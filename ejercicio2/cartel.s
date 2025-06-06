.text
.globl DibujoCartel
.extern DrawRect

DibujoCartel:

    stp x21, x22, [sp, #-16]!   // Guardar x21 y x22
    stp x23, x24, [sp, #-16]!   // Guardar x23 y x24
    stp x25, x30, [sp, #-16]!   // Guardar x25 y LR (x30)

    
	// Dibujo un Cartel
	mov x21, #245	//Posicion en fila: x
	mov x22, #100	//Posicion en columna: y
	mov x23, #100	//Ancho de la figura
	mov x24, #50	//Alto de la figura

	movz w25, 0x4040
	movk w25, 0xFF40, lsl 16 // Color del cartel gris claro
bl DrawRect


	mov x21, #250	//Posicion en fila: x
	mov x22, #140	//Posicion en columna: y
	mov x23, #90	//Ancho de la figura
	mov x24, #10	//Alto de la figura
	//Color de la figura fondo
	movz w25, 0x1919, lsl 16
	movk w25, 0x34, lsl 0

bl DrawRect

// Dibujo el segundo cartel

	mov x21, #405	//Posicion en fila: x
	mov x22, #160	//Posicion en columna: y
	mov x23, #120	//Ancho de la figura
	mov x24, #50	//Alto de la figura
	//Color de la figura 
	movz w25, 0x4040
	movk w25, 0xFF40, lsl 16 // Color del cartel gris claro

bl DrawRect

	mov x21, #410	//Posicion en fila: x
	mov x22, #200	//Posicion en columna: y
	mov x23, #110	//Ancho de la figura
	mov x24, #10	//Alto de la figura
	//Color de la figura fondo
	movz w25, 0x1919, lsl 16
	movk w25, 0x34, lsl 0

bl DrawRect

//Letras del cartel, Primero dibujo la letra 'O'

    movz w25, 0x00 // Rojo Apagado
    movk w25, 0x0022 , lsl 16

	
	mov x21, #255  // eje x
	mov x22, #110	// eje y
	mov x23, #20 	// ancho
	mov x24, #25	//alto
bl DrawRect

// Ahora dibujo la letra 'd'
// Parte inferior
	mov x21, #285
	mov x22, #110
	mov x23, #20
	mov x24, #25
bl DrawRect

// Ahora dibujo la letra 'C'
// Parte superior
	mov x21, #315
	mov x22, #110
	mov x23, #20
	mov x24, #25
bl DrawRect

// Dibujo los numeros del segundo cartel "2025"

	mov x21, #420 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto
bl DrawRect

	mov x21, #445 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto
bl DrawRect

	mov x21, #470 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto
bl DrawRect

	mov x21, #495 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto
bl DrawRect

// Dibujo los detalles de las letras y numeros para darle su forma

	movz w25, 0x4040
	movk w25, 0xFF40, lsl 16 // Color girs claro

// Centro de 'o'
	mov x21, #260
	mov x22, #115
	mov x23, #10
	mov x24, #15
bl DrawRect

// Centro de 'd'
	mov x21, #290
	mov x22, #125
	mov x23, #7
	mov x24, #7
bl DrawRect

	mov x21, #285
	mov x22, #105
	mov x23, #12
	mov x24, #17
bl DrawRect

// centro de la letra C
	mov x21, #320
	mov x22, #115
	mov x23, #20
	mov x24, #15
bl DrawRect

// Aca relleno los detalles de los numeros 
// Centro del '0'
	mov x21, #450
	mov x22, #175
	mov x23, #10
	mov x24, #15
bl DrawRect

// Detalles del '2'
	mov x21, #420
	mov x22, #175
	mov x23, #15
	mov x24, #7
bl DrawRect

	mov x21, #425
	mov x22, #185
	mov x23, #15
	mov x24, #7
bl DrawRect

// Detalles del segundo '2'
	mov x21, #470
	mov x22, #175
	mov x23, #15
	mov x24, #7
bl DrawRect

	mov x21, #475
	mov x22, #185
	mov x23, #15
	mov x24, #7
bl DrawRect

// Detalles del '5'
	mov x21, #500
	mov x22, #175
	mov x23, #15
	mov x24, #7
bl DrawRect

	mov x21, #495
	mov x22, #185
	mov x23, #15
	mov x24, #7
bl DrawRect


    ldp x25, x30, [sp], #16     // Restaurar x25 y LR
    ldp x23, x24, [sp], #16     // Restaurar x23 y x24
    ldp x21, x22, [sp], #16     // Restaurar x21 y x22


    br x30  

