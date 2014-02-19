//------------------------------------------------------------------------------
//txt_Set() related constants
//------------------------------------------------------------------------------
  TEXT_COLOUR            = 0 ;       // text foreground colr
  TEXT_BACKGROUND        = 1 ;       // text background colr
  TEXT_HIGHLIGHT         = 1 ;       // text background colr
  FONT_ID                = 2 ;       // default 0, else points to data statement font
  FONT_SIZE              = 2 ;       // compatibility
  TEXT_WIDTH             = 3 ;       // text width multiplier
  TEXT_HEIGHT            = 4 ;       // text height multiplier
  TEXT_XGAP              = 5 ;       // horizontal text gap (default 1)
  TEXT_YGAP              = 6 ;       // vertical text gap (default 1)
  TEXT_PRINTDELAY        = 7 ;       // for 'teletype' like effect when printing
  TEXT_OPACITY           = 8 ;       // text mode flag, TRANSPARENT or OPAQUE
  TEXT_BOLD              = 9 ;       // embolden text (auto reset)
  TEXT_ITALIC            = 10 ;      // italicize text (auto reset)
  TEXT_INVERSE           = 11 ;      // invert text (auto reset)
  TEXT_UNDERLINED        = 12 ;      // underline text (auto reset)
  TEXT_ATTRIBUTES        = 13 ;      // controls BOLD/ITALIC/INVERSE/UNDERLINE simultaneously
  TEXT_WRAP              = 14 ;      // Sets the pixel position where text wrap will occur at RHS
  TEXT_ANGLE             = 15 ;      // Sets the text angle, only for plotted font

//------------------------------------------------------------------------------
//txt_Set() related arguments
//------------------------------------------------------------------------------
    // (legacy compatibility)
  FONT1                  = 1 ;       // font_System_5x7
  FONT2                  = 2 ;       // font_System_8x8
  FONT3                  = 3 ;       // font_System_8x12

    // new font constants
  FONT_1                 = 1 ;       // font_System_5x7
  FONT_2                 = 2 ;       // font_System_8x8
  FONT_3                 = 3 ;       // font_System_8x12
  FONT_4                 = 4 ;       // font_System_12x16
  FONT_5                 = 5 ;       // font_MS_SanSerif8x12
  FONT_6                 = 6 ;       // font_dejaVuSansCondensed9pt
  FONT_7                 = 7 ;       // font_dejaVuSans9pt
  FONT_8                 = 8 ;       // font_dejaVuSansBold9pt
  FONT_9                 = 9 ;       // font_System_3x6
  FONT_10                = 10 ;      // font_plotted
  FONT_11                = 11 ;      // EGA 8x12 font

  TRANSPARENT            = 0 ;       // TEXT_OPACITY  transparent  text
  OPAQUE                 = 1 ;       // TEXT_OPACITY  opaque text

  BOLD                   = 16 ;      // TEXT_ATTRIBUTES bold text
  ITALIC                 = 32 ;      // TEXT_ATTRIBUTES italic text
  INVERSE                = 64 ;      // TEXT_ATTRIBUTES inverse text
  UNDERLINED             = 128 ;     // TEXT_ATTRIBUTES underlined

// single word array operations
  OP1_NOP                = 0 ;       // no operation
  OP1_SET                = 1 ;       // "set" the entire array with "value"
  OP1_AND                = 2 ;       // "and" the entire array with "value"
  OP1_IOR                = 3 ;       // "inclsuve or" the entire array with "value"
  OP1_XOR                = 4 ;       // "exclusive or" the entire array with "value"
  OP1_ADD                = 5 ;       // signed add each element of entire array with "value"
  OP1_SUB                = 6 ;       // signed subtract "value" from each element of entire array.
  OP1_MUL                = 7 ;       // signed multiply each element of entire array by "value"
  OP1_DIV                = 8 ;       // signed divide each element of entire array by "value"
  OP1_REV                = 9 ;       // reverse the elements of an array (value is ignored)
  OP1_SHL                = 10 ;      // shift an array left by "value" positions
  OP1_SHR                = 11 ;      // shift an array right by "value" positions
  OP1_ROL                = 12 ;      // rotate an array left by "value" positions
  OP1_ROR                = 13 ;      // rotate an array right by "value" positions
    // graphics only operations
  OP1_GRAY               = 14 ;      // convert an array of RGB565 elements to grayscale, "value" is ignored
  OP1_WHITEN             = 15 ;      // saturate an array of RGB565 elements to white, "value" determines saturation
  OP1_BLACKEN            = 16 ;      // saturate an array of RGB565 elements to black, "value" determines saturation
  OP1_LIGHTEN            = 17 ;      // increase luminance of an array of RGB565 elements, "value" determines saturation
  OP1_DARKEN             = 18 ;      // decrease luminance of an array of RGB565 elements, "value" determines saturation

// dual word array operations
    // boolean and math operations
  OP2_AND                = 1 ;       // "and" arrays, result to array1 (value is ignored)
  OP2_IOR                = 2 ;       // "inclusive or" arrays, result to array1 (value is ignored)
  OP2_XOR                = 3 ;       // "exclusive or" arrays, result to array1 (value is ignored)
  OP2_ADD                = 4 ;       // "add" arrays, result to array1, array1 + (array2+value)
  OP2_SUB                = 5 ;       // "subtract" array2 from array1, result to array1, array1 - (array2+value)
  OP2_MUL                = 6 ;       // "multiply" arrays, result to array1 (value is ignored)
  OP2_DIV                = 7 ;       // "divide array1 by array2" , result to array1 (value is ignored)
  OP2_COPY               = 8 ;       // "copy" array2 to array1 (value is ignored)
    // graphics only operations
  OP2_BLEND              = 9 ;       // blend arrays, blend percentage determined by "value", result to "array1"


//------------------------------------------------------------------//
// Pin related constants                                            //
//------------------------------------------------------------------//

// pin_Set(...) pin modes
  PIN_INP                = 0 ;       // pin is input, no pullup or pulldown
  PIN_INP_HI             = 1 ;       // pin is input with pullup to Vcc
  PIN_INP_LO             = 2 ;       // pin is input with pulldown to Gnd
  PIN_OUT                = 3 ;       // pin is output
  PIN_OUT_OD             = 4 ;       // pin is output with open drain
  PIN_AN                 = 5 ;       // pin is analogue (PA0 to PA3 only)
  PIN_ANAVG              = 6 ;       // pin is analogue (PA0 to PA3 only), averaged - 16 samples


// pin name             constant    connector H1 I/O Pin referencesnumbers
  PA0                    = 1 ;       // pin 1
  PA1                    = 2 ;       // pin 3
  PA2                    = 3 ;       // pin 5
  BUS_WR_PIN             = 3 ;       // pin 5 (alias PA2_PIN)
  PA3                    = 4 ;       // pin 7
  BUS_RD_PIN             = 4 ;       // pin 7 (alias PA3_PIN)
  PA4                    = 5 ;       // pin 29
  PA5                    = 6 ;       // pin 27
  PA6                    = 7 ;       // pin 25
  PA7                    = 8 ;       // pin 23
  PA8                    = 9 ;       // pin 21
  PA9                    = 10 ;      // pin 19
  PA10                   = 11 ;      // pin 8  (LCD power control)
  PA11                   = 12 ;      // pin 6
  PA12                   = 13 ;      // pin 28 (TX1)
  PA13                   = 14 ;      // pin 30 (RX1)
  PA14                   = 15 ;      // pin 10 (input only)
  PA15                   = 16 ;      // pin 12 (input only)
  AUDIO_ENABLE           = 17 ;      // pin 45 (Output only)

