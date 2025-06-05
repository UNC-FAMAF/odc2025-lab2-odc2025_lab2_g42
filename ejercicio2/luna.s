.equ SCREEN_WIDTH, 640

.text	
.globl DibujoLuna
.globl DibujoCirculo


DibujoLuna:
 	 
	sub sp, sp, #48
    stp x20, x21, [sp]
    stp x22, x23, [sp, #16]
    stp x24, x30, [sp, #32]  // Guarda LR


//x21 va a ser el centro x
//x22 va a ser el centro y
//x23 va a ser el radio

	movz w10, 0xFFF5, lsl 16 // Color amarillo claro	
	movk w10, 0xF5DC, lsl 00
	bl DibujoCirculo

	add x21, x21, #5 // Desplazo la sombra
	movz w10, 0x0000, lsl 16
	movk w10, 0x0000, lsl 00
	bl DibujoCirculo

	ldp x24, x30, [sp, #32]  // Restaura LR
    ldp x22, x23, [sp, #16]
    ldp x20, x21, [sp]
    add sp, sp, #48
    ret



DibujoCirculo:

	sub sp, sp, #64
    stp x1, x2, [sp]         // Guarda todos los registros usados
    stp x3, x4, [sp, #16]
    stp x5, x6, [sp, #32]
    stp x7, x8, [sp, #48]

// X21 Es el centro x
// x22 Es el centro y
// x23 es el radio
//x20 es el framebuffer base
//w10 es el color

	mov x1, x21 //x1 pasa a ser el centro x
	mov x2, x22 //x2 pasa a ser el centro y
	mov x3, x23 //x3 pasa a el radio

// Recorrer coordenadas desde -radio a +radio en Y
	mov x4, xzr
	subs x4, xzr, x3  // x4 = -radio (contador en y) 

circulo_exterior_loop:
	mov x5, xzr
	subs x5, xzr, x3  // x5= -radio (contador x por filas)


circulo_interno_loop:
	add x6, x1, x5 //x6 = pos_x = centro_x + offset_x
	add x7, x2, x4 //x7 = pos_y = centro_y + offset_y

	mul x8, x5, x5 // x8 = (offset_x)^2
	mul x9, x4, x4 // x9 = (offset_y)^2
	add x8, x8, x9 //x8 = (offset_x)^2 + (offset_y)^2
	mul x9, x3, x3 //x9 = radio^2
	cmp x8, x9 //Comparo si x8 > x9 esta fuera del circulo
	b.gt skip_pixel //Si el punto esta afuera no lo pinto 

//Calculo la direccion del pixel en la memoria:
	mov x12, SCREEN_WIDTH
	mul x13, x7, x12 // x13 = pos_y * SCREEN_WIDTH
	add x13, x13, x6 // x13 = offset = fila * ancho + columna
	lsl x13, x13, #2 // x13 = 4 * x13 (bytes por pixel)
	add x13, x20, x13 //x13 = direccion absoluta del pixel
	stur w10, [x13] //Escribo el color en esta posicion 

skip_pixel:
add x5, x5, #1 //siguiente pixel en la fila
cmp x5, x3
ble circulo_interno_loop //repetir hasta llegar a +radio

add x4, x4, #1 //Siguiente fila en la columna 
cmp x4, x3
ble circulo_exterior_loop // repetir hasta llegar a +radio en y 

	ldp x7, x8, [sp, #48]    // Restaura registros
    ldp x5, x6, [sp, #32]
    ldp x3, x4, [sp, #16]
    ldp x1, x2, [sp]
    add sp, sp, #64
    ret
	

