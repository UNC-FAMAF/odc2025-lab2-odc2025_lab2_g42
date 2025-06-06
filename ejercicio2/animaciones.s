.text
.global animacion
.extern luna
.extern foco

animacion:
    // Estado inicial de la luna (x19)
    mov x19, #600       // luna_x

loop33:

movz w25, 0x6600
    movk w25, 0x6666, lsl 16

    mov x22, #190
    mov x21, #135
    mov x23, #55
    mov x24, #15
bl DrawRect


/////////////////// LUNA ////////////////////////
    mov x21, x19
    mov x22, #40        // Centro Y
    mov x23, #30        // Radio
luna:
    //sub sp, sp, #48
    //stp x21, x22, [sp]
    //stp x23, x24, [sp, #16]
    //str x25, [sp, #32]
    //str x30, [sp, #40]

    // Dibujo luna en color claro
    movk w10, 0xFFFF
    movk w10, 0xFFFF, lsl 16
    bl DibujoCirculo

    // Borro anterior posición (color fondo)
    add x21, x19, #5
    movz w10, 0x1919, lsl 16
    movk w10, 0x0034, lsl 00
    bl DibujoCirculo

     // Delay
    mov x8, #3500
    bl delay


    // Retrocedo X (muevo luna)
    sub x19, x19, #5


   

//
    //ldr x30, [sp, #40]
    //ldr x25, [sp, #32]
    //ldp x23, x24, [sp, #16]
    //ldp x21, x22, [sp]
    //add sp, sp, #48

letre_o:


   //  Borde NEGRO (apagado) ---
    mov x21, #255       // Mismas coordenadas
    mov x22, #110
    mov x23, #20
    mov x24, #25
    movz w25, 0x00 // Rojo Apagado
    movk w25, 0x0022 , lsl 16
    bl DrawRect

 
    // -- Dibujar CENTRO FIJO (gris) ---
    mov x21, #260       // X centrado
    mov x22, #115       // Y
    mov x23, #10        // Ancho
    mov x24, #15        // Alto
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
    bl DrawRect

     // Delay para estado ENCENDIDO
    mov x8, #3500      // 30ms (ajustable)
    bl delay


      // --- 1) Borde AMARILLO (encendido) ---
    mov x21, #255       // X 
    mov x22, #110       // Y
    mov x23, #20        // Ancho
    mov x24, #25        // Alto
    movz w25, 0x00    // Rojo Billante
    movk w25, 0x00FF, lsl 16
    bl DrawRect

   
     // --- 3) Dibujar CENTRO FIJO (gris) ---
    mov x21, #260       // X centrado
    mov x22, #115       // Y
    mov x23, #10        // Ancho
    mov x24, #15        // Alto
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
    bl DrawRect

letra_d: 

// Ahora dibujo la letra 'd' (APAGADA)
// Parte inferior
	mov x21, #285
	mov x22, #110
	mov x23, #20
	mov x24, #25
     movz w25, 0x00 // Rojo Apagado
    movk w25, 0x0022 , lsl 16
     bl DrawRect

   

    // Centro de 'd' 
	mov x21, #290
	mov x22, #125
	mov x23, #7
	mov x24, #7
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
    bl DrawRect

	mov x21, #285
	mov x22, #105
	mov x23, #12
	mov x24, #17
    
    bl DrawRect

   // Delay para estado ENCENDIDO
    mov x8, #3500      // 30ms (ajustable)
    bl delay

// Ahora dibujo la letra 'd' (ENCENCIDA)
// Parte inferior
	mov x21, #285
	mov x22, #110
	mov x23, #20
	mov x24, #25
      movz w25, 0x00    // Rojo Billante
    movk w25, 0x00FF, lsl 16
    bl DrawRect


    // Centro de 'd' 
	mov x21, #290
	mov x22, #125
	mov x23, #7
	mov x24, #7
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
    bl DrawRect

	mov x21, #285
	mov x22, #105
	mov x23, #12
	mov x24, #17
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
    bl DrawRect
  
letra_c:
    //Letra C apagada
	mov x21, #315
	mov x22, #110
	mov x23, #20
	mov x24, #25

    movz w25, 0x00 // Rojo Apagado
    movk w25, 0x0022 , lsl 16
    bl DrawRect

 // centro de la letra C
	mov x21, #320
	mov x22, #115
	mov x23, #20
	mov x24, #15
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
bl DrawRect


   // Delay para estado ENCENDIDO
    mov x8, #3500      // 30ms (ajustable)
    bl delay


    //Letra C Encendida
	mov x21, #315
	mov x22, #110
	mov x23, #20
	mov x24, #25

      movz w25, 0x00    // Rojo Billante
    movk w25, 0x00FF, lsl 16
    bl DrawRect

 // centro de la letra C
	mov x21, #320
	mov x22, #115
	mov x23, #20
	mov x24, #15
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
bl DrawRect


