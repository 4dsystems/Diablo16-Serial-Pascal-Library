procedure blitComtoDisplay(X : word; Y : word; Width : word; Height : word; Pixels : t4DByteArray) ;
var
  towrite : AnsiString ;
  written : dword ;
  remains : integer ;
  stoffset: integer ;
begin
  towrite := inttostrx(F_blitComtoDisplay) + inttostrx(X) + inttostrx(Y) + inttostrx(Width) + inttostrx(Height) + ByteArraytoString(Pixels, Width*Height*2) ;
// WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ; This fails on MB5 and cable as a driver buffer is of a fixed size which is smaller than needed
  {$R-}
  stoffset := 1 ;
  remains  := length(towrite) ;
  while remains <> 0 do begin ;        // This is he workaround
    writefile(ComHandle4D, towrite[stoffset], remains, written, nil) ;
    inc(stoffset,written) ;
    dec(remains,written) ;
    end  ;
  {$R+}
  GetAck() ;
end ;

function bus_Read8() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_bus_Read8) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure bus_Write8(Bits : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_bus_Write8) + inttostrx(Bits) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function charheight(TestChar : AnsiChar) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_charheight) + TestChar ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function charwidth(TestChar : AnsiChar) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_charwidth) + TestChar ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_CallFunction(Handle : word; ArgCount : word; Args : t4DWordArray) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_CallFunction) + inttostrx(Handle) + inttostrx(ArgCount) + WordArraytoString(Args, ArgCount) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Close(Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Close) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Count(Filename : AnsiString) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Count) + Filename + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Dir(Filename : AnsiString) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Dir) + Filename + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Erase(Filename : AnsiString) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Erase) + Filename + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Error() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Error) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Exec(Filename : AnsiString; ArgCount : word; Args : t4DWordArray) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Exec) + Filename + #0 + inttostrx(ArgCount) + WordArraytoString(Args, ArgCount) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Exists(Filename : AnsiString) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Exists) + Filename + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_FindFirst(Filename : AnsiString) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_FindFirst) + Filename + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_FindFirstRet(Filename : AnsiString; var StringIn : ansistring) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_FindFirstRet) + Filename + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResStr(StringIn) ;
end ;

function file_FindNext() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_FindNext) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_FindNextRet(var StringIn : ansistring) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_FindNextRet) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResStr(StringIn) ;
end ;

function file_GetC(Handle : word) : ansichar ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_GetC) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := Ansichar(GetAckResp) ;
end ;

function file_GetS(var StringIn : ansistring; Size : word; Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_GetS) + inttostrx(Size) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResStr(StringIn) ;
end ;

function file_GetW(Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_GetW) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Image(X : word; Y : word; Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Image) + inttostrx(X) + inttostrx(Y) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Index(Handle : word; HiSize : word; LoSize : word; Recordnum : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Index) + inttostrx(Handle) + inttostrx(HiSize) + inttostrx(LoSize) + inttostrx(Recordnum) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_LoadFunction(Filename : AnsiString) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_LoadFunction) + Filename + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_LoadImageControl(Datname : AnsiString; GCIName : AnsiString; Mode : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_LoadImageControl) + Datname + #0 + GCIName + #0 + inttostrx(Mode) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Mount() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Mount) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Open(Filename : AnsiString; Mode : AnsiChar) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Open) + Filename + #0 + Mode ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_PlayWAV(Filename : AnsiString) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_PlayWAV) + Filename + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_PutC(Character : AnsiChar; Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_PutC) + Character + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_PutS(StringOut : AnsiString; Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_PutS) + StringOut + #0 + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_PutW(Word : word; Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_PutW) + inttostrx(Word) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Read(Data : t4DByteArray; Size : word; Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Read) + inttostrx(Size) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResData(Data,Size) ;
end ;

function file_Rewind(Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Rewind) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Run(Filename : AnsiString; ArgCount : word; Args : t4DWordArray) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Run) + Filename + #0 + inttostrx(ArgCount) + WordArraytoString(Args, ArgCount) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_ScreenCapture(X : word; Y : word; Width : word; Height : word; Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_ScreenCapture) + inttostrx(X) + inttostrx(Y) + inttostrx(Width) + inttostrx(Height) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Seek(Handle : word; HiWord : word; LoWord : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Seek) + inttostrx(Handle) + inttostrx(HiWord) + inttostrx(LoWord) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function file_Size(Handle : word; var HiWord : word; var LoWord : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Size) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckRes2Words(HiWord,LoWord) ;
end ;