// bit position masks
  M_PA0                  = $0001 ;  // pin 1
  M_PA1                  = $0002 ;  // pin 3
  M_PA2                  = $0004 ;  // pin 5
  M_PA3                  = $0008 ;  // pin 7
  M_PA4                  = $0010 ;  // pin 29
  M_PA5                  = $0020 ;  // pin 27
  M_PA6                  = $0040 ;  // pin 25
  M_PA7                  = $0080 ;  // pin 23
  M_PA8                  = $0100 ;  // pin 21
  M_PA9                  = $0200 ;  // pin 19 (LCD power control)
  M_PA10                 = $0400 ;  // pin 8
  M_PA11                 = $0800 ;  // pin 6
  M_PA12                 = $1000 ;  // pin 28
  M_PA13                 = $2000 ;  // pin 30
  M_PA14                 = $4000 ;  // pin 10 (input only)
  M_PA15                 = $8000 ;  // pin 12 (input only)



//------------------------------------------------------------------------------
//gfx_Set() related constants
//------------------------------------------------------------------------------
  PEN_SIZE               = 16 ;      // not necessary to use (legacy mode)
  BACKGROUND_COLOUR      = 17 ;
  OBJECT_COLOUR          = 18 ;      // line / circle / rectangle generic colour
  CLIPPING               = 19 ;      // clipping ON / OFF
  TRANSPARENT_COLOUR     = 20 ;      // (only on displays with specific hware feature)
  TRANSPARENCY           = 21 ;      // 0 = OFF, 1 = ON (only on displays with specific hware feature)
  FRAME_DELAY            = 22 ;      // legacy mode, see pokeB(IMAGE_DELAY, n);
  SCREEN_MODE            = 23 ;      // LANDSCAPE, LANDSCAPE_R, PORTRAIT, PORTRAIT_R
  OUTLINE_COLOUR         = 24 ;      // if not BLACK (0) , used for outline around circles,rectangles and filled polygons
  CONTRAST               = 25 ;      // for OLED,cahnge contrast, for LCD on or off only
  LINE_PATTERN           = 26 ;      // used for patterned lines, 16bit value (0 = no pattern, '1's = pattern)
  BEVEL_RADIUS           = 27 ;      // button bevel radius
  BEVEL_WIDTH            = 28 ;      // button bevel width
  BEVEL_SHADOW           = 29 ;      // button bevel shadow depth
  X_ORIGIN               = 30 ;      // display position X offset
  Y_ORIGIN               = 31 ;      // display position X offset

// built in fill pattern constants for function gfx_FillPattern
  FILLPATTERN_0          = $FFE0 ;
  FILLPATTERN_1          = $FFE1 ;
  FILLPATTERN_2          = $FFE2 ;
  FILLPATTERN_3          = $FFE3 ;
  FILLPATTERN_4          = $FFE4 ;
  FILLPATTERN_5          = $FFE5 ;
  FILLPATTERN_6          = $FFE6 ;
  FILLPATTERN_7          = $FFE7 ;
  FILLPATTERN_8          = $FFE8 ;
  FILLPATTERN_9          = $FFE9 ;
  FILLPATTERN_10         = $FFEA ;
  FILLPATTERN_11         = $FFEB ;
  FILLPATTERN_12         = $FFEC ;
  FILLPATTERN_13         = $FFED ;
  FILLPATTERN_14         = $FFEE ;
  FILLPATTERN_15         = $FFEF ;
  FILLPATTERN_16         = $FFF0 ;
  FILLPATTERN_17         = $FFF1 ;
  FILLPATTERN_18         = $FFF2 ;
  FILLPATTERN_19         = $FFF3 ;
  FILLPATTERN_20         = $FFF4 ;
  FILLPATTERN_21         = $FFF5 ;
  FILLPATTERN_22         = $FFF6 ;
  FILLPATTERN_23         = $FFF7 ;
  FILLPATTERN_24         = $FFF8 ;
  FILLPATTERN_25         = $FFF9 ;
  FILLPATTERN_26         = $FFFA ;
  FILLPATTERN_27         = $FFFB ;
  FILLPATTERN_28         = $FFFC ;
  FILLPATTERN_29         = $FFFD ;
  FILLPATTERN_30         = $FFFE ;
  FILLPATTERN_31         = $FFFF ;

  PTN_EMPTY              = $FFE0 ;
  PTN_SOLID              = $FFE1 ;
  PTN_FINE_DOTS          = $FFE2 ;
  PTN_MEDIUM_DOTS        = $FFE3 ;
  PTN_COURSE_DOTS        = $FFE4 ;
  PTN_BS_VERTICAL        = $FFE5 ;
  PTN_BS_HORIZONTAL      = $FFE6 ;
  PTN_COURSE_F_DIAGONAL  = $FFE7 ;
  PTN_COURSE_B_DIAGONAL  = $FFE8 ;
  PTN_COURSE_CROSS       = $FFE9 ;
  PTN_COURSE_DIAGONALCROSS = $FFEA ;
  PTN_BSVERTICAL         = $FFEB ;
  PTN_BSHORIZONTAL       = $FFEC ;
  PTN_FDIAGONAL          = $FFED ;
  PTN_BDIAGONAL          = $FFEE ;
  PTN_FINE_CROSS         = $FFEF ;
  PTN_FINE_DIAGONAL_CROSS = $FFF0 ;
  PTN_BRICKS             = $FFF1 ;
  PTN_CARGONET           = $FFF2 ;
  PTN_CIRCUITS           = $FFF3 ;
  PTN_COBBLESTONES       = $FFF4 ;
  PTN_DAISIES            = $FFF5 ;
  PTN_DIZZY              = $FFF6 ;
  PTN_FIELDEFFECT        = $FFF7 ;
  PTN_KEY                = $FFF8 ;
  PTN_ROUNDER            = $FFF9 ;
  PTN_SCALES             = $FFFA ;
  PTN_STONE              = $FFFB ;
  PTN_THATCHES           = $FFFC ;
  PTN_TILE               = $FFFD ;
  PTN_WAFFLESREVENGE     = $FFFE ;
  PTN_CROSSES            = $FFFF ;

//------------------------------------------------------------------//
//     gradient control constants                                   //
//------------------------------------------------------------------//
  GRAD_DOWN              = $20 ;    // gradient changes in the vertical direction
  GRAD_RIGHT             = $30 ;    // gradient change in the horizontal direction
  GRAD_UP                = $40 ;    // gradient changes in the vertical direction
  GRAD_LEFT              = $50 ;    // gradient change in the horizontal direction
  GRAD_WAVE_VER          = $60 ;    // gradient wave in the vertical direction
  GRAD_WAVE_HOR          = $70 ;    // gradient wave in the horizontal direction

