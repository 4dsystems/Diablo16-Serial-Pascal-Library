function inttostrx(val : integer) : AnsiString  ;
begin
 inttostrx := ansichar((val shr 8) and $FF) + ansichar(val and $FF) ;
 end ;

function WordArraytoString(wordsin : t4DWordArray; count : word) : AnsiString  ;
var
 i : integer ;
begin
 for i := 0 to count - 1 do begin ;
   result := result + inttostrx(wordsin[i]) ;
 end ;
end;

function ByteArraytoString(Bytesin : t4DByteArray; size : integer) : AnsiString  ;
var
 i : integer ;
begin
 for i := 0 to size - 1 do begin ;
   result := result + ansichar(bytesin^[i]) ;
 end ;
end;

procedure getbytes(data : t4DByteArray; size : integer) ;
var
 read    : dword ;
 readt   : dword ;
 sttime  : dword ;
begin ;
 readt  := 0 ;
 sttime := gettickcount();
 while (readt <> size) and (gettickcount() - sttime < TimeLimit4D) do begin ;
 //  application.processmessages ;
   readfile(ComHandle4D,data^[readt],size-readt,read, nil) ;
   inc(readt,read) ;
   end ;
 if readt <> size
 then begin ;
   Error4D := Err4D_Timeout ;
   if @Callback4D  <> nil // DoCallback4D
   then Callback4D(Error4D, Error_Inv4D) ;
   if @Callback4Dcmd  <> nil
   then Callback4Dcmd(Error4D, Error_Inv4D) ;
//   assert(not error_Abort4D,'Timeout waiting for Data') ;
   end ;
end ;

procedure getAck ;
var
 read    : dword ;
 readx   : byte ;
 sttime  : dword ;
begin ;
 Error4D := Err4D_OK ;
 sttime := gettickcount();
 read := 0 ;
 while (read <> 1) and (gettickcount() - sttime < TimeLimit4D) do begin ;
  // application.processmessages ;
   readfile(ComHandle4D,readx,1,read, nil) ;
   end ;
 if read = 0
 then begin ;
   Error4D := Err4D_Timeout ;
   if @Callback4D  <> nil // DoCallback4D
   then Callback4D(Error4D, Error_Inv4D) ;
   if @Callback4Dcmd  <> nil
   then Callback4Dcmd(Error4D, Error_Inv4D) ;
//   assert(not error_Abort4D, 'Error, ' + Error4DText[Error4D] + ' on Get ACK') ;
   end
 else if readx <> 6
 then begin ;
   Error4D     := Err4D_Invalid ;
   Error_Inv4D := readx ;
   if @Callback4D  <> nil
   then Callback4D(Error4D, Error_Inv4D) ;
   if @Callback4Dcmd  <> nil
   then Callback4Dcmd(Error4D, Error_Inv4D) ;
//   assert(not error_Abort4D, 'Error, Invalid response ' + format('%x',[Error_Inv4D]) + ' on Get ACK') ;
   end;

end;

function getWord : word ;
var
 read    : dword ;
 readx   : array[1..2] of ansichar ;
 readfull: ansistring ;
 sttime  : dword ;
begin ;
 if Error4D <> Err4D_OK
 then exit ;
 sttime := gettickcount();
 readfull := '' ;
 while (length(readfull) <> 2) and (gettickcount() - sttime < TimeLimit4D) do begin ;
   //application.processmessages ;
   readfile(ComHandle4D,readx,2-length(readfull),read, nil) ;
   readfull := readfull + copy(readx,1,read) ;
   end ;
 if length(readfull) <> 2
 then begin ;
   result := 0 ;
   Error4D  := Err4D_Timeout ;
   if @Callback4D  <> nil // DoCallback4D
   then Callback4D(Error4D, Error_Inv4D) ;
   if @Callback4Dcmd  <> nil
   then Callback4Dcmd(Error4D, Error_Inv4D) ;
//   assert(not error_Abort4D, 'Error, ' + Error4DText[Error4D] + ' on Get Word') ;
   end
 else result := ord(readfull[1]) shl 8 + ord(readfull[2]) ;
end ;

function getString(strLen : integer) : ansistring ;
var
 read    : dword ;
 readx   : ansichar ;
 sttime  : dword ;
