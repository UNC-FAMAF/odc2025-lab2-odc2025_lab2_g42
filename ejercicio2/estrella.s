.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGH, 480
.globl DibujarEstrellas

DibujarEstrellas:
    stp x29, x30, [sp, -16]!   // Guardar registros
    mov x29, sp


    // Estrella 1
    mov x11, #100      // X
    mov x12, #50       // Y
    bl DibujarPunto

    // Estrella 2
    mov x11, #200
    mov x12, #80
    bl DibujarPunto

    // Estrella 3
    mov x11, #300
    mov x12, #40
    bl DibujarPunto

    // Estrella 4
    mov x11, #400
    mov x12, #60
    bl DibujarPunto

    // Estrella 5
    mov x11, #500
    mov x12, #30
    bl DibujarPunto

    //Estrella 6
    mov x11, #450
    mov x12, #40
    bl DibujarPunto

    //Estrella 7
    mov x11, #600
    mov x12, #50

    //Estrella 8
    mov x11, #250
    mov x12, #30

    //Estrella 9
    mov x11, #150
    mov x12, #50

    //Estrella 10
    mov x11, #350
    mov x12, #80

    ldp x29, x30, [sp], 16
    
    br x30

// Subrutina para dibujar un punto en (x11, x12) con color en x10
DibujarPunto:
    stp x13, x14, [sp, -16]!   // Guardar registros

    // Calcular posición en memoria: dirección = base + (y * width + x) * 4
    mov x13, SCREEN_WIDTH
    madd x14, x12, x13, x11    // y * width + x
    lsl x14, x14, 2            // multiplicar por 4 (bytes por pixel)
    add x14, x20, x14          // dirección final

    // Dibujar el pixel
    stur w10, [x14]

    ldp x13, x14, [sp], 16     // Restaurar registros

    br x30
