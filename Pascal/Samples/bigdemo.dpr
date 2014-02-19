program bigdemo;

(****************************************************************************************
*                                                                                       *
*  4D Serial Sample                                                                     *
*                                                                                       *
*  Date:        28 November 2012                                                        *
*                                                                                       *
*  Description: Demonstrates Pretty much every 4D Serial command.                       *
*               This has been written as a console application.                         *
*                                                                                       *
*               The following files are needed on the uSD to complete all tests. Their  *
*               relative location (from C:\Users\Public\Documents\4D Labs) is shown     *
*               gfx2demo.gci    resources\GC Files                                      *
*               gfx2demo.dat    resources\GC Files                                      *
*               KBFunc.4fn      Picaso ViSi (must be recompiled for Diablo)             *
*               KBFunc.gci      Picaso ViSi                                             *
*               KBFunc.dat      Picaso ViSi                                             *
*               Space.wav       Picaso ViSi Genie\SoundPlayer.ImgData                   *
*                                                                                       *
****************************************************************************************)


{$APPTYPE CONSOLE}

uses
  math,
  windows,
  Diablo_Serial_4DLibrary,
  SysUtils;

const
 maxrates = 19 ;
type
  datar = record
    recnum : integer ;
    values : array[1..5] of ansichar ;
    idx    : ansichar ;
    end;
  tbaudratea = array[0..maxrates] of integer ;
