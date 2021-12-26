unit UConfig;
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
 *  $Source: /root/lcdsmartie-cvsbackup/lcdsmartie/UConfig.pas,v $
 *  $Revision: 1.54 $ $Date: 2011/06/04 16:48:30 $
 *****************************************************************************}

interface

Uses  Windows,SysUtils;

const
  sMyConfigFileFormatVersion = '1.0';
  sMyScreenTextSyntaxVersion = '1.0';

  MaxScreens = 99;
  MaxLines = 4;
  MaxCols = 40;
  MaxThemes = 99;
  MaxActions = 99;
  MaxScreenSizes = 12;
  MaxEmailAccounts = 99;

type
  TScreenSize = record
    SizeName : string[6];
    YSize : byte;
    XSize : byte;
  end;

const
  ScreenSizes : array[1..MaxScreenSizes] of TScreenSize = (
    (SizeName : '1x10'; YSize : 1; XSize : 10),
    (SizeName : '1x16'; YSize : 1; XSize : 16),
    (SizeName : '1x20'; YSize : 1; XSize : 20),
    (SizeName : '1x24'; YSize : 1; XSize : 24),
    (SizeName : '1x40'; YSize : 1; XSize : 40),
    (SizeName : '2x16'; YSize : 2; XSize : 16),
    (SizeName : '2x20'; YSize : 2; XSize : 20),
    (SizeName : '2x24'; YSize : 2; XSize : 24),
    (SizeName : '2x40'; YSize : 2; XSize : 40),
    (SizeName : '4x16'; YSize : 4; XSize : 16),
    (SizeName : '4x20'; YSize : 4; XSize : 20),
    (SizeName : '4x40'; YSize : 4; XSize : 40));


const
  BaudRates: array [0..14] of Cardinal =(CBR_110, CBR_300, CBR_600, CBR_1200, CBR_2400,
    CBR_4800, CBR_9600, CBR_14400, CBR_19200, CBR_38400, CBR_56000, CBR_57600,
    CBR_115200, CBR_128000, CBR_256000);

