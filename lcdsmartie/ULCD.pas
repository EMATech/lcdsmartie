unit ULCD;
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
 *  $Source: /root/lcdsmartie-cvsbackup/lcdsmartie/ULCD.pas,v $
 *  $Revision: 1.1 $ $Date: 2004/11/05 21:50:55 $
 *****************************************************************************}


interface

type
    TLCD = class(TObject)
    public
      procedure setPosition(x, y: Integer);
      procedure write(str: String);
      procedure customChar(chr: Integer; data: array of Byte);
      procedure setbacklight(on: Boolean);
      function readKey(var key: Char) : Boolean;
      procedure setFan(t1,t2: Integer);
      procedure setGPO(gpo: Byte; on: Boolean);
      procedure setContrast(level: Integer);
      procedure setBrightness(level: Integer);
      constructor Create;
      destructor Destory;
    private
      posX, posY: Integer;
    end;

implementation

constructor TLCD.Create;
begin
  inherited;
end;

destructor TLCD.Destory;
begin
  inherited;
end;

procedure TLCD.setContrast(level: Integer);
begin
  // dummy procedure - do nothing
end;

procedure TLCD.setBrightness(level: Integer);
begin
  // dummy procedure - do nothing
end;

procedure TLCD.setGPO(gpo: Byte; on: Boolean);
begin
  // dummy procedure - do nothing
end;

procedure TLCD.setFan(t1,t2: Integer);
begin
  // dummy procedure - do nothing
end;

procedure TLCD.setbacklight(on: Boolean);
begin
  // dummy procedure - do nothing
end;

procedure TLCD.customChar(chr: Integer; data: array of Byte);
begin
  // dummy procedure - do nothing
end;

procedure TLCD.setPosition(x, y: Integer);
begin
  posX:=x;
  posY:=y;
end;

function TLCD.readKey(var key: Char) : Boolean;
begin
  Result:=False;
end;

procedure TLCD.write(str: String);
begin
  // dummy procedure - do nothing
end;

end.
