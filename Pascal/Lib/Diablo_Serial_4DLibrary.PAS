unit Diablo_Serial_4DLibrary;
// SPE Version 1.1 added bus_ and pin_ functions
interface
uses windows ;
type
{$I Diablo_Types4D.inc}
const
{$I Diablo_CONST4DSERIAL.INC}
{$I Diablo_CONST4D.INC}
  Err_OK      = 0 ;
  Err_Timeout = 1 ;
  Err_NAK     = 2 ;
type
 TErrorCallback = procedure(ErrCode : integer; Errorbyte : byte)
                            of object;
 TErrorCallbackcmd = procedure(ErrCode : integer; Errorbyte : byte) ;
function bus_Read8() : word ;
procedure bus_Write8(Bits : word) ;
function charheight(TestChar : AnsiChar) : word ;
function charwidth(TestChar : AnsiChar) : word ;
function file_CallFunction(Handle : word; ArgCount : word; Args : t4DWordArray) : word ;
function file_Close(Handle : word) : word ;
function file_Count(Filename : AnsiString) : word ;
function file_Dir(Filename : AnsiString) : word ;
function file_Erase(Filename : AnsiString) : word ;
function file_Error() : word ;
function file_Exec(Filename : AnsiString; ArgCount : word; Args : t4DWordArray) : word ;
function file_Exists(Filename : AnsiString) : word ;
function file_FindFirst(Filename : AnsiString) : word ;
function file_FindFirstRet(Filename : AnsiString; var StringIn : ansistring) : word ;
function file_FindNext() : word ;
function file_FindNextRet(var StringIn : ansistring) : word ;
function file_GetC(Handle : word) : ansichar ;
function file_GetS(var StringIn : ansistring; Size : word; Handle : word) : word ;
function file_GetW(Handle : word) : word ;
function file_Image(X : word; Y : word; Handle : word) : word ;
function file_Index(Handle : word; HiSize : word; LoSize : word; Recordnum : word) : word ;
function file_LoadFunction(Filename : AnsiString) : word ;
function file_LoadImageControl(Datname : AnsiString; GCIName : AnsiString; Mode : word) : word ;
function file_Mount() : word ;
function file_Open(Filename : AnsiString; Mode : AnsiChar) : word ;
function file_PlayWAV(Filename : AnsiString) : word ;
function file_PutC(Character : AnsiChar; Handle : word) : word ;
function file_PutS(StringOut : AnsiString; Handle : word) : word ;
function file_PutW(Word : word; Handle : word) : word ;
function file_Read(Data : t4DByteArray; Size : word; Handle : word) : word ;
function file_Rewind(Handle : word) : word ;
function file_Run(Filename : AnsiString; ArgCount : word; Args : t4DWordArray) : word ;
function file_ScreenCapture(X : word; Y : word; Width : word; Height : word; Handle : word) : word ;
function file_Seek(Handle : word; HiWord : word; LoWord : word) : word ;
function file_Size(Handle : word; var HiWord : word; var LoWord : word) : word ;
function file_Tell(Handle : word; var HiWord : word; var LoWord : word) : word ;
function file_Write(Size : word; Source : t4DByteArray; Handle : word) : word ;
function gfx_BevelShadow(Value : word) : word ;
function gfx_BevelWidth(Value : word) : word ;
function gfx_BGcolour(Color : word) : word ;
function gfx_Contrast(Contrast : word) : word ;
function gfx_FrameDelay(Msec : word) : word ;
function gfx_Get(Mode : word) : word ;
function gfx_GetPixel(X : word; Y : word) : word ;
function gfx_LinePattern(Pattern : word) : word ;
function gfx_Orbit(Angle : word; Distance : word; var Xdest : word; var Ydest : word) : word ;
function gfx_OutlineColour(Color : word) : word ;
function gfx_ScreenMode(ScreenMode : word) : word ;
function gfx_Slider(Mode : word; X1 : word; Y1 : word; X2 : word; Y2 : word; Color : word; Scale : word; Value : word) : word ;
function gfx_Transparency(OnOff : word) : word ;
function gfx_TransparentColour(Color : word) : word ;
function img_ClearAttributes(Handle : word; Index : word; Value : word) : word ;
function img_Darken(Handle : word; Index : word) : word ;
function img_Disable(Handle : word; Index : word) : word ;
function img_Enable(Handle : word; Index : word) : word ;
function img_GetWord(Handle : word; Index : word; Offset  : word) : word ;
function img_Lighten(Handle : word; Index : word) : word ;
function img_SetAttributes(Handle : word; Index : word; Value : word) : word ;
function img_SetPosition(Handle : word; Index : word; Xpos : word; Ypos : word) : word ;
function img_SetWord(Handle : word; Index : word; Offset  : word; Word : word) : word ;
function img_Show(Handle : word; Index : word) : word ;
function img_Touched(Handle : word; Index : word) : word ;
function media_Flush() : word ;
function media_Init() : word ;
function media_RdSector(var SectorIn : t4DSector) : word ;
function media_ReadByte() : word ;
function media_ReadWord() : word ;
function media_WriteByte(Byte : word) : word ;
function media_WriteWord(Word : word) : word ;
function media_WrSector(SectorOut : t4DSector) : word ;
function mem_Free(Handle : word) : word ;
function mem_Heap() : word ;
function pin_HI(Pin : word) : word ;
function pin_LO(Pin : word) : word ;
function pin_Read(Pin : word) : word ;
function pin_Set(Mode : word; Pin : word) : word ;
procedure putCH(WordChar : word) ;
function putstr(InString : AnsiString) : word ;
function readString(Handle : word; var StringIn : ansistring) : word ;
function snd_Pitch(Pitch : word) : word ;
function snd_Playing() : word ;
function sys_GetModel(var ModelStr : ansistring) : word ;
function sys_GetPmmC() : word ;
function sys_GetVersion() : word ;
function sys_Sleep(Units : word) : word ;
function touch_Get(Mode : word) : word ;
function txt_Attributes(Attribs : word) : word ;
function txt_BGcolour(Color : word) : word ;
function txt_Bold(Bold : word) : word ;
function txt_FGcolour(Color : word) : word ;
function txt_FontID(FontNumber : word) : word ;
function txt_Height(Multiplier : word) : word ;
function txt_Inverse(Inverse : word) : word ;
function txt_Italic(Italic : word) : word ;
function txt_Opacity(TransparentOpaque : word) : word ;
function txt_Underline(Underline : word) : word ;
function txt_Width(Multiplier : word) : word ;
function txt_Wrap(Position : word) : word ;
function txt_Xgap(Pixels : word) : word ;
function txt_Ygap(Pixels : word) : word ;
function writeString(Handle : word; StringOut : AnsiString) : word ;
procedure blitComtoDisplay(X : word; Y : word; Width : word; Height : word; Pixels : t4DByteArray) ;
procedure file_Unmount() ;
procedure gfx_Button(Up : word; x : word; y : word; buttonColour : word; txtColour : word; font : word; txtWidth : word; txtHeight : word;  text : AnsiString) ;
procedure gfx_ChangeColour(OldColor : word; NewColor : word) ;
procedure gfx_Circle(X : word; Y : word; Radius : word; Color : word) ;
procedure gfx_CircleFilled(X : word; Y : word; Radius : word; Color : word) ;
procedure gfx_Clipping(OnOff : word) ;
procedure gfx_ClipWindow(X1 : word; Y1 : word; X2 : word; Y2 : word) ;
procedure gfx_Cls() ;
procedure gfx_Ellipse(X : word; Y : word; Xrad : word; Yrad : word; Color : word) ;
procedure gfx_EllipseFilled(X : word; Y : word; Xrad : word; Yrad : word; Color : word) ;
procedure gfx_Line(X1 : word; Y1 : word; X2 : word; Y2 : word; Color : word) ;
procedure gfx_LineTo(X : word; Y : word) ;
procedure gfx_MoveTo(X : word; Y : word) ;
procedure gfx_Panel(Raised : word; X : word; Y : word; Width : word; Height : word; Color : word) ;
procedure gfx_Polygon(n : word; Xvalues : t4DWordArray; Yvalues : t4DWordArray; Color : word) ;
procedure gfx_PolygonFilled(n : word; Xvalues : t4DWordArray; Yvalues : t4DWordArray; Color : word) ;
procedure gfx_Polyline(n : word; Xvalues : t4DWordArray; Yvalues : t4DWordArray; Color : word) ;
procedure gfx_PutPixel(X : word; Y : word; Color : word) ;
procedure gfx_Rectangle(X1 : word; Y1 : word; X2 : word; Y2 : word; Color : word) ;
procedure gfx_RectangleFilled(X1 : word; Y1 : word; X2 : word; Y2 : word; Color : word) ;
procedure gfx_ScreenCopyPaste(Xs : word; Ys : word; Xd : word; Yd : word; Width : word; Height : word) ;
procedure gfx_Set(Func : word; Value : word) ;
procedure gfx_SetClipRegion() ;
procedure gfx_Triangle(X1 : word; Y1 : word; X2 : word; Y2 : word; X3 : word; Y3 : word; Color : word) ;
procedure gfx_TriangleFilled(X1 : word; Y1 : word; X2 : word; Y2 : word; X3 : word; Y3 : word; Color : word) ;
procedure media_Image(X : word; Y : word) ;
procedure media_SetAdd(HiWord : word; LoWord : word) ;
procedure media_SetSector(HiWord : word; LoWord : word) ;
procedure media_Video(X : word; Y : word) ;
procedure media_VideoFrame(X : word; Y : word; Framenumber : word) ;
procedure setbaudWait(Newrate : word) ;
procedure snd_BufSize(Bufsize : word) ;
procedure snd_Continue() ;
procedure snd_Pause() ;
procedure snd_Stop() ;
procedure snd_Volume(Volume : word) ;
procedure touch_DetectRegion(X1 : word; Y1 : word; X2 : word; Y2 : word) ;
procedure touch_Set(Mode : word) ;
procedure txt_MoveCursor(Line : word; Column : word) ;
procedure txt_Set(Func : word; Value : word) ;
function OpenComm(comport : string; newrate : integer) : integer ;
var
 // 4D Global variables
 ComHandle4D   : thandle ;  // comp port handle, used by Intrinsic routines
 Error4D       : integer ;  // Error indicator,  used and set by Intrinsic routines
 error_Inv4D   : byte ;     // Error byte returned from com port, onl set if error = Err_Invalid
 Callback4D    : TErrorCallback ; // if exists will be called when an error is detected
 Callback4Dcmd : TErrorCallbackcmd ; // if exists will be called when an error is detected
 TimeLimit4D   : integer ;  // time limit in ms for total serial command duration, 2000 (2 seconds) should be adequate for most commands
                            // assuming a reasonable baud rate AND low latency AND 0 for the Serial Delay Parameter
                            // temporary increase might be required for very long (bitmap write, large image file opens)
                            // or indeterminate (eg file_exec, file_run, file_callFunction) commands

