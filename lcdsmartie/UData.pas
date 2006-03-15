unit UData;
{******************************************************************************
 *
 *  LCD Smartie - LCD control software.
 *  Copyright (C) 2000-2003  BassieP
 *
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  as published by the Free Software Foundation; either version 2
 *  of the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 *  $Source: /root/lcdsmartie-cvsbackup/lcdsmartie/UData.pas,v $
 *  $Revision: 1.70 $ $Date: 2006/03/15 15:44:41 $
 *****************************************************************************}


interface

uses
  Classes, SysUtils, SyncObjs,
  UDataEmail, UDataMBM, UDataSmartie;

const
  iMaxPluginFuncs = 20;

type
  TMyProc = function(param1: pchar; param2: pchar): Pchar; stdcall;
  TFiniProc = procedure(); stdcall;
  TBridgeProc = function(iBridgeId: Integer; iFunc: Integer; param1: pchar; param2: pchar): Pchar; stdcall;

  TDll = Record
    sName: String;
    hDll: HMODULE;
    bBridge: Boolean;
    iBridgeId: Integer;
    functions: Array [1..iMaxPluginFuncs] of TMyProc;
    bridgeFunc: TBridgeProc;
    finiFunc: TFiniProc;
    uiLastRefreshed: Cardinal;  // time when Dll results were refreshed.
    uiMinRefreshInterval: Cardinal; // min Refresh interval between refreshes.
  end;

  TData = Class(TObject)
  private
    cacheresult_lastFindPlugin: Cardinal;
    cache_lastFindPlugin: String;
    uiScreenStartTime: Cardinal; // time that new start refresh started (used by plugin cache code)
    bNewScreenEvent: Boolean;
    bForceRefresh: Boolean;

    // DLL plugins
    dlls: Array of TDll;
    uiTotalDlls: Cardinal;
    sDllResults: array of string;
    iDllResults: Integer;

    // email thread
    EmailThread : TEmailDataThread;  // keep a copy for mainline "GotMail"
    MBMThread : TMBMDataThread;  // for finding MBM cpu speed
    LCDSmartieUpdateThread : TSmartieDataThread;  // IsConnected call
    DataThreads : TList;  // of TDataThread

    // other variables
    procedure ResolveOtherVariables(var line: String);
    procedure ResolveTimeVariable(var line: String);
    procedure ResolveStringFunctionVariables(var line: String);
    procedure ResolveLCDFunctionVariables(var line: String);
    // file data
    procedure ResolveFileVariables(var line: String);
    // dll plugins
    procedure LoadPlugin(sDllName: String; bDotNet: Boolean = false);
    procedure ResolvePluginVariables(var line: String; qstattemp: Integer;
      bCacheResults: Boolean);
    // Connected (using LCDSmartie connection)
    function  GetIsConnected : boolean;
    function  GetLCDSmartieUpdate : boolean;
    function  GetLCDSmartieUpdateText : string;
    // MBM stats
    function  GetMBMActive : boolean;
    // e-mail stuff
    function  GetGotEmail : boolean;
  public
    cLastKeyPressed: Char;
    procedure ScreenStart;
    procedure ScreenEnd;
    procedure NewScreen(bYes: Boolean);
    function change(line: String; qstattemp: Integer = 1;
      bCacheResults: Boolean = false): String;
    function CallPlugin(uiDll: Integer; iFunc: Integer;
                    const sParam1: String; const sParam2:String) : String;
    function FindPlugin(const sDllName: String): Cardinal;
    constructor Create;
    destructor Destroy; override;
    function CanExit: Boolean;
    procedure RefreshDataThreads;
    //
    property GotEmail : boolean read GetGotEmail;
    property MBMActive : boolean read GetMBMActive;
    property IsConnected : boolean read GetIsConnected;
    property LCDSmartieUpdate : boolean read GetLCDSmartieUpdate;
    property LCDSmartieUpdateText : string read GetLCDSmartieUpdateText;
  end;



implementation

