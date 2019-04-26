init:
	REP   #$20 ; 16-bit A

	; Set transfer modes.
	STZ   $4350 ; Channel 5

	; Point to HDMA tables.
	LDA   #Gradient1_BrightnessTable
	STA   $4352

	SEP   #$20 ; 8-bit A

	; Store program bank to $43x4.
	PHK
	PLA
	STA   $4354 ; Channel 5


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
	LDA.b #%00111000
	TSB   $6D9F

	RTL ; <-- Can also be RTL.

; --- HDMA Tables below this line ---
Gradient1_RedGreenTable:
db $49,$21,$43
db $0A,$21,$44
db $21,$20,$44
db $0E,$20,$45
db $0C,$20,$46
db $01,$20,$47
db $09,$21,$47
db $0A,$21,$48
db $0B,$21,$49
db $04,$21,$4A
db $06,$22,$4A
db $06,$23,$4A
db $07,$24,$4A
db $06,$25,$4A
db $06,$26,$4A
db $10,$27,$4A
db $00

Gradient1_BlueTable:
db $3A,$86
db $26,$87
db $12,$88
db $07,$89
db $06,$8A
db $07,$8B
db $06,$8C
db $07,$8D
db $06,$8E
db $06,$8F
db $07,$90
db $06,$91
db $09,$92
db $0A,$93
db $0B,$94
db $16,$95
db $00

Gradient1_BrightnessTable:
db $80,$0A
db $60,$0A
db $00
