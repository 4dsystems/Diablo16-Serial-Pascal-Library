unit clock1;

(****************************************************************************************
*                                                                                       *
*  4D Serial Sample                                                                     *
*                                                                                       *
*  Date:        28 November 2012                                                        *
*                                                                                       *
*  Description: Demonstrates the rebirthing of Clock.4DG as a Windows Pascal program    *
*               by using the 4D Serial Environment                                      *
*                                                                                       *
****************************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, math, registry, Buttons, Diablo_Serial_4DLibrary ;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    pgexit : integer ;
    { Private declarations }
    procedure combobox2set ;
    procedure callback(ErrCode : integer; Errorbyte : byte) ;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure Tform1.callback(ErrCode : integer; Errorbyte : byte) ;
begin
 if errcode = Err_NAK
 then showmessage('Serial 4D library reports Error ' + Error4DText[errcode] + ' Returned data= ' + format('%2.2x',[ErrorByte]))
 else showmessage('Serial 4D library reports Error ' + Error4DText[errcode]) ;
 halt(5) ;
end ;

procedure TForm1.ComboBox2DropDown(Sender: TObject);
var
 i : integer ;
begin
 i := combobox2.itemindex ;
 combobox2set ;

 if i >= combobox2.items.count
 then combobox2.itemindex := combobox2.items.count-1
 else combobox2.itemindex := i ;
end;

procedure TForm1.combobox2set ;
 var
 gtnine : boolean ;
 i     : integer ;
 info  : tregkeyinfo ;
 tsr   : tstringlist ;
 tsr2  : tstringlist ;
 tr    : TRegistry;
begin
 combobox2.items.clear ;
 tsr := tstringlist.create ;
 tsr2 := tstringlist.create ;
 TR := TRegistry.Create;
 WITH TR DO
   try
     // enum against HARDWARE\DEVICEMAP\SERIALCOMM to determine ports available
     RootKey := HKEY_Local_Machine ;
     if OpenKeyreadonly('HARDWARE\DEVICEMAP\SERIALCOMM')
     then begin ;
       getkeyinfo(info) ;
       if info.NumValues <> 0
       then begin ;
         getvaluenames(tsr) ;
         for i := 1 to tsr.count do begin ;
           tsr2.add(readstring(tsr[i-1])) ;
           end ;
         end ;
       end ;
   finally
     free ;
   end ;
 gtnine := false ;
 for i := 0 to tsr2.count-1 do begin ;
   if length(tsr2[i]) > 4
   then gtnine := true ;
   end ;
 for i := 0 to tsr2.count-1 do begin ;
   if  gtnine
    and (length(tsr2[i]) = 4)
   then combobox2.items.add('COM ' + copy(tsr2[i],4,999))
   else combobox2.items.add(tsr2[i]) ;
   end ;
 end ;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 pgexit := 3 ;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  combobox2set ;
  combobox2.itemindex := combobox2.items.count - 1 ;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 pgexit := 2 ;
end;

procedure TForm1.Button1Click(Sender: TObject);
const
 FACECOLOUR = DARKGREEN ;
 SECONDSCOLOUR = RED ;
 MINUTESCOLOUR = LIME ;
 HOURSCOLOUR = YELLOW ;
var    // global variables
 seconds, minutes, hours, ms, nh, nm, ns : word ;
// targetX, targetY : integer ;
 screenwidth, screenheight : integer ;
 xc, yc, r : integer ;
 n, state, x, y, k, colr : integer ;
 orbitx : word ;
 orbity : word ;

// draw the line for a clock hand
procedure DrawHand(length : integer; angle : integer; colour : integer) ;
begin ;
  gfx_MoveTo(xc, yc);  // MUST RE_ESTABLISH THE CENTRE POINT!!!

  gfx_Set(OBJECT_COLOUR, colour);
  gfx_Orbit(angle-90, length,orbitx,orbity);
  gfx_LineTo(orbitx , orbity);     // but it should be gfx_LineTo, this is now correct
end ;


begin ; // func main()
  TimeLimit4D   := 2000 ; // 2 second timeout on all commands
  CallBack4D    := CallBack ;

//  Callback4D    := nil ;  // TEMP we will handle all errors
//  error_Abort4D := true ; // abort on detected 4D Serial error
  OpenComm(combobox2.Text, combobox1.itemindex ) ; // assumes that itemindex matches 4dgl baud rate
  pgexit := 0;
  gfx_Cls() ;
  txt_Set(TEXT_OPACITY, OPAQUE);


  // get the screen resolution and centrepoint
  screenwidth := gfx_Get( X_MAX );
  screenheight := gfx_Get( Y_MAX );
  xc := screenwidth shr 1;
  yc := screenheight shr 1;

  txt_FontID(FONT_4) ;
//  txt_MoveCursor(25,7);
  gfx_MoveTo(40, screenheight-30);
  txt_Set(TEXT_COLOUR, WHITE);
  putstr('4D Systems ');
  txt_Set(TEXT_COLOUR, RED);
  putstr('4');
  txt_Set(TEXT_COLOUR, CYAN);
  putstr('D');
  txt_Set(TEXT_COLOUR, YELLOW);
  putstr('G');
  txt_Set(TEXT_COLOUR, LIME);
  putstr('L');

  // calculate a radius suitable for landscape or portrate mode
  r := MIN(screenwidth, screenheight) shr 1;

  // draw the clock face
  gfx_Set(PEN_SIZE, SOLID);
  gfx_Circle( xc, yc, r-16, FACECOLOUR );


  // draw the clocks outer dress ring
  gfx_Set(PEN_SIZE, OUTLINE);
  n := -8;
  while n < 8 do begin ;
      inc(n) ;
      colr := ABS(n) + 12 xor 31;
      gfx_Circle( xc, yc, r+n-8, colr );
    end ;

  // set up the centre point
  gfx_MoveTo(xc, yc);

  // a target variable for the orbit command
  // not needed for serial gfx_OrbitInit(&targetX, &targetY);

  // mark the hours round the clockface
  gfx_Set(PEN_SIZE, SOLID);
  gfx_MoveTo(xc, yc);
  n := -90;   // 12 o'clock position
  while (n<270) do begin ;
    gfx_Orbit(n, r-6, orbitx, orbity);
    k := 3;
    if ((n mod 90) = 0 )
    then k := 5;
    gfx_Circle(orbitx , orbity, k, BLUE);
    n := n + 30;   // each 30 degreees
    end ;

  touch_Set(TOUCH_ENABLE);         // enable the touch screen

  // each second, redraw the clock face
  repeat
    DrawHand(r-20, seconds*6, FACECOLOUR);            // undraw the second hand
    gfx_Circle(orbitx , orbity,  3, FACECOLOUR);

    DrawHand(r-35, trunc(minutes*6+seconds/10), FACECOLOUR);            // undraw the minute hand
    gfx_Circle(orbitx , orbity,  5, FACECOLOUR);

    DrawHand(r-50, hours*30+minutes shr 1, FACECOLOUR);  // undraw the hour hand
    gfx_Circle(orbitx , orbity,  7, FACECOLOUR);

    gfx_Circle( xc, yc, 5, FACECOLOUR );

    // calculate the new time
    label3.Caption := timetostr(now) ;
    decodetime(Now,hours,minutes,seconds,ms) ;

    DrawHand(r-20, seconds*6, SECONDSCOLOUR);               // redraw the second hand
    gfx_Circle(orbitx , orbity, 3, SECONDSCOLOUR);

    DrawHand(r-35, trunc(minutes*6+seconds/10), MINUTESCOLOUR);    // redraw the minute hand
    gfx_Circle(orbitx , orbity,  5, MINUTESCOLOUR);

    DrawHand(r-50, hours*30+minutes shr 1, HOURSCOLOUR);       // redraw the hour hand
    gfx_Circle(orbitx , orbity,  7, HOURSCOLOUR);

    gfx_Circle( xc, yc, 5, ORANGE );

    txt_Set(TEXT_COLOUR, LIGHTGREY);
    txt_Set(FONT_SIZE, FONT3);
    txt_MoveCursor(1, 5);
    putstr ('The Time is ' + format('%2.2d', [hours]) + ':' + format('%2.2d', [minutes]) + ':' + format('%2.2d', [seconds]));

    repeat
      decodetime(now,nh,nm,ns,ms) ;
      if (touch_Get(TOUCH_STATUS) = TOUCH_PRESSED)
      then begin ;
        pgexit := 1;
        break;                                          // if there's a press exit
        end ;
      until (nh <> hours) or (nm <> minutes) or (ns <> seconds) ;
    application.processmessages ;
    until(pgexit <> 0);

  gfx_Cls();
  if pgexit = 1
  then label3.Caption := 'Stopped by Touch'
  else label3.Caption := 'Stopped by cancel' ;
  closehandle(ComHandle4D) ;
end;

end.