begin ;
 if Error4D <> Err4D_OK
 then exit ;
 sttime := gettickcount();
 result := '' ;
 while (length(result) <> strlen) and (gettickcount() - sttime < TimeLimit4D) do begin ;
   //application.processmessages ;
   readfile(ComHandle4D,readx,1,read, nil) ;
   if read <> 0
   then result := result + readx ;
   end ;
 if length(result) <> strlen
 then begin ;
   result := '' ;
   Error4D  := Err4D_Timeout ;
   if @Callback4D  <> nil // DoCallback4D
   then Callback4D(Error4D, Error_Inv4D) ;
   if @Callback4Dcmd  <> nil
   then Callback4Dcmd(Error4D, Error_Inv4D) ;
//   assert(not error_Abort4D, 'Error, ' + Error4DText[Error4D] + ' on Get String') ;
   end ;
end ;

function GetAckResp : word ;
begin
 getAck ;
 Result := getWord ;
end;

function GetAckRes2Words(var word1 : word; var word2 : word) : word ;
begin
 getAck ;
 Result := getWord ;
 word1  := getWord ;
 word2  := getWord ;
end;

procedure GetAck2Words(var word1 : word; var word2 : word) ;
begin
 getAck ;
 word1 := getWord ;
 word2 := getWord ;
end;

function GetAckResSector(var sector : t4DSector) : word ;
begin
 getAck ;
 Result := getWord ;
 getbytes(@Sector, 512) ;
end;

function GetAckResStr(var outstr : ansistring) : word ;
begin
 getAck ;
 Result := getWord ;
 OutStr := getstring(result) ;
end;

function GetAckResData(outdata : t4DByteArray; size : word) : word ;
begin
 getAck ;
 Result  := getWord ;
 getbytes(OutData, size) ;
end;

procedure SetBaudrate(Newrate : integer) ;
const
  fbinary = 1 ;
var
  com1dcb  : tdcb ;
begin
  if not getcommstate(ComHandle4D,com1dcb)
  then writeln('Error from getcommstate');
  com1dcb.ByteSize := 8 ;
  com1dcb.StopBits := onestopbit ;
  com1dcb.Parity   := noparity ;
  com1DCB.XonChar := #0;
  com1DCB.XoffChar := #0;
  com1DCB.Flags := fbinary ;
  case Newrate of
    BAUD_110    : com1dcb.baudrate := 110 ;
    BAUD_300    : com1dcb.baudrate := 300 ;
    BAUD_600    : com1dcb.baudrate := 600 ;
    BAUD_1200   : com1dcb.baudrate := 1200 ;
    BAUD_2400   : com1dcb.baudrate := 2400 ;
    BAUD_4800   : com1dcb.baudrate := 4800 ;
    BAUD_9600   : com1dcb.baudrate := 9600 ;
    BAUD_14400  : com1dcb.baudrate := 14400 ;
    BAUD_19200  : com1dcb.baudrate := 19200 ;
    BAUD_31250  : com1dcb.baudrate := 31250 ;
    BAUD_38400  : com1dcb.baudrate := 38400 ;
    BAUD_56000  : com1dcb.baudrate := 56000 ;
    BAUD_57600  : com1dcb.baudrate := 57600 ;
    BAUD_115200 : com1dcb.baudrate := 115200 ;
    BAUD_128000 : com1dcb.baudrate := 133928 ; // actual rate is not 128000 ;
    BAUD_256000 : com1dcb.baudrate := 281250 ; // actual rate is not  256000 ;
    BAUD_300000 : com1dcb.baudrate := 312500 ; // actual rate is not  300000 ;
    BAUD_375000 : com1dcb.baudrate := 401785 ; // actual rate is not  375000 ;
    BAUD_500000 : com1dcb.baudrate := 562500 ; // actual rate is not  500000 ;
    BAUD_600000 : com1dcb.baudrate := 703125 ; // actual rate is not  600000 ;
    end;
  if not setcommstate(ComHandle4D,com1dcb)
  then writeln('Error from Setcommstate');
  end ;

procedure SetThisBaudrate(Newrate : integer) ;
begin ;
  flushfilebuffers(ComHandle4D) ;  // ensure the change bause rate gets out
  sleep(10) ;               // seems to be needed to enable Windows to change speed
  SetBaudrate(Newrate) ;
  sleep(50) ; // Display sleeps for 100
  purgecomm(ComHandle4D,PURGE_TXABORT+PURGE_RXABORT+PURGE_TXCLEAR+PURGE_RXCLEAR) ; // thow away any potential rubbish

end;
