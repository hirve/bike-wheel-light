; Controller ATTINY 2313 at 8 MHz internal RC oscillator
; Brown-out at 1.8V, fuse CKDIV8 is ON

; Design:
;                    --------
;           RESET --|1     20|-- +3..4.2V, -- Capacitor ~0.1uF --|
;      |-- Light1 --|        |-- SCK
;      |-- Light2 --|        |-- MISO
;      |-- Light3 --|        |-- MOSI
;      |-- Light4 --|        |--
;      |-- Light5 --|        |--
;      |-- Light6 --|        |--
;      |-- Light7 --|        |--
;      |-- Light8 --|        |-- Reed Switch --|
;                |--|10    11|--
;                    --------

; ------------------------------------------------------------------------

; Device
  .include "tn2313def.inc"

; ------------------------------------------------------------------------

; Registers

	.def R4_PERIOD =			R4
	.def R5_PERIOD =			R5
	.def R6_SPEED =				R6

	.def R7_TEXT_BEGIN =		R7
	.def R8_TEXT_SYMB =			R8
	.def R9_SYMB_LINE =			R9

	.def R10_ANGLE_COUNTER =	R10
	.def R11_ANGLE_COUNTER =	R11

	.def R12_CLB =				R12

	.def R13_SP =				R13
	.def R14_SLP =				R14

	.def R15_CLB_PRINT =		R15

;------------------------------------------------------------------------

.eseg

.org 0x000
	.db 128

;------------------------------------------------------------------------

.cseg

.org 0x0000
        RJMP Reset		; Reset Handler
.org 0x0001
        RETI			; External Interrupt0 Handler
.org 0x0002
        RETI			; External Interrupt1 Handler
.org 0x0003
        RETI			; Timer1 Capture Handler
.org 0x0004
        RETI			; Timer1 CompareA Handler
.org 0x0005
        RETI			; Timer1 Overflow Handler
.org 0x0006
        RJMP Timer		; Timer0 Overflow Handler
.org 0x0007
        RETI			; USART0 RX Complete Handler
.org 0x0008
        RETI			; USART0,UDR Empty Handler
.org 0x0009
        RETI			; USART0 TX Complete Handler
.org 0x000A
        RETI			; Analog Comparator Handler
.org 0x000B
        RETI			; PCINT0 Handler
.org 0x000C
        RETI			; Timer1 Compare B Handler
.org 0x000D
        RETI			; Timer0 Compare A Handler
.org 0x000E
        RETI			; Timer0 Compare B Handler
.org 0x000F
        RETI			; USI Start Handler
.org 0x0010
        RETI			; USI Overflow Handler
.org 0x0011
        RETI			; EEPROM Ready Handler
.org 0x0012
        RETI			; Watchdog Overflow Handler
.org 0x0013
        RETI			; PCINT1 Handler
.org 0x0014
        RETI			; PCINT2 Handler


;------------------------------------------------------------------------

