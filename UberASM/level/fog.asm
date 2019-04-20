main:	
; Color Math
LDA #$3F	; enable color math on everything
	STA $40
	LDA #$00	; use background color instead of subscreen layers
	STA $44
	LDA #$1F	; Put all layers on the main screen
	STA $212C	
	LDA #$00	; No layers on subscreen
	STA $212D

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
	RTL		; retur

LVL1BRIGHT:
db $40,$08
db $40,$09
db $00