function file_Tell(Handle : word; var HiWord : word; var LoWord : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Tell) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckRes2Words(HiWord,LoWord) ;
end ;

procedure file_Unmount() ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Unmount) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function file_Write(Size : word; Source : t4DByteArray; Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_file_Write) + inttostrx(Size) + ByteArraytoString(Source, Size) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function gfx_BevelShadow(Value : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_BevelShadow) + inttostrx(Value) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function gfx_BevelWidth(Value : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_BevelWidth) + inttostrx(Value) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function gfx_BGcolour(Color : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_BGcolour) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure gfx_Button(Up : word; x : word; y : word; buttonColour : word; txtColour : word; font : word; txtWidth : word; txtHeight : word;  text : AnsiString) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Button) + inttostrx(Up) + inttostrx(x) + inttostrx(y) + inttostrx(buttonColour) + inttostrx(txtColour) + inttostrx(font) + inttostrx(txtWidth) + inttostrx(txtHeight) +  text + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_ChangeColour(OldColor : word; NewColor : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_ChangeColour) + inttostrx(OldColor) + inttostrx(NewColor) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_Circle(X : word; Y : word; Radius : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Circle) + inttostrx(X) + inttostrx(Y) + inttostrx(Radius) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_CircleFilled(X : word; Y : word; Radius : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_CircleFilled) + inttostrx(X) + inttostrx(Y) + inttostrx(Radius) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_Clipping(OnOff : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Clipping) + inttostrx(OnOff) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_ClipWindow(X1 : word; Y1 : word; X2 : word; Y2 : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_ClipWindow) + inttostrx(X1) + inttostrx(Y1) + inttostrx(X2) + inttostrx(Y2) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_Cls() ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Cls) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function gfx_Contrast(Contrast : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Contrast) + inttostrx(Contrast) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure gfx_Ellipse(X : word; Y : word; Xrad : word; Yrad : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Ellipse) + inttostrx(X) + inttostrx(Y) + inttostrx(Xrad) + inttostrx(Yrad) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_EllipseFilled(X : word; Y : word; Xrad : word; Yrad : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_EllipseFilled) + inttostrx(X) + inttostrx(Y) + inttostrx(Xrad) + inttostrx(Yrad) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function gfx_FrameDelay(Msec : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_FrameDelay) + inttostrx(Msec) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function gfx_Get(Mode : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Get) + inttostrx(Mode) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function gfx_GetPixel(X : word; Y : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_GetPixel) + inttostrx(X) + inttostrx(Y) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure gfx_Line(X1 : word; Y1 : word; X2 : word; Y2 : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Line) + inttostrx(X1) + inttostrx(Y1) + inttostrx(X2) + inttostrx(Y2) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function gfx_LinePattern(Pattern : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_LinePattern) + inttostrx(Pattern) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure gfx_LineTo(X : word; Y : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_LineTo) + inttostrx(X) + inttostrx(Y) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_MoveTo(X : word; Y : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_MoveTo) + inttostrx(X) + inttostrx(Y) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function gfx_Orbit(Angle : word; Distance : word; var Xdest : word; var Ydest : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Orbit) + inttostrx(Angle) + inttostrx(Distance) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck2Words(Xdest,Ydest) ;
end ;