uses
  Windows, Forms, Dialogs, StrUtils, Winsock,
  UMain, UUtils, UConfig,
  DataThread, UDataNetwork, UDataDisk, UDataGame, UDataMemory,
  UDataCPU, UDataSeti, UDataFolding, UDataRSS, UDataDNet,
  UDataWinamp;


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
////                                                                       ////
////      M A I N   D A T A    F U N C T I O N S                           ////
////                                                                       ////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


constructor TData.Create;
var
  status: Integer;
  WSAData: TWSADATA;
  DataThread : TDataThread;
begin
  inherited;

  status := WSAStartup(MAKEWORD(2,0), WSAData);
  if status <> 0 then
     raise Exception.Create('WSAStartup failed');

  uiTotalDlls := 0;

  DataThreads := TList.Create;

  EmailThread := TEmailDataThread.Create;  // keep a copy for mainline GotEmail call
  EmailThread.Resume;
  DataThreads.Add(EmailThread);

  MBMThread :=  TMBMDataThread.Create;  // keep a copy for finding MBM cpu speed
  MBMThread.Resume;
  DataThreads.Add(MBMThread);

  DataThread := TGameDataThread.Create;
  DataThread.Resume;
  DataThreads.Add(DataThread);

  DataThread := TNetworkDataThread.Create;
  DataThread.Resume;
  DataThreads.Add(DataThread);

  DataThread := TDiskDataThread.Create;
  DataThread.Resume;
  DataThreads.Add(DataThread);

  DataThread := TMemoryDataThread.Create;
  DataThread.Resume;
  DataThreads.Add(DataThread);

  DataThread := TCPUDataThread.Create(MBMThread);
  DataThread.Resume;
  DataThreads.Add(DataThread);

  LCDSmartieUpdateThread := TSmartieDataThread.Create;
  LCDSmartieUpdateThread.Resume;
  DataThreads.Add(LCDSmartieUpdateThread);

  DataThread := TSetiDataThread.Create;
  DataThread.Resume;
  DataThreads.Add(DataThread);

  DataThread := TFoldingDataThread.Create;
  DataThread.Resume;
  DataThreads.Add(DataThread);

  DataThread := TRSSDataThread.Create;
  DataThread.Resume;
  DataThreads.Add(DataThread);

  DataThread := TDNetDataThread.Create;
  DataThread.Resume;
  DataThreads.Add(DataThread);
end;

function TData.CanExit: Boolean;
var
  uiDll: Cardinal;
  Loop : longint;
begin
  for Loop := 0 to DataThreads.Count-1 do begin
    TDataThread(DataThreads[Loop]).Terminate;
  end;

  // close all plugins
  for uiDll:=1 to uiTotalDlls do
  begin
    try
      if (dlls[uiDll-1].hDll <> 0) then
      begin
        // call SmartieFini if it exists
        if (Assigned(dlls[uiDll-1].finiFunc)) then
        begin
          try
            dlls[uiDll-1].finiFunc();
          except
            on E: Exception do
              raise Exception.Create('Plugin '+dlls[uiDll-1].sName+' had an exception during closedown: '
              + E.Message);
          end;
        end;
        FreeLibrary(dlls[uiDll-1].hDll);
      end;
    except
    end;
    dlls[uiDll-1].hDll := 0;
  end;
  uiTotalDlls := 0;

  Result := True;
end;

destructor TData.Destroy;
var
  Loop : longint;
begin

  for Loop := 0 to DataThreads.Count-1 do begin
    TDataThread(DataThreads[Loop]).WaitFor;
    TDataThread(DataThreads[Loop]).Free;
  end;

  DataThreads.Free;

  WSACleanup();

  inherited;
end;


procedure TData.RefreshDataThreads;
var
  Loop : longint;
begin
  for Loop := 0 to DataThreads.Count-1 do begin
    TDataThread(DataThreads[Loop]).Refresh;
  end;
end;

procedure TData.NewScreen(bYes: Boolean);
var
  Loop : longint;
