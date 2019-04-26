init:
   REP #$20
	LDA #$3200
	STA $4330
	LDA #.RedTable
	STA $4332
	LDY.b #.RedTable>>16
	STY $4334
   SEP #$20  

	LDA #$08
	TSB $0D9F

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
	RTL

.RedTable:           ; 
   db $29 : db $20   ; 
   db $29 : db $21   ; 
   db $27 : db $22   ; 
   db $2A : db $23   ; 
   db $2A : db $24   ; 
   db $13 : db $25   ; 
   db $00            ; 

main:
   REP #$20                             ;/  16 bit action starts here. (To load the x position of the BG)
   LDA $1E                              ;\  Load BG x Position
   LSR #3                               ; | Multiplied by 0.125
   STA $7F9E00                          ;/  Store to FreeRAM for indirect HDMA
   LDA $1E                              ;\  Load BG x Position
   LSR #2                               ; | Multiplied by 0.25
   STA $7F9E02                          ;/  Store to FreeRAM for indirect HDMA
   LDA $1E                              ;\  Load BG x Position
   LSR #1                               ; | Multiplied by 0.5
   STA $7F9E04                          ;/  Store to FreeRAM for indirect HDMA
   LDA $1E                              ;\  Load BG x Position
   STA $7F9E06                          ;/  Store to FreeRAM for indirect HDMA
   SEP #$20                             ; Back to 8bit
   RTL

