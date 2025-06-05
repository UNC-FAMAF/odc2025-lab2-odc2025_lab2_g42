.text
.global animacion
.extern luna
.extern foco

animacion:
    // Estado inicial de la luna (x19)
    mov x19, #600       // luna_x

loop33:
/////////////////// LUNA ////////////////////////
    mov x21, x19
    mov x22, #40        // Centro Y
    mov x23, #30        // Radio
luna:
    sub sp, sp, #48
    stp x21, x22, [sp]
    stp x23, x24, [sp, #16]
    str x25, [sp, #32]
    str x30, [sp, #40]

    // Dibujo luna en color claro
    movk w10, 0xFFFF
    movk w10, 0xFFFF, lsl 16
    bl DibujoCirculo

    // Borro anterior posición (color fondo)
    add x21, x19, #9
    movz w10, 0x1919, lsl 16
    movk w10, 0x0034, lsl 00
    bl DibujoCirculo

    // Retrocedo X (muevo luna)
    sub x19, x19, #10

    // Delay
    mov x8, #1000
    bl delay



    ldr x30, [sp, #40]
    ldr x25, [sp, #32]
    ldp x23, x24, [sp, #16]
    ldp x21, x22, [sp]
    add sp, sp, #48

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
    mov x8, #20000
    bl delay

    // Segundo color
    movz w25, 0xFFFF
    movk w25, 0xFFFF, lsl 16
    bl DrawRect

    // Delay
    mov x8, #20000
    bl delay

   // Recupero los registros desde la pila
    ldur x21, [sp, #0]
    ldur x22, [sp, #8]
    ldur x23, [sp, #16]
    ldur x24, [sp, #24]

    add sp, sp, #40   // Libero el stack
    

    b loop33