begin
  bNewScreenEvent := bYes;
  if (bYes) then
  begin
    bForceRefresh := true;
    for Loop := 0 to DataThreads.Count-1 do begin
      TDataThread(DataThreads[Loop]).Active := false;
      TDataThread(DataThreads[Loop]).Refresh;
    end;
  end;
end;

procedure TData.ScreenStart;
begin
  iDllResults := 0;
  uiScreenStartTime := GetTickCount();
end;

procedure TData.ScreenEnd;
begin
  bForceRefresh := false;
end;

function TData.change(line: String; qstattemp: Integer = 1;
   bCacheResults: Boolean = false): String;
label
  endChange;
var
  Loop : longint;
begin
  try
    for Loop := 0 to DataThreads.Count-1 do begin
      TDataThread(DataThreads[Loop]).ResolveVariables(Line);
      if (Pos('$', line) = 0) then break;
    end;

    if (Pos('$', line) = 0) then goto endChange;
    ResolvePluginVariables(line, qstattemp, bCacheResults);
    ResolveOtherVariables(Line);
    ResolveFileVariables(Line);
    if (Pos('$', line) = 0) then goto endChange;
    ResolveLCDFunctionVariables(Line);
    ResolveWinampVariables(line);
    ResolveTimeVariable(Line);
    ResolveStringFunctionVariables(Line);
endChange:
  except
    on E: Exception do line := '[Unhandled Exception: '
      + CleanString(E.Message) + ']';
  end;

  line := StringReplace(line, Chr($A), '', [rfReplaceAll]);
  line := StringReplace(line, Chr($D), '', [rfReplaceAll]);
  result := line;
end;


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
////                                                                       ////
////      E - M A I L    C H E C K I N G    P R O  C E D U R E S           ////
////                                                                       ////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

function TData.GetGotEmail : boolean;
begin
  Result := false;
  if assigned(EmailThread) then
    Result := EmailThread.GotEmail;
end;


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
////                                                                       ////
////      M O T H E R B O A R D     S T A T S      P R O C E D U R E S     ////
////                                                                       ////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


function TData.GetMBMActive : boolean;
begin
  Result := false;
  if assigned(MBMThread) then
    Result := MBMThread.MBMActive;
end;


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
////                                                                       ////
////      L C D   S M A R T I E   U P D A T E      P R O C E D U R E S     ////
////                                                                       ////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


function TData.GetIsConnected : boolean;
begin
  Result := false;
  if assigned(LCDSmartieUpdateThread) then
    Result := LCDSmartieUpdateThread.IsConnected;
end;

function TData.GetLCDSmartieUpdate : boolean;
begin
  Result := false;
  if assigned(LCDSmartieUpdateThread) then
    Result := LCDSmartieUpdateThread.LCDSmartieUpdate;
end;

function TData.GetLCDSmartieUpdateText : string;
begin
  Result := '';
  if assigned(LCDSmartieUpdateThread) then
    Result := LCDSmartieUpdateThread.LCDSmartieUpdateText;
end;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
////                                                                       ////
////      R E S O L V E    O T H E R    V A R I A B L E S                  ////
////                                                                       ////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


procedure TData.ResolveOtherVariables(var line: String);
var
  args: Array [1..maxArgs] of String;
  prefix, postfix: String;
  numArgs: Cardinal;
  spacecount : Integer;
  ccount: double;
  tempst : String;
  iPos1, iPos2 : Integer;
  screenResolution: String;
