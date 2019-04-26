init:     ; 
   LDA #$1F    ;\  BG1, BG2, BG3, OBJ on main screen (TM)
   STA $212C   ; | 
   LDA #$00    ; | 0 on main screen should use windowing. (TMW)
   STA $212E   ;/  
   LDA #$00    ;\  0 on sub screen (TS)
   STA $212D   ; | 
   LDA #$00    ; | 0 on sub screen should use windowing. (TSW)
   STA $212F   ;/  
   LDA #00    ; BG1, BG2, BG3, OBJ, Backdrop for color math
   STA $44     ;/  mirror of $2130
   LDA #$37    ; BG1, BG2, BG3, OBJ, Backdrop for color math
   STA $40     ;/  mirror of $2131

	REP #$20
	LDA #$3200
	STA $4330
	LDA #.GreenTable
	STA $4332
	LDY.b #.GreenTable>>16
	STY $4334
	LDA #$3200
	STA $4340
	LDA #.BlueTable
	STA $4342
	LDY.b #.BlueTable>>16
	STY $4344
	SEP #$20
	LDA #$18
	TSB $6D9F
	RTL



.GreenTable:         ; 
   db $4F : db $40   ; 
   db $57 : db $41   ; 
   db $3A : db $42   ; 
   db $00            ; 

.BlueTable:          ; 
   db $08 : db $80   ; 
   db $07 : db $81   ; 
   db $08 : db $82   ; 
   db $07 : db $83   ; 
   db $07 : db $84   ; 
   db $07 : db $85   ; 
   db $07 : db $86   ; 
   db $08 : db $87   ; 
   db $07 : db $88   ; 
   db $07 : db $89   ; 
   db $07 : db $8A   ; 
   db $08 : db $8B   ; 
   db $07 : db $8C   ; 
   db $07 : db $8D   ; 
   db $07 : db $8E   ; 
   db $08 : db $8F   ; 
   db $07 : db $90   ; 
   db $07 : db $91   ; 
   db $07 : db $92   ; 
   db $07 : db $93   ; 
   db $07 : db $94   ; 
   db $08 : db $95   ; 
   db $07 : db $96   ; 
   db $07 : db $97   ; 
   db $07 : db $98   ; 
   db $08 : db $99   ; 
   db $07 : db $9A   ; 
   db $07 : db $9B   ; 
   db $07 : db $9C   ; 
   db $08 : db $9D   ; 
   db $06 : db $9E   ; 
   db $00            ; 
