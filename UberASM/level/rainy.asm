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
db $21,$22,$42
db $12,$22,$41
db $4D,$21,$41
db $02,$22,$41
db $0B,$22,$42
db $02,$23,$42
db $0C,$23,$43
db $02,$24,$43
db $0B,$24,$44
db $03,$25,$44
db $0A,$25,$45
db $03,$26,$45
db $0B,$26,$46
db $03,$27,$46
db $0A,$27,$47
db $03,$28,$47
db $0B,$28,$48
db $02,$29,$48
db $00

Gradient1_BlueTable:
db $04,$87
db $19,$86
db $19,$85
db $19,$84
db $19,$83
db $15,$82
db $0D,$83
db $0D,$84
db $0D,$85
db $0E,$86
db $0D,$87
db $0D,$88
db $0D,$89
db $07,$8A
db $00

Gradient1_BrightnessTable:
db $80,$0E
db $60,$0E
db $00
