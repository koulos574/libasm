section .text
    global _ft_read

_ft_read:
    mov rax, 0x2000003 ; put in rax the code of read to call in syscall (no need to precise arguments there are already in the function call from the C code)
    syscall ; call read (0x2000003)
    jc err ;A syscall return errno an sets the carry flag on error, jc (jump if carry flag on)
    ret

err:
    mov rax, -1 ;return -1 because err
    ret

    