Data:

	;1
	.db 0b00000000,\
      0b00000000
	.db 0b00000000,\
      0b01000010
	.db 0b01111111,\
      0b01000000
	.db 0b00000000,\
      0b00000000

	;2
	.db 0b00000000,\
      0b00000000
	.db 0b01000010,\
      0b01100001
	.db 0b01010001,\
      0b01001001
	.db 0b01000110,\
      0b00000000

	;3
	.db 0b00000000,\
      0b00000000
	.db 0b00100010,\
      0b01000001
	.db 0b01000001,\
      0b01001001
	.db 0b00110110,\
      0b00000000

	;4
	.db 0b00000000,\
      0b00000000
	.db 0b00111000,\
      0b00100100
	.db 0b00100010,\
      0b01111111
	.db 0b00100000,\
      0b00000000

	;5
	.db 0b00000000,\
      0b00000000
	.db 0b00101111,\
      0b01001001
	.db 0b01001001,\
      0b01001001
	.db 0b00110001,\
      0b00000000

	;6
	.db 0b00000000,\
      0b00000000
	.db 0b00111110,\
      0b01001001
	.db 0b01001001,\
      0b01001001
	.db 0b00110010,\
      0b00000000

	;7
	.db 0b00000000,\
      0b00000000
	.db 0b00000001,\
      0b01100001
	.db 0b00011001,\
      0b00000101
	.db 0b00000011,\
      0b00000000

	;8
	.db 0b00000000,\
      0b00000000
	.db 0b00110110,\
      0b01001001
	.db 0b01001001,\
      0b01001001
	.db 0b00110110,\
      0b00000000

	;9
	.db 0b00000000,\
      0b00000000
	.db 0b00100110,\
      0b01001001
	.db 0b01001001,\
      0b01001001
	.db 0b00111110,\
      0b00000000

	;10 - 0
	.db 0b00000000,\
      0b00000000
	.db 0b00111110,\
      0b01000001
	.db 0b01000001,\
      0b01000001
	.db 0b00111110,\
      0b00000000

	;11 - space
	.db 0b00000000,\
      0b00000000
	.db 0b00000000,\
      0b00000000
	.db 0b00000000,\
      0b00000000
	.db 0b00000000,\
      0b00000000

	;12 - YO
	.db 0b00000000,\
      0b00000000
	.db 0b01111101,\
      0b01010101
	.db 0b01010100,\
      0b01000101
	.db 0b01000101,\
      0b00000000

	;13 - heart
	.db 0b00000000,\
      0b00011100
	.db 0b00100010,\
      0b01000001
	.db 0b10000010,\
      0b01000001
	.db 0b00100010,\
      0b00011100

	;14 - ball
	.db 0b00000000,\
      0b00000000
	.db 0b00011000,\
      0b00111100
	.db 0b00111100,\
      0b00011000
	.db 0b00000000,\
      0b00000000

	;15 - left
	.db 0b00000000,\
      0b00000000
	.db 0b00001000,\
      0b00010100
	.db 0b00100010,\
      0b01111111
	.db 0b00000000,\
      0b00000000

	;16 - right
	.db 0b00000000,\
      0b00000000
	.db 0b01111111,\
      0b00100010
	.db 0b00010100,\
      0b00001000
	.db 0b00000000,\
      0b00000000

	;17 - point
	.db 0b00000000,\
      0b00000000
	.db 0b00000000,\
      0b00000000
	.db 0b11000000,\
      0b11000000
	.db 0b00000000,\
      0b00000000

	;18 - line
	.db 0b00000000,\
      0b00000000
	.db 0b00001000,\
      0b00001000
	.db 0b00001000,\
      0b00001000
	.db 0b00000000,\
      0b00000000

	;19 - k
	.db 0b00000000,\
      0b00000000
	.db 0b01111111,\
      0b00010000
	.db 0b00101000,\
      0b01000100
	.db 0b01000100,\
      0b00000000

	;20 - m
	.db 0b00000000,\
      0b00000000
	.db 0b01111100,\
      0b00000100
	.db 0b01111000,\
      0b00000100
	.db 0b01111000,\
      0b00000000

	;21 - /
	.db 0b00000000,\
      0b00000000
	.db 0b00100000,\
      0b00010000
	.db 0b00001000,\
      0b00000100
	.db 0b00000010,\
      0b00000000

	;22 - h
	.db 0b00000000,\
      0b01111111
	.db 0b00001000,\
      0b00000100
	.db 0b00000100,\
      0b01111000
	.db 0b00000000,\
      0b00000000

	;23 - =
	.db 0b00000000,\
      0b00000000
	.db 0b00101000,\
      0b00101000
	.db 0b00101000,\
      0b00101000
	.db 0b00000000,\
      0b00000000

	;24 - S
	.db 0b00000000,\
      0b00000000
	.db 0b00101110,\
      0b01001001
	.db 0b01001001,\
      0b01001001
	.db 0b00110010,\
      0b00000000

	;25 - i
	.db 0b00000000,\
      0b00000000
	.db 0b00000000,\
      0b01000100
	.db 0b01111101,\
      0b01000000
	.db 0b00000000,\
      0b00000000

	;26 - t
	.db 0b00000000,\
      0b00000100
	.db 0b00000100,\
      0b00111111
	.db 0b01000100,\
      0b01000100
	.db 0b00000000,\
      0b00000000

	;27 - n
	.db 0b00000000,\
      0b01111100
	.db 0b00001000,\
      0b00000100
	.db 0b00000100,\
      0b01111000
	.db 0b00000000,\
      0b00000000

	;28 - underline
	.db 0b00000000,\
      0b10000000
	.db 0b10000000,\
      0b10000000
	.db 0b10000000,\
      0b10000000
	.db 0b10000000,\
      0b00000000

	;29 - [
	.db 0b00000000,\
      0b00000000
	.db 0b00000000,\
      0b01111111
	.db 0b01000001,\
      0b00000000
	.db 0b00000000,\
      0b00000000

	;30 - ]
	.db 0b00000000,\
      0b00000000
	.db 0b00000000,\
      0b01000001
	.db 0b01111111,\
      0b00000000
	.db 0b00000000,\
      0b00000000

	;31 - a
	.db 0b00000000,\
      0b00100000
	.db 0b01010100,\
      0b01010100
	.db 0b01010100,\
      0b01111000
	.db 0b00000000,\
      0b00000000

	;32 - r
	.db 0b00000000,\
      0b01111100
	.db 0b00001000,\
      0b00000100
	.db 0b00000100,\
      0b00001000
	.db 0b00000000,\
      0b00000000

	;33 - e
	.db 0b00000000,\
      0b00111000
	.db 0b01010100,\
      0b01010100
	.db 0b01010100,\
      0b01001000
	.db 0b00000000,\
      0b00000000

	;34 - c
	.db 0b00000000,\
      0b00111000
	.db 0b01000100,\
      0b01000100
	.db 0b01000100,\
      0b00101000
	.db 0b00000000,\
      0b00000000

	;35 - l
	.db 0b00000000,\
      0b00000000
	.db 0b01000010,\
      0b01111110
	.db 0b01000000,\
      0b00000000
	.db 0b00000000,\
      0b00000000

	;36 - b
	.db 0b00000000,\
      0b01111111
	.db 0b01000100,\
      0b01000100
	.db 0b01000100,\
      0b00111000
	.db 0b00000000,\
      0b00000000

	;37 - V
	.db 0b00000000,\
      0b00011111
	.db 0b00100000,\
      0b01000000
	.db 0b01000000,\
      0b00100000
	.db 0b00011111,\
      0b00000000

	;38 - o
	.db 0b00000000,\
      0b00111000
	.db 0b01000100,\
      0b01000100
	.db 0b01000100,\
      0b00111000
	.db 0b00000000,\
      0b00000000

	;39 - p
	.db 0b00000000,\
      0b11111100
	.db 0b00100100,\
      0b00100100
	.db 0b00100100,\
      0b00011000
	.db 0b00000000,\
      0b00000000

	;40 - u
	.db 0b00000000,\
      0b00000000
	.db 0b00111100,\
      0b01000000
	.db 0b00100000,\
      0b01111100
	.db 0b00000000,\
      0b00000000

	;41 - A
	.db 0b00000000,\
      0b01111100
	.db 0b00010010,\
      0b00010001
	.db 0b00010001,\
      0b01111110
	.db 0b00000000,\
      0b00000000

	;42 - T
	.db 0b00000000,\
      0b00000001
	.db 0b00000001,\
      0b01111111
	.db 0b00000001,\
      0b00000001
	.db 0b00000000,\
      0b00000000

	;43 - L
	.db 0b00000000,\
      0b01111111
	.db 0b01000000,\
      0b01000000
	.db 0b01000000,\
      0b01000000
	.db 0b00000000,\
      0b00000000



