	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------

	movz x10, 0x1919, lsl 16
	movk x10, 0x34, lsl 00

	mov x2, SCREEN_HEIGH         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:

	stur w10,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto
	
	bl DibujarEstrellas
//Dibujar un Rectangulo

	mov x21, #220
	mov x22, #150
	mov x23, #150
	mov x24, #330

	bl DrawRect

    mov x21, #50
	mov x22, #180
	mov x23, #150
	mov x24, #300

	bl DrawRect

	mov x21, #390
	mov x22, #210	
	mov x23, #150
	mov x24, #270

	bl DrawRect 

	//Dibujar luna
	mov x21, #600 //Centro X de la luna
	mov x22, #40 //Centro Y de la luna
	mov x23, #30 //Radio de la luna
	bl DibujoLuna //Llamo a la subrutina que dibuja la luna 



	// Ejemplo de uso de gpios
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10
	and w11, w10, 0b10

	// w11 será 1 si había un 1 en la posición 2 de w10, si no será 0
	// efectivamente, su valor representará si GPIO 2 está activo
	lsr w11, w11, 1

DrawRect:	
	mov x1, x21	//x21 = X inicial
	mov x2, x22	//Y inicial
	mov x3, x23	//ancho
	mov x4, x24	//alto	
	movz w10, 0x33 // Color Rectangulo	
	movk w10, 0x3333

rect_loop_y:
	mov x5, x1 //Resetear el valor de X para cada fila
	mov x6, x3 //Resetear contador de ancho

rect_loop_x:
	mov x7, SCREEN_WIDTH
	mul x8, x2, x7 // x8 = y*SCREEN_WIDTH
	add x8, x8, x5 // x8 += x 
	lsl x8, x8, #2 // x8 *= 4 (los bytes por pixel)
	add x8, x20, x8 // x8 = direccion base + offset
	stur w10, [x8] // pintar pixel
	
	add x5, x5, #1 // Siguiente x
	subs x6, x6, #1 // decrementar contador de ancho
	b.ne rect_loop_x // Repetir hasta que x6= 0

	add x2, x2, #1 //siguiente y
	subs x4, x4, #1 // Decrementar contador de alto
	b.ne rect_loop_y //Repetir hasta que x4 = 0
	br x30
//---------------------------------------------------------------
// Infinite Loop
	
InfLoop:
	b InfLoop
