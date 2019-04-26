init:
   REP   #$20 ; 16-bit A

	; Set transfer modes.
	LDA   #$3202
	STA   $4330 ; Channel 3
	LDA   #$3200
	STA   $4340 ; Channel 4

	; Point to HDMA tables.
	LDA   #Gradient1_RedGreenTable
	STA   $4332
	LDA   #Gradient1_BlueTable
	STA   $4342

	SEP   #$20 ; 8-bit A

	; Store program bank to $43x4.
	PHK
	PLA
	STA   $4334 ; Channel 3
	STA   $4344 ; Channel 4

	; Enable channels 3 and 4.
	LDA.b #%00011000
	TSB   $6D9F

	RTL ; <-- Can also be RTL.

; --- HDMA Tables below this line ---
Gradient1_RedGreenTable:
db $22,$30,$50
db $03,$31,$50
db $13,$31,$51
db $04,$32,$51
db $0E,$32,$52
db $05,$33,$52
db $0C,$33,$53
db $05,$34,$53
db $0B,$34,$54
db $06,$35,$54
db $09,$35,$55
db $07,$36,$55
db $09,$36,$56
db $08,$37,$56
db $09,$37,$57
db $09,$38,$57
db $0A,$38,$58
db $0A,$39,$58
db $0C,$39,$59
db $0C,$3A,$59
db $10,$3A,$5A
db $00

Gradient1_BlueTable:
db $80,$9F
db $60,$9F
db $00
