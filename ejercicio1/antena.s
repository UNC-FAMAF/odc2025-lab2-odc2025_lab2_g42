.globl DibujarAntena
.extern DrawRect

DibujarAntena: // Dibujo la antena del primer edificio

    sub sp, sp, #48
    stp x20, x21, [sp]       // Guarda registros críticos
    stp x22, x23, [sp, #16]
    stp x24, x25, [sp, #32]
    str x30, [sp, #40]       // Guarda LR


	mov x21, #80
	mov x22, #130
	mov x23, #90
	mov x24, #50
	movz w25, 0x33
	movk w25, 0x3333
	bl DrawRect

	mov x21, #122
	mov x22, #60
	mov x23, #5
	mov x24, #80
	movz w25, 0x33
	movk w25, 0x3333
	bl DrawRect

	mov x21, #114
	mov x22, #50
	mov x23, #20
	mov x24, #20
	movz w25, 0xAA00
	movk w25, 0xFFFF, lsl 16
	bl DrawRect

	mov x21, #119
	mov x22, #54
	mov x23, #10
	mov x24, #10
	movz w25, 0xFF00
	movk w25, 0xFFFF, lsl 16
	bl DrawRect


      ldr x30, [sp]       // Restaura LR
    add sp, sp, #16
   
   
       // Restaurar registros
    ldr x30, [sp, #40]
    ldp x24, x25, [sp, #32]
    ldp x22, x23, [sp, #16]
    ldp x20, x21, [sp]
    add sp, sp, #48
    ret