begin
  if (pos('$ScreenReso', line) <> 0) then begin
    screenResolution := IntToStr(Screen.DesktopWidth) + 'x' +
      IntToStr(Screen.DesktopHeight);

    line := StringReplace(line, '$ScreenReso', screenResolution,
      [rfReplaceAll]);
  end;


  if decodeArgs(line, '$MObutton', maxArgs, args, prefix, postfix, numargs)
    then
  begin
    spacecount := 0;
    if (numargs = 1) and (cLastKeyPressed = args[1]) then spacecount := 1;

    line := prefix + intToStr(spacecount) + postfix;
  end;

  if pos('$ScreenChanged', line) <> 0 then
  begin
    spacecount := 0;
    if (bNewScreenEvent) then
      spacecount := 1;

    line := StringReplace(line, '$ScreenChanged', IntToStr(spacecount), [rfReplaceAll]);
  end;

  while decodeArgs(line, '$Count', maxArgs, args, prefix, postfix, numargs)
    do
  begin
    ccount := 0;
    try
      RequiredParameters(numargs, 1, 1);
      tempst := args[1];
      iPos1 := 1;
      iPos2 := pos('#', tempst);

      repeat
        if (iPos2 = 0) then
          ccount := ccount + StrToFloatN(tempst, iPos1, length(tempst)-iPos1+1)
        else
          ccount := ccount + StrToFloatN(tempst, iPos1, iPos2-iPos1);
        iPos1 := iPos2 + 1;
        iPos2 := PosEx('#', tempst, iPos1);
      until (iPos1 = 1);

      line := prefix + FloatToStr(ccount, localeFormat) + postfix;
    except
      on E: Exception do line := prefix + '[Count: '
        + CleanString(E.Message) + ']' + postfix;
    end;
  end;
end;

procedure TData.ResolveTimeVariable(var line: String);
var
  tempst, line2 : String;
begin
  while pos('$Time(', line) <> 0 do
  begin
    try
      line2 := copy(line, pos('$Time(', line) + 6, length(line));
      if (pos(')', line2) = 0) then
        raise Exception.Create('No ending bracket');
      line2 := copy(line2, 1, pos(')', line2)-1);
      tempst := formatdatetime(line2, now, localeFormat);
      line := StringReplace(line, '$Time(' + line2 + ')', tempst, []);
    except
      on E: Exception do line := StringReplace(line, '$Time(', '[Time: '
        + CleanString(E.Message) + ']', []);
    end;
  end;
end;

procedure TData.ResolveLCDFunctionVariables(var line: String);
var
  spaceline, line2 : String;
  h, iPos1, iPos2 : Integer;
begin
  iPos1 :=  pos('$CustomChar(', line);
  while (iPos1 <> 0) do
  begin
    try
      iPos2 := PosEx(')', line, iPos1+12);
      if (iPos2 = 0) then
        raise Exception.Create('No ending bracket');
      LCDSmartieDisplayForm.customchar(AnsiMidStr(line, iPos1+12, iPos2-(iPos1+12)));
      Delete(line, iPos1, iPos2-iPos1+1);
    except
      on E: Exception do line := StringReplace(line, '$CustomChar(',
        '[CustomChar: ' + CleanString(E.Message) + ']', []);
    end;
    iPos1 :=  PosEx('$CustomChar(', line, iPos1);
  end;

  while (pos('$Flash(', line) <> 0) do
  begin
    try
      line2 := copy(line, pos('$Flash(', line) + 7, (pos('$)$',
        line))-(pos('$Flash(', line) + 7));
      if (LCDSmartieDisplayForm.doesflash) then
      begin
        spaceline := '';
        for h := 1 to length(line2) do
        begin
          spaceline := spaceline + ' ';
        end;
      end
      else
      begin
        spaceline := line2;
      end;
      if pos('$)$', line) <> 0 then line := StringReplace(line, '$Flash('
        + line2 + '$)$', spaceline, [])
      else line := StringReplace(line, '$Flash(', 'ERROR', []);
    except
      on E: Exception do line := StringReplace(line, '$Flash(', '[Flash: '
        + CleanString(E.Message) + ']', []);
    end;
  end;
end;

procedure TData.ResolveStringFunctionVariables(var line: String);
var
  args: Array [1..maxArgs] of String;
  prefix, postfix: String;
  numArgs: Cardinal;
  h, x, iPos1, iPos2, iPos3: Integer;
  spacecount : Integer;
  spaceline : string;
  STHDBar: String;
