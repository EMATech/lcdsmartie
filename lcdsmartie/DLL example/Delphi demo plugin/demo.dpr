library demo;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes;

{$R *.res}

Function function1(param1:pchar;param2:pchar):pchar; stdcall;
// this one is a simple math funtion
begin
  result:=pchar(IntToStr(StrToInt(param1)+StrToInt(param2)));
end;

Function function2(param1:pchar;param2:pchar):pchar; stdcall;
// this one is also a math funtion
begin
  result:=pchar(IntToStr(StrToInt(param1)-StrToInt(param2)));
end;

Function function3(param1:pchar;param2:pchar):pchar; stdcall;
// this one is also a math funtion
begin
  result:=pchar(IntToStr(StrToInt(param1)*StrToInt(param2)));
end;

Function function4(param1:pchar;param2:pchar):pchar; stdcall;
// this one is also a math funtion
// note that i have to convert the strings to FLOAT instead of integer
// to be able to do devide it
begin
  result:=pchar(FloatToSTr(round((StrTofloat(param1)/StrTofloat(param2))*100)/100));
end;

Function function5(param1:pchar;param2:pchar):pchar; stdcall;
// this one puts 2 strings together (VERY USEFULL ;) )
begin
  result := Pchar(StrPas(Param2) + StrPas(Param1));
end;

Function function6(param1:pchar;param2:pchar):pchar; stdcall;
// this one shows the current time
begin
  result:=pchar(TimeToStr(time));
end;

Function function7(param1:pchar;param2:pchar):pchar; stdcall;
// this one is my favorite ;)
begin
  result:=pchar('BasieP Ruled');
end;

Function function8(param1:pchar;param2:pchar):pchar; stdcall;
// finally a function that realy does do something
// this is a '1337' converter. It converts normal text to numbers
// and non-A-Z chars
var
  regel:String;
begin
  regel:=param1;
  regel:=StringReplace(regel,'a','4',[rfReplaceAll]);
  regel:=StringReplace(regel,'b','8',[rfReplaceAll]);
  regel:=StringReplace(regel,'e','3',[rfReplaceAll]);
  regel:=StringReplace(regel,'i','1',[rfReplaceAll]);
  regel:=StringReplace(regel,'l','|',[rfReplaceAll]);
  regel:=StringReplace(regel,'m','|\/|',[rfReplaceAll]);
  regel:=StringReplace(regel,'n','|\|',[rfReplaceAll]);
  regel:=StringReplace(regel,'o','0',[rfReplaceAll]);
  regel:=StringReplace(regel,'s','5',[rfReplaceAll]);
  regel:=StringReplace(regel,'t','7',[rfReplaceAll]);
  regel:=StringReplace(regel,'w','\/\/',[rfReplaceAll]);
  regel:=StringReplace(regel,'v','\/',[rfReplaceAll]);
  regel:=StringReplace(regel,'x','><',[rfReplaceAll]);
  regel:=StringReplace(regel,'z','2',[rfReplaceAll]);
  regel:=StringReplace(regel,'A','4',[rfReplaceAll]);
  regel:=StringReplace(regel,'B','8',[rfReplaceAll]);
  regel:=StringReplace(regel,'E','3',[rfReplaceAll]);
  regel:=StringReplace(regel,'I','1',[rfReplaceAll]);
  regel:=StringReplace(regel,'L','|',[rfReplaceAll]);
  regel:=StringReplace(regel,'M','|\/|',[rfReplaceAll]);
  regel:=StringReplace(regel,'N','|\|',[rfReplaceAll]);
  regel:=StringReplace(regel,'O','0',[rfReplaceAll]);
  regel:=StringReplace(regel,'S','5',[rfReplaceAll]);
  regel:=StringReplace(regel,'T','7',[rfReplaceAll]);
  regel:=StringReplace(regel,'W','\/\/',[rfReplaceAll]);
  regel:=StringReplace(regel,'V','\/',[rfReplaceAll]);
  regel:=StringReplace(regel,'X','><',[rfReplaceAll]);
  regel:=StringReplace(regel,'Z','2',[rfReplaceAll]);
  result:=pchar(regel);
end;

Function function9(param1:pchar;param2:pchar):pchar; stdcall;
// this one replaces the blocks( � ) and the underscores ( _ ) from the bars
// to custom chars (defined as the first char of param2 and the second char)
var
  regel:String;
begin
  regel:=param1;
  regel:=StringReplace(regel,'�',param2[0],[rfReplaceAll]);
  regel:=StringReplace(regel,'_',param2[1],[rfReplaceAll]);
  result:=pchar(regel);
end;

Function function10(param1:pchar;param2:pchar):pchar; stdcall;
//     -= The End. =-     \\
begin
  result:=pchar(IntToStr(Round((StrToInt(param1)*1.8)+32)));
end;


// don't forget to export the funtions, else nothing works :)
exports
  function1,
  function2,
  function3,
  function4,
  function5,
  function6,
  function7,
  function8,
  function9,
  function10;
begin
end.

