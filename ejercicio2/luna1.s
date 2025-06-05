.text
.globl luna
.extern DibujoCirculo
.extern delay

luna:
// Preserva registros ANTES de llamar a las funciones
    sub sp, sp, #48          // Reserva espacio para 6 registros (x21-x25, x30)
    stp x21, x22, [sp]       // Guarda x21, x22
    stp x23, x24, [sp, #16]  // Guarda x23, x24
    str x25, [sp, #32]       // Guarda x25
    str x30, [sp, #40]       // Guarda LR

    //Dibujar luna
    mov x21, #600 //Centro X de la luna         
    mov x22, #40 //Centro Y de la luna
    mov x23, #30 //Radio de la luna
 

loop_x:
    movk w10, 0xFFFF
    movk w10, 0xFFFF, lsl 16
    bl DibujoCirculo //Llamo a la subrutina que dibuja la luna 
    
    add x21, x21, #9
	movz x10, 0x1919, lsl 16
	movk x10, 0x34, lsl 00
    bl DibujoCirculo

    mov x8, #7000
    bl delay 

    sub x21, x21, #10
    mov x8, #7000
    bl delay 
    b loop_x


    // Restaura registros
    ldr x30, [sp, #40]       // Restaura LR
    ldr x25, [sp, #32]       // Restaura x25
    ldp x23, x24, [sp, #16]  // Restaura x23, x24
    ldp x21, x22, [sp]       // Restaura x21, x22
    add sp, sp, #48          // Libera espacio

    br x30

    