init:
   REP #$20                             ; | 
   LDA #$0F42                           ; | Use indeirect and mode 2 on register 210F
   STA $4330                            ; | 4330 = Mode, 4331 = Register
   LDA #ParallaxTable_212255534         ; | Address of HDMA table, get high and low byte
   STA $4332                            ; | 4332 = Low-Byte of table, 4333 = High-Byte of table
   SEP #$20                             ; | 
   LDA.b #ParallaxTable_212255534>>16   ; | Address of HDMA table, get bank byte
   STA $4334                            ; | 4334 = Bank-Byte of table
   LDA #$7F                             ; | Address of indirect table in RAM bank byte
   STA $4337                            ; | 4334 = Bank-Byte of indirect table
   LDA #$08                             ; | 
   TSB $6D9F                            ; | Enable HDMA channel 3
   RTL                                  ;/  Return	

main:
   REP #$20                             ;/  16 bit action starts here. (To load the x position of the BG)

   LDA $1E                              ;\  Load BG x Position
   LSR #2                               ; | Multiplied by 0.25
   PHA                                  ; | Preserve A (current multiplication result)
   CLC : ADC #$01FF                     ; | Add rate.
   STA $7F9E00                          ; | Store to FreeRAM for indirect HDMA
   PLA                                  ;/  Restore A (current multiplication result)
   LDA $1E                              ;\  Load BG x Position
   LSR #1                               ; | Multiplied by 0.5
   PHA                                  ; | Preserve A (current multiplication result)
   CLC : ADC #$01FE                     ; | Add rate.
   STA $7F9E02                          ; | Store to FreeRAM for indirect HDMA
   PLA                                  ;/  Restore A (current multiplication result)
   LDA $1E                              ;\  Load BG x Position
   ASL #0                               ; | Multiplied by 1
   STA $7F9E04                          ;/  Store to FreeRAM for indirect HDMA
   LDA $1E                              ;\  Load BG x Position
   STA $7F9E06                          ;/  Store to FreeRAM for indirect HDMA
   SEP #$20                             ; Back to 8bit
   RTL                                  ; Return

ParallaxTable_212255534:                ;\  
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E00                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E02                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $01 : dw $9E04                    ; | 
   db $00                               ;/  

