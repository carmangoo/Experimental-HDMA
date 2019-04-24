init:
	
	LDA #$05
	STA $7EA100

	RTL

main:	
	REP #$20 ; Ponemos en 16 bits
	LDA #$0F02 ; Ponemos el hdma a scroll horizontal 
				; y modo de doble escritura
	STA $4330		; $210F, one register write twice
	LDA #$8600 ; Tabla de datos
	STA $00
	STA $4332		; Source: $7F8600
	SEP #$20 ; Ponemos en 8 bits
	LDA #$7F; Guardo ese valor en memoria ram?
	STA $02
	STA $4334 ; Guarda en el byte de puntero?
	LDA #$08
	TSB $6D9F		; Channel 3
	
	LDX #$00
	LDY #$00

.loop	LDA scanlines,x
	STA [$00],y		; Set number of scanlines
	INY ; Incrementa el registro/indice de Y
	LDA $A100 ; Obtiene la posicion del layer 2
	STA $211B ;Guardamos la posicion en $211B;
	LDA $A100
	STA $211B ; Guardamos la posicion en $211B
	LDA multiples,x ;Obtenemos valor de tabla
	STA $211C		; Mode 7 multiply
	REP #$20 ; Ponemos en 16bits
	LDA $2134
	LSR #4 ; Dividmos entre 8
	STA [$00],y		; Scroll value = multiple * L2 X / 16
	SEP #$20
	INY #2
	INX
	CPX.b #multiples-scanlines+1
	BEQ .loop

	LDA #$00
	STA [$00],y		; End HDMA table
	INC $A100
	RTL
	
scanlines:
	db $10,$10,$10,$10,$10	; The number of scanlines for each 
							; scroll layer
multiples:
	db $10,$18,$20,$28,$30	; Scrolling multiplier
							; $10 = same as L2, $7F = max