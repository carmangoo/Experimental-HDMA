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
db $09,$37,$58
db $07,$37,$57
db $06,$36,$57
db $05,$36,$56
db $05,$35,$56
db $04,$35,$55
db $05,$34,$55
db $03,$34,$54
db $05,$33,$54
db $02,$33,$53
db $05,$32,$53
db $02,$32,$52
db $06,$31,$52
db $01,$31,$51
db $06,$30,$51
db $01,$30,$50
db $06,$2F,$50
db $06,$2E,$4F
db $01,$2E,$4E
db $06,$2D,$4E
db $07,$2C,$4D
db $07,$2B,$4C
db $01,$2A,$4C
db $06,$2A,$4B
db $01,$29,$4B
db $06,$29,$4A
db $02,$28,$4A
db $06,$28,$49
db $02,$27,$49
db $06,$27,$48
db $03,$26,$48
db $06,$26,$47
db $03,$25,$47
db $07,$25,$46
db $04,$24,$46
db $07,$24,$45
db $05,$23,$45
db $08,$23,$44
db $07,$22,$44
db $0A,$22,$43
db $0A,$21,$43
db $13,$21,$42
db $00

Gradient1_BlueTable:
db $09,$9F
db $16,$9E
db $0F,$9D
db $0D,$9C
db $0B,$9B
db $0B,$9A
db $0A,$99
db $09,$98
db $0A,$97
db $09,$96
db $09,$95
db $0A,$94
db $0A,$93
db $09,$92
db $0B,$91
db $0B,$90
db $0D,$8F
db $0E,$8E
db $12,$8D
db $00
