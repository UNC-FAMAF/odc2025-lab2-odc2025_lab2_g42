.text
.extern DrawRect
.extern delay
.globl foco

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
    
    
    br x30
