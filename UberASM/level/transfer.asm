main:
    REP #$20
	LDA #$3202	; $43X0 = 02 
	STA $4330	; $43x1 = 32
	LDA #LVL1REDGREEN	; get pointer to red/green color table
	STA $4332	; store it to low and high byte pointer
    PHK		; get bank
	PLY		;
	STY $4334	; store to bank pointer byte
	SEP #$20	; 8 bit A
	LDA #$08	
    TSB $6D9F	;
	RTL	; return
; later code

LVL1REDGREEN:
db $4F,$21,$50
db $04,$22,$51
db $04,$24,$52
db $04,$25,$53
db $04,$27,$54
db $04,$28,$55
db $04,$2A,$56
db $04,$2B,$57
db $04,$2D,$58
db $04,$2E,$59
db $04,$30,$5A
db $00