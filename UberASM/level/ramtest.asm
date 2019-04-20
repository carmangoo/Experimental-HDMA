init:
    !FREERAM = $7FA100

    LDX #$0B
    LVL1_HDMAINIT:
    LDA LVL1BLUE,x
    STA !FREERAM,x
    DEX
    BPL LVL1_HDMAINIT
    RTL

    LVL1BLUE:
    db $4F,$99
    db $08,$9A
    db $08,$9B
    db $08,$9D
    db $08,$9E
    db $08,$9F
    db $00

main: 
    REP #$20	; 16 bit A
    LDA #$3200	; $43X0 = 00 
    STA $4330	; $43x1 = 00

    LDA #$A100	; get pointer to blue color table
    STA $4332	; store it to low and high byte pointer
    LDY #$7F
    STY $4334	; store to bank pointer byte
    SEP #$20	; 8 bit A
    LDA #$08	; Enable HDMA on channel 3
    TSB $6D9F	;

    SEP #$20
	LDA $1A
	STA !FREERAM+$1
	LSR
	STA !FREERAM+$3
	LSR
	STA !FREERAM+$5
    RTL

