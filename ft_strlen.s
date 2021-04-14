section .text
    global _ft_strlen

_ft_strlen:
    xor rax, rax ; put rax to 0
    jmp loop ; let's go to the loooop

loop:
    cmp byte[rdi + rax],0 ; check if it's null 
    je return ; return if it's null
    inc rax; count +1
    jmp loop

return:
    ret

