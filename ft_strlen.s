# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vifontai <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/14 11:12:23 by vifontai          #+#    #+#              #
#    Updated: 2021/04/14 11:12:24 by vifontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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