Spd_data:

	.db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.db 0,0,0,97,93,88,84,80,77,74,71,69,66,64,62,60
	.db 58,56,54,53,51,50,49,47,46,45,44,43,42,41,40,39
	.db 39,38,37,36,36,35,34,34,33,32,32,31,31,30,30,29
	.db 29,28,28,28,27,27,26,26,26,25,25,25,24,24,24,23
	.db 23,23,23,22,22,22,22,21,21,21,21,20,20,20,20,19
	.db 19,19,19,19,19,18,18,18,18,18,17,17,17,17,17,17
	.db 17,16,16,16,16,16,16,16,15,15,15,15,15,15,15,15
	.db 14,14,14,14,14,14,14,14,14,14,13,13,13,13,13,13
	.db 13,13,13,13,13,12,12,12,12,12,12,12,12,12,12,12
	.db 12,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11
	.db 11,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10
	.db 10,10,10,9,9,9,9,9,9,9,9,9,9,9,9,9
	.db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

;------------------------------------------------------------------------

Reset:

; DDRA
	LDI R17, 0b00000011
	OUT 0x1A, R17

; DDRB
	LDI R17, 0b00000000
	OUT 0x17, R17

; PORTB
	LDI R17, 0b11111001
	OUT 0x18, R17

; DDRD
	LDI R17, 0b00111111
	OUT 0x11, R17

