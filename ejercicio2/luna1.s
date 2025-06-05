.text
.globl luna
.extern DibujoCirculo
.extern delay

luna:
    sub sp, sp, #48
    stp x21, x22, [sp]
    stp x23, x24, [sp, #16]
    str x25, [sp, #32]
    str x30, [sp, #40]

    mov x21, #600      // Centro X
    mov x22, #40       // Centro Y
    mov x23, #30       // Radio

    // Dibujo luna en color claro
    movk w10, 0xFFFF
    movk w10, 0xFFFF, lsl 16
    bl DibujoCirculo

    // Borro anterior posición (color fondo)
    add x21, x21, #9
    movz w10, 0x1919, lsl 16
    movk w10, 0x0034, lsl 00
    bl DibujoCirculo

    // Retrocedo X (muevo luna)
    sub x21, x21, #10

    // Delay
    mov x8, #7000
    bl delay


    ldr x30, [sp, #40]
    ldr x25, [sp, #32]
    ldp x23, x24, [sp, #16]
    ldp x21, x22, [sp]
    add sp, sp, #48

    br x30

    