.text
.globl delay

delay:
    // Guardar el registro x9 en la pila
    sub sp, sp, #8         
    stur x9, [sp, #0]       

    // Preparar el contador: x9 = x8 * x8
    mov x9, x8              
    mul x9, x9, x9          

delay_loop:
    sub x9, x9, #1          
    cbnz x9, delay_loop     

    // Restaurar x9 desde la pila
    ldur x9, [sp, #0]       
    add sp, sp, #8          

    br x30