; PORTD
	LDI R17, 0b00000000
	OUT 0x12, R17

; Timers
	LDI R17, 0b00000010
	OUT 0x39, R17

; Timer 0
	LDI R17, 0b00000011
	OUT 0x33, R17

; Timer 1
	LDI R17, 0b00000100
	OUT 0x2E, R17

; Sleep mode
	LDI R17, 0b00100000
	OUT 0x35, R17

; Text Off
	CLR R16
	STS 0x60, R16

; Clb
Clb_READ:
	LDI R16, 199
	MOV R12_CLB, R16
	CLR R15_CLB_PRINT
	SBIC 0x1C, 1
	RJMP Clb_READ
		LDI R16, 0
		OUT 0x1E, R16
		SBI 0x1C,0
		IN R16, 0x1D
		MOV R12_CLB, R16

; SP
	LDI R16, 0xDF
	OUT 0x3D, R16
	SEI

;------------------------------------------------------------------------

Main:
	SLEEP
	MOV R16, R14_SLP
	CPI R16, 1
	BRNE Main_SLEEP_RET
		LDI R16, 0b00110000
		OUT 0x3B, R16
		LDI R16, 0b00000001
		OUT 0x20, R16
		LDI R17, 0b00110000
		OUT 0x35, R17
		RCALL Clb_WRITE
		SLEEP
		CLR R15_CLB_PRINT
		LDI R17, 0b00100000
		OUT 0x35, R17
		LDI R16, 0
		OUT 0x3B, R16

Main_SLEEP_RET:
	IN R16, 0x16
	ANDI R16, 0b00000001
	CPI R16, 0b00000000
	BRNE Main

Main_ON:
	SLEEP
	IN R16, 0x16
	ANDI R16, 0b00000001
	CPI R16, 0b00000001
	BRNE Main_ON
		CLR R10_ANGLE_COUNTER
		CLR R11_ANGLE_COUNTER
		RCALL Impulse
		CLR R14_SLP
	RJMP Main

;------------------------------------------------------------------------

Clb_WRITE:

	MOV R16, R15_CLB_PRINT
	CPI R16, 0
	BREQ Clb_WRITE_RET

EEWrite:

		SBIC 0x1C, 1
		RJMP EEWrite

		LDI R17, 0b00000000
		OUT 0x1C, R17
		LDI R17, 0x00
		OUT 0x1E, R17
		MOV R17, R12_CLB
		OUT 0x1D, R17

		CLI
			SBI 0x1C, 2
			SBI 0x1C, 1
		SEI