begin

  iPos1 := pos('$Right(', line);
  while iPos1 <> 0 do
  begin
    try
      iPos2 := PosEx(',$', line, iPos1+1);
      if (iPos2 = 0) then
        raise Exception.Create('Missing ",$"');

      iPos3 := PosEx('%)', line, iPos2+2);
      if (iPos3 = 0) then
        raise Exception.Create('Missing "%)"');

      spacecount := StrToIntN(line, iPos2 + 2, iPos3-(iPos2+2));
      Delete(line, iPos2, (iPos3+2)-iPos2);
      Delete(line, iPos1, 7);
      if (spacecount >  iPos2-(iPos1+7)) then
        Insert(DupeString(' ', spacecount-(iPos2-(iPos1+7))), line, iPos1);
    except
      on E: Exception do line := StringReplace(line, '$Right(', '[Right: '
        + CleanString(E.Message) + ']', []);
    end;

    iPos1 := PosEx('$Right(',line,iPos1);
  end;

  while decodeArgs(line, '$Center', maxArgs, args, prefix, postfix, numargs)
    do
  begin
    try
      RequiredParameters(numargs, 1, 2);
      if (numargs = 1) then spacecount := config.width
      else spacecount := StrToInt(args[2]);

      line := prefix + CenterText(args[1], spacecount) + postfix;
    except
      on E: Exception do line := prefix + '[Center: '
        + CleanString(E.Message) + ']' + postfix;
    end;
  end;

  while decodeArgs(line, '$Chr', maxArgs, args, prefix, postfix, numargs) do
  begin
    try
      RequiredParameters(numargs, 1, 1);
      line := prefix + Chr(StrToInt(args[1])) + postfix;
    except
      on E: Exception do line := prefix + '[Chr: '
        + CleanString(E.Message) + ']' + postfix;
    end;
  end;

  while decodeArgs(line, '$Fill', maxArgs, args, prefix, postfix, numargs) do
  begin
    try
      RequiredParameters(numargs, 1, 1);
      spacecount := StrToInt(args[1]);
      spaceline := '';

      if spacecount > length(prefix) then
        spaceline := DupeString(' ', spacecount - length(prefix));

      line := prefix + spaceline + postfix;
    except
      on E: Exception do line := prefix + '[Fill: ' + E.Message + ']' +
        postfix;
    end;
  end;

  while decodeArgs(line, '$Bar', maxArgs, args, prefix, postfix, numargs)
    do
  begin
    try
      RequiredParameters(numargs, 3, 3);
      spacecount := strtoint(args[3])*3;

      if (StrToFloat(args[2], localeFormat) <> 0) then
        x := round(StrToFloat(args[1], localeFormat)
                  * spacecount / StrToFloat(args[2], localeFormat))
      else x := 0;

      if x > spacecount then x := spacecount;
      STHDBar := '';
      for h := 1 to (x div 3) do STHDBar := STHDBar + '�';
      if (x mod 3 = 1) then STHDBar := STHDBar + chr(131);
      if (x mod 3 = 2) then STHDBar := STHDBar + chr(132);
      for h := 1 to round(spacecount/3)-length(STHDBar) do STHDBar :=
        STHDBar + '_';

      line := prefix + STHDBar + postfix;
    except
      on E: Exception do line := prefix + '[Bar: '
        + CleanString(E.Message) + ']' + postfix;
    end;
  end;

end;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
////                                                                       ////
////      L O A D   F R O M    F I L E    P R O C E D U R E S              ////
////                                                                       ////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


procedure TData.ResolveFileVariables(var line: String);
var
  hdcounter: Integer;
  args: Array [1..maxArgs] of String;
  prefix, postfix: String;
  numArgs: Cardinal;
  spaceline, sFileloc : string;
  i,iFileline: Integer;
  FileStream: TFileStream;
  Lines: TStringList;
  fFile3: textfile;
  line3 : string;
  iBytesToRead: Integer;
  counter3: Integer;