numero_2:

	mov x21, #420 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto movz w25, 0x0000    // Negro (#FF000000)
    movz w25, 0x00 // Rojo Apagado
    movk w25, 0x0022 , lsl 16
    bl DrawRect

    // Detalles del '2'

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

    // Delay para estado ENCENDIDO
    mov x8, #3500      // 30ms (ajustable)
    bl delay

    //2 encenidpos
    mov x21, #420 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto movz w25, 0x0000    // Negro (#FF000000)
     movz w25, 0x00    // Rojo Billante
    movk w25, 0x00FF, lsl 16
    bl DrawRect

    // Detalles del '2'

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
    

numero_0:

	mov x21, #445 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto
    movz w25, 0x00 // Rojo Apagado
    movk w25, 0x0022 , lsl 16
    bl DrawRect

    mov x21, #450
	mov x22, #175
	mov x23, #10
	mov x24, #15
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
	
    bl DrawRect

        // Delay para estado ENCENDIDO
    mov x8, #3500      // 30ms (ajustable)
    bl delay

    mov x21, #445 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto
     movz w25, 0x00    // Rojo Billante
    movk w25, 0x00FF, lsl 16
    bl DrawRect

    mov x21, #450
	mov x22, #175
	mov x23, #10
	mov x24, #15
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
	
    bl DrawRect


numero2n:

	mov x21, #470 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto
     movz w25, 0x00 // Rojo Apagado
    movk w25, 0x0022 , lsl 16
    bl DrawRect

    mov x21, #470
	mov x22, #175
	mov x23, #15
	mov x24, #7
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
	
    bl DrawRect

	mov x21, #475
	mov x22, #185
	mov x23, #15
	mov x24, #7
    bl DrawRect


    // Delay para estado ENCENDIDO
    mov x8, #3500      // 30ms (ajustable)
    bl delay


    mov x21, #470 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto
    movz w25, 0x00    // Rojo Billante
    movk w25, 0x00FF, lsl 16
    bl DrawRect

    mov x21, #470
	mov x22, #175
	mov x23, #15
	mov x24, #7
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
	
    bl DrawRect

	mov x21, #475
	mov x22, #185
	mov x23, #15
	mov x24, #7
    bl DrawRect

numero_5:

	mov x21, #495 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto
   movz w25, 0x00 // Rojo Apagado
    movk w25, 0x0022 , lsl 16
    bl DrawRect

    mov x21, #500
	mov x22, #175
	mov x23, #15
	mov x24, #7
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
    bl DrawRect

	mov x21, #495
	mov x22, #185
	mov x23, #15
	mov x24, #7
    bl DrawRect


     // Delay para estado ENCENDIDO
    mov x8, #3500      // 30ms (ajustable)
    bl delay


    
	mov x21, #495 // Eje x
	mov x22, #170 // Eje y
	mov x23, #20  // Ancho
	mov x24, #25 // Alto
     movz w25, 0x00    // Rojo Billante
    movk w25, 0x00FF, lsl 16
    bl DrawRect

    mov x21, #500
	mov x22, #175
	mov x23, #15
	mov x24, #7
    movz w25, 0x4040    // Gris (#FF404040)
    movk w25, 0xFF40, lsl 16
    bl DrawRect

	mov x21, #495
	mov x22, #185
	mov x23, #15
	mov x24, #7
    bl DrawRect

  vent:
    movz w25, 0xFF00
    movk w25, 0xFFFF, lsl 16

    mov x22, #190
    mov x21, #135
    mov x23, #55
    mov x24, #15
bl DrawRect

foco:
    // Reservo espacio en el stack (5 registros de 8 bytes = 40 bytes)
    sub sp, sp, #40

    // Cargo los valores

    mov x21, #114	
    mov x22, #50
    mov x23, #20
    mov x24, #20

    // Guardo en memoria los registros usados
    stur x21, [sp, #0]     // posición x
    stur x22, [sp, #8]     // posición y
    stur x23, [sp, #16]    // ancho
    stur x24, [sp, #24]    // alto


    // Primer color
    movz w25, 0x1100
    movk w25, 0xFFFF, lsl 16
    bl DrawRect

    // Delay
    mov x8, #3500
    bl delay

    // Segundo color
    movz w25, 0xFFFF
    movk w25, 0xFFFF, lsl 16
    bl DrawRect

    // Delay
    mov x8, #3500
    bl delay

   // Recupero los registros desde la pila
    ldur x21, [sp, #0]
    ldur x22, [sp, #8]
    ldur x23, [sp, #16]
    ldur x24, [sp, #24]

    add sp, sp, #40   // Libero el stack
    

    b loop33