const
  gfx2demogci = 'gfx2demo.gci' ;
  gfx2demodat = 'gfx2demo.dat' ;
  functest    = 'kbfunc.4fn' ;
  functestg   = 'kbfunc.gci' ;
  functestd   = 'kbfunc.dat' ;
  soundtest   = 'space.wav' ;
  testdat     = 'test.dat' ;
  baudrates : tbaudratea = (   110,    300,    600,   1200,   2400,   4800,   9600, 14400, 19200, 31250, 38400, 56000, 57600,
                            115200, 128000, 256000, 300000, 375000, 500000, 600000) ;

  Image : array[0..2053] of byte = (0,  32,   0,  32,  16,   0, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51, $84, $31, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $84, $51, $10, $A2, $10, $A2, $84, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $84, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $84, $51,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $84, $51,
    $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $84, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $84, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2,
    $84, $31, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $84, $51, $10, $A2, $10, $A2, $10, $A2,
    $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $84, $31, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $84, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2,
    $10, $A2, $84, $31, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $84, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2,
    $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $84, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $84, $51, $10, $A2,
    $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $21, $04, $29, $45, $31, $A6, $94, $B2, $94, $92, $94, $92, $84, $31, $5A, $EC,
    $18, $E4, $10, $A2, $84, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $84, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $21, $24, $B5, $96, $29, $65,
    $42, $29, $CE, $7A, $C6, $18, $C6, $18, $C6, $18, $C6, $39, $BD, $F8, $52, $CB, $10, $A2, $84, $31, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $84, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2,
    $10, $A2, $10, $A2, $21, $24, $C6, $18, $AD, $55, $21, $24, $42, $29, $C6, $38, $B5, $96, $B5, $96, $B5, $B7, $BD, $F8, $BD, $F8,
    $BD, $F8, $5A, $CB, $10, $A2, $84, $31, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $8C, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $21, $24, $C6, $18, $C6, $39, $A5, $14, $21, $24, $21, $45,
    $42, $29, $39, $E7, $39, $E7, $52, $8A, $9C, $F4, $BD, $F8, $BD, $F8, $AD, $76, $29, $45, $10, $A2, $84, $31, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $84, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $21, $24,
    $C6, $18, $C6, $39, $BD, $F8, $94, $B2, $21, $04, $10, $A2, $10, $A2, $10, $A3, $10, $A2, $10, $A2, $21, $04, $A5, $55, $BD, $F8,
    $BD, $D7, $5B, $0C, $10, $A2, $10, $A2, $84, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $84, $51, $10, $A2, $10, $A2,
    $10, $A2, $10, $A2, $10, $A2, $10, $A2, $21, $24, $C6, $18, $C6, $39, $BD, $F8, $A5, $35, $42, $08, $10, $A3, $29, $65, $D5, $34,
    $E4, $0F, $E3, $EF, $BA, $89, $20, $A3, $52, $8A, $C6, $39, $BD, $F8, $7B, $F0, $10, $A2, $10, $A2, $10, $A2, $84, $31, $FF, $FF,
    $FF, $FF, $FF, $FF, $84, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $21, $25, $C6, $18, $C6, $39, $BD, $F8,
    $A5, $35, $42, $08, $10, $A3, $29, $65, $D4, $F3, $DA, $28, $D9, $A6, $D9, $A6, $C1, $85, $38, $C3, $29, $86, $D6, $9A, $BD, $F8,
    $7B, $F0, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $84, $31, $FF, $FF, $84, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2,
    $10, $A2, $21, $25, $C6, $18, $C6, $39, $BD, $F8, $A5, $35, $42, $08, $10, $A3, $29, $04, $BB, $8E, $A9, $C6, $A1, $65, $A1, $65,
    $A1, $65, $69, $04, $18, $A2, $52, $8A, $CE, $7A, $BD, $F8, $6B, $6E, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $84, $31,
    $8C, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $21, $25, $C6, $18, $C6, $39, $BD, $F8, $AD, $55, $42, $08, $10, $A3,
    $10, $A2, $18, $A3, $20, $A2, $18, $A2, $18, $A2, $18, $A2, $18, $A2, $10, $A2, $18, $E4, $BD, $F7, $C6, $18, $B5, $B7, $42, $08,
    $10, $A2, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $8C, $51, $FF, $FF, $8C, $51, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $C6, $38,
    $C6, $39, $BD, $F8, $BD, $F8, $9C, $D3, $63, $0C, $63, $2D, $63, $2D, $63, $0C, $21, $04, $29, $45, $6B, $4D, $63, $4D, $63, $2D,
    $7B, $CF, $C6, $39, $C6, $39, $BD, $F8, $84, $31, $18, $E4, $10, $A2, $10, $A2, $10, $A2, $10, $A2, $8C, $51, $FF, $FF, $FF, $FF,
    $FF, $FF, $8C, $51, $10, $A2, $10, $A2, $10, $A3, $D6, $BB, $BD, $F8, $BD, $F8, $BD, $F8, $BD, $F8, $C6, $39, $C6, $39, $C6, $39,
    $AD, $76, $21, $25, $42, $49, $D6, $9A, $C6, $39, $C6, $39, $C6, $39, $BE, $18, $BD, $F8, $94, $B3, $29, $86, $10, $A2, $10, $A2,
    $10, $a2, $10, $a2, $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51, $10, $a2, $10, $a3, $D6, $BA, $BD, $F8,
    $BD, $F8, $BD, $F8, $BD, $F8, $BD, $F8, $BD, $F8, $BD, $F8, $A5, $14, $21, $24, $42, $29, $CE, $59, $BD, $F8, $BD, $F8, $BD, $D7,
    $AD, $75, $73, $CF, $29, $65, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $8C, $51, $10, $a3, $7B, $CF, $5A, $CB, $5A, $CB, $5A, $CB, $5a, $cb, $63, $2C, $B5, $B7, $BD, $F8, $A5, $14,
    $21, $24, $31, $A6, $6B, $6E, $5A, $EB, $5a, $cb, $4A, $6A, $29, $86, $18, $C3, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $8C, $51,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51, $10, $a2, $10, $a2, $10, $a2,
    $10, $a2, $10, $a2, $10, $a2, $BD, $D7, $BD, $F8, $A5, $14, $21, $24, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2,
    $10, $a2, $10, $a2, $10, $a2, $10, $a2, $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $BD, $F7, $BD, $F8, $9C, $F4, $21, $04,
    $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51, $10, $a2, $10, $a2,
    $10, $a2, $10, $a2, $7B, $CF, $63, $2D, $52, $AA, $18, $E3, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2,
    $10, $a2, $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2,
    $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51, $10, $a2,
    $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $8C, $51, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2,
    $10, $a2, $10, $a2, $10, $a2, $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51,
    $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $10, $a2,
    $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $8C, $51, $10, $a2, $10, $a2, $10, $a2, $10, $a2, $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $51, $10, $a2, $10, $a2, $8C, $51, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $8C, $51, $8C, $51, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF) ;

  atoz : ansistring = 'abcdefghijklmnopqrstuvwxyz' ;

 var
  bytes  : array[0..19] of byte ;
  data   : datar ;
  handle : word ;
  h1     : word ;
  h2     : word ;
  i      : integer ;
  orbitx : word ;
  orbity : word ;
  rc     : integer ;
  w1     : word ;
  w2     : word ;
  rawbase : integer ;

  // testing variables
  baud_Rate   : integer ;
  fFATtests   : boolean ;
  fmediatests : boolean ;
  fimgtests   : boolean ;
  ftouchtests : boolean ;
  floadtests  : boolean ;
  fsoundtests : boolean ;
  wks         : ansistring ;

procedure callback(ErrCode : integer; Errorbyte : byte) ;
begin
 if errcode = Err_NAK
 then writeln('Serial 4D library reports Error ' + Error4DText[errcode] + ' Returned data= ' + format('%2.2x',[ErrorByte]))
 else writeln('Serial 4D library reports Error ' + Error4DText[errcode]) ;
 writeln('Program stopped') ;
 halt(1) ;
end ;

function trymount : boolean ;
const
  retries = 20 ;
var
  i : integer ;
  j : integer ;
begin ;
  i := file_Mount() ;
  j := 0 ;
  if i = 0
  then begin ;
    write('Please insert the uSD card') ;
    while (i = 0) and (j < retries) do begin ;
      write('.') ;
      i := file_Mount() ;
      inc(j) ;
      end;
    end ;
 result := j <> retries ;
 end ;

function RAWPartitionbase(var rawbaseo : integer) : boolean ;
var
  sector  : t4DSector ;
  rawsize : integer ;
  FAT     : boolean ;
  RAW     : boolean ;