function gfx_OutlineColour(Color : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_OutlineColour) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure gfx_Panel(Raised : word; X : word; Y : word; Width : word; Height : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Panel) + inttostrx(Raised) + inttostrx(X) + inttostrx(Y) + inttostrx(Width) + inttostrx(Height) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_Polygon(n : word; Xvalues : t4DWordArray; Yvalues : t4DWordArray; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Polygon) + inttostrx(n) + WordArraytoString(Xvalues, n) + WordArraytoString(Yvalues, n) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_PolygonFilled(n : word; Xvalues : t4DWordArray; Yvalues : t4DWordArray; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_PolygonFilled) + inttostrx(n) + WordArraytoString(Xvalues, n) + WordArraytoString(Yvalues, n) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_Polyline(n : word; Xvalues : t4DWordArray; Yvalues : t4DWordArray; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Polyline) + inttostrx(n) + WordArraytoString(Xvalues, n) + WordArraytoString(Yvalues, n) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_PutPixel(X : word; Y : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_PutPixel) + inttostrx(X) + inttostrx(Y) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_Rectangle(X1 : word; Y1 : word; X2 : word; Y2 : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Rectangle) + inttostrx(X1) + inttostrx(Y1) + inttostrx(X2) + inttostrx(Y2) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_RectangleFilled(X1 : word; Y1 : word; X2 : word; Y2 : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_RectangleFilled) + inttostrx(X1) + inttostrx(Y1) + inttostrx(X2) + inttostrx(Y2) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_ScreenCopyPaste(Xs : word; Ys : word; Xd : word; Yd : word; Width : word; Height : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_ScreenCopyPaste) + inttostrx(Xs) + inttostrx(Ys) + inttostrx(Xd) + inttostrx(Yd) + inttostrx(Width) + inttostrx(Height) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function gfx_ScreenMode(ScreenMode : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_ScreenMode) + inttostrx(ScreenMode) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure gfx_Set(Func : word; Value : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Set) + inttostrx(Func) + inttostrx(Value) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_SetClipRegion() ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_SetClipRegion) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function gfx_Slider(Mode : word; X1 : word; Y1 : word; X2 : word; Y2 : word; Color : word; Scale : word; Value : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Slider) + inttostrx(Mode) + inttostrx(X1) + inttostrx(Y1) + inttostrx(X2) + inttostrx(Y2) + inttostrx(Color) + inttostrx(Scale) + inttostrx(Value) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function gfx_Transparency(OnOff : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Transparency) + inttostrx(OnOff) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function gfx_TransparentColour(Color : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_TransparentColour) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure gfx_Triangle(X1 : word; Y1 : word; X2 : word; Y2 : word; X3 : word; Y3 : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_Triangle) + inttostrx(X1) + inttostrx(Y1) + inttostrx(X2) + inttostrx(Y2) + inttostrx(X3) + inttostrx(Y3) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure gfx_TriangleFilled(X1 : word; Y1 : word; X2 : word; Y2 : word; X3 : word; Y3 : word; Color : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_gfx_TriangleFilled) + inttostrx(X1) + inttostrx(Y1) + inttostrx(X2) + inttostrx(Y2) + inttostrx(X3) + inttostrx(Y3) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function img_ClearAttributes(Handle : word; Index : word; Value : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_ClearAttributes) + inttostrx(Handle) + inttostrx(Index) + inttostrx(Value) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function img_Darken(Handle : word; Index : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_Darken) + inttostrx(Handle) + inttostrx(Index) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function img_Disable(Handle : word; Index : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_Disable) + inttostrx(Handle) + inttostrx(Index) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function img_Enable(Handle : word; Index : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_Enable) + inttostrx(Handle) + inttostrx(Index) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function img_GetWord(Handle : word; Index : word; Offset  : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_GetWord) + inttostrx(Handle) + inttostrx(Index) + inttostrx(Offset ) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function img_Lighten(Handle : word; Index : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_Lighten) + inttostrx(Handle) + inttostrx(Index) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function img_SetAttributes(Handle : word; Index : word; Value : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_SetAttributes) + inttostrx(Handle) + inttostrx(Index) + inttostrx(Value) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function img_SetPosition(Handle : word; Index : word; Xpos : word; Ypos : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_SetPosition) + inttostrx(Handle) + inttostrx(Index) + inttostrx(Xpos) + inttostrx(Ypos) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function img_SetWord(Handle : word; Index : word; Offset  : word; Word : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_SetWord) + inttostrx(Handle) + inttostrx(Index) + inttostrx(Offset ) + inttostrx(Word) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function img_Show(Handle : word; Index : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_Show) + inttostrx(Handle) + inttostrx(Index) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function img_Touched(Handle : word; Index : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_img_Touched) + inttostrx(Handle) + inttostrx(Index) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function media_Flush() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_Flush) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure media_Image(X : word; Y : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_Image) + inttostrx(X) + inttostrx(Y) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function media_Init() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_Init) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function media_RdSector(var SectorIn : t4DSector) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_RdSector) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResSector(SectorIn) ;
end ;

