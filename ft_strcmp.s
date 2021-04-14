section .text
    global _ft_strcmp


_ft_strcmp:
    xor rax, rax ; put rax to 0, xor is faster than mov rax,0
    jmp loop

loop:
    mov al, byte[rdi] ; cant cmp directly two indirect arguments, al is 8 bits (like a char, int is 16 bits -32767 to 32767)
    cmp al, byte[rsi] ; cmp to see if it's min
    jl not_equal_min ; jump less than
    cmp al, byte[rsi] ; cmp to see if it's more
    jg not_equal_sup ;jump greater than
    cmp byte[rdi], 0 ; see if it's the end
    je ending ; If there is a diff it will not pass the first two check, that is why jump equal
    inc rdi ;let's go to next char
    inc rsi; let's go to next char
    jmp loop
    

not_equal_min:
    mov rax, -1 ; rax is the return regirster ret -1
    ret

not_equal_sup:
    mov rax, 1 ; rax is the return regirster ret 1
    ret

ending:
    mov rax,0 ; rax is the return regirster  ret 0
    ret