implementation
{$I Diablo_Intrinsic4DRoutines.pas}

function OpenComm(comport : string; newrate : integer) : integer ;
var
 comx     : pchar ;
 com1time : tcommtimeouts ;
 errs     : dword ;
 port     : string ;
begin
 if copy(comport,4,1) = ' '                        // remove blank if there are comports gt 10
 then port := '\\.\COM' + copy(comport,5,99)
 else port := '\\.\' + comport ;

 comx := pchar(port) ;
 ComHandle4D := createfile(Comx,generic_read + generic_write,0,nil,
                         open_existing,0,0) ;
 if ComHandle4D = invalid_handle_value
 then begin ;
      result := getlasterror() ;
      exit ;
      end ;

 getcommtimeouts(ComHandle4D,com1time) ;
 com1time.readintervaltimeout := maxdword ; {allow for baud rate?!}
                                         { need to allow at least 16.7ms }
 com1time.readtotaltimeoutmultiplier := 0; { give chance to respond }
 com1time.readtotaltimeoutconstant := 10 ; { update 100x a second }
 Setcommtimeouts(ComHandle4D,com1time) ;

 SetBaudrate(Newrate) ;

 errs := $ffff ;
 clearcommerror(ComHandle4D,errs,nil) ;

 purgecomm(ComHandle4D, PURGE_TXABORT+PURGE_RXABORT+PURGE_TXCLEAR+PURGE_RXCLEAR) ;
 result := 0 ;
 end ;

{$I Diablo_Compound4DRoutines.pas}
initialization
 Callback4D := nil ;
 Callback4DCmd := nil ;
end.