Clb_WRITE_RET:
	RET

;------------------------------------------------------------------------

Timer:

	PUSH R16
	IN R16, 0x3F
	PUSH R16

Timer_SLEEP:

	MOV R16, R14_SLP
	CPI R16, 1
	BREQ Timer_RET

Timer_A:

	CLR R16
	INC R10_ANGLE_COUNTER
	CP R10_ANGLE_COUNTER, R16
	BRNE Timer_A_INC_END

		INC R11_ANGLE_COUNTER

Timer_A_INC_END:

	MOV R16, R10_ANGLE_COUNTER
	MOV R17, R11_ANGLE_COUNTER

	CPI R17, 200
	BRNE Timer_A_END

		CLR R14_SLP
		INC R14_SLP

Timer_A_END:

		RCALL Timer_CORR
		RCALL Lights_OFF
		RCALL Period_Max_STOP
		RCALL Period_SET
		RCALL Speed_CALC
		RCALL Text_PRINT
		RCALL Line_PRINT

;		Decor -----------------------

;			RCALL Frames
;			RCALL Byte_WRITE

			RCALL Name_WRITE
			RCALL Decor1

;		Decor_END -------------------

Timer_RET:
	POP R16
	OUT 0x3F, R16
	POP R16
	RETI

;-----------------------------------------------------------------------

Lights_OFF:
	LDI R17, 0
	OUT 0x12, R17
	OUT 0x1B, R17
	RET

Impulse:
	LDI R17, 0b00111111
	OUT 0x12, R17
	LDI R17, 0b00000011
	OUT 0x1B, R17
	LDI R17, 0b00000000
	OUT 0x12, R17
	LDI R17, 0
	OUT 0x1B, R17
	RET

Frames:
Frames_All:
	MOV R16, R10_ANGLE_COUNTER
	ANDI R16, 0b00000111
	CPI R16, 0
	BRNE Frames_2
		RCALL Impulse
		RJMP Frames_RET

Frames_All_END:
Frames_2:
	LDI R17, 0b00100001
	OUT 0x12, R17
	LDI R17, 0b00000000
	OUT 0x1B, R17
	LDI R17, 0b00000000
	OUT 0x12, R17
	LDI R17, 0
	OUT 0x1B, R17
Frames_2_END:
Frames_RET:
	RET

Decor1:
	MOV R16, R10_ANGLE_COUNTER
	ANDI R16, 0b01111111
	CPI R16, 0
	BRNE Decor1_RET
		MOV R16, R6_SPEED
		CPI R16, 9
		BRMI Decor1_RET
			MOV R16, R6_SPEED
			CPI R16, 14
			BRPL Decor1_RET

				LDI R16, 16       ; |>
				STS 0x60, R16

				LDI R16, 16       ; |>
				STS 0x61, R16

				LDI R16, 0
				STS 0x62, R16

				LDI R16, 0x60
				MOV R8_TEXT_SYMB, R16
				LDI R16, 1
				MOV R7_TEXT_BEGIN, R16
Decor1_RET:
	RET

Name_WRITE:
	MOV R16, R11_ANGLE_COUNTER
	CPI R16, 0
	BRNE Name_WRITE_RET
		MOV R16, R10_ANGLE_COUNTER
		CPI R16, 0x2A
		BRNE Name_WRITE_RET
			MOV R16, R6_SPEED
			CPI R16, 15
			BRMI Name_WRITE_RET
				MOV R16, R6_SPEED
				CPI R16, 30
				BRPL Name_WRITE_RET
					LDI R16, 41        ; A
					STS 0x60, R16
					LDI R16, 32        ; r
					STS 0x61, R16
					LDI R16, 26        ; t
					STS 0x62, R16
					LDI R16, 42        ; T
					STS 0x63, R16
					LDI R16, 33        ; e
					STS 0x64, R16
					LDI R16, 34        ; c
					STS 0x65, R16
					LDI R16, 22        ; h
					STS 0x66, R16
					LDI R16, 43        ; L
					STS 0x67, R16
					LDI R16, 31        ; a
					STS 0x68, R16
					LDI R16, 36        ; b
					STS 0x69, R16
					LDI R16, 0
					STS 0x6A, R16      ; Make sure that nums are in order.

					LDI R16, 0x60
					MOV R8_TEXT_SYMB, R16
					LDI R16, 1
					MOV R7_TEXT_BEGIN, R16
