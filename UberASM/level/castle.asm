init:
	REP   #$20 ; 16-bit A

	; Set transfer modes.
	LDA   #$3202
	STA   $4340 ; Channel 4
	LDA   #$3200
	STA   $4350 ; Channel 4

	; Point to HDMA tables.
	LDA   #Gradient1_RedGreenTable
	STA   $4342
	LDA   #Gradient1_BlueTable
	STA   $4352

	SEP   #$20 ; 8-bit A

	; Store program bank to $43x4.
	PHK
	PLA
	STA   $4344 ; Channel 4
	STA   $4354 ; Channel 4


   REP #$20             ; | 
   LDA #$0F02           ; | Use Mode 02 on register 210D
   STA $4330            ; | 4330 = Mode, 4331 = Register
   LDA #$9E00           ; | Address of HDMA table
   STA $4332            ; | 4332 = Low-Byte of table, 4333 = High-Byte of table
   SEP #$20             ; | 
   LDA.b #$7F           ; | Address of HDMA table, get bank byte
   STA $4334            ; | 4334 = Bank-Byte of table
   LDA #$38             ; | 
   TSB $6D9F            ; | Enable HDMA channel 3
   RTL                  ;/  End HDMA setup	  	

   ; --- HDMA Tables below this line ---
Gradient1_RedGreenTable:
db $33,$20,$40
db $3C,$21,$41
db $03,$21,$42
db $13,$22,$42
db $0A,$22,$43
db $0C,$23,$43
db $06,$23,$44
db $01,$24,$44
db $02,$25,$45
db $02,$26,$45
db $01,$27,$45
db $02,$28,$45
db $02,$29,$45
db $02,$2A,$45
db $02,$2B,$46
db $02,$2C,$46
db $02,$2D,$46
db $01,$2E,$46
db $02,$2F,$46
db $02,$30,$47
db $02,$31,$47
db $02,$32,$47
db $04,$33,$47
db $01,$34,$47
db $05,$34,$46
db $04,$35,$45
db $01,$36,$45
db $02,$36,$44
db $02,$37,$44
db $03,$38,$43
db $8B,$39,$43,$37,$42,$36,$42,$34,$42,$33,$42,$32,$42,$30,$42,$2F,$42,$2D,$42,$2C,$42,$2B,$42
db $03,$29,$42
db $00

Gradient1_BlueTable:
db $33,$80
db $3F,$81
db $1D,$82
db $12,$83
db $16,$84
db $07,$85
db $06,$84
db $05,$83
db $04,$82
db $04,$81
db $0F,$80
db $00

main:
 LDY #$00             ; | Y will be the loop counter.
   LDX #$00             ; | X the index for writing the table to the RAM
   LDA $13              ; | Speed of waves
   LSR #1               ; | Slowing down A
   STA $00              ;/  Save for later use.

   PHB : PHK : PLB      ;\  Preservev bank
.Loop:                  ; | Jump back if not finished writing table
   LDA #$03             ; | Set scanline height
   STA $7F9E00,x        ; | for each wave
   TYA                  ; | Transfer Y to A, to calculate next index
   ADC $00              ; | Add frame counter
   AND #$0F             ; | 
   PHY                  ; | Preserve loop counter
   TAY                  ;/  Get the index in Y

   LDA.w .WaveTable,y   ;\  Load in wave value
   LSR                  ; | Half only
   CLC                  ; | Clear Carry for addition
   ADC $1E            ; | Add value to layer X position (low byte)
   STA $7F9E01,x        ; | store to HDMA table (low byte)
   LDA $1F           ; | Get high byte of X position
   ADC #$00             ; | Add value to layer X position (low byte)
   STA $7F9E02,x        ;/  store to HDMA table (high byte)

   PLY                  ;\  Pull original loop counter
   CPY #$4A             ; | Compare if we have written enough HDMA entries.
   BPL .End             ; | If bigger, end HDMA
   INX                  ; | Increase X, so that in the next loop, it writes the new table data...
   INX                  ; | ... at the end of the old one instead of overwritting it.
   INX                  ; | 
   INY                  ; | Increase loop counter
   BRA .Loop            ;/  Repeat loop

.End:                   ;\  Jump here when at the end of HDMA
   PLB                  ; | Pull back data bank.
   LDA #$00             ; | End HDMA by writting 00...
   STA $7F9E03,x        ; | ...at the end of the table.
   RTL                  ;/  

.WaveTable:             ;\  
   db $00               ; | 
   db $01               ; | 
   db $02               ; | 
   db $03               ; | 
   db $04               ; | 
   db $05               ; | 
   db $06               ; | 
   db $07               ; | 
   db $07               ; | 
   db $06               ; | 
   db $05               ; | 
   db $04               ; | 
   db $03               ; | 
   db $02               ; | 
   db $01               ; | 
   db $00               ;/  

