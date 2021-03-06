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
db $02,$3D,$5B
db $1B,$3D,$5A
db $0F,$3D,$59
db $0D,$3D,$58
db $0B,$3D,$57
db $09,$3D,$56
db $09,$3D,$55
db $08,$3D,$54
db $08,$3D,$53
db $08,$3D,$52
db $07,$3D,$51
db $07,$3D,$50
db $07,$3D,$4F
db $07,$3D,$4E
db $07,$3D,$4D
db $07,$3D,$4C
db $06,$3D,$4B
db $07,$3D,$4A
db $07,$3D,$49
db $08,$3D,$48
db $07,$3D,$47
db $09,$3D,$46
db $09,$3D,$45
db $0A,$3D,$44
db $09,$3D,$43
db $00

Gradient1_BlueTable:
db $22,$89
db $1A,$88
db $15,$87
db $14,$86
db $12,$85
db $13,$84
db $13,$83
db $15,$82
db $1B,$81
db $13,$80
db $00