Name_WRITE_RET:
	RET

Text_PRINT:
	MOV R16, R7_TEXT_BEGIN
	CPI R16, 1
	BRNE Text_PRINT_RET
		CLR R7_TEXT_BEGIN
		MOV R28, R8_TEXT_SYMB
		CLR R29
		LD R16, Y
		CPI R16, 0
		BREQ Text_PRINT_RET
			LDI R16, 1
			MOV R9_SYMB_LINE, R16
Text_PRINT_RET:
	RET

Line_PRINT:
	MOV R16, R9_SYMB_LINE
	CPI R16, 0
	BREQ Line_PRINT_RET

		LD R16, Y
		DEC R16
		CLR R17

		LDI R30, low(Data*2)
		LDI R31, high(Data*2)

		CLC
		ROL R16
		ROL R17

		CLC
		ROL R16
		ROL R17

		CLC
		ROL R16
		ROL R17

		ADD R30, R16
		ADC R31, R17

		MOV R16, R9_SYMB_LINE
		DEC R16
		CLR R17

		ADD R30, R16
		ADC R31, R17

		LPM R16, Z

			RCALL Line_OUT

		INC R9_SYMB_LINE
		MOV R16, R9_SYMB_LINE
		CPI R16, 9
		BRNE Line_PRINT_RET

			CLR R9_SYMB_LINE
			INC R8_TEXT_SYMB
			LDI R16, 1
			MOV R7_TEXT_BEGIN, R16
Line_PRINT_RET:
	RET

Line_OUT:
	LDI R18, 0b00000000

; D0,D1
	MOV R17, R16
	ANDI R17, 0b00000011
	OR R18, R17

; D2,D3,D4,D5
	MOV R17, R16
	ANDI R17, 0b11110000
	LSR R17
	LSR R17
	OR R18, R17

	OUT 0x12, R18

	LDI R18, 0b00000000

; A0
	MOV R17, R16
	ANDI R17, 0b00001000
	LSR R17
	LSR R17
	LSR R17
	OR R18, R17

; A1
	MOV R17, R16
	ANDI R17, 0b00000100
	LSR R17
	OR R18, R17

	OUT 0x1B, R18

Line_OUT_RET:
	RET

Num_Text_WRITE:
	MOV R17, R16
	LDI R18, 0
Num_Text_100_BEGIN:
	SUBI R17, 100
	BRCS Num_Text_100_WRITE
		INC R18
		RJMP Num_Text_100_BEGIN
Num_Text_100_WRITE:
		LDI R19, 11
		STS 0x60, R19
		CPI R18, 0
		BREQ Num_Text_100_END
			STS 0x60, R18
Num_Text_100_END:
	SUBI R17, -100
	LDI R18, 0
Num_Text_10_BEGIN:
	SUBI R17, 10
	BRCS Num_Text_10_WRITE
		INC R18
		RJMP Num_Text_10_BEGIN
Num_Text_10_WRITE:
		LDI R19, 10
		STS 0x61, R19
		CPI R18, 0
		BREQ Num_Text_10_END
			STS 0x61, R18
Num_Text_10_END:
	SUBI R17, -10
Num_Text_1_WRITE:
	LDI R19, 10
	STS 0x62, R19
	CPI R17, 0
	BREQ Num_Text_1_END
		STS 0x62, R17
Num_Text_1_END:
	LDI R17, 0
	STS 0x63, R17
