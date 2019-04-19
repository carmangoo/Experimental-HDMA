	REP #$20	; 16 bit A
	LDA #$0000	; $43X0 = 00 
	STA $4330	; $43x1 = 00
	LDA #LVL1BRIGHT	; get pointer to brightness table
	STA $4332	; store it to low and high byte pointer
	PHK		; get bank
	PLY		;
	STY $4334	; store to bank pointer byte
	SEP #$20	; 8 bit A
	LDA #$08	; Enable HDMA on channel 3
	TSB $0D9F	;
	RTS		; return

LVL1BRIGHT:
db $0C,$0F
db $0C,$0E
db $0C,$0D
db $0C,$0C
db $0C,$0B
db $0C,$0A
db $0C,$09
db $0C,$08
db $0C,$07
db $0C,$06
db $0C,$05
db $0C,$04
db $0C,$03
db $0C,$02
db $0C,$01
db $0C,$00
db $00