begin ;
  result := false ;
  media_SetAdd(0, 0) ;                    // so we test this, could use SetSector instead
  if (media_RdSector(sector) = 0)
  then writeln('read sector failed')
  else begin ;
    rawbaseo := 0 ;
    RAW     := false ;
    FAT     := false ;
    if   (sector[511] = $aa)
     and (sector[510] = $55)
    then begin ; // possible partition table
      if   (    (sector[446] =   0)
             or (sector[446] = $80) )
       and (    (sector[462] =   0)
             or (sector[462] = $80) )
       and (    (sector[478] =   0)
             or (sector[478] = $80) )
       and (    (sector[494] =   0)
             or (sector[494] = $80) )
      then begin ;
        if  (sector[450] = $04)
         or (sector[450] = $06)
         or (sector[450] = $0E)
        then FAT := true ;
        if sector[466] = $DA
        then begin ;
          rawbaseo := sector[470] + sector[471] shl 8 + sector[472]  shl 16 + sector[473]  shl 24 ;
          rawsize := sector[474] + sector[475] shl 8 + sector[476]  shl 16 + sector[477]  shl 24 ;
          result := true ;
          RAW := true ;
          end;
        end
      else if (sector[0] = $EB) // jmp instruction
        then FAT := true
        else RAW := true ; // but no really possible as we couldn't have gotten this far in this program
      end
    else RAW := true ; // but no really possible as we couldn't have gotten this far in this program
 {   if FAT and RAW
    then writeln('Disk has FAT and RAW partitions')
    else if FAT
      then writeln('Disk has FAT partition')
    else if RAW
    then writeln('Disk is RAW, no partition table')}
    end ;
end;

procedure Function_tests ;
var
  j     : integer ;
  k     : integer ;
  l     : integer ;
  m     : integer ;
  parms : array[0..19] of word ;
  wks1  : ansistring ;
  wks2  : ansistring ;
  wks3  : ansistring ;
