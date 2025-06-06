.text
.global animacion

animacion:

    // Estado inicial de la luna (x19)
    mov x19, #600       // luna_x

contador:
    mov x11, #0 // Inicio el contador en 0

loop33:


// ================================ Dibujo las estrellas =============================================
// Las anteriores estrellas no las implemento porque generan conflicto con las animaciones
estrellasNuevas:
    // La estrella se conforma en dos lineas y un centro
    mov x21, #290
    mov x22, #35
    mov x23, #15
    mov x24, #3
    movz x25, 0xB6
	movk x25, 0x7683
    bl DrawRect

    cmp x11, #11
    b.lt estado2    // Si el contador es menor que 11 pasa al estado2

    b final1        // Si no es asi pasa a final1

estado2:
    movz w25, 0xFF
    movk w25, 0xFFFF
    bl DrawRect
final1:

//Segunda linea
    mov x21, #296
    mov x22, #29
    mov x23, #3
    mov x24, #15
    movz x25, 0xB6
	movk x25, 0x7683
    bl DrawRect

    cmp x11, #11
    b.lt estado1

    b final

estado1:
    movz w25, 0xFF
    movk w25, 0xFFFF
    bl DrawRect
final:
    // cuadrado del centro
    mov x21, #294
    mov x22, #33
    mov x23, #7
    mov x24, #7
	movz x25, 0x1919, lsl 16
	movk x25, 0x34, lsl 00
    bl DrawRect

// ================================ Dibujo la segunda estrella =============================================
// Las anteriores estrellas no las implemento porque generan conflicto con las animaciones
estrellasNuevas2:
    // La estrella se conforma en dos lineas y un centro
    mov x21, #540
    mov x22, #40
    mov x23, #15
    mov x24, #3
    movz x25, 0xB6
	movk x25, 0x7683
    bl DrawRect

    cmp x11, #17
    b.lt estado3

    b final2

estado3:
    movz w25, 0xFF
    movk w25, 0xFFFF
    bl DrawRect
final2:

//Segunda linea
    mov x21, #546
    mov x22, #34
    mov x23, #3
    mov x24, #15
    movz x25, 0xB6
	movk x25, 0x7683
    bl DrawRect

    cmp x11, #17
    b.lt estado4

    b final3

estado4:
    movz w25, 0xFF
    movk w25, 0xFFFF
    bl DrawRect
final3:
    // cuadrado del centro
    mov x21, #544
    mov x22, #38
    mov x23, #7
    mov x24, #7
	movz x25, 0x1919, lsl 16
	movk x25, 0x34, lsl 00
    bl DrawRect



    
    cmp x11, #20
    b.lt skip_reset
    mov x11, #0

skip_reset:

    add x11, x11, #1


/////////////////// LUNA ////////////////////////
    mov x21, x19
    mov x22, #40        // Centro Y
    mov x23, #30        // Radio
luna:

    // Dibujo luna en color claro
    movk w10, 0xFFFF
    movk w10, 0xFFFF, lsl 16
    bl DibujoCirculo

    // Borro anterior posición (color fondo)
    add x21, x19, #1
    movz w10, 0x1919, lsl 16
    movk w10, 0x0034, lsl 00
    bl DibujoCirculo

    // Retrocedo X (muevo luna)
    sub x19, x19, #1
// ================================ Termina la luna =============================================


// ================================ Animo el foco =============================================

foco:
    // Cargo los valores
    mov x21, #114	
    mov x22, #50
    mov x23, #20
    mov x24, #20

    // Simular x11 % 10 < 5
    and x12, x11, #0xF    // x12 = x11 % 16 Si el resto de la division es 0 o 5, el brech es verdadero
    cmp x12, #5
    b.lt foco_color2

    // Caso: x11 % 10 >= 5 → amarillo
    movz w25, 0x0000
    movk w25, 0xAAAA, lsl 16
    bl DrawRect
    b foco_fin

foco_color2:
    // Caso: x11 % 10 < 5 → rojo
    movz w25, 0x0000
    movk w25, 0xFFFF, lsl 16
    bl DrawRect

foco_fin:



// ================================ termina el foco =============================================

// ================================ Animo una ventana =============================================

ventana:
    mov x22, #190
    mov x21, #135
    mov x23, #55
    mov x24, #15

    cmp x11, #19
    b.lt apago_luz
    //  Si no comple entonces prendo luz
    movz w25, 0x6600
    movk w25, 0x6666, lsl 16
    bl DrawRect
    b ventana_fin

apago_luz:
    movz w25, 0xFF00
    movk w25, 0xFFFF, lsl 16
    bl DrawRect
ventana_fin:

// ================================ termina la ventana =============================================


// ================================ Animo las letras =============================================

letre_o:

      // --- 1) Borde AMARILLO (encendido) ---
    mov x21, #255       // X 
    mov x22, #110       // Y
    mov x23, #20        // Ancho
    mov x24, #25        // Alto

    cmp x11, #5
    b.lt apago_luz1

    movz w25, 0xFF    // Morado
    movk w25, 0xFFFF, lsl 16
    bl DrawRect
    b termino_luz