// baud divisor rates for legacy setbaud(n);
  MIDI                   = 9 ;
  BAUD_110               = 0 ;
  BAUD_300               = 1 ;
  BAUD_600               = 2 ;
  BAUD_1200              = 3 ;
  BAUD_2400              = 4 ;
  BAUD_4800              = 5 ;
  BAUD_9600              = 6 ;
  BAUD_14400             = 7 ;
  BAUD_19200             = 8 ;
  BAUD_31250             = 9 ;
  BAUD_38400             = 10 ;
  BAUD_56000             = 11 ;
  BAUD_57600             = 12 ;
  BAUD_115200            = 13 ;
  BAUD_128000            = 14 ;
  BAUD_256000            = 15 ;
  BAUD_300000            = 16 ;
  BAUD_375000            = 17 ;
  BAUD_500000            = 18 ;
  BAUD_600000            = 19 ;


// I2C software emulation timing related constants
  I2C_SLOW               = 0 ;       // 100Khz
  I2C_MED                = 1 ;       // 400Khz
  I2C_FAST               = 2 ;       // 5Mhz
  I2C_10KHZ              = 3 ;       // 10khz
  I2C_20HZ               = 4 ;       // 20khz
  I2C_50KHZ              = 5 ;       // 50khz
  I2C_250KHZ             = 6 ;       // 250khz


//------------------------------------------------------------------------------
// Constants for SPI1, SPI2 an SPI3 "mode"
//------------------------------------------------------------------------------
  SPI8_MODE_0            = 0 ;       //    8bit mode    SCK idles low,    SDO stable for first falling edge, SDI sampled on first falling edge
  SPI8_MODE_1            = 1 ;       //    8bit mode    SCK idles low,    SDO stable for first rising edge,  SDI sampled on first rising edge
  SPI8_MODE_2            = 2 ;       //    8bit mode    SCK idles high,    SDO stable for first falling edge, SDI sampled on first falling edge
  SPI8_MODE_3            = 3 ;       //    8bit mode    SCK idles high,    SDO stable for first rising edge,  SDI sampled on first falling edge
  SPI8_MODE_4            = 4 ;       //    8bit mode    SCK idles low,    SDO stable for first falling edge, SDI sampled on next rising edge
  SPI8_MODE_5            = 5 ;       //    8bit mode    SCK idles low,    SDO stable for first rising edge,  SDI sampled on next falling edge
  SPI8_MODE_6            = 6 ;       //    8bit mode    SCK idles high,    SDO stable for first falling edge, SDI sampled on next rising edge
  SPI8_MODE_7            = 7 ;       //    8bit mode    SCK idles high,    SDO stable for first rising edge,  SDI sampled on next rising edge
  SPI16_MODE_0           = 8 ;       //    16bit mode    SCK idles low,    SDO stable for first falling edge, SDI sampled on first falling edge
  SPI16_MODE_1           = 9 ;       //    16bit mode    SCK idles low,    SDO stable for first rising edge,  SDI sampled on first rising edge
  SPI16_MODE_2           = 10 ;      //    16bit mode    SCK idles high,    SDO stable for first falling edge, SDI sampled on first falling edge
  SPI16_MODE_3           = 11 ;      //    16bit mode    SCK idles high,    SDO stable for first rising edge,  SDI sampled on first falling edge
  SPI16_MODE_4           = 12 ;      //    16bit mode    SCK idles low,    SDO stable for first falling edge, SDI sampled on next rising edge
  SPI16_MODE_5           = 13 ;      //    16bit mode    SCK idles low,    SDO stable for first rising edge,  SDI sampled on next falling edge
  SPI16_MODE_6           = 14 ;      //    16bit mode    SCK idles high,    SDO stable for first falling edge, SDI sampled on next rising edge
  SPI16_MODE_7           = 15 ;      //    16bit mode    SCK idles high,    SDO stable for first rising edge,  SDI sampled on next rising edge

//------------------------------------------------------------------------------
// Constants for SPI1, SPI2 an SPI3 "speed"
//------------------------------------------------------------------------------
  SPI_SPEED0             = 0 ;       // 78.125 khz
  SPI_SPEED1             = 1 ;       // 109.375 khz
  SPI_SPEED2             = 2 ;       // 273.4375 khz
  SPI_SPEED3             = 3 ;       // 312.5 khz
  SPI_SPEED4             = 4 ;       // 437.5 khz
  SPI_SPEED5             = 5 ;       // 729.166 khz
  SPI_SPEED6             = 6 ;       // 1.09375 mhz
  SPI_SPEED7             = 7 ;       // 1.25 mhz
  SPI_SPEED8             = 8 ;       // 1.75 mhz
  SPI_SPEED9             = 9 ;       // 2.1875 mhaz
  SPI_SPEED10            = 10 ;      // 4.375 mhz
  SPI_SPEED11            = 11 ;      // 5.00 mhz
  SPI_SPEED12            = 12 ;      // 7.00 mhz
  SPI_SPEED13            = 13 ;      // 8.75 mhz
  SPI_SPEED14            = 14 ;      // 11.666 mhz
  SPI_SPEED15            = 15 ;      // 17.5 mhz

// image control header offsets
  IMG_COUNT              = 0 ;
  IMG_ENTRYLEN           = 1 ;
  IMG_MODE               = 2 ;
  IMG_GCI_FILENAME       = 3 ;
  IMG_DAT_FILENAME       = 4 ;
  IMG_GCIFILE_HANDLE     = 5 ;

// image control entry offsets
  IMAGE_LOWORD           = 0 ;       // WORD image address LO
  IMAGE_HIWORD           = 1 ;       // WORD image address HI
  IMAGE_XPOS             = 2 ;       // WORD image location X
  IMAGE_YPOS             = 3 ;       // WORD image location Y
  IMAGE_WIDTH            = 4 ;       // WORD image width
  IMAGE_HEIGHT           = 5 ;       // WORD image height
  IMAGE_FLAGS            = 6 ;       // WORD image flags
  IMAGE_DELAY            = 7 ;       // WORD inter frame delay
  IMAGE_FRAMES           = 8 ;       // WORD number of frames
  IMAGE_INDEX            = 9 ;       // WORD current frame
  IMAGE_CLUSTER          = 10 ;      // WORD image start cluster  pos (for FAT16 only)
  IMAGE_SECTOR           = 11 ;      // WORD image start sector in cluster pos (for FAT16 only)
  IMAGE_TAG              = 12 ;      // WORD user variable #1
  IMAGE_TAG2             = 13 ;      // WORD user variable #2

