# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vifontai <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/14 11:12:29 by vifontai          #+#    #+#              #
#    Updated: 2021/04/14 11:12:30 by vifontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
    global _ft_write

_ft_write:
    mov rax, 0x2000004 ; put in rax the code of write to call in syscall (no need to precise arguments there are already in the function call from the C code)
    syscall ;syscall
    jc err ;A syscall return errno an sets the carry flag on error, jc (jump if carry flag on)
    ret

err:
    mov rax,-1 ;return -1 because err
    ret