begin
  gfx_Cls() ;
  putstr('file_Run, file_Exec and' + #10 + 'file_LoadFunction Tests') ;
  writeln('file_Run, file_Exec and file_LoadFunction Tests') ;
  j := mem_Heap() ;
  handle := file_LoadFunction(functest) ;
  h1 := writeString(0,  'Please enter your name') ;   // prompts string
  h2 := writeString(h1, '') ;                         // result string, must be max length if following strings are to be 'kept'
  writeln('String Handles ', h1, ' ', h2) ;
  parms[0] := h1 ;                  // prompt string
  parms[1] := h2 ;                  // result string
  parms[2] := 20 ;
  parms[3] := 1 ;                   // 1 = save screen, 0 = don't save screen
  TimeLimit4D := 5000000 ;          // allow the user time to respond
  i := file_CallFunction(handle, 4, @parms) ;         // calls a function
  writeln('You typed ', i, ' characters') ;
  readString(h2, wks1) ;                              // read string immediately as it will be overwritten 'soon'
  writeln('>', wks1, '<') ;
  k := mem_Heap() ;
  mem_Free(handle) ;
  l := mem_Heap() ;
  sleep(5000) ;                                       // give time to read the 'restored' screen

  h1 := writeString(0,  'Please type anything') ;     // prompts string
  h2 := writeString(h1, '') ;                         // result string, must be max length if following strings are to be 'kept'
  parms[0] := h1 ;                  // prompt string
  parms[1] := h2 ;                  // result string
  parms[2] := 20 ;
  parms[3] := 0 ;                   // 1 = save screen, 0 = don't save screen
  i := file_Exec(functest, 4, @parms) ;
  readString(h2, wks2) ;                              // read string immediately as it will be overwritten 'soon'
  gfx_Cls() ;

  h1 := writeString(0,  'Please some more') ;         // prompts string
  h2 := writeString(h1, '') ;                         // result string, must be max length if following strings are to be 'kept'
  parms[0] := h1 ;                  // prompt string
  parms[1] := h2 ;                  // result string
  parms[2] := 20 ;
  parms[3] := 0 ;                   // 1 = save screen, 0 = don't save screen
  i := file_Run(functest, 4, @parms) ;
  readString(h2, wks3) ;                              // read string immediately as it will be overwritten 'soon'
  gfx_Cls() ;
  m := mem_Heap() ;
  writeln('Memfree before loadfunction = ',j) ;
  writeln('Memfree after loadfunction = ',k) ;
  writeln('Memfree after free = ',l) ;
  writeln('Memfree at end = ',m) ;
  writeln('You typed') ;
  writeln(wks1) ;
  writeln(wks2) ;
  writeln(wks3) ;
  TimeLimit4D := 2000 ; // set back to 2 seconds
end ;

procedure gfx_Part1 ;
begin ;
  gfx_BGcolour(LIGHTGOLD) ;           // to check CLS works with different bg color
  gfx_Cls() ;
  txt_BGcolour(LIGHTGOLD) ;           // to ensure text goesn look odd
  txt_FGcolour(RED) ;
  putstr('gfx_A to gfx_L') ;
  Writeln('gfx_A to gfx_L') ;
  txt_FGcolour(LIME) ;            // reset
  gfx_BevelShadow(1) ;                // make it really dark
  gfx_BevelWidth(6) ;                 // make the button bigger by increasing the bevel size
  for i := 1 to 10 do begin ;
    gfx_Button(ON, 120,50, YELLOW, PURPLE, FONT3, 1, 1, 'Test Button') ;
    sleep(100) ;
    gfx_Button(OFF, 120,50, YELLOW, PURPLE, FONT3, 1, 1, 'Test Button') ;
    sleep(100) ;
    end;
  gfx_BevelShadow(3) ; // back to default
  gfx_ChangeColour(LIME, WHITE) ;
  gfx_Circle(30,30,10,BLUE) ;
  gfx_CircleFilled(130,30,10,BLUE) ;
  gfx_Rectangle(60,60,100,100,RED) ;  // draw a rectange to show where we are clipping
  gfx_ClipWindow(60,60,100,100) ;
  gfx_Clipping(ON) ;                  // turn clipping on but just use it for text
  gfx_Moveto(40,80) ;
  putstr('1234567890asdfghjkl') ;     // this is clipped
  gfx_Clipping(OFF) ;
  sleep(1000) ;
  writeln('Display off') ;
  gfx_Contrast(0) ;
  sleep(1000) ;
  gfx_Contrast(15) ;
  writeln('Display on') ;
  gfx_Ellipse(100,230, 50,30,RED) ;
  gfx_EllipseFilled(100,300, 50,30,AQUA) ;
  gfx_FrameDelay(6) ;
  writeln('X Res=',gfx_Get(X_MAX)+1,' Y Res=',gfx_Get(Y_MAX)+1) ;
  writeln('Pixel at 0,30 is ', format('%4.4x',[gfx_GetPixel(0, 30)])) ;
  gfx_Line(0,0,100,200,BLUE) ;
  gfx_LinePattern($00aa) ;
  gfx_Set(OBJECT_COLOUR, WHITE);
  gfx_LineTo(239,319) ;
  gfx_LinePattern(0) ;            // reser
  gfx_BGcolour(BLACK) ;           // reset
  txt_BGcolour(BLACK) ;           // reset
end;

procedure gfx_Part2 ;
var
  i      : integer ;
  k      : integer ;
  l      : integer ;
  vx     : array[0..19] of word ;
  vy     : array[0..19] of word ;
begin ;
  gfx_Cls() ;
  putstr('gfx_M to gfx_T') ;
  writeln('gfx_M to gfx_T') ;
  k := 180 ;
  l := 80 ;
  gfx_MoveTo(k, l);
  gfx_CircleFilled(k,l,5,BLUE) ;
  i := -90;   // 12 o'clock position
  while (i<270) do begin ;
    gfx_Orbit(i, 30, orbitx, orbity);
    k := 3;
    if ((i mod 90) = 0 )
    then k := 5;
    gfx_Circle(orbitx , orbity, k, BLUE);
    i := i + 30;   // each 30 degreees
    end ;

  gfx_OutlineColour(YELLOW) ;
  gfx_Panel(PANEL_RAISED,140,0,190,20, LIME) ;
  gfx_OutlineColour(0) ;                    // turn outline off

   vx[0] := 36;   vy[0] := 110;
   vx[1] := 36;   vy[1] := 80;
   vx[2] := 50;   vy[2] := 80;
   vx[3] := 50;   vy[3] := 110;
   vx[4] := 76;   vy[4] := 104;
   vx[5] := 85;   vy[5] := 80;
   vx[6] := 94;   vy[6] := 104;
   vx[7] := 76;   vy[7] := 70;
   vx[8] := 85;   vy[8] := 76;
   vx[9] := 94;   vy[9] := 70;
  vx[10] := 110; vy[10] := 66;
  vx[11] := 110; vy[11] := 80;
  vx[12] := 100; vy[12] := 90;
  vx[13] := 120; vy[13] := 90;
  vx[14] := 110; vy[14] := 80;
  vx[15] := 101; vy[15] := 70;
  vx[16] := 110; vy[16] := 76;
  vx[17] := 119; vy[17] := 70;
  // house
  gfx_Rectangle(6,50,66,110,RED);             // frame
  gfx_Triangle(6,50,36,9,66,50,YELLOW);       // roof
  gfx_Polyline(4, @vx, @vy, CYAN);            // door
  // man
  gfx_Circle(85, 56, 10, BLUE);               // head
  gfx_Line(85, 66, 85, 80, BLUE);             // body
  gfx_Polyline(3, @vx[4], @vy[4], CYAN);      // legs
  gfx_Polyline(3, @vx[7], @vy[7], BLUE);      // arms
  // woman
  gfx_Circle(110, 56, 10, PINK);              // head
  gfx_Polyline(5, @vx[10], @vy[10], BROWN);   // dress
  gfx_Line(104, 104, 106, 90, PINK);          // left arm
  gfx_Line(112, 90, 116, 104, PINK);          // right arm
  gfx_Polyline(3, @vx[15], @vy[15], SALMON);  // dress

  vx[0] := 10; vy[0] := 130;
  vx[1] := 35; vy[1] := 125;
  vx[2] := 80; vy[2] := 130;
  vx[3] := 60; vy[3] := 145;
  vx[4] := 80; vy[4] := 160;
  vx[5] := 35; vy[5] := 170;
  vx[6] := 10; vy[6] := 160;
  gfx_Polygon(7, @vx, @vy, RED);

  vx[0] := 110; vy[0] := 130;
  vx[1] := 135; vy[1] := 125;
  vx[2] := 180; vy[2] := 130;
  vx[3] := 160; vy[3] := 145;
  vx[4] := 180; vy[4] := 160;
  vx[5] := 135; vy[5] := 170;
  vx[6] := 110; vy[6] := 160;
  gfx_PolygonFilled(7, @vx, @vy, RED);

  gfx_PutPixel(40, 94, LIME) ;          // door knob
  gfx_Rectangle(0,180, 10,200, AQUA) ;
  gfx_RectangleFilled(20,180, 40,200, ORANGE) ;
  gfx_ScreenCopyPaste(0,0, 0,280, 40,40) ;
  gfx_ScreenMode(LANDSCAPE) ;
//gfx_Set(CLIPPING, ON) ;
//gfx_SetClipRegion() ;
  gfx_Slider(SLIDER_RAISED, 210, 100, 250,10, BLUE, 100, 50) ; // coordinates are different because we are in landscape mode
  gfx_ScreenMode(PORTRAIT) ;
  gfx_Transparency(ON) ;
  gfx_TransparentColour(YELLOW) ;  // how do we 'test' this?
  gfx_Triangle(6,250, 36,209, 66,250,YELLOW);
  gfx_TriangleFilled(110,210, 130,210, 120,230,CYAN);
end ;

procedure text_Tests ;
begin ;
  gfx_Cls() ;
  writeln('Text Tests') ;
  putstr('Text Tests') ;

  txt_Attributes(BOLD + INVERSE + ITALIC + UNDERLINED) ;
  txt_Xgap(3) ;
  txt_Ygap(3) ;
  txt_BGcolour(YELLOW) ;
  txt_FGcolour(WHITE) ;
  txt_FontID(FONT3) ;
  txt_MoveCursor(5, 0) ;
  putstr('Hello There') ;

  txt_MoveCursor(6, 2) ;
  txt_Height(2) ;
  txt_Width(2) ;
  txt_Inverse(OFF) ;
  txt_Italic(OFF) ;
  txt_Opacity(TRANSPARENT) ;
  txt_Set(TEXT_COLOUR, LIME) ;
  txt_Underline(ON) ;
  txt_Bold(OFF) ;
  txt_Wrap(88) ;
  putstr('Hello There') ;
  txt_Height(1) ;
  txt_Width(1) ;
  putCH(ord('z')) ;
  txt_Wrap(0) ;              // reset
  writeln('Char height=', charheight('w'), ' Width=', charwidth('w') ) ;
  txt_BGcolour(BLACK) ;
  txt_FGcolour(LIME) ;
  txt_FontID(FONT3) ;
  txt_MoveCursor(0,0) ;      // reset
end;

procedure FAT_Tests ;
var
  i    : integer ;
  j    : integer ;
  k    : integer ;
  wks  : ansistring ;
begin ;
  gfx_Cls() ;
  writeln('FAT Tests') ;
  putstr('FAT Tests'#10) ;
  writeln('File Error=', file_Error()) ;
  writeln('uSD has ',file_Count('*.*'),' Files') ;
  file_Dir('*.dat') ;     // should this get returned!? FindFirst and next certainly should, both need to be manual as they need 'to(buffer)'

  if (file_Exists(Testdat) <> 0)
  then file_Erase(Testdat) ;
  handle := file_Open(Testdat, 'w') ;
  writeln('Handle=',handle) ;
  // write some stuff to uSD
  file_PutC('a', handle) ;
  file_PutW(1234, handle) ;
  file_PutS('This is a Test', handle) ;
  file_Close(handle) ;

  handle := file_Open(Testdat, 'r') ;
  writeln('Handle=',handle) ;
  // read it back and dump to screen
  writeln(file_GetC(handle)) ;
  writeln(file_GetW(handle)) ;
  i := file_GetS(wks, 100, handle) ;
  writeln('Length=',i,' String="', wks, '"') ;

  file_Rewind(handle) ;
  i := file_Read(@bytes, 10, handle) ;
  write('Bytes read=',i, ' Data=') ;
  for j := 0 to i-1 do begin ;
    write(format('%2.2x',[bytes[j]]),' ') ;
    end;
  writeln ;
  i := file_Tell(handle, w1, w2) ;
  writeln('File pointer=', w1 shl 16 + w2) ;
  i := file_Size(handle, w1, w2) ;
  writeln('File size=', w1 shl 16 + w2) ;

  file_Close(handle) ;
  file_Erase(TestDat) ;

  handle := file_Open(Testdat, 'w') ;
  writeln('Handle=',handle) ;
  for I := 1 to 50 do begin ;
    data.recnum := i ;
    k := i mod 20 ;
    for j := 1 to 5 do begin ;
      data.values[j] := atoz[k+j] ;
      data.idx := atoz[random(25)+1]
      end;
    file_Write(sizeof(data), @data, handle) ;
    end;
  file_Close(handle) ;
  handle := file_Open(Testdat, 'r') ;
  file_Index(handle, sizeof(data) shr 16, sizeof(data) and $FFFF, 5) ;
  i := file_Read(@data, sizeof(data), handle) ;
  writeln(data.recnum,' ', data.values, ' ', data.idx) ;
  file_Seek(handle, 0, 10*sizeof(data)) ;
  i := file_Read(@data, sizeof(data), handle) ;
  writeln(data.recnum,' ', data.values, ' ', data.idx) ;
  file_Close(handle) ;
  file_Erase(TestDat) ;


  file_FindFirstRet('*.dat', wks) ;
  writeln(wks) ;
  file_FindNextRet(wks) ;
  writeln(wks) ;

  handle := file_Open(Testdat, 'w') ;
  writeln('Handle=',handle) ;
  i := sizeof(image) ;
  k := 0 ;
  while i <> 0 do begin ;
    j := min(512, i) ;
    file_Write(j, @image[k], handle) ;
    dec(i,j) ;
    inc(k,j) ;
    end ;
  file_Close(handle) ;
  gfx_Cls() ;
  handle := file_Open(Testdat, 'r') ;
  file_Image(0,0,handle) ;
  file_Close(handle) ;
  gfx_moveto(40,10) ;
  putstr('4D Logo') ;

  file_Erase(TestDat) ;
  handle := file_Open(Testdat, 'w') ;
  writeln('Handle=',handle) ;
  file_ScreenCapture(0,0,100,32, handle) ;
  file_Close(handle) ;

  handle := file_Open(Testdat, 'r') ;
  file_Image(0,40,handle) ;
  file_Rewind(handle) ;
  file_Image(0,80,handle) ;
  file_Rewind(handle) ;
  file_Image(0,120,handle) ;
  file_Close(handle) ;
  file_Erase(TestDat) ;
end;

procedure IMG_Tests ;
var
  handle : word ;
  i      : integer ;
  j      : integer ;
  k      : integer ;
begin ;
  gfx_Cls() ;
  txt_MoveCursor(0, 5) ;
  putstr('IMG Tests') ;
  writeln('IMG Tests') ;
  handle := file_LoadImageControl('gfx2demo.dat', 'gfx2demo.gci', 1) ;
  writeln(handle) ;
  for I := 0 to 4 do begin ;  // 4 is 'default', same as no dark/light ening
    gfx_BevelShadow(i) ;
    img_Darken(handle, 0) ; // bug, darkens atm
    img_Show(handle, 0) ;
    sleep(250) ;
    end;
  for I := 3 downto 0 do begin ;
    gfx_BevelShadow(i) ;
    img_Lighten(handle, 0) ;
    img_Show(handle, 0) ;
    sleep(250) ;
    end;
  gfx_BevelShadow(3) ; // back to default

  img_SetPosition(handle, 0, 0, 50) ; // move to a different position
  img_Show(handle, 0) ;

  j := img_GetWord(handle, 0, IMAGE_FRAMES) ;
  for i := 0 to j-1 do begin ;
    img_SetWord(handle, 0, IMAGE_INDEX, i) ;
    img_Show(handle, 0) ;
    sleep(500) ;
    end;

  img_Disable(handle, ALL) ;
  j := 0 ;
  k := 0 ;
  for i := 36 to 39 do begin ;
    img_SetPosition(handle, i, j, k) ; // move to a different position
    if j = 119
    then begin ;
      k := 149 ;
      j := 0 ;
      end
    else j := 119 ;
    img_Enable(handle, i) ;
    end;
  img_Show(handle,ALL) ;
//  img_ClearAttributes(handle, index, value) ;
//  img_SetAttributes(handle, index, value) ;
  if fTouchTests
  then begin ;
    touch_Set(TOUCH_ENABLE) ;
    writeln('Please Touch an Image') ;
    i := -1 ;
    repeat
      j := touch_Get(TOUCH_STATUS) ;
      if j = TOUCH_PRESSED
      then i := img_Touched(handle, ALL) ;
      until i <> -1 ;
    writeln('You touched Image Index ',i) ;
    end;
  mem_Free(handle) ;
end ;

procedure Media_Tests ;
var
  i      : integer ;
  j      : integer ;
  k      : integer ;
  l      : integer ;
  m      : integer ;
  sector : t4DSector ;
begin
  gfx_Cls() ;
  putstr('Media Tests') ;
  writeln('Media Tests') ;
  file_Unmount() ;    // just to test this and media_Init
  i := media_Init() ;
  if i = 0
  then begin ;
    write('Please insert the uSD card') ;
    while (i = 0) do begin ;
      write('.') ;
      i := media_Init() ;
      end;
    end;

  writeln('First RAW sector=', rawbase) ;
  trymount() ;

  handle := file_Open('gfx2demo.gci', 'r') ;
  file_Seek(handle, $49, $5800) ;   // location of large unicorn file
  i := 128 * 128 * 13 * 2 + 8 ;     // size of large unicorn file
  l := (i div 512) + 1 ;
  // we assume here that the raw partition is big enough to write this, could
  k := rawbase ;
  m := 1 ;
  while i <> 0 do begin ;
    write('Copying sector ', m, ' of ', l, #13) ;
    j := min(512, i) ;
    file_Read(@sector, j, handle) ;
    media_SetSector(k shr 16, k and $FFFF) ;
    inc(k) ;
    media_WrSector(Sector) ;
    dec(i,j) ;
    inc(m) ;
    end ;
  file_Close(handle) ;
  writeln ;
  media_SetSector(rawbase shr 16, rawbase and $FFFF) ;
  media_Image(0,0) ;
  media_SetSector(rawbase shr 16, rawbase and $FFFF) ;
  media_Video(0,128) ;

  media_SetSector(rawbase shr 16, rawbase and $FFFF) ;
  media_WriteByte($11) ;
  media_WriteWord($2233) ;
  media_Flush() ;            // should write 0xFF over the rest of the sector
  media_SetSector(rawbase shr 16, rawbase and $FFFF) ;
  writeln(format('%2.2x %4.4x %4.4x',[media_ReadByte(),media_ReadWord(),media_ReadWord]));
end;

procedure Sound_Tests ;
var
  i   : integer ;
  j   : integer ;
begin
  gfx_Cls() ;
  writeln('Sound Tests') ;
  putstr('Sound Tests') ;
  snd_Volume(127) ;
  snd_BufSize(2) ;
  writeln('Playing') ;
  file_PlayWAV(soundtest) ;
  sleep(10000) ;
  writeln('Pausing') ;
  snd_Pause() ;
  sleep(5000) ;
  writeln('Continuing') ;
  snd_Continue() ;
  sleep(5000) ;
  writeln('Playing with pitch') ;
  i := snd_Pitch($FFFF) ;
  writeln('Original Pitch=',i) ;
  sleep(5000) ;
  snd_Pitch(trunc(I*2 {one octave} {1.0594631 one semitone})) ;
  sleep(5000) ;
  snd_Pitch(trunc(i/2)) ;
  sleep(5000) ;
  snd_Pitch(i) ;
  sleep(5000) ;
  for j := 1 to 5 do begin ;
    i := snd_Playing() ;
    write('Blocks remaining=',i,'  ',#13) ;
    sleep(2000) ;
    end;
  writeln ;
  for i := 127 downto 8 do begin ;
    snd_Volume(i) ; // 8 to 127 ;
    write('Volume=',i,' ',#13) ;
    sleep(100) ;
    end;
  writeln ;
  writeln('Stopping') ;
  snd_Stop() ;
end;

procedure Touch_Tests ;
var
 firstx : integer ;
 firsty : integer ;
 x      : integer ;
 y      : integer ;
 state  : integer ;
begin
  gfx_Cls() ;
  putstr('Touch Tests' + #10) ;
  writeln('Touch Tests.') ;
  putstr('Please ensure Touch is only' + #10 + 'detected in the Blue area') ;
  writeln('Detecting touch in Region') ;
  touch_Set(TOUCH_ENABLE) ;
  touch_DetectRegion(100,100, 200, 200) ;
  gfx_RectangleFilled(100,100, 200, 200, BLUE) ;
  repeat
  until (touch_Get(TOUCH_STATUS) = TOUCH_PRESSED);
  touch_Set(TOUCH_REGIONDEFAULT) ;
  gfx_Cls() ;
  putstr('Draw.. Drawing stops' + #10 + 'when touch released' + #10) ;
  writeln('Drawing') ;

  while(touch_Get(TOUCH_STATUS) <>  TOUCH_PRESSED) do;      // we'll wait for a touch
  firstx := touch_Get(TOUCH_GETX);                          // so we can get the first point
  firsty := touch_Get(TOUCH_GETY);
  while(state <> TOUCH_RELEASED) do begin ;
    state := touch_Get(TOUCH_STATUS);                       // look for any touch activity
    x := touch_Get(TOUCH_GETX);                             // grab the x
    y := touch_Get(TOUCH_GETY);                             // and the y coordinates of the touch
    if(state = TOUCH_PRESSED)                               // if there's a press
    then begin ;
      firstx := x;
      firsty := y;
      end ;

    if(state = TOUCH_MOVING)                                // if there's movement
    then begin ;
      gfx_Line(firstx, firsty, x, y, BLUE);                 // but lines are much better
      firstx := x;
      firsty := y;
      end  ;
    end ;                                                   // and we'll hang around until touch is release
  putstr('Done!' + #10) ;
  touch_Set(TOUCH_DISABLE) ;
end;

begin
  {$IFDEF CONSOLE}
  writeln('Error!') ;
  halt(100) ;
  {$ENDIF}
  TimeLimit4D   := 5000 ; // 5 second timeout on all commands
  CallBack4DCmd := CallBack ; // callback,m then about on detected 4D Serial error
  if  (paramstr(1) = '')
   or (paramstr(1) = '/?')
   or (paramstr(1) = '-?')
  then begin ;
    writeln('Runs every SPE2 function (if possble) and displays results') ;
    writeln ;
    writeln('Bigdemo COMx [speed]') ;
    writeln ;
    writeln('COMx  The com port to which a display ia attacted') ;
    writeln('speed The baud rate to communicate at') ;
    writeln ;
    writeln('A Partitioned uSD with the following files are required for all tests') ;
    writeln('to be run.') ;
    writeln ;
    writeln(' ', gfx2demogci) ;
    writeln(' ', gfx2demodat) ;
    writeln(' ', functest) ;
    writeln(' ', functestg) ;
    writeln(' ', functestd) ;
    writeln(' ', soundtest) ;
    writeln ;
    writeln('One of the tests that uses the RAW partition will be extremely slow at low') ;
    writeln('baud rates.') ;
    halt(1) ;
    end;

  if paramstr(2) = ''
  then baud_Rate := BAUD_9600
  else begin ;
    i := 0 ;
    while (i < maxrates) and (inttostr(baudrates[i]) <> paramstr(2)) do inc(i) ;
    if i = maxrates
    then begin ;
      writeln('Invalid baud rate ', paramstr(2)) ;
      halt(2) ;
      end;
    baud_Rate := i ;
    end ;

  rc := opencomm(paramstr(1), baud_rate) ;
  if rc <> 0
  then begin ;
    writeln('Error ', syserrormessage(rc), ' Opening ', paramstr(1)) ;
    halt(2) ;
    end;

  gfx_Cls() ;
  fFATtests   := trymount() ;
  fmediatests := false ;
  fimgtests   := false ;
  ftouchtests := false ;
  floadtests  := false ;
  fsoundtests := false ;
  sys_GetModel(wks) ; // length is also returned, but we don't need that here
  writeln('Display model: ', wks) ;
  putstr('Display model: ' + wks) ;
  if  (copy(wks,length(wks)) = 'T')
   or (copy(wks,length(wks)-1,1) = 'T')
  then ftouchtests := true ;
  writeln('SPE2 Version: ', format('%4.4x',[sys_GetVersion()])) ;
  writeln('PmmC Version: ', format('%4.4x',[sys_GetPmmC()])) ;
  if fFATtests
  then begin ;
    if rawpartitionbase(rawbase)
    then fmediatests := true ;
    if   (file_Exists(gfx2demodat) <> 0)
     and (file_Exists(gfx2demogci) <> 0)
    then fimgtests := true ;
    if   (file_Exists(functest) <> 0)
     and (file_Exists(functestg) <> 0)
     and (file_Exists(functestd) <> 0)
    then floadtests  := true ;
    if file_Exists(soundtest) <> 0
    then fsoundtests := true ;
    end ;
  if fFATtests
  then begin ;
    writeln('FAT Tests will be done') ;
    if fmediatests
    then if file_Exists(gfx2demogci) <> 0
      then writeln('Media tests will be done')
      else begin ;
        writeln('Media tests cannot be done, missing ', gfx2demogci) ;
        fmediatests := false ;
        end
    else writeln('Media tests cannot be done, no RAW Partition') ;
    if fimgtests
    then writeln('Image tests will be done')
    else writeln('Image tests will not be done, missing ', gfx2demogci, ' or ', gfx2demodat) ;
    if floadtests
    then writeln('Load tests will be done')
    else writeln('Load tests will not be done, missing ',functest, ' or ', functestg, ' or ', functestd) ;
    if fsoundtests
    then writeln('Sound tests will be done')
    else writeln('Sound tests will not be done, missing ', soundtest) ;
    end
  else begin ;
    writeln('FAT Tests cannot be done, either no uSD card or no FAT partition') ;
    writeln('Neither will Media, Image, Load or Sound Tests') ;
    end;
  if ftouchtests
  then writeln('Touch Tests will be done')
  else writeln('Touch Tests will not be done, display doesn''t appear capable') ;

  sleep(5000) ;

  gfx_Part1() ; // GFX Part 1 tests
  sleep(5000) ;

  gfx_Part2() ; // GFX Part 2 tests
  sleep(5000) ;

  text_Tests() ; // text tests
  sleep(5000) ;

  if fFATTests
  then begin ;
    FAT_Tests() ;
    sleep(5000) ;
    end;

  if fimgtests
  then begin ;
    IMG_Tests() ;
    sleep(5000) ;
    end;

  if fmediatests
  then begin ;
    Media_Tests() ;
    sleep(5000) ;
    end;

  if floadtests
  then begin ;
    Function_Tests() ;
    sleep(5000) ;
    end;

  if ftouchtests
  then begin ;
    Touch_Tests() ;
    sleep(5000) ;
    end;

  if fsoundtests
  then begin ;
    Sound_Tests() ;
    sleep(5000) ;
    end;

  setbaudWait(baud_115200) ;
  putstr('Hello at 115200' + #10) ;
  setbaudWait(baud_9600) ;
  putstr('Back to 9600' + #10) ;

{
  writeln('Time is ', timetostr(now()), ', about to sleep display') ;
  tlim := 100000000 ;
  i := sys_Sleep(1000) ;
  tlim := def_tlim ;
  if i <> 0
  then writeln('Display awoken by touch with ', i, ' Sleep units remaining') ;
  writeln('Time is ', timetostr(now()), ', just woken up') ;
}

end.
