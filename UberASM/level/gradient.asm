	
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

        ; HDMA stuff
REP #$20	; 16 bit A
LDA #$0000	; $43X0 = 00  0000 es de brillo y 3200 es de color
STA $4330	; $43x1 = 32
LDA #LVL1BRIGHT	; get pointer to red color table
STA $4332	; store it to low and high byte pointer
PHK		; get bank
PLY		;
STY $4334	; store to bank pointer byte
LDA #$3200	; $43X0 = 00 
STA $4340	; $43x1 = 32
LDA #LVL1GREEN	; get pointer to red color table
STA $4342	; store it to low and high byte pointer
STY $4344	; store to bank pointer byte
LDA #$3200	; $43X0 = 00 
STA $4350	; $43x1 = 32
LDA #LVL1BLUE	; get pointer to red color table
STA $4352	; store it to low and high byte pointer
STY $4354	; store to bank pointer byte
SEP #$20	; 8 bit A
LDA #$38	; Enable HDMA on channels 3 4 and 5
TSB $6D9F	;
RTL		; return


LVL1RED:
db $4F,$21
db $04,$22
db $04,$24
db $04,$25
db $04,$27
db $04,$28
db $04,$2A
db $04,$2B
db $04,$2D
db $04,$2E
db $04,$30
db $00

LVL1GREEN:
db $4F,$50
db $04,$51
db $04,$52
db $04,$53
db $04,$54
db $04,$55
db $04,$56
db $04,$57
db $04,$58
db $04,$59
db $04,$5A
db $00

LVL1BLUE:
db $4F,$99
db $08,$9A
db $08,$9B
db $08,$9D
db $08,$9E
db $08,$9F
db $00

; Brillo
LVL1BRIGHT:
db $03,$00
db $03,$01
db $03,$02
db $03,$03
db $03,$04
db $03,$05
db $03,$06
db $03,$07
db $03,$08
db $03,$09
db $03,$0A
db $03,$0B
db $03,$0C
db $03,$0D
db $03,$0E
db $80,$0F
db $03,$0E
db $03,$0D
db $03,$0C
db $03,$0B
db $03,$0A
db $03,$09
db $03,$08
db $03,$07
db $03,$06
db $03,$05
db $03,$04
db $03,$03
db $03,$02
db $03,$01
db $03,$00
db $00