// image attribute flags (in IMAGE_FLAGS)
// for img_SetAttributes(...) and img_ClearAttributes(...)
  I_ENABLED              = $8000 ;  // bit 15,  set for image enabled
  I_DARKEN               = $4000 ;  // bit 14,  display dimmed
  I_LIGHTEN              = $2000 ;  // bit 13,  display bright
  I_TOUCHED              = $1000 ;  // bit 12,  touch test result
  I_Y_LOCK               = $0800 ;  // bit 11,  stop Y movement
  I_X_LOCK               = $0400 ;  // bit 10,  stop X movement
  I_TOPMOST              = $0200 ;  // bit 9,   draw on top of other images next update (auto reset)
  I_STAYONTOP            = $0100 ;  // bit 8,   draw on top of other images always
  I_MOVIE                = $0080 ;  // bit 7,   image is a movie
  I_NOGROUP              = $0040 ;  // bit 6,   set to exclude image refresh when using img_Show(hndl, ALL);
  I_TOUCH_DISABLE        = $0020 ;  // bit 5,   set to disable touch for this image, default=1 for movie, 0 for image
  I_COLOUR16             = $0010 ;  // bit 4,   indicates 16 bit colour mode
    // bits 0-3 reserved



//touch_Set() related constants
  TOUCH_ENABLE           = 0 ;
  TOUCH_DISABLE          = 1 ;
  TOUCH_REGIONDEFAULT    = 2 ;

//touch_Get() related constants
  TOUCH_STATUS           = 0 ;
  TOUCH_GETX             = 1 ;
  TOUCH_GETY             = 2 ;
  NOTOUCH                = 0 ;
  TOUCH_PRESSED          = 1 ;
  TOUCH_RELEASED         = 2 ;
  TOUCH_MOVING           = 3 ;

//------------------------------------------------------------------------------
// FILEIO Error Code Constants
//------------------------------------------------------------------------------
  FE_OK                  = 0 ;       // IDE function succeeded
  FE_IDE_ERROR           = 1 ;       // IDE command execution error
  FE_NOT_PRESENT         = 2 ;       // CARD not present
  FE_PARTITION_TYPE      = 3 ;       // WRONG partition type, not FAT16
  FE_INVALID_MBR         = 4 ;       // MBR sector invalid signature
  FE_INVALID_BR          = 5 ;       // Boot Record invalid signature
  FE_DISK_NOT_MNTD       = 6 ;       // Media not mounted
  FE_FILE_NOT_FOUND      = 7 ;       // File not found in open for read
  FE_INVALID_FILE        = 8 ;       // File not open
  FE_FAT_EOF             = 9 ;       // Fat attempt to read beyond EOF
  FE_EOF                 = 10 ;      // Reached the end of file
  FE_INVALID_CLUSTER     = 11 ;      // Invalid cluster value > maxcls
  FE_DIR_FULL            = 12 ;      // All root dir entry are taken
  FE_DISK_FULL           = 13 ;      // All clusters in partition are taken
  FE_FILE_OVERWRITE      = 14 ;      // A file with same name exist already
  FE_CANNOT_INIT         = 15 ;      // Cannot init the CARD
  FE_CANNOT_READ_MBR     = 16 ;      // Cannot read the MBR
  FE_MALLOC_FAILED       = 17 ;      // Malloc could not allocate the FILE struct
  FE_INVALID_MODE        = 18 ;      // Mode was not r.w.
  FE_FIND_ERROR          = 19 ;      // Failure during FILE search
  FE_INVALID_FNAME       = 20 ;      // bad filename
  FE_INVALID_MEDIA       = 21 ;      // bad media
  FE_SECTOR_READ_FAIL    = 22 ;      // sector read failed
  FE_SECTOR_WRITE_FAIL   = 23 ;      // sector write failed
  FE_FILE_TIMEOUT        = 26 ;      // Timeout during file I/O, probable unexpected media removal

//------------------------------------------------------------------------------
// DISK struct offsets
//------------------------------------------------------------------------------
  DISK_FIRST_SECT_LO     = 0 ;       // DWORD address of the first sector of the FAT partition (LO word)
  DISK_FIRST_SECT_HI     = 1 ;       //       address of the first sector of the FAT partition (HI word)
  DISK_FAT_LO            = 2 ;       // DWORD address of FAT (LO word)
  DISK_FAT_HI            = 3 ;       //       address of FAT (HI word)
  DISK_ROOT_LO           = 4 ;       // DWORD address of root directory (LO word)
  DISK_ROOT_HI           = 5 ;       //       address of root directory (HI word)
  DISK_DATA_LO           = 6 ;       // DWORD address of data area (LO word)
  DISK_DATA_HI           = 7 ;       //       address of data area (HI word)
  DISK_MAXCLUS_LO        = 8 ;       // DWORD max number of clusters in partition (LO word)
  DISK_MAXCLUS_HI        = 9 ;       //       max number of clusters in partition (HI word)
  DISK_MAXROOT           = 10 ;      // WORD  max entries in root directory
  DISK_FATSIZE           = 11 ;      // WORD  number of sectors in FAT
  DISK_FATCOPIES         = 12 ;      // WORD  number of fat copies
  DISK_SECT_PER_CLUS     = 13 ;      // WORD  number of sectors per cluster
  DISK_TYPE              = 14 ;      // WORD  type of fat
  DISK_BUF               = 15 ;      // WORD  pointer to 512 byte info buffer

//------------------------------------------------------------------------------
// FILE struct offsets
//------------------------------------------------------------------------------
  FILE_FIRST_CLUSTER     = 0 ;       // WORD  first cluster
  FILE_CURR_CLUSTER      = 1 ;       // WORD  current cluster in file
  FILE_CURR_SECTOR       = 2 ;       // WORD  sector in current cluster
  FILE_CURR_SECTOR_POS   = 3 ;       // WORD  position in current sector
  FILE_CURR_SECTOR_TOP   = 4 ;       // WORD  number bytes in current sector buffer
  FILE_SEEK_POS_LO       = 5 ;       // DWORD position in the file (LO word)
  FILE_SEEK_POS_HI       = 6 ;       //       position in the file (HI word)
  FILE_SIZE_LO           = 7 ;       // DWORD file size (LO word)
  FILE_SIZE_HI           = 8 ;       //       file size (HI word)
  FILE_TIME              = 9 ;       // WORD  last update time
  FILE_DATE              = 10 ;      // WORD  last update date
  FILE_NAME              = 11 ;      // WORD  12 byte buffer for filename
  FILE_MODE              = 17 ;      // WORD  file mode 'r', 'w', 'a'
  FILE_ATTRIBUTES        = 18 ;      // WORD  files attributes
  FILE_PAGEFLAG          = 19 ;      // WORD  cache check flag
  FILE_ENTRY             = 20 ;      // WORD  entry position in cur directory
  FILE_DISK              = 21 ;      // WORD* pointer to DISK mount media structure
  FILE_BUFFER            = 22 ;      // WORD*  sector buffer



//------------------------------------------------------------------//
// pin counter mode constants                                       //
//------------------------------------------------------------------//
  COUNT_OFF              = 0 ;       // Disconnect the counter from the pin, "OVFfunction" is therefore ignored, and counting is inhibited.
  COUNT_RISE             = 1 ;       // increment counter on every rising edge
  COUNT_FALL             = 2 ;       // increment counter on every falling edge
  COUNT_EDGE             = 3 ;       // increment on every rising and falling edge


