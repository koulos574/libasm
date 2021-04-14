section .text
    global _ft_strcpy
;rsi is the source rdi is the dest
_ft_strcpy:
    xor rax, rax ; set everything i will use at 0
    xor rcx, rcx 
    jmp loop

loop:
    cmp byte[rsi + rcx], 0 ; see if str is not NULL
    je ending_str ; let's end
    mov al, byte[rsi + rcx] ; 2 indirects operations (like cmp byte[rdi], byte [rsi]) can't be cmp so need to pass it to a register al 8 bits (bc we pass 1 char)
    mov byte[rdi + rcx], al ; lets pass it to dest
    cmp al, 0 ; see if it's the end of the string
    je ending_str ; let's end
    inc rcx ; go to the next char
    jmp loop ; loop that

ending_str:
    mov al, 0 ; '\0'
    mov byte[rdi + rcx],al ; put the '\0 at the end'
    mov rax, rdi ;rax is the return register, we need to put rdi in rax
    ret


