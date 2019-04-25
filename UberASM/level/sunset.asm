init:
  REP #$20
	LDA #$3200
	STA $4330
	LDA #.RedTable
	STA $4332
	LDY.b #.RedTable>>16
	STY $4334
	LDA #$3200
	STA $4340
	LDA #.GreenTable
	STA $4342
	LDY.b #.GreenTable>>16
	STY $4344
	LDA #$3200
	STA $4350
	LDA #.BlueTable
	STA $4352
	LDY.b #.BlueTable>>16
	STY $4354
	SEP #$20
	LDA #$38
	TSB $6D9F
	RTL

; --- HDMA Tables below this line ---
.RedTable:           ; 
   db $80 : db $3F   ; 
   db $60 : db $3F   ; 
   db $00            ; 

.GreenTable:         ; 
   db $02 : db $5F   ; 
   db $07 : db $5E   ; 
   db $08 : db $5D   ; 
   db $07 : db $5C   ; 
   db $07 : db $5B   ; 
   db $07 : db $5A   ; 
   db $08 : db $59   ; 
   db $07 : db $58   ; 
   db $07 : db $57   ; 
   db $07 : db $56   ; 
   db $08 : db $55   ; 
   db $07 : db $54   ; 
   db $07 : db $53   ; 
   db $07 : db $52   ; 
   db $07 : db $51   ; 
   db $07 : db $50   ; 
   db $08 : db $4F   ; 
   db $07 : db $4E   ; 
   db $07 : db $4D   ; 
   db $07 : db $4C   ; 
   db $08 : db $4B   ; 
   db $07 : db $4A   ; 
   db $07 : db $49   ; 
   db $07 : db $48   ; 
   db $08 : db $47   ; 
   db $07 : db $46   ; 
   db $07 : db $45   ; 
   db $07 : db $44   ; 
   db $08 : db $43   ; 
   db $07 : db $42   ; 
   db $07 : db $41   ; 
   db $05 : db $40   ; 
   db $00            ; 

.BlueTable:          ; 
   db $25 : db $80   ; 
   db $20 : db $81   ; 
   db $26 : db $82   ; 
   db $21 : db $83   ; 
   db $25 : db $84   ; 
   db $24 : db $85   ; 
   db $0B : db $86   ; 
   db $00            ; 