//------------------------------------------------------------------------------
// PWM Constants
//------------------------------------------------------------------------------
  PWM_OFF                = 0 ;
  PWM_PLAIN              = 1 ;
  PWM_SERVO              = 2 ;

//------------------------------------------------------------------//
// CONSTANTS
//------------------------------------------------------------------//

  SPI1                   = 1 ;
  SPI2                   = 2 ;
  SPI3                   = 3 ;

// generic constants
  ENABLE                 = 1 ;
  DISABLE                = 0 ;
  HI                     = 1 ;
  LO                     = 0 ;
  ON                     = 1 ;
  OFF                    = 0 ;
  ALL                    = $FFFF ;  // argument for img_xxx functions to update all images (and other uses)



//gfx_Get() related constants
  X_MAX                  = 0 ;       // current orientations screen maximum X co-ordinate
  Y_MAX                  = 1 ;       // current orientations screen maximum Y co-ordinate
  LEFT_POS               = 2 ;       // last objects left co-ord
  TOP_POS                = 3 ;       // last objects top co-ord
  RIGHT_POS              = 4 ;       // last objects right co-ord
  BOTTOM_POS             = 5 ;       // last objects bottom co-ord
  X_ORG                  = 6 ;       // display position X offset
  Y_ORG                  = 7 ;       // display position X offset




  SOLID                  = 0 ;       // PEN_SIZE
  OUTLINE                = 1 ;       // PEN_SIZE
  STYLE1                 = 2 ;
  STYLE2                 = 3 ;

  LANDSCAPE              = 0 ;       // SCREEN_MODE (north)
  LANDSCAPE_R            = 1 ;       // SCREEN_MODE (south)
  PORTRAIT               = 2 ;       // SCREEN_MODE (west)
  PORTRAIT_R             = 3 ;       // SCREEN_MODE (east)

  COLOUR8                = 1 ;       // COLOUR_MODE 8 bit colour mode (not supported)
  COLOUR16               = 0 ;       // COLOUR_MODE 16 bit colour mode


  CHECKED                = 0 ;
  UNCHECKED              = 1 ;


  DOWN                   = 0 ;
  UP                     = 1 ;
  HIDE                   = 2 ;
  HYPER                  = 3 ;       // text only, no frame

  BUTTON_DOWN            = 0 ;
  BUTTON_UP              = 1 ;

  SLIDER_SUNKEN          = 0 ;
  SLIDER_RAISED          = 1 ;
  SLIDER_HIDE            = 2 ;

  PROGRESSBAR_RAISED     = $FFFF ;
  PROGRESSBAR_SUNKEN     = $FFFE ;
  PROGRESSBAR_HIDE       = 2 ;

  PANEL_SUNKEN           = 0 ;
  PANEL_RAISED           = 1 ;
  PANEL_HIDE             = 2 ;
  PANEL_FRAME            = 3 ;




// timer control  related constants
  TIMER0                 = 0 ;
  TIMER1                 = 1 ;
  TIMER2                 = 2 ;
  TIMER3                 = 3 ;
  TIMER4                 = 4 ;
  TIMER5                 = 5 ;
  TIMER6                 = 6 ;
  TIMER7                 = 7 ;



