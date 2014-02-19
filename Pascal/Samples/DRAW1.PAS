unit Draw1;
(****************************************************************************************
*                                                                                       *
*  4D Serial Sample                                                                     *
*                                                                                       *
*  Date:        28 November 2012                                                        *
*                                                                                       *
*  Description: Demonstrates the rebirthing of TouchTestDraw.4DG as a Windows Pascal    *
*               program by using the 4D Serial Environment                              *
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
    Button1: TButton;
    Button2: TButton;
    ColorDialog1: TColorDialog;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Clsclick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    newcolor : word ;
    pgexit   : integer ;
    { Private declarations }
    procedure combobox2set ;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Clsclick(Sender: TObject);
begin
 pgexit := 1 ;
end;

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
     { enum against HKEY_Local_MAchine \ mysoft
            to determine versions installed }
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
 pgexit := -2 ;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  combobox2set ;
  combobox2.itemindex := combobox2.items.count - 1 ;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 pgexit := -1 ;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 firstx, firsty, x, y, state : integer ;


begin ;
  TimeLimit4D   := 2000 ; // 2 second timeout on all commands
//  error_Abort4D := true ; // abort on detected 4D Serial error
  OpenComm(combobox2.Text, combobox1.itemindex) ; // assumes that itemindex matches 4dgl baud rate
  gfx_Cls() ;
  newcolor := LIGHTGREEN ;
  pgexit := 0 ;
  putstr('DRAW.....');

  touch_Set(TOUCH_ENABLE);                                    // enable the touch screen
  while(touch_Get(TOUCH_STATUS) <>  TOUCH_PRESSED) do;           // we'll wait for a touch
  firstx := touch_Get(TOUCH_GETX);                            // so we can get the first point
  firsty := touch_Get(TOUCH_GETY);
  while(pgexit >= 0) do begin ;
    application.ProcessMessages ;
    state := touch_Get(TOUCH_STATUS);                       // look for any touch activity
    x := touch_Get(TOUCH_GETX);                             // grab the x
    y := touch_Get(TOUCH_GETY);                             // and the y coordinates of the touch
    if(state = TOUCH_PRESSED)                              // if there's a press
    then begin ;
      firstx := x;
      firsty := y;
      end ;

    if(state = TOUCH_MOVING)                               // if there's movement
    then begin ;
      gfx_Line(firstx, firsty, x, y, newcolor);         // but lines are much better
      firstx := x;
      firsty := y;
      end  ;
    if pgexit = 1
    then begin ;
      gfx_Cls() ;
      pgexit := 0 ;
      end ;
    end ;                                 // and we'll hang around doing it all day long

  gfx_Cls();
  closehandle(ComHandle4D) ;
end;

procedure TForm1.Button2Click(Sender: TObject);
function crgbto565(incolor : integer) : word ;
var
 colr : word ;
 colg : word ;
 colb : word ;
begin ;
 colb := trunc(((incolor shr 16) and $ff / 256) * 32) ;
 colg := trunc(((incolor shr 8) and $ff / 256) * 64) ;
 colr := trunc((incolor  and $ff / 256) * 32) ;
 result := colr shl 11 + colg shl 5 + colb ;
 end ;
begin
 if colordialog1.execute
 then newcolor := crgbto565(colordialog1.color) ;
end;

end.
