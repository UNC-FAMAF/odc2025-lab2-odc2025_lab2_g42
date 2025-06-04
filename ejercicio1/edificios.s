.text
.globl detEdificio
.extern DrawRect

detEdificio:

    stp x21, x22, [sp, #-16]!   // Guardar x21 y x22
    stp x23, x24, [sp, #-16]!   // Guardar x23 y x24
    stp x25, x30, [sp, #-16]!   // Guardar x25 y LR (x30)

edificiosdefondo:	// Dibujo edificios de fondo
	
	mov x28, #5 // Imprimo la cantidad de edificios

	// Defino la ubicacion de las ventanas y su tamaño
	mov x21, #10
	mov x22, #180
	mov x23, #160
	mov x24, #350
	movz w25, 0x2030
	movk w25, 0xFF20, lsl 16	// Coloco el color

oLoop22:
	bl DrawRect			// Imprimo los edificios
	add x21, x21, #200	// Desplazo hacia la derecha
	sub x28, x28, #1	// Decremento la cantidad de edificios

	cmp x28, #3	
	b.eq oLoop22
	sub x22, x22, #30
	add x24, x24, #320

	cmp x28, #2	
	b.eq oLoop22
	add x22, x22, #90

	cbnz x28, oLoop22 // Si el contador no llega a cero imrimo de nuevo


//Dibujar un Rectangulo

	mov x21, #220
	mov x22, #150
	mov x23, #150
	mov x24, #330
	movz w25, 0x4040 // Coloco el color
	movk w25, 0xFF40, lsl 16

	bl DrawRect

    mov x21, #50
	mov x22, #180
	mov x23, #150
	mov x24, #300
	movz w25, 0x4040 // Coloco el color
	movk w25, 0xFF40, lsl 16

	bl DrawRect
    
    // Tercer edificio

	mov x21, #390
	mov x22, #210	
	mov x23, #150
	mov x24, #270
	movz w25, 0x4040 // Coloco el color
	movk w25, 0xFF40, lsl 16

	bl DrawRect 


Ventanas1:	// Dibujo las ventanas para cada edificio

	mov x28, #10 // Imprimo la cantidad de ventanas en filas

	// Defino la ubicacion de las ventanas y su tamaño
	mov x22, #190
	mov x21, #60
	mov x23, #130
	mov x24, #15
	movz w25, 0xFF00
	movk w25, 0xFFFF, lsl 16

oLoop1:
	bl DrawRect			// Imprimo las ventanas
	add x22, x22, #30	// Desplazo hacia abajo
	sub x28, x28, #1	// Decremento la cantidad de ventanas
	cbnz x28, oLoop1 // Si el contador no llega a cero imrimo de nuevo

Ventanas2:

	mov x28, #11 // Imprimo la cantidad de ventanas en filas

	// Defino la ubicacion de las ventanas y su tamaño
	mov x21, #230
	mov x22, #160
	mov x23, #130
	mov x24, #20
	movz w25, 0xEE00
	movk w25, 0xFFFF, lsl 16

oLoop2:
	bl DrawRect			// Imprimo las ventanas
	add x22, x22, #30	// Desplazo hacia abajo
	sub x28, x28, #1	// Decremento la cantidad de ventanas
	cbnz x28, oLoop2 // Si el contador no llega a cero imrimo de nuevo

Ventanas3:

	mov x28, #9 // Imprimo la cantidad de ventanas en filas

	// Defino la ubicacion de las ventanas y su tamaño
	mov x21, #410
	mov x22, #220	
	mov x23, #110
	mov x24, #10
	movz w25, 0xDD00
	movk w25, 0xFFFF, lsl 16

oLoop3:
	bl DrawRect			// Imprimo las ventanas
	add x22, x22, #30	// Desplazo hacia abajo
	sub x28, x28, #1	// Decremento la cantidad de ventanas
	cbnz x28, oLoop3 // Si el contador no llega a cero imrimo de nuevo

MarcosDeLasVentanas:	// Dibujo la separacion entre las ventanas
	
	mov x28, #3 // Imprimo la cantidad de ventanas en filas

	// Defino la ubicacion de las ventanas y su tamaño
	mov x21, #115
	mov x22, #190
	mov x23, #20
	mov x24, #300
	movz w25, 0x4040
	movk w25, 0xFF40, lsl 16	// Coloco el color

oLoop11:
	bl DrawRect			// Imprimo las ventanas
	add x21, x21, #170	// Desplazo hacia la derecha
	sub x28, x28, #1	// Decremento la cantidad de marcos

	cmp x28, #3			//Si esta en el segundo pilar cambio el diseño
	b.eq oLoop11
	sub x22, x22, #30
	add x24, x24, #320

	cmp x28, #2		//Si esta en el ultimo pilar cambio el diseño
	b.eq oLoop11
	add x22, x22, #90

	cbnz x28, oLoop11 // Si el contador no llega a cero imrimo de nuevo

    ldp x25, x30, [sp], #16     // Restaurar x25 y LR
    ldp x23, x24, [sp], #16     // Restaurar x23 y x24
    ldp x21, x22, [sp], #16     // Restaurar x21 y x22
    
    
    br x30