//------------------------------------------------------------------------------
// system WORD variables accesible with peekW and pokeW or pointer access
// Note that the txt_Set variables (0-15) and gfx_set variables (16-31)
// can also be accessed with peekW and pokeW
//------------------------------------------------------------------------------

  RANDOM_LO              = 32 ;      // random number generator LO word
  RANDOM_HI              = 33 ;      // random number generator LO word
  SYSTEM_TIMER_LO        = 34 ;      // 1msec 32 bit free running timer LO word
  SYSTEM_TIMER_HI        = 35 ;      // 1msec 32 bit free running timer HI word
  TMR0                   = 36 ;      // user timer0
  TMR1                   = 37 ;      // user timer1
  TMR2                   = 38 ;      // user timer2
  TMR3                   = 39 ;      // user timer3 (10msec resolution)
  TMR4                   = 40 ;      // user timer0
  TMR5                   = 41 ;      // user timer1
  TMR6                   = 42 ;      // user timer2
  TMR7                   = 43 ;      // user timer3 (10msec resolution)
  SYS_X_MAX              = 44 ;      // display hardware X res-1
  SYS_Y_MAX              = 45 ;      // display hardware Y res-1
  GFX_XMAX               = 46 ;      // current display width-1 determined by portrait / landscape swapping
  GFX_YMAX               = 47 ;      // current display width-1 determined by portrait / landscape swapping
  GFX_LEFT               = 48 ;      // virtual left point for most recent object
  GFX_TOP                = 49 ;      // virtual top point for most recent object
  GFX_RIGHT              = 50 ;      // virtual right point for most recent object
  GFX_BOTTOM             = 51 ;      // virtual bottom point for most recent object
  GFX_X1                 = 52 ;      // clipped left point for current object
  GFX_Y1                 = 53 ;      // clipped top point for current object
  GFX_X2                 = 54 ;      // clipped right point for current object
  GFX_Y2                 = 55 ;      // clipped bottom point for current object
  GFX_X_ORG              = 56 ;      // current X origin
  GFX_Y_ORG              = 57 ;      // current Y origin

  GFX_THUMB_PERCENT      = 75 ;      // size of slider thumb as percentage
  GFX_THUMB_BORDER_DARK  = 76 ;      // darker shadow of thumb
  GFX_THUMB_BORDER_LIGHT = 77 ;      // lighter shadow of thumb
  TOUCH_XMINCAL          = 78 ;      // touch calibration value
  TOUCH_YMINCAL          = 79 ;      // touch calibration value
  TOUCH_XMAXCAL          = 80 ;      // touch calibration value
  TOUCH_YMAXCAL          = 81 ;      // touch calibration value
  IMG_WIDTH              = 82 ;      // width of currently loaded image
  IMG_HEIGHT             = 83 ;      // height of currently loaded image
  IMG_FRAME_DELAY        = 84 ;      // 0 if image, else inter frame delay for movie
  IMG_FLAGS              = 85 ;      // bit 4 determines colour mode, other bits reserved
  IMG_FRAME_COUNT        = 86 ;      // count of frames in a movie
  IMG_PIXEL_COUNT_LO     = 87 ;      // count of pixels in the current frame
  IMG_PIXEL_COUNT_HI     = 88 ;      // count of pixels in the current frame
  IMG_CURRENT_FRAME      = 89 ;      // last frame shown
  MEDIA_ADDRESS_LO       = 90 ;      // uSD byte address LO
  MEDIA_ADDRESS_HI       = 91 ;      // uSD byte address HI
  MEDIA_SECTOR_LO        = 92 ;      // uSD sector address LO
  MEDIA_SECTOR_HI        = 93 ;      // uSD sector address HI
  MEDIA_SECTOR_COUNT     = 94 ;      // uSD number of bytes remaining in sector
  TEXT_XPOS              = 95 ;      // text current x pixel position
  TEXT_YPOS              = 96 ;      // text current y pixel position
  TEXT_MARGIN            = 97 ;      // text left pixel pos for carriage return
  TXT_FONT_ID            = 98 ;      // font type, 0 = system font, else pointer to user font
  TXT_FONT_MAX           = 99 ;      // max number of chars in font
  TXT_FONT_OFFSET        = 100 ;     // starting offset (normally 0x20)
  TXT_FONT_WIDTH         = 101 ;     // current font width
  TXT_FONT_HEIGHT        = 102 ;     // current font height
  GFX_TOUCH_REGION_X1    = 103 ;     // touch capture region
  GFX_TOUCH_REGION_Y1    = 104 ;
  GFX_TOUCH_REGION_X2    = 105 ;
  GFX_TOUCH_REGION_Y2    = 106 ;
  GFX_CLIP_LEFT_VAL      = 107 ;     // left clipping point (set with gfx_ClipWindow(...)
  GFX_CLIP_TOP_VAL       = 108 ;     // top clipping point (set with gfx_ClipWindow(...)
  GFX_CLIP_RIGHT_VAL     = 109 ;     // right clipping point (set with gfx_ClipWindow(...)
  GFX_CLIP_BOTTOM_VAL    = 110 ;     // bottom clipping point (set with gfx_ClipWindow(...)
  GFX_CLIP_LEFT          = 111 ;     // current clip value (reads full size if clipping turned off)
  GFX_CLIP_TOP           = 112 ;     // current clip value (reads full size if clipping turned off)
  GFX_CLIP_RIGHT         = 113 ;     // current clip value (reads full size if clipping turned off)
  GFX_CLIP_BOTTOM        = 114 ;     // current clip value (reads full size if clipping turned off)
  GRAM_PIXEL_COUNT_LO    = 115 ;     // LO word of count of pixels in the set GRAM area
  GRAM_PIXEL_COUNT_HI    = 116 ;     // HI word of count of pixels in the set GRAM area
  TOUCH_RAW_X            = 117 ;     // 12 bit raw A2D X value from touch screen
  TOUCH_RAW_Y            = 118 ;     // 12 bit raw A2D Y value from touch screen
  GFX_LAST_CHAR_WIDTH    = 119 ;     // calculated char width from last call to charWidth function
  GFX_LAST_CHAR_HEIGHT   = 120 ;     // calculated height from last call to charHeight function
  GFX_LAST_STR_WIDTH     = 121 ;     // calculated width from last call to strWidth function
  GFX_LAST_STR_HEIGHT    = 122 ;     // calculated height from last call to strHeight function
  PIN_COUNTER_PA4        = 123 ;     // pin counter for PA4
  PIN_COUNTER_PA5        = 124 ;     // pin counter for PA5
  PIN_COUNTER_PA6        = 125 ;     // pin counter for PA6
  PIN_COUNTER_PA7        = 126 ;     // pin counter for PA7
  PIN_COUNTER_PA8        = 127 ;     // pin counter for PA8
  PIN_COUNTER_PA9        = 128 ;     // pin counter for PA9
  PIN_EVENT_PA4          = 129 ;     // pin counter rollover event for PA4
  PIN_EVENT_PA5          = 130 ;     // pin counter rollover event for PA5
  PIN_EVENT_PA6          = 131 ;     // pin counter rollover event for PA6
  PIN_EVENT_PA7          = 132 ;     // pin counter rollover event for PA7
  PIN_EVENT_PA8          = 133 ;     // pin counter rollover event for PA8
  PIN_EVENT_PA9          = 134 ;     // pin counter rollover event for PA9
  QEN1_COUNTER_LO        = 135 ;     // quadrature encoder #1 counter LO
  QEN1_COUNTER_HI        = 136 ;     // quadrature encoder #1 counter HI
  QEN1_DELTA             = 137 ;     // quadrature encoder #1 delta count, reset when read
  QEN2_COUNTER_LO        = 138 ;     // quadrature encoder #2 counter LO
  QEN2_COUNTER_HI        = 139 ;     // quadrature encoder #2 counter HI
  QEN2_DELTA             = 140 ;     // quadrature encoder #2 delta count, reset when read
  FALSE_REASON           = 141 ;     // explanation 'false' results, currently only for flash_ functions

//------------------------------------------------------------------//
// string processing constants                                      //
//------------------------------------------------------------------//
  STR                    = $0080 ;  // display as string
  CHR                    = $0081 ;  // display as single char


