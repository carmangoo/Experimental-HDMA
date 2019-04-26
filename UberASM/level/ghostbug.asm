init: 
   LDA #$17    ;\  BG1, BG2, BG3, OBJ on main screen (TM)
   STA $212C   ; | 
   LDA #$00   ; | 0 on main screen should use windowing. (TMW)
   STA $212E   ;/  
   LDA #$00    ;\  0 on sub screen (TS)
   STA $212D   ; | 
   LDA #$00    ; | 0 on sub screen should use windowing. (TSW)
   STA $212F   ;/  
   LDA #$77    ; BG1, BG2, BG3, OBJ, Backdrop, Half for color math
   STA $40     ;/  mirror of $2131

  REP #$20
	LDA #$3200
	STA $4330
	LDA #.RedTable
	STA $4332
	LDY.b #.RedTable>>16
	STY $4334
   SEP #$20  


   	; REP #$20                  ;\  16 bit mode
   	; LDA #$0000                ; | 
   	; STA $4330                 ; | 
   	; LDA #.BrightTable         ; | load high and low byte of table address
   	; STA $4332                 ; | 
   	; SEP #$20                  ; | back to 8 bit mode
   	; LDA.b #.BrightTable>>16   ; | load bank byte of table address
   	; STA $4334                 ; | 
   	LDA #$08           ; | 
   	TSB $6D9F                 ; | enable HDMA channel 3
   	RTL                       ;/  

.BrightTable:                 ; 
    db $08 : db $09            ; 
   db $12 : db $0A            ; 
   db $11 : db $0B            ; 
   db $12 : db $0C            ; 
   db $13 : db $0D            ; 
   db $12 : db $0E            ; 
   db $1D : db $0F            ; 
   db $12 : db $0E            ; 
   db $13 : db $0D            ; 
   db $12 : db $0C            ; 
   db $11 : db $0B            ; 
   db $13 : db $0A            ; 
   db $06 : db $09            ; 
   db $00                     ; 

.RedGreenBlueTable:  ; 
   db $80 : db $E0   ; 
   db $60 : db $E0   ; 
   db $00            ; 

.RedTable:           ; 
   db $29 : db $20   ; 
   db $29 : db $21   ; 
   db $27 : db $22   ; 
   db $2A : db $23   ; 
   db $2A : db $24   ; 
   db $13 : db $25   ; 
   db $00            ; 