.text
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
	movz w25, 0x4040
	movk w25, 0xFF40, lsl 16
	bl DrawRect

	mov x21, #122
	mov x22, #60
	mov x23, #5
	mov x24, #80
	movz w25, 0x4040
	movk w25, 0xFF40, lsl 16
	bl DrawRect

	mov x21, #100
	mov x22, #100
	mov x23, #50
	mov x24, #30
    movz w25, 0x4040
	movk w25, 0xFF40, lsl 16

    
    bl DrawRect

    mov x21, #90
	mov x22, #120
	mov x23, #70
	mov x24, #30
    movz w25, 0x4040
	movk w25, 0xFF40, lsl 16

    
    bl DrawRect

    mov x21, #70
	mov x22, #160
	mov x23, #111
	mov x24, #30
    movz w25, 0x4040
	movk w25, 0xFF40, lsl 16


	bl DrawRect


       // Restaurar registros
    ldr x30, [sp, #40]
    ldp x24, x25, [sp, #32]
    ldp x22, x23, [sp, #16]
    ldp x20, x21, [sp]
    add sp, sp, #48

    br x30