//============================================================================
// number formatting bits
//============================================================================
// bit 15 14 13 12 11 10 9  8  7  6  5  4  3  2  1  0
//     |  |  |  |   \___ ___/  |  \  /  \_____ _____/
//     |  |  |  |       V      |   V          V
//     |  |  |  |       |      |   |          |
//     |  |  |  |  digit count |   |          |
//     |  |  |  |  (nb 0 = 16) |   |          |____BASE (usually 2,10 or 16)
//     |  |  |  |              |   |
//     |  |  |  |              |   |___reserved (not used on Goldelox)
//     |  |  |  |              |
//     |  |  |  |              |____ string indicatior
//     |  |  |  |                      0x80 = [STR]
//     |  |  |  |                      0x81 = [CHR]
//     |  |  |  |______
//     |  |  |           1 = leading zeros included
//     |  |  |           0 = leading zeros suppressed
//     |  |  |
//     |  |  |_______
//     |  |           1 = leading zero blanking
//     |  |
//     |  |_____ sign bit (0 = signed, 1 = unsigned)
//     |
//     |______ 1 = space before unsigned number



  //=======================================================
  // general number formatting constants
  // for 'print' and 'putnum'
  //=======================================================
  // binary, no leading zeroes
  BIN                    = $0002 ;  // binary, 16 digits, no leading zeroes
  BIN1                   = $0102 ;  // binary, 1 digit, no leading zeroes
  BIN2                   = $0202 ;  // binary, 2 digits, no leading zeroes
  BIN3                   = $0302 ;  // binary, 3 digits, no leading zeroes
  BIN4                   = $0402 ;  // binary, 4 digits, no leading zeroes
  BIN5                   = $0502 ;  // binary, 5 digits, no leading zeroes
  BIN6                   = $0602 ;  // binary, 6 digits, no leading zeroes
  BIN7                   = $0702 ;  // binary, 7 digits, no leading zeroes
  BIN8                   = $0802 ;  // binary, 8 digits, no leading zeroes
  BIN9                   = $0902 ;  // binary, 9 digits, no leading zeroes
  BIN10                  = $0A02 ;  // binary, 10 digits, no leading zeroes
  BIN11                  = $0B02 ;  // binary, 11 digits, no leading zeroes
  BIN12                  = $0C02 ;  // binary, 12 digits, no leading zeroes
  BIN13                  = $0D02 ;  // binary, 13 digits, no leading zeroes
  BIN14                  = $0E02 ;  // binary, 14 digits, no leading zeroes
  BIN15                  = $0F02 ;  // binary, 15 digits, no leading zeroes
  BIN16                  = $0002 ;  // binary, 16 digits, no leading zeroes

  // binary, with leading zeroes
  BINZ                   = $1002 ;  // binary, 16 digits, leading zeroes
  BIN1Z                  = $1102 ;  // binary, 1 digit, leading zeroes
  BIN2Z                  = $1202 ;  // binary, 2 digits, leading zeroes
  BIN3Z                  = $1302 ;  // binary, 3 digits, leading zeroes
  BIN4Z                  = $1402 ;  // binary, 4 digits, leading zeroes
  BIN5Z                  = $1502 ;  // binary, 5 digits, leading zeroes
  BIN6Z                  = $1602 ;  // binary, 6 digits, leading zeroes
  BIN7Z                  = $1702 ;  // binary, 7 digits, leading zeroes
  BIN8Z                  = $1802 ;  // binary, 8 digits, leading zeroes
  BIN9Z                  = $1902 ;  // binary, 9 digits, leading zeroes
  BIN10Z                 = $1A02 ;  // binary, 10 digits, leading zeroes
  BIN11Z                 = $1B02 ;  // binary, 11 digits, leading zeroes
  BIN12Z                 = $1C02 ;  // binary, 12 digits, leading zeroes
  BIN13Z                 = $1D02 ;  // binary, 13 digits, leading zeroes
  BIN14Z                 = $1E02 ;  // binary, 14 digits, leading zeroes
  BIN15Z                 = $1F02 ;  // binary, 15 digits, leading zeroes
  BIN16Z                 = $1002 ;  // binary, 16 digits, leading zeroes

  // binary, with leading blanked
  BINZB                  = $2002 ;  // binary, 16 digits, leading blanks
  BIN1ZB                 = $2102 ;  // binary, 1 digit, leading blanks
  BIN2ZB                 = $2202 ;  // binary, 2 digits, leading blanks
  BIN3ZB                 = $2302 ;  // binary, 3 digits, leading blanks
  BIN4ZB                 = $2402 ;  // binary, 4 digits, leading blanks
  BIN5ZB                 = $2502 ;  // binary, 5 digits, leading blanks
  BIN6ZB                 = $2602 ;  // binary, 6 digits, leading blanks
  BIN7ZB                 = $2702 ;  // binary, 7 digits, leading blanks
  BIN8ZB                 = $2802 ;  // binary, 8 digits, leading blanks
  BIN9ZB                 = $2902 ;  // binary, 9 digits, leading blanks
  BIN10ZB                = $2A02 ;  // binary, 10 digits, leading blanks
  BIN11ZB                = $2B02 ;  // binary, 11 digits, leading blanks
  BIN12ZB                = $2C02 ;  // binary, 12 digits, leading blanks
  BIN13ZB                = $2D02 ;  // binary, 13 digits, leading blanks
  BIN14ZB                = $2E02 ;  // binary, 14 digits, leading blanks
  BIN15ZB                = $2F02 ;  // binary, 15 digits, leading blanks
  BIN16ZB                = $2002 ;  // binary, 16 digits, leading blanks

  // signed decimal, no leading zeroes
  DECFMT                 = $050A ;  // signed decimal, 5 digits, no leading zeroes, name changed for Delphi due to conflict with dec function
  DEC1                   = $010A ;  // signed decimal, 1 digit, no leading zeroes
  DEC2                   = $020A ;  // signed decimal, 2 digits, no leading zeroes
  DEC3                   = $030A ;  // signed decimal, 3 digits, no leading zeroes
  DEC4                   = $040A ;  // signed decimal, 4 digits, no leading zeroes
  DEC5                   = $050A ;  // signed decimal, 5 digits, no leading zeroes

  // signed decimal, with leading zeroes
  DECZ                   = $150A ;  // signed decimal, 5 digits, leading zeroes
  DEC1Z                  = $110A ;  // signed decimal, 1 digit, leading zeroes
  DEC2Z                  = $120A ;  // signed decimal, 2 digits, leading zeroes
  DEC3Z                  = $130A ;  // signed decimal, 3 digits, leading zeroes
  DEC4Z                  = $140A ;  // signed decimal, 4 digits, leading zeroes
  DEC5Z                  = $150A ;  // signed decimal, 5 digits, leading zeroes

  // signed decimal, leading zeroes blanked
  DECZB                  = $250A ;  // signed decimal, 5 digits, leading blanks
  DEC1ZB                 = $210A ;  // signed decimal, 1 digit, leading blanks
  DEC2ZB                 = $220A ;  // signed decimal, 2 digits, leading blanks
  DEC3ZB                 = $230A ;  // signed decimal, 3 digits, leading blanks
  DEC4ZB                 = $240A ;  // signed decimal, 4 digits, leading blanks
  DEC5ZB                 = $250A ;  // signed decimal, 5 digits, leading blanks

  // unsigned decimal, no leading zeroes
  UDEC                   = $450A ;  // unsigned decimal, 5 digits, no leading zeroes
  UDEC1                  = $410A ;  // unsigned decimal, 1 digit, no leading zeroes
  UDEC2                  = $420A ;  // unsigned decimal, 2 digits, no leading zeroes
  UDEC3                  = $430A ;  // unsigned decimal, 3 digits, no leading zeroes
  UDEC4                  = $440A ;  // unsigned decimal, 4 digits, no leading zeroes
  UDEC5                  = $450A ;  // unsigned decimal, 5 digits, no leading zeroes

  // unsigned decimal, with leading zero's
  UDECZ                  = $550A ;  // unsigned decimal, 5 digits, leading zeroes
  UDEC1Z                 = $510A ;  // unsigned decimal, 1 digit, leading zeroes
  UDEC2Z                 = $520A ;  // unsigned decimal, 2 digits, leading zeroes
  UDEC3Z                 = $530A ;  // unsigned decimal, 3 digits, leading zeroes
  UDEC4Z                 = $540A ;  // unsigned decimal, 4 digits, leading zeroes
  UDEC5Z                 = $550A ;  // unsigned decimal, 5 digits, leading zeroes

  // unsigned decimal, leading zeroes blanked
  UDECZB                 = $650A ;  // unsigned decimal, 5 digits, leading blanks
  UDEC1ZB                = $610A ;  // unsigned decimal, 1 digit, leading blanks
  UDEC2ZB                = $620A ;  // unsigned decimal, 2 digits, leading blanks
  UDEC3ZB                = $630A ;  // unsigned decimal, 3 digits, leading blanks
  UDEC4ZB                = $640A ;  // unsigned decimal, 4 digits, leading blanks
  UDEC5ZB                = $650A ;  // unsigned decimal, 5 digits, leading blanks

  // hex, with leading zero's
  HEX                    = $1410 ;  // hex, 4 digits, leading zeroes
  HEX1                   = $1110 ;  // hex, 1 digit, leading zeroes
  HEX2                   = $1210 ;  // hex, 2 digits, leading zeroes
  HEX3                   = $1310 ;  // hex, 3 digits, leading zeroes
  HEX4                   = $1410 ;  // hex, 4 digits, leading zeroes

  // hex, no leading zero's
  HEXZ                   = $0410 ;  // hex, 4 digits, no leading zeroes
  HEX1Z                  = $0110 ;  // hex, 1 digit, no leading zeroes
  HEX2Z                  = $0210 ;  // hex, 2 digits, no leading zeroes
  HEX3Z                  = $0310 ;  // hex, 3 digits, no leading zeroes
  HEX4Z                  = $0410 ;  // hex, 4 digits, no leading zeroes

  // hex, leading zero's blanked
  HEXZB                  = $2410 ;  // hex, 4 digits, leading blanks
  HEX1ZB                 = $2110 ;  // hex, 1 digit, leading blanks
  HEX2ZB                 = $2210 ;  // hex, 2 digits, leading blanks
  HEX3ZB                 = $2310 ;  // hex, 3 digits, leading blanks
  HEX4ZB                 = $2410 ;  // hex, 4 digits, leading blanks