function media_ReadByte() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_ReadByte) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function media_ReadWord() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_ReadWord) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure media_SetAdd(HiWord : word; LoWord : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_SetAdd) + inttostrx(HiWord) + inttostrx(LoWord) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure media_SetSector(HiWord : word; LoWord : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_SetSector) + inttostrx(HiWord) + inttostrx(LoWord) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure media_Video(X : word; Y : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_Video) + inttostrx(X) + inttostrx(Y) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure media_VideoFrame(X : word; Y : word; Framenumber : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_VideoFrame) + inttostrx(X) + inttostrx(Y) + inttostrx(Framenumber) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function media_WriteByte(Byte : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_WriteByte) + inttostrx(Byte) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function media_WriteWord(Word : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_WriteWord) + inttostrx(Word) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function media_WrSector(SectorOut : t4DSector) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_media_WrSector) + ByteArraytoString(@SectorOut, 512) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function mem_Free(Handle : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_mem_Free) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function mem_Heap() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_mem_Heap) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function pin_HI(Pin : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_pin_HI) + inttostrx(Pin) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function pin_LO(Pin : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_pin_LO) + inttostrx(Pin) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function pin_Read(Pin : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_pin_Read) + inttostrx(Pin) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function pin_Set(Mode : word; Pin : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_pin_Set) + inttostrx(Mode) + inttostrx(Pin) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure putCH(WordChar : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_putCH) + inttostrx(WordChar) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function putstr(InString : AnsiString) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_putstr) + InString + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function readString(Handle : word; var StringIn : ansistring) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_readString) + inttostrx(Handle) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResStr(StringIn) ;
end ;

procedure setbaudWait(Newrate : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_setbaudWait) + inttostrx(Newrate) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  SetThisBaudrate(Newrate) ; // change this systems baud rate to match new display rate, ACK is 100ms away
  GetAck() ;
end ;

procedure snd_BufSize(Bufsize : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_snd_BufSize) + inttostrx(Bufsize) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure snd_Continue() ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_snd_Continue) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure snd_Pause() ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_snd_Pause) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function snd_Pitch(Pitch : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_snd_Pitch) + inttostrx(Pitch) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function snd_Playing() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_snd_Playing) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure snd_Stop() ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_snd_Stop) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

procedure snd_Volume(Volume : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_snd_Volume) + inttostrx(Volume) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function sys_GetModel(var ModelStr : ansistring) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_sys_GetModel) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResStr(ModelStr) ;
end ;

function sys_GetPmmC() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_sys_GetPmmC) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function sys_GetVersion() : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_sys_GetVersion) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function sys_Sleep(Units : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_sys_Sleep) + inttostrx(Units) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure touch_DetectRegion(X1 : word; Y1 : word; X2 : word; Y2 : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_touch_DetectRegion) + inttostrx(X1) + inttostrx(Y1) + inttostrx(X2) + inttostrx(Y2) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function touch_Get(Mode : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_touch_Get) + inttostrx(Mode) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure touch_Set(Mode : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_touch_Set) + inttostrx(Mode) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function txt_Attributes(Attribs : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Attributes) + inttostrx(Attribs) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_BGcolour(Color : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_BGcolour) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_Bold(Bold : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Bold) + inttostrx(Bold) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_FGcolour(Color : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_FGcolour) + inttostrx(Color) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_FontID(FontNumber : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_FontID) + inttostrx(FontNumber) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_Height(Multiplier : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Height) + inttostrx(Multiplier) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_Inverse(Inverse : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Inverse) + inttostrx(Inverse) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_Italic(Italic : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Italic) + inttostrx(Italic) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure txt_MoveCursor(Line : word; Column : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_MoveCursor) + inttostrx(Line) + inttostrx(Column) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function txt_Opacity(TransparentOpaque : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Opacity) + inttostrx(TransparentOpaque) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

procedure txt_Set(Func : word; Value : word) ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Set) + inttostrx(Func) + inttostrx(Value) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  GetAck() ;
end ;

function txt_Underline(Underline : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Underline) + inttostrx(Underline) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_Width(Multiplier : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Width) + inttostrx(Multiplier) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_Wrap(Position : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Wrap) + inttostrx(Position) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_Xgap(Pixels : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Xgap) + inttostrx(Pixels) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function txt_Ygap(Pixels : word) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_txt_Ygap) + inttostrx(Pixels) ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

function writeString(Handle : word; StringOut : AnsiString) : word ;
var
  towrite : AnsiString ;
  written : dword ;
begin
  towrite := inttostrx(F_writeString) + inttostrx(Handle) + StringOut + #0 ;
  WriteFile(ComHandle4D,towrite[1],length(towrite),written, nil) ;
  Result := GetAckResp() ;
end ;

