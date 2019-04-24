main:	
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
	TSB $6D9F	;
	RTL		; return

LVL1BRIGHT:
db $03,$00
db $03,$00
db $03,$00
db $03,$01
db $03,$01
db $03,$01
db $03,$02
db $03,$02
db $03,$02
db $03,$03
db $03,$03
db $03,$03
db $03,$03
db $03,$03
db $03,$04
db $80,$04
db $03,$04
db $03,$03
db $03,$03
db $03,$03
db $03,$03
db $03,$03
db $03,$02
db $03,$02
db $03,$02
db $03,$02
db $03,$01
db $03,$01
db $03,$01
db $03,$00
db $03,$00
db $00