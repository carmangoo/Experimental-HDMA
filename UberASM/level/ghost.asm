init:
	REP #$20                  ;\  16 bit mode
   	LDA #$0000                ; | 
   	STA $4330                 ; | 
   	LDA #.BrightTable         ; | load high and low byte of table address
   	STA $4332                 ; | 
   	SEP #$20                  ; | back to 8 bit mode
   	LDA.b #.BrightTable>>16   ; | load bank byte of table address
   	STA $4334                 ; | 
   	LDA #$08                  ; | 
   	TSB $6D9F                 ; | enable HDMA channel 3
   	RTL                       ;/  

.BrightTable:                 ; 
   db $60 : db $0B            ; 
   db $80 : db $0B            ; 
   db $00                     ; 