begin
  hdcounter := 0;
  while decodeArgs(line, '$LogFile', maxArgs, args, prefix, postfix,
    numargs) do
  begin
    try
      hdcounter := hdcounter + 1;
      if hdcounter > 4 then line := StringReplace(line, '$LogFile(',
        'error', []);

      sFileloc := args[1];
      if (sFileloc[1] = '"') and (sFileloc[Length(sFileLoc)] = '"') then
        sFileloc := copy(sFileloc, 2, Length(sFileloc)-2);

      if (not FileExists(sFileloc)) then
        raise Exception.Create('No such file');

      RequiredParameters(numargs, 2, 2);
      iFileline := StrToInt(args[2]);

      if iFileline > 3 then iFileline := 3;
      if iFileline < 0 then iFileline := 0;

      FileStream := TFileStream.Create(sFileloc, fmOpenRead or fmShareDenyNone);
      iBytesToRead := 1024;
      if (FileStream.Size < iBytesToRead) then
        iBytesToRead := FileStream.Size;
      SetLength(spaceline, iBytesToRead);

      FileStream.Seek(-1 * iBytesToRead, soFromEnd);
      FileStream.ReadBuffer(spaceline[1], iBytesToRead);
      FileStream.Free;

      Lines := TStringList.Create;
      Lines.Text := spaceline;
      spaceline := stripspaces(lines[lines.count - iFileline]);
      if (pos('] ', spaceline) <> 0) then
        spaceline := copy(spaceline, pos('] ', spaceline) + 2, length(spaceline));

      for i := 0 to 7 do spaceline := StringReplace(spaceline, chr(i), '',
        [rfReplaceAll]);
      Lines.Free;
      line := prefix + spaceline + postfix;
    except
      on E: Exception do line := prefix + '[LogFile: '
        + CleanString(E.message) + ']' + postfix;
    end;
  end;

  while decodeArgs(line, '$File', maxArgs, args, prefix, postfix, numargs) do
  begin
    sFileloc := args[1];
    if (sFileloc[1] = '"') and (sFileloc[Length(sFileLoc)] = '"') then
      sFileloc := copy(sFileloc, 2, Length(sFileloc)-2);

    try
      RequiredParameters(numargs, 2, 2);
      iFileline := StrToInt(args[2]);
      if (not FileExists(sFileloc)) then
        raise Exception.Create('No such file');
      assignfile(fFile3, sFileloc);
      reset(fFile3);
      for counter3 := 1 to iFileline do readln(fFile3, line3);
      closefile(fFile3);
      line := prefix + line3 + postfix;
    except
      on E: Exception do line := prefix + '[File: '
        + CleanString(E.Message) + ']' + postfix;
    end;
  end;
end;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
////                                                                       ////
////      D L L    P L U G I N        P R O C E D U R E S                  ////
////                                                                       ////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


procedure TData.ResolvePluginVariables(var line: String; qstattemp: Integer;
  bCacheResults: Boolean);
var
  args: Array [1..maxArgs] of String;
  prefix, postfix: String;
  numArgs: Cardinal;
  sParam1, sParam2: String;
  sAnswer: String;
  uiPlugin: Cardinal;
  uiMinRefresh: Cardinal;
  bCallPlugin: Boolean;
begin
  while decodeArgs(line, '$dll', maxArgs, args, prefix, postfix, numargs) do
  begin
    try
      RequiredParameters(numargs, 4, 4);

      uiPlugin := FindPlugin(args[1]);
      if (bCacheResults) and (not bForceRefresh) then
      begin
        if (dlls[uiPlugin].uiMinRefreshInterval < Cardinal(config.dllPeriod)) then
          uiMinRefresh := config.dllPeriod
        else
          uiMinRefresh := dlls[uiPlugin].uiMinRefreshInterval;

        if (uiScreenStartTime <= dlls[uiPlugin].uiLastRefreshed)
          or (uiScreenStartTime - dlls[uiPlugin].uiLastRefreshed > uiMinRefresh) then
        begin
          dlls[uiPlugin].uiLastRefreshed := uiScreenStartTime;

          bCallPlugin := True;
        end
        else
          bCallPlugin := False;
      end
      else
        bCallPlugin := True; // always call, if new screen or not to be cached.

      if (bCallPlugin) then
      begin
        sParam1 := change(args[3], qstattemp);
        sParam2 := change(args[4], qstattemp);
        try
          sAnswer := CallPlugin(uiPlugin, StrToInt(args[2]), sParam1, sParam2);
        except
          on E: Exception do
            sAnswer := '[Dll: ' + CleanString(E.Message) + ']';
        end;
      end;

      if (bCacheResults) then
      begin
        Inc(iDllResults);
        if (iDllResults >= Length(sDllResults)) then
           SetLength(sDllResults, iDllResults + 5);

        if (bCallPlugin) then
          sDllResults[iDllResults] := sAnswer // save result
        else
          sAnswer := sDllResults[iDllResults]; // get cached result
      end;

      sAnswer := change(sAnswer, qstattemp);

      line := prefix +  sAnswer + postfix;
    except
      on E: Exception do
        line := prefix + '[Dll: ' + CleanString(E.Message) + ']' + postfix;
    end;
  end;