Num_Text_DEL0:
	LDS R17, 0x60
	CPI R17, 11
	BRNE Num_Text_DEL0_END
		LDS R17, 0x61
		CPI R17, 10
		BRNE Num_Text_DEL0_END
			LDI R17, 11
			STS 0x61, R17
Num_Text_DEL0_END:
	LDI R16, 0x60
	MOV R8_TEXT_SYMB, R16
	LDI R16, 1
	MOV R7_TEXT_BEGIN, R16
	RET

Byte_WRITE:
	MOV R16, R11_ANGLE_COUNTER
	CPI R16, 0
	BRNE Byte_WRITE_RET
		MOV R16, R10_ANGLE_COUNTER
		CPI R16, 0x40
		BRNE Byte_WRITE_RET
			MOV R16, R6_SPEED
			CPI R16, 0
			BREQ Byte_WRITE_RET
				RCALL Num_Text_WRITE
Byte_WRITE_RET:
	RET

Period_Max_STOP:
	IN R16, 0x2C
	IN R16, 0x2D
	SUBI R16, 14
	BRCS Period_Max_STOP_RET
		LDI R16, 13
		CLR R17
		OUT 0x2D, R16
		OUT 0x2C, R17
Period_Max_STOP_RET:
	RET

Period_SET:
	MOV R16, R11_ANGLE_COUNTER
	CPI R16, 0
	BRNE Period_SET_RET
		MOV R16, R10_ANGLE_COUNTER
		CPI R16, 0x20
		BRNE Period_SET_RET
			IN R4_PERIOD, 0x2C
			IN R5_PERIOD, 0x2D
			CLR R16
			OUT 0x2D, R16
			OUT 0x2C, R16
Period_SET_RET:
	RET

Speed_CALC:
	MOV R16, R11_ANGLE_COUNTER
	CPI R16, 0
	BRNE Speed_CALC_RET
		MOV R16, R10_ANGLE_COUNTER
		CPI R16, 0x30
		BRNE Speed_CALC_RET
			CLR R6_SPEED
			MOV R16, R4_PERIOD
			MOV R17, R5_PERIOD
			CLC
			ROR R17
			ROR R16
			CLC
			ROR R17
			ROR R16
			CLC
			ROR R17
			ROR R16
			CLC
			ROR R17
			ROR R16
			CLR R17
			MOV R13_SP, R16
			LDI R30, low(Spd_data*2)
			LDI R31, high(Spd_data*2)
			ADD R30, R16
			ADC R31, R17
			LPM R6_SPEED, Z
Speed_CALC_RET:
	RET

Timer_CORR:
;	MOV R16, R4_PERIOD
	MOV R17, R5_PERIOD
	NEG R17
	OUT 0x32, R17
Timer_CORR_RET:
	RET

MUL31:
;	R19:R17:R16 <- R19:R17:R16 * R18
;
;	R19:R17:R16 -	Collect
;	R22:R21:R20 -	Base multiplier
;	R18 -	Second multiplier
;	R23 -	Carry
	PUSH R20
	PUSH R21
	PUSH R22
	PUSH R23
		MOV R20, R16
		MOV R21, R17
		MOV R22, R19
		CLR R16
		CLR R17
		CLR R19
MUL31_CP_1:
		MOV R23, R18
		ANDI R23, 0b00000001
		CPI R23, 0b00000001
		BRNE MUL31_NEXT
			ADD R16, R20
			ADC R17, R21
			ADC R19, R22
MUL31_NEXT:
		LSR R18
		CLC
		ROL R20
		ROL R21
		ROL R22
		CPI R18, 0
		BRNE MUL31_CP_1
MUL31_RET:
	POP R23
	POP R22
	POP R21
	POP R20
	RET

Impulse_0:
	SBI 0x12, 0
	CBI 0x12, 0
	RET

Impulse_1:
	SBI 0x12, 1
	CBI 0x12, 1
	RET