//==================================================================================================



(*
    16 bit RGB (565) Colour Chart
    Original work by 4D Forum Member: skadoo
*)



  ALICEBLUE              = $F7DF ;
  ANTIQUEWHITE           = $FF5A ;
  AQUA                   = $07FF ;
  AQUAMARINE             = $7FFA ;
  AZURE                  = $F7FF ;
  BEIGE                  = $F7BB ;
  BISQUE                 = $FF38 ;
  BLACK                  = $0000 ;
  BLANCHEDALMOND         = $FF59 ;
  BLUE                   = $001F ;
  BLUEVIOLET             = $895C ;
  BROWN                  = $A145 ;
  BURLYWOOD              = $DDD0 ;
  CADETBLUE              = $5CF4 ;
  CHARTREUSE             = $7FE0 ;
  CHOCOLATE              = $D343 ;
  CORAL                  = $FBEA ;
  CORNFLOWERBLUE         = $64BD ;
  CORNSILK               = $FFDB ;
  CRIMSON                = $D8A7 ;
  CYAN                   = $07FF ;
  DARKBLUE               = $0011 ;
  DARKCYAN               = $0451 ;
  DARKGOLDENROD          = $BC21 ;
  DARKGRAY               = $AD55 ;
  DARKGREEN              = $0320 ;
  DARKKHAKI              = $BDAD ;
  DARKMAGENTA            = $8811 ;
  DARKOLIVEGREEN         = $5345 ;
  DARKORANGE             = $FC60 ;
  DARKORCHID             = $9999 ;
  DARKRED                = $8800 ;
  DARKSALMON             = $ECAF ;
  DARKSEAGREEN           = $8DF1 ;
  DARKSLATEBLUE          = $49F1 ;
  DARKSLATEGRAY          = $2A69 ;
  DARKTURQUOISE          = $067A ;
  DARKVIOLET             = $901A ;
  DEEPPINK               = $F8B2 ;
  DEEPSKYBLUE            = $05FF ;
  DIMGRAY                = $6B4D ;
  DODGERBLUE             = $1C9F ;
  FIREBRICK              = $B104 ;
  FLORALWHITE            = $FFDE ;
  FORESTGREEN            = $2444 ;
  FUCHSIA                = $F81F ;
  GAINSBORO              = $DEFB ;
  GHOSTWHITE             = $FFDF ;
  GOLD                   = $FEA0 ;
  GOLDENROD              = $DD24 ;
  GRAY                   = $8410 ;
  GREEN                  = $0400 ;
  GREENYELLOW            = $AFE5 ;
  HONEYDEW               = $F7FE ;
  HOTPINK                = $FB56 ;
  INDIANRED              = $CAEB ;
  INDIGO                 = $4810 ;
  IVORY                  = $FFFE ;
  KHAKI                  = $F731 ;
  LAVENDER               = $E73F ;
  LAVENDERBLUSH          = $FF9E ;
  LAWNGREEN              = $7FE0 ;
  LEMONCHIFFON           = $FFD9 ;
  LIGHTBLUE              = $AEDC ;
  LIGHTCORAL             = $F410 ;
  LIGHTCYAN              = $E7FF ;
  LIGHTGOLD              = $FFDA ;
  LIGHTGREEN             = $9772 ;
  LIGHTGREY              = $D69A ;
  LIGHTPINK              = $FDB8 ;
  LIGHTSALMON            = $FD0F ;
  LIGHTSEAGREEN          = $2595 ;
  LIGHTSKYBLUE           = $867F ;
  LIGHTSLATEGRAY         = $7453 ;
  LIGHTSTEELBLUE         = $B63B ;
  LIGHTYELLOW            = $FFFC ;
  LIME                   = $07E0 ;
  LIMEGREEN              = $3666 ;
  LINEN                  = $FF9C ;
  MAGENTA                = $F81F ;
  MAROON                 = $8000 ;
  MEDIUMAQUAMARINE       = $6675 ;
  MEDIUMBLUE             = $0019 ;
  MEDIUMORCHID           = $BABA ;
  MEDIUMPURPLE           = $939B ;
  MEDIUMSEAGREEN         = $3D8E ;
  MEDIUMSLATEBLUE        = $7B5D ;
  MEDIUMSPRINGGREEN      = $07D3 ;
  MEDIUMTURQUOISE        = $4E99 ;
  MEDIUMVIOLETRED        = $C0B0 ;
  MIDNIGHTBLUE           = $18CE ;
  MINTCREAM              = $F7FF ;
  MISTYROSE              = $FF3C ;
  MOCCASIN               = $FF36 ;
  NAVAJOWHITE            = $FEF5 ;
  NAVY                   = $0010 ;
  OLDLACE                = $FFBC ;
  OLIVE                  = $8400 ;
  OLIVEDRAB              = $6C64 ;
  ORANGE                 = $FD20 ;
  ORANGERED              = $FA20 ;
  ORCHID                 = $DB9A ;
  PALEGOLDENROD          = $EF55 ;
  PALEGREEN              = $9FD3 ;
  PALETURQUOISE          = $AF7D ;
  PALEVIOLETRED          = $DB92 ;
  PAPAYAWHIP             = $FF7A ;
  PEACHPUFF              = $FED7 ;
  PERU                   = $CC27 ;
  PINK                   = $FE19 ;
  PLUM                   = $DD1B ;
  POWDERBLUE             = $B71C ;
  PURPLE                 = $8010 ;
  RED                    = $F800 ;
  ROSYBROWN              = $BC71 ;
  ROYALBLUE              = $435C ;
  SADDLEBROWN            = $8A22 ;
  SALMON                 = $FC0E ;
  SANDYBROWN             = $F52C ;
  SEAGREEN               = $2C4A ;
  SEASHELL               = $FFBD ;
  SIENNA                 = $A285 ;
  SILVER                 = $C618 ;
  SKYBLUE                = $867D ;
  SLATEBLUE              = $6AD9 ;
  SLATEGRAY              = $7412 ;
  SNOW                   = $FFDF ;
  SPRINGGREEN            = $07EF ;
  STEELBLUE              = $4416 ;
  TAN                    = $D5B1 ;
  TEAL                   = $0410 ;
  THISTLE                = $DDFB ;
  TOMATO                 = $FB08 ;
  TURQUOISE              = $471A ;
  VIOLET                 = $EC1D ;
  WHEAT                  = $F6F6 ;
  WHITE                  = $FFFF ;
  WHITESMOKE             = $F7BE ;
  YELLOW                 = $FFE0 ;
  YELLOWGREEN            = $9E66 ;