end;

function TData.FindPlugin(const sDllName: String): Cardinal;
var
  uiDll: Cardinal;
  sLoadDllName: String;
begin
  // for speed reason - check if this is the same plugin as the last one:
  if (sDllName = cache_lastFindPlugin) then
    Result := cacheresult_lastFindPlugin
  else
  begin

    // check if we have seen this dll before
    sLoadDllName := sDllName;
    if (Pos('.DLL', UpperCase(sLoadDllName)) = 0) then
      sLoadDllName := sLoadDllName + '.dll';
    uiDll:=1;
    while (uiDll<=uiTotalDlls) and (dlls[uiDll-1].sName <> sLoadDllName) do
      Inc(uiDll);
    Dec(uiDll);

    if (uiDll >= uiTotalDlls) then
    begin // we havent seen this one before - load it
      try
        LoadPlugin(sLoadDllName);
      except
        on E: Exception do
          showmessage('Load of plugin failed: ' + e.Message)
      end;
    end;

    cacheresult_lastFindPlugin := uiDll;
    cache_lastFindPlugin := sDllName;

    Result := uiDll;
  end;
end;

function TData.CallPlugin(uiDll: Integer; iFunc: Integer;
                    const sParam1: String; const sParam2:String) : String;
begin
  if (dlls[uiDll].hDll <> 0) then
  begin
    if (iFunc >= 0) and (iFunc <= iMaxPluginFuncs) then
    begin
      if (iFunc = 0) then iFunc := 10;
      try
        if (dlls[uiDll].bBridge) then
        begin
          if (@dlls[uiDll].bridgeFunc = nil) then
            raise Exception.Create('No Bridge Func');
          Result := dlls[uiDll].bridgeFunc( dlls[uiDll].iBridgeId, iFunc,
             pchar(sParam1), pchar(sParam2) );
        end
        else if @dlls[uiDll].functions[iFunc] <> nil then
          Result := dlls[uiDll].functions[iFunc]( pchar(sParam1), pchar(sParam2) )
        else
          Result := '[Dll: Function not found]';
      except
        on E: Exception do
          Result := '[Dll: ' + CleanString(E.Message) + ']';
      end;
    end
    else
      Result := '[Dll: function number out of range]';
  end
  else
    Result := '[Dll: Can not load plugin]';
end;

procedure TData.LoadPlugin(sDllName: String; bDotNet: Boolean = false);
type
  TBridgeInit = function(dll: PChar; var id: Integer; var refresh: Integer): PChar; stdcall;
  TMinRefreshFunc = function: Integer; stdcall;
var
  uiDll: Cardinal;
  i: Integer;
  id: Integer;
  minRefresh: Integer;
  initFunc:  procedure; stdcall;
  minRefreshFunc: TMinRefreshFunc;
  bridgeInitFunc: TBridgeInit;
  bFound: Boolean;
  sLibraryPath: String;
  sResult: String;
