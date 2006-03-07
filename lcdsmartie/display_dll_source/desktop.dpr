library desktop;

uses
  SysUtils {Unit1},
  dispform in 'dispform.pas' {LCDDisplayForm};

{$R *.res}

const
  DLLProjectName = 'Desktop Display DLL';
  Version = 'v1.0';
type
  pboolean = ^boolean;
  TCustomArray = array[0..7] of byte;

var
  LCDDisplayForm : TLCDDisplayForm = nil;

function DISPLAYDLL_Init(SizeX,SizeY : byte; StartupParameters : pchar; OK : pboolean) : pchar; stdcall;
// return startup error
// open port
begin
  OK^ := true;
  Result := PChar(DLLProjectName + ' ' + Version);
  try
    LCDDisplayForm := TLCDDisplayForm.Create(nil);
    with LCDDisplayForm do begin
      SetSize(SizeX,SizeY);
      Show;
    end;
  except
    on E: Exception do begin
      result := PChar('DESKTOP.DLL Exception: ' + E.Message);
      OK^ := false;
    end;
  end;
end;

procedure DISPLAYDLL_Done(); stdcall;
// close port
begin
  try
    LCDDisplayForm.Hide;
    LCDDisplayForm.Free;
    LCDDisplayForm := nil;
  except
  end;
end;


function DISPLAYDLL_ReadKey : word; stdcall;
begin
  Result := $FF00;
  try
  except
  end;
end;

procedure DISPLAYDLL_Write(Str : pchar); stdcall;
// write string
var
  S : string;
  Loop : integer;
  B : byte;
begin
  S := string(Str);
  // characters 1-8 (custom chars) and 32-127 are the only valid on screen characters
  for Loop := 1 to length(S) do begin
    B := ord(S[Loop]);
    if (B < 32) or (B > 127) then begin
      case B of
        Ord('�'): B := 1;
        Ord('�'): B := 2;
        else B := ((B - 1) mod 8) + 1;
      end; // case
      S[Loop] := char(b);
    end;
  end;
  try
    LCDDisplayForm.ScreenWrite(S);
  except
  end;
end;

procedure DISPLAYDLL_CustomChar(Chr : byte; Data : TCustomArray); stdcall;
// define custom character
begin
  try
    LCDDisplayForm.CustomChar(Chr,Data);
  except
  end;
end;

procedure DISPLAYDLL_SetBacklight(LightOn : boolean); stdcall;
// turn on backlighting
begin
  try
    LCDDisplayForm.SetBacklight(LightOn);
  except
  end;
end;

procedure DISPLAYDLL_SetContrast(Contrast : byte); stdcall;
// 0 - 255
begin
  try
  except
  end;
end;

procedure DISPLAYDLL_SetBrightness(Brightness : byte); stdcall;
// 0 - 255
begin
  try
  except
  end;
end;

procedure DISPLAYDLL_SetPosition(X, Y: byte); stdcall;
// set cursor position
begin
  try
    LCDDisplayForm.SetPosition(X,Y);
  except
  end;
end;

procedure DISPLAYDLL_SetGPO(GPO : byte; GPOOn : boolean); stdcall;
// turn on GPO
begin
  try
  except
  end;
end;

procedure DISPLAYDLL_SetFan(T1,T2 : byte); stdcall;
// set fan output
begin
  try
  except
  end;
end;

function DISPLAYDLL_DefaultParameters : pchar; stdcall;
begin
  DISPLAYDLL_DefaultParameters := pchar('');
end;

function DISPLAYDLL_Usage : pchar; stdcall;
begin
  Result := pchar('No parameters');
end;

function DISPLAYDLL_DriverName : pchar; stdcall;
begin
  Result := PChar(DLLProjectName + ' ' + Version);
end;

// don't forget to export the funtions, else nothing works :)
exports
  DISPLAYDLL_SetFan,
  DISPLAYDLL_SetGPO,
  DISPLAYDLL_SetBrightness,
  DISPLAYDLL_SetContrast,
  DISPLAYDLL_SetBacklight,
  DISPLAYDLL_ReadKey,
  DISPLAYDLL_CustomChar,
  DISPLAYDLL_Write,
  DISPLAYDLL_SetPosition,
  DISPLAYDLL_DefaultParameters,
  DISPLAYDLL_Usage,
  DISPLAYDLL_DriverName,
  DISPLAYDLL_Done,
  DISPLAYDLL_Init;
begin
end.