apago_luz1:
    movz w25, 0xAA    // Morado
    movk w25, 0xAAAA, lsl 16
    bl DrawRect
termino_luz:
   
     // --- 3) Dibujar CENTRO FIJO (gris) ---
    mov x21, #260       // X centrado
    mov x22, #115       // Y
    mov x23, #10        // Ancho
    mov x24, #15        // Alto
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
    bl DrawRect

//============================================================
letra_d: 
	mov x21, #285
	mov x22, #110
	mov x23, #20
	mov x24, #25

    cmp x11, #6
    b.lt apago_luz2

    movz w25, 0xFF    // Morado
    movk w25, 0xFFFF, lsl 16
    bl DrawRect
    b termino_luz1

apago_luz2:
    movz w25, 0xAA    // Morado
    movk w25, 0xAAAA, lsl 16
    bl DrawRect
termino_luz1:
   

//Aca se dibujo los detalles que dan forma la 'd'
	mov x21, #290
	mov x22, #125
	mov x23, #7
	mov x24, #7
    movz w25, 0x4040    
    movk w25, 0xFF40, lsl 16
    bl DrawRect
	mov x21, #285
	mov x22, #105
	mov x23, #12
	mov x24, #17
    bl DrawRect

//=========================================================
letra_c:
    mov x21, #315
	mov x22, #110
	mov x23, #20
	mov x24, #25

    cmp x11, #7
    b.lt apago_luz3

    movz w25, 0xFF    // Morado
    movk w25, 0xFFFF, lsl 16
    bl DrawRect
    b termino_luz2

apago_luz3:
    movz w25, 0xAA    // Morado
    movk w25, 0xAAAA, lsl 16
    bl DrawRect
termino_luz2:
   
 // centro de la letra C
	mov x21, #320
	mov x22, #115
	mov x23, #20
	mov x24, #15
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
bl DrawRect

//=========================================================
numero_2:
    mov x21, #420 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25


    cmp x11, #8
    b.lt apago_luz4

    movz w25, 0xFF    // Morado
    movk w25, 0xFFFF, lsl 16
    bl DrawRect
    b termino_luz3

apago_luz4:
    movz w25, 0xAA    // Morado
    movk w25, 0xAAAA, lsl 16
    bl DrawRect
termino_luz3:
   
//Detalles del '2'
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
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
//================================================
numero_0:
    mov x21, #445 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto


    cmp x11, #9
    b.lt apago_luz5

    movz w25, 0xFF    // Morado
    movk w25, 0xFFFF, lsl 16
    bl DrawRect
    b termino_luz4

apago_luz5:
    movz w25, 0xAA    // Morado
    movk w25, 0xAAAA, lsl 16
    bl DrawRect
termino_luz4:
   
//Centro del '0'
    mov x21, #450
	mov x22, #175
	mov x23, #10
	mov x24, #15
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
	
    bl DrawRect

//================================================
numero2n:
	mov x21, #470 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto

    cmp x11, #10
    b.lt apago_luz6

    movz w25, 0xFF    // Morado
    movk w25, 0xFFFF, lsl 16
    bl DrawRect
    b termino_luz5

apago_luz6:
    movz w25, 0xAA    // Morado
    movk w25, 0xAAAA, lsl 16
    bl DrawRect
termino_luz5:
   

    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
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

//================================================
numero_5:
    mov x21, #495 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto

    cmp x11, #11
    b.lt apago_luz7

    movz w25, 0xFF    // Morado
    movk w25, 0xFFFF, lsl 16
    bl DrawRect
    b termino_luz6

apago_luz7:
    movz w25, 0xAA    // Morado
    movk w25, 0xAAAA, lsl 16
    bl DrawRect
termino_luz6:
   
//Detalles del '5'

    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
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

// ================================ termina las letras =============================================


// ================================ Dibujo una nube =============================================

nube:
	movz x10, 0x95
	movk x10, 0x3548

    mov x21, #390
    mov x22, #50
    mov x23, #20
    mov x24, #40
    bl DibujoCirculo

    mov x21, #420
    mov x22, #30
    mov x23, #20
    mov x24, #40
    bl DibujoCirculo


    mov x21, #450
    mov x22, #50
    mov x23, #20
    mov x24, #40
    bl DibujoCirculo

    mov x21, #390
    mov x22, #35
    mov x23, #60
    mov x24, #35
    movz x25, 0x95
	movk x25, 0x3548
    bl DrawRect

// ================================ Termina la nube =============================================


personita:
    movz w25, 0x0000
    movk w25, 0x0000, lsl 16

    mov x21, #150
    mov x22, #197
    mov x23, #4
    mov x24, #10
bl DrawRect

    mov x21, #148
    mov x22, #198
    mov x23, #8
    mov x24, #6
bl DrawRect

    mov x21, #152
    mov x22, #193
    mov x23, #4
    mov x24, #10
bl DibujoCirculo

    mov x8, #10000
    bl delay

    b loop33