type
  TTransitionStyle = (tsNone,tsLeftRight,tsRightLeft,tsTopBottom,tsBottomTop,tsRandomChars,tsFade);

  TScreenType = (xxNone,xxHD,xxMO,xxCF,xxHD2,xxTestDriver,xxIR,xxDLL);

  TScreenSettings = Record
    enabled: Boolean;
    theme: Integer;
    TransitionStyle : TTransitionStyle;
    TransitionTime : Integer;
    showTime: Integer;
    bSticky: Boolean;
  end;

  TScreenLine = Record
    text: String;
    noscroll: Boolean;
    contNextLine: Boolean;
    center: Boolean;
    settings: TScreenSettings;
  end;

  TScreen = Record
    line: array [1..MaxLines] of TScreenLine;
    settings: TScreenSettings;
  end;


  TPopAccount = Record
    server: String;
    user: String;
    pword: String;
    port_ssl: String;
  end;

  TTestDriverSettings = Record
    iStopBits: Integer;  // 1 or 2
    iParity: Integer; // 0 = none, 1 = odd, 2 = even
    sInit: String;
    sFini: String;
    sGotoLine1, sGotoLine2, sGotoLine3, sGotoLine4: String;
    sCharMap: String;
  end;

  TConfig = class(TObject)
  private
    fScreenSize: Integer;
    P_width: Integer;
    P_height: Integer;
    uiActionsLoaded: Cardinal;
    sFileName: String;
    function loadINI: Boolean;
    procedure saveINI;
    procedure SetScreenSize(con: Integer);
  public
    sSkinPath: String;
    sTrayIcon: String;
    LastTabIndex: Integer; // last config tab index

    localeFormat: TFormatSettings;
    bHideOnStartup: Boolean;
    bAutoStart, bAutoStartHide: Boolean;
    testDriver: TTestDriverSettings;
    isUsbPalm: Boolean;
    gameServer: Array[1..MaxScreens, 1..MaxLines] of String;
    pop: Array [1..MaxEmailAccounts] of TPopAccount;
    comPort: Integer;
    baudrate: Integer;
    refreshRate: Integer;
    bootDriverDelay: Integer;
    emailPeriod: Integer;
    dllPeriod: Integer;
    scrollPeriod: Integer;
    colorOption: Integer;
    alwaysOnTop: Boolean;
    httpProxy: String;
    httpProxyPort: Integer;
    newsRefresh: Integer;
    randomScreens: Boolean;
    gameRefresh: Integer;
    foldUserid: String;
    foldEnabled: Boolean;
    checkUpdates: Boolean;
    distLog: String;
    screen: Array[1..MaxScreens] of Tscreen;
    ShutdownMessage: Array[1..MaxLines] of string;
    winampLocation: String;
    setiEmail: String;
    setiEnabled: Boolean;
    actionsArray: Array[1..MaxActions, 1..4] of String;
    totalactions: Integer;
    // screen settings
    xScreenType : TScreenType;
    xiMinFadeContrast: Integer;  // can only set this in config file?
    // these apply to LPT displays
    xparallelPort: Integer;
    xbHDAltAddressing: Boolean;
    xbHDKS0073Addressing: Boolean;
    xiHDTimingMultiplier: Integer;
    // these apply to Matrix displays
    xcontrast: Integer;
    xbrightness: Integer;
    xmx3Usb: Boolean;
    // these apply to Crystal Fontz displays
    xCF_contrast: Integer;
    xCF_brightness: Integer;
    xiCF_cgrom: Integer;
    // these apply to IRTrans displays
    xIR_brightness: Integer;
    xremotehost : string;
    // these apply to DLL Plugin displays
    DisplayDLLName : string;
    DisplayDLLParameters : string;
    DLL_Contrast: integer;
    DLL_Brightness: integer;
    EmulateLCD : boolean;
	  EnableRemoteSend: boolean;
    RemoteSendBindIP: string;
    RemoteSendPort: string;
    RemoteSendPassword: string;
    RemoteSendUseSSL: boolean;

    function load: Boolean;
    procedure save;
    property ScreenSize: Integer read fScreenSize write SetScreenSize;
    property width: Integer read P_width;
    property height: Integer read P_height;
    property filename: String read sFileName;
    constructor Create(filename: String);
  end;

var
  Config: TConfig;

implementation

uses Forms, INIFiles, StrUtils;

constructor TConfig.Create(filename: String);
begin
  sFileName := filename;
  xiMinFadeContrast := 0;
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, localeFormat);
  inherited Create();
end;

procedure TConfig.SetScreenSize(con: Integer);
begin
  fScreenSize := con;
  P_width := ScreenSizes[fScreenSize].XSize;
  P_height := ScreenSizes[fScreenSize].YSize;
end;

const
  BoolStr : array[false..true] of string = ('0','1');

function TConfig.load: Boolean;
var
  bResult1: Boolean;
begin
  bResult1 := false;
  if (FileExists(ExtractFilePath(Application.EXEName) + sFileName)) then
    bResult1 := loadINI;
  result := bResult1;
end;

procedure TConfig.save;
begin
  saveINI;
end;

function TConfig.loadINI: Boolean;
var
  initfile: TINIFile;
  ActionsCount, MailCount, ScreenCount, LineCount: Integer;
  sConfigFileFormatVersion, sScreenTextSyntaxVersion: String;
  sScreen, sLine, sPOPAccount, sGameLine: String;
  iTemp: Integer;