begin
  bFound := false;

  uiDll := uiTotalDlls;

  Inc(uiTotalDlls);
  SetLength(dlls, uiTotalDlls);
  dlls[uiDll].sName := sDllName;
  dlls[uiDll].uiLastRefreshed := 0;
  dlls[uiDll].uiMinRefreshInterval := 300;

  dlls[uiDll].bBridge := bDotNet;
  if (bDotNet) then
    sLibraryPath := 'DNBridge.dll'
  else
    sLibraryPath := 'plugins\' + sDllName;

  dlls[uiDll].hDll := LoadLibrary(pchar(extractfilepath(application.exename) +
    sLibraryPath));

  if (dlls[uiDll].hDll <> 0) then
  begin
    initFunc := getprocaddress(dlls[uiDll].hDll, PChar('SmartieInit'));
    if (not Assigned(initFunc)) then
      initFunc := getprocaddress(dlls[uiDll].hDll, PChar('_SmartieInit@0'));

    dlls[uiDll].finiFunc := getprocaddress(dlls[uiDll].hDll, PChar('SmartieFini'));
    if (not Assigned(dlls[uiDll].finiFunc)) then
      dlls[uiDll].finiFunc := getprocaddress(dlls[uiDll].hDll, PChar('_SmartieFini@0'));

    // Call SmartieInit if it exists.
    if (Assigned(initFunc)) then
    begin
      try
        initFunc();
      except
        on E: Exception do
          raise Exception.Create('Plugin '+sDllName+' had an exception during Init: '
            + E.Message);
      end;
    end;

    if (bDotNet) then
    begin
      @bridgeInitFunc := getprocaddress(dlls[uiDll].hDll, PChar('_BridgeInit@12'));
      if (@bridgeInitFunc = nil) then
        raise Exception.Create('Could not init bridge');

      try
        sResult := bridgeInitFunc(PChar(dlls[uiDll].sName), id, minRefresh);
      except
        on E: Exception do
          raise Exception.Create('Bridge Init for '+dlls[uiDll].sName+' had an exception: '
            + E.Message);
      end;
      if (id = -1) or (sResult <> '') then
         raise Exception.Create('Bridge Init for '+dlls[uiDll].sName+' failed with: '
            + sResult);
      dlls[uiDll].iBridgeId := id;
      if (minRefresh > 0) then
        dlls[uiDll].uiMinRefreshInterval := minRefresh;

      @dlls[uiDll].BridgeFunc := getprocaddress(dlls[uiDll].hDll,
        PChar('_BridgeFunc@16'));
      if (@dlls[uiDll].BridgeFunc = nil) then
        raise Exception.Create('No Bridge function found.');
    end
    else
    begin
      for i:= 1 to iMaxPluginFuncs do
      begin
        @dlls[uiDll].functions[i] := getprocaddress(dlls[uiDll].hDll,
          PChar('function' + IntToStr(i)));
        if (@dlls[uiDll].functions[i] = nil) then
          @dlls[uiDll].functions[i] := getprocaddress(dlls[uiDll].hDll,
            PChar('_function' + IntToStr(i)+'@8'));
        if (@dlls[uiDll].functions[i] <> nil) then
          bFound := True;
      end;

      minRefreshFunc := getprocaddress(dlls[uiDll].hDll, PChar('GetMinRefreshInterval'));
      if (not Assigned(minRefreshFunc)) then
        minRefreshFunc := getprocaddress(dlls[uiDll].hDll, PChar('_GetMinRefreshInterval@0'));

      if (@minRefreshFunc <> nil) then
      begin
        try
          minRefresh := minRefreshFunc();
        except
          on E: Exception do
            raise Exception.Create('Plugin '+sDllName
              +' had an exception during GetMinRefreshInterval:' + E.Message);
        end;
        if (minRefresh > 0) then
          dlls[uiDll].uiMinRefreshInterval := minRefresh;
      end;

      if (not bFound) then
      begin
        if (dlls[uiDll].hDll <> 0) then FreeLibrary(dlls[uiDll].hDll);
        dlls[uiDll].hDll := 0;
        Dec(uiTotalDlls);
        LoadPlugin(dlls[uiDll].sName, true);
      end;
    end;
  end
  else
  begin
    raise Exception.Create('LoadLibrary failed with ' + ErrMsg(GetLastError));
  end;
end;

end.