begin

  try
    // We can't use the faster TMemINIFile - because it leaves quoted strings
    // with their quotes...
    initfile := TINIFile.Create(ExtractFilePath(Application.EXEName) +
      sFileName);
  except
    result := false;
    Exit;
  end;

  sConfigFileFormatVersion := initfile.ReadString('Versions',
    'ConfigFileFormat', '1.0');
  sScreenTextSyntaxVersion := initfile.ReadString('Versions',
    'ScreenTextSyntax', '1.0');

  sSkinPath := initfile.ReadString('General Settings', 'SkinPath', 'images\default\');
  sSkinPath := IncludeTrailingPathDelimiter(sSkinPath);

  sTrayIcon := initfile.ReadString('General Settings', 'TrayIcon', 'smartie.ico');

  LastTabIndex := initfile.ReadInteger('General Settings', 'LastTab',0);


  baudrate := initfile.ReadInteger('Communication Settings', 'Baudrate', 8);
  comPort := initfile.ReadInteger('Communication Settings', 'COMPort', 1);

  iTemp := initfile.ReadInteger('Communication Settings', 'USBPalm', -1);
  if (iTemp <> -1) then
  begin
    isUsbPalm := (iTemp > 0);
  end
  else
  begin
    // If they were using a previous version then this value was used for USB Palms
    isUsbPalm :=
      (initfile.ReadString('Communication Settings', 'USBPalmDevice', '') <> '');
  end;

  xparallelPort := initfile.ReadInteger('Communication Settings',
    'ParallelPort', 888);

  xmx3Usb := initFile.ReadBool('Communication Settings', 'MX3USB', false);

  xbHDAltAddressing := initFile.ReadBool('Communication Settings',
   'HDAlternativeAddressing', false);
  xbHDKS0073Addressing := initFile.ReadBool('Communication Settings',
   'HDKS0073Addressing', false);
  xiHDTimingMultiplier := initFile.ReadInteger('Communication Settings',
   'HDTimingMultiplier', 1);

  refreshRate := initfile.ReadInteger('General Settings', 'RefreshRate', 75);
  winampLocation := initfile.ReadString('General Settings', 'WinAmpLocation',
    'C:\Program Files\Winamp\winamp.exe');

  bootDriverDelay := initfile.ReadInteger('General Settings',
    'BootDriverDelay', 3);
  setiEmail := initfile.ReadString('General Settings', 'SETIEmail',
    'test@test.com');
  setiEnabled := initfile.ReadBool('General Settings', 'SETIEnabled', false);

  for ScreenCount := 1 to MaxScreens do
  begin
    sScreen := 'Screen ' + Format('%.2u', [ScreenCount], localeFormat);
    screen[ScreenCount].settings.enabled  := initFile.ReadBool(sScreen, 'Enabled', false);
    screen[ScreenCount].settings.theme := initFile.ReadInteger(sScreen, 'Theme', 1)-1;
    screen[ScreenCount].settings.showTime := initFile.ReadInteger(sScreen, 'ShowTime', 10);
    screen[ScreenCount].settings.bSticky := initFile.ReadBool(sScreen, 'Sticky', false);
    screen[ScreenCount].settings.TransitionTime := initFile.ReadInteger(sScreen, 'TransitionTime', 20);
    screen[ScreenCount].settings.TransitionStyle := TTransitionStyle(initFile.ReadInteger(sScreen, 'TransitionStyle',1));

    for LineCount := 1 to MaxLines do
    begin
      sLine := Format('%.2u', [LineCount], localeFormat);
      screen[ScreenCount].line[LineCount].text := initFile.ReadString(sScreen, 'Text' + sLine, '');
      screen[ScreenCount].line[LineCount].noscroll := initFile.ReadBool(sScreen, 'NoScroll' + sLine,
        true);
      screen[ScreenCount].line[LineCount].contNextLine := initFile.ReadBool(sScreen,
        'ContinueNextLine' + sLine, false);
      screen[ScreenCount].line[LineCount].center := initFile.ReadBool(sScreen, 'Center' + sLine,
        false);
    end;
  end;

  distLog := initfile.ReadString('General Settings', 'DistLog', 'C:\repllog.txt');
  emailPeriod := initfile.ReadInteger('General Settings', 'EmailPeriod', 10);
  dllPeriod := initfile.ReadInteger('General Settings', 'DLLPeriod', 250);
  scrollPeriod := initfile.ReadInteger('General Settings', 'ScrollPeriod', 200);

  alwaysOnTop := initFile.ReadBool('General Settings', 'AlwaysOnTop', false);

  httpProxy := initFile.ReadString('Communication Settings', 'HTTPProxy', '');
  httpProxyPort := initFile.ReadInteger('Communication Settings',
    'HTTPProxyPort', 0);
  xremotehost := initFile.ReadString('Communication Settings', 'RemoteHost', 'localhost');
  DisplayDLLName := initFile.ReadString('Communication Settings', 'DisplayDLLName', '');
  DisplayDLLParameters := initFile.ReadString('Communication Settings', 'DisplayDLLParameters', 'COM1,9600,8,N,1');


  xScreenType := TScreenType(initFile.ReadInteger('General Settings', 'LCDType', 0));

  // Readonly settings - not set at all.
{
  if (ScreenType = stTestDriver) then
  begin
    testDriver.iStopBits := initFile.ReadInteger('Test Driver', 'StopBits', 1);
    testDriver.iParity := initFile.ReadInteger('Test Driver', 'Parity', 0);
    testDriver.sInit := initFile.ReadString('Test Driver', 'Init', '');
    testDriver.sFini := initFile.ReadString('Test Driver', 'Fini', '');
    testDriver.sGotoLine1 := initFile.ReadString('Test Driver', 'GotoLine1', '');
    testDriver.sGotoLine2 := initFile.ReadString('Test Driver', 'GotoLine2', '');
    testDriver.sGotoLine3 := initFile.ReadString('Test Driver', 'GotoLine3', '');
    testDriver.sGotoLine4 := initFile.ReadString('Test Driver', 'GotoLine4', '');
    testDriver.sCharMap := initFile.ReadString('Test Driver', 'CharMap', '');
  end;
}

  SetScreenSize(initFile.ReadInteger('General Settings', 'Size', 11));

  xcontrast := initFile.ReadInteger('General Settings', 'Contrast', 88);
  xbrightness := initFile.ReadInteger('General Settings', 'Brightness', 26);

  xCF_contrast := initFile.ReadInteger('General Settings', 'CFContrast', 66);
  xCF_brightness := initFile.ReadInteger('General Settings', 'CFBrightness',
    61);
  xiCF_cgrom := initFile.ReadInteger('General Settings', 'CFCGRomVersion', 2);
  xiMinFadeContrast := initFile.ReadInteger('General Settings', 'MinFadeContrast',
    0);

  xIR_brightness := initFile.ReadInteger('General Settings', 'IRBrightness', 3);

  DLL_contrast := initFile.ReadInteger('General Settings', 'DLLContrast', 127);
  DLL_brightness := initFile.ReadInteger('General Settings', 'DLLBrightness',127);

  newsRefresh := initFile.ReadInteger('General Settings', 'NewsRefresh', 120);
  randomScreens := initFile.ReadBool('General Settings', 'RandomScreens',
    false);

  foldUserid := initFile.ReadString('General Settings', 'FoldUserid',
    '1437');
  foldEnabled := initFile.ReadBool('General Settings', 'FoldEnabled',
    false);
  gameRefresh := initFile.ReadInteger('General Settings', 'GameRefresh', 1);

  checkUpdates := initFile.ReadBool('General Settings', 'CheckUpdates', true);

  colorOption := initFile.ReadInteger('General Settings', 'ColorOption', 4);
  bHideOnStartup := initFile.ReadBool('General Settings', 'HideOnStartup', false);
  bAutoStart := initFile.ReadBool('General Settings', 'AutoStart', false);
  bAutoStartHide := initFile.ReadBool('General Settings', 'AutoStartHidden', false);
  EmulateLCD := initFile.ReadBool('General Settings', 'EmulateLCD', false);

  for LineCount := 1 to MaxLines do
  begin
    ShutdownMessage[LineCount] := initFile.ReadString('General Settings' , 'ShutdownLine' + IntToStr(LineCount) , '');
  end;


  // Pop accounts + ssl
  for MailCount := 1 to MaxEmailAccounts do
  begin
    sPOPAccount := Format('%.2u', [MailCount], localeFormat);
    pop[MailCount].server := initFile.ReadString('POP Accounts', 'Server' +
      sPOPAccount, '');
    pop[MailCount].user := initFile.ReadString('POP Accounts', 'User' + sPOPAccount,
      '');
    pop[MailCount].pword := initFile.ReadString('POP Accounts', 'Password' +
      sPOPAccount, '');
    pop[MailCount].port_ssl := initFile.ReadString('POP Accounts', 'Port_ssl' +
      sPOPAccount, '');
  end;


  // Load Game server list.
  for ScreenCount := 1 to MaxScreens do
  begin
    for LineCount := 1 to MaxLines do
    begin
      sGameLine := 'GameServer' + Format('%.2u', [ScreenCount], localeFormat) + '-'
        + Format('%.2u', [LineCount], localeFormat);
      gameServer[ScreenCount, LineCount] := initfile.ReadString('Game Servers', sGameLine, '');
    end;
  end;

  // Load Actions
  ActionsCount := 0;
  repeat
    ActionsCount := ActionsCount + 1;
    actionsArray[ActionsCount, 1] := initfile.ReadString('Actions', 'Action' +
      Format('%.2u', [ActionsCount], localeFormat) + 'Variable', '');
    actionsArray[ActionsCount, 2] := initfile.ReadString('Actions', 'Action' +
      Format('%.2u', [ActionsCount], localeFormat) + 'Condition', '0');
    actionsArray[ActionsCount, 3] := initfile.ReadString('Actions', 'Action' +
      Format('%.2u', [ActionsCount], localeFormat) + 'ConditionValue', '');
    actionsArray[ActionsCount, 4] := initfile.ReadString('Actions', 'Action' +
      Format('%.2u', [ActionsCount], localeFormat) + 'Action', '')
  until (actionsArray[ActionsCount, 1] = '') or (ActionsCount = MaxActions);
  totalactions := ActionsCount - 1;
  uiActionsLoaded := totalactions;

  EnableRemoteSend := initFile.ReadBool('General Settings', 'EnableRemoteSend', false);
  RemoteSendBindIP := initFile.ReadString('General Settings', 'RemoteSendBindIP', '0.0.0.0');
  RemoteSendPort := initFile.ReadString('General Settings', 'RemoteSendPort', '6088');
  RemoteSendPassword := initFile.ReadString('General Settings', 'RemoteSendPassword', 'password1234');
  RemoteSendUseSSL := initFile.ReadBool('General Settings', 'RemoteSendUseSSL', false);

  result := true;

  initfile.Free;
end;


// save configuration
procedure TConfig.saveINI;
var
  initfile : TMemINIFile;
  sScreen, sLine, sPOPAccount, sGameLine: String;
  ActionsCount, MailCount, ScreenCount, LineCount: Integer;
  sPrefix: String;
begin
  initfile := TMemINIFile.Create(ExtractFilePath(Application.EXEName) +
    sFileName);

  initfile.WriteString('Versions', 'ConfigFileFormat',
    sMyConfigFileFormatVersion);
  initfile.WriteString('Versions', 'ScreenTextSyntax',
    sMyScreenTextSyntaxVersion);

  initfile.WriteString('General Settings', 'SkinPath', sSkinPath);
  initfile.WriteInteger('General Settings', 'LastTab',LastTabIndex);
  initfile.WriteString('General Settings', 'TrayIcon', sTrayIcon);

  initfile.WriteInteger('Communication Settings', 'Baudrate', baudrate);
  initfile.WriteInteger('Communication Settings', 'COMPort', comPort);

  initfile.WriteBool('Communication Settings', 'USBPalm', isUsbPalm);

  initfile.WriteInteger('Communication Settings', 'ParallelPort',
    xparallelPort);

  initFile.WriteBool('Communication Settings', 'HDAlternativeAddressing',
    xbHDAltAddressing);
  initFile.WriteBool('Communication Settings', 'HDKS0073Addressing',
    xbHDKS0073Addressing);
  initfile.WriteInteger('Communication Settings', 'HDTimingMultiplier',
    xiHDTimingMultiplier);

  initFile.WriteBool('Communication Settings', 'MX3USB', xmx3Usb);

  initfile.WriteInteger('General Settings', 'RefreshRate', refreshRate);
  initfile.WriteString('General Settings', 'WinAmpLocation', winampLocation);

  initfile.WriteInteger('General Settings', 'BootDriverDelay',
    bootDriverDelay);

  initfile.WriteString('General Settings', 'SETIEmail', setiEmail);
  initfile.WriteBool('General Settings', 'SETIEnabled', setiEnabled);

  for ScreenCount := 1 to MaxScreens do
  begin
    sScreen := 'Screen ' + Format('%.2u', [ScreenCount], localeFormat);
    initfile.WriteBool(sScreen, 'Enabled', screen[ScreenCount].settings.enabled);
    initFile.WriteInteger(sScreen, 'Theme', screen[ScreenCount].settings.theme + 1);
    initFile.WriteInteger(sScreen, 'ShowTime', screen[ScreenCount].settings.showTime);
    initfile.WriteBool(sScreen, 'Sticky', screen[ScreenCount].settings.bSticky);
    initFile.WriteInteger(sScreen, 'TransitionTime', screen[ScreenCount].settings.TransitionTime);
    initFile.WriteInteger(sScreen, 'TransitionStyle', ord(screen[ScreenCount].settings.TransitionStyle));

    for LineCount := 1 to MaxLines do
    begin
      sLine := Format('%.2u', [LineCount], localeFormat);
      initFile.WriteString(sScreen, 'Text' + sLine, '"' + screen[ScreenCount].line[LineCount].text + '"');
    end;

    for LineCount := 1 to MaxLines do
    begin
      sLine := Format('%.2u', [LineCount], localeFormat);
      initFile.WriteBool(sScreen, 'NoScroll' + sLine, screen[ScreenCount].line[LineCount].noscroll);
    end;

    for LineCount := 1 to MaxLines do
    begin
      sLine := Format('%.2u', [LineCount], localeFormat);
      initFile.WriteBool(sScreen, 'ContinueNextLine' + sLine, screen[ScreenCount].line[LineCount].contNextLine);
    end;

    for LineCount := 1 to MaxLines do
    begin
      sLine := Format('%.2u', [LineCount], localeFormat);
      initFile.WriteBool(sScreen, 'Center' + sLine, screen[ScreenCount].line[LineCount].center);
    end;

  end;

  initfile.WriteString('General Settings', 'DistLog', distLog);
  initfile.WriteInteger('General Settings', 'EmailPeriod', emailPeriod);
  initfile.WriteInteger('General Settings', 'DLLPeriod', dllPeriod);
  initfile.WriteInteger('General Settings', 'ScrollPeriod', scrollPeriod);

  initFile.WriteBool('General Settings', 'AlwaysOnTop', alwaysOnTop);

  initFile.WriteString('Communication Settings', 'HTTPProxy', httpProxy);
  initFile.WriteInteger('Communication Settings', 'HTTPProxyPort',
    httpProxyPort);
  initFile.WriteString('Communication Settings', 'RemoteHost', xremotehost);
  initFile.WriteString('Communication Settings', 'DisplayDLLName', DisplayDLLName);
  initFile.WriteString('Communication Settings', 'DisplayDLLParameters', DisplayDLLParameters);

  initFile.WriteInteger('General Settings', 'LCDType', ord(xScreenType));
  initFile.WriteInteger('General Settings', 'Size', ScreenSize);
  initFile.WriteInteger('General Settings', 'Contrast', xcontrast);
  initFile.WriteInteger('General Settings', 'Brightness', xbrightness);

  initFile.WriteInteger('General Settings', 'CFContrast', xCF_contrast);
  initFile.WriteInteger('General Settings', 'CFBrightness', xCF_brightness);
  initFile.WriteInteger('General Settings', 'CFCGRomVersion', xiCF_cgrom);
  initFile.WriteInteger('General Settings', 'MinFadeContrast', xiMinFadeContrast);

  initFile.WriteInteger('General Settings', 'IRBrightness', xIR_brightness);

  initFile.WriteInteger('General Settings', 'DLLContrast', DLL_contrast);
  initFile.WriteInteger('General Settings', 'DLLBrightness', DLL_brightness);

  initFile.WriteInteger('General Settings', 'NewsRefresh', newsRefresh);
  initFile.WriteBool('General Settings', 'RandomScreens', randomScreens);

  initFile.WriteString('General Settings', 'FoldUserid', foldUserid);
  initFile.WriteBool('General Settings', 'FoldEnabled', foldEnabled);
  initFile.WriteInteger('General Settings', 'GameRefresh', gameRefresh);

  initFile.WriteBool('General Settings', 'CheckUpdates', checkUpdates);

  initFile.WriteInteger('General Settings', 'ColorOption', colorOption);
  initFile.WriteBool('General Settings', 'HideOnStartup', bHideOnStartup);
  initFile.WriteBool('General Settings', 'AutoStart', bAutoStart);
  initFile.WriteBool('General Settings', 'AutoStartHidden', bAutoStartHide);
  initFile.WriteBool('General Settings', 'EmulateLCD', EmulateLCD);

  for LineCount := 1 to MaxLines do
  begin
    initFile.WriteString('General Settings', 'ShutdownLine' + IntToStr(LineCount), '"' + ShutdownMessage[LineCount]+ '"');
  end;

  // Pop accounts + ssl
  for MailCount := 1 to MaxEmailAccounts do
  begin
    sPOPAccount := Format('%.2u', [MailCount], localeFormat);
    initFile.WriteString('POP Accounts', 'Server' + sPOPAccount,
      pop[MailCount].server);
    initFile.WriteString('POP Accounts', 'User' + sPOPAccount, '"' +
      pop[MailCount].user + '"');
    initFile.WriteString('POP Accounts', 'Password' + sPOPAccount, '"' +
      pop[MailCount].pword + '"');
    initFile.WriteString('POP Accounts', 'Port_ssl' + sPOPAccount,
      pop[MailCount].port_ssl);
  end;

  for ScreenCount := 1 to MaxScreens do
  begin
    for LineCount := 1 to MaxLines do
    begin
      sGameLine := 'GameServer' + Format('%.2u', [ScreenCount], localeFormat) + '-'
        + Format('%.2u', [LineCount], localeFormat);
      initfile.WriteString('Game Servers', sGameLine, gameServer[ScreenCount, LineCount]);
    end;
  end;

  // Save Actions
  // and delete those we loaded but aren't now used.
  // [ and delete two further sets of keys - to clean up from older builds which
  // stored unused actions ]
  for ActionsCount := 1 to uiActionsLoaded + 2 do
  begin
    sPrefix := 'Action' + Format('%.2u', [ActionsCount], localeFormat);
    if (ActionsCount <= totalactions) then
    begin
      initfile.WriteString('Actions', sPrefix + 'Variable', actionsArray[ActionsCount, 1]);
      initfile.WriteString('Actions', sPrefix + 'Condition', actionsArray[ActionsCount, 2]);
      initfile.WriteString('Actions', sPrefix + 'ConditionValue',
        actionsArray[ActionsCount, 3]);
      initfile.WriteString('Actions', sPrefix + 'Action', actionsArray[ActionsCount, 4]);
    end
    else
    begin
      initfile.DeleteKey('Actions', sPrefix + 'Variable');
      initfile.DeleteKey('Actions', sPrefix + 'Condition');
      initfile.DeleteKey('Actions', sPrefix + 'ConditionValue');
      initfile.DeleteKey('Actions', sPrefix + 'Action');
    end;
  end;
  
  initFile.WriteBool('General Settings', 'EnableRemoteSend', EnableRemoteSend);
  initFile.WriteString('General Settings', 'RemoteSendBindIP', RemoteSendBindIP);
  initFile.WriteString('General Settings', 'RemoteSendPort', RemoteSendPort);
  initFile.WriteString('General Settings', 'RemoteSendPassword', RemoteSendPassword);
  initFile.WriteBool('General Settings', 'RemoteSendUseSSL', RemoteSendUseSSL);

  initfile.UpdateFile;
  initfile.Free;

end;


end.
