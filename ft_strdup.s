# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vifontai <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/14 11:12:18 by vifontai          #+#    #+#              #
#    Updated: 2021/04/14 11:12:20 by vifontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
    global _ft_strdup
    extern _ft_strlen
    extern _malloc
    extern _ft_strcpy
;je recois rdi 
_ft_strdup:
    cmp rdi, 0 ;check if rdi is NULL
    je exit
    call _ft_strlen ; call strlen res of ft_strlen in goes in rax
    inc rax ;for the backslash
    push rdi ; put the value on the stack
    mov rdi, rax; for the malloc (rax has the right size for the future string), malloc takes rdi as the first arg
    call _malloc ; malloc return the allocation in rax
    cmp rax, 0 ; check if malloc fail
    je exit
    pop r10 ; we can take it after we take rdi and put it in r10
    mov rdi, rax ; rax has the allocation of malloc
    mov rsi, r10 ; for strcpy
    call _ft_strcpy ; takes rdi as first (first being the dest) arg rsi as second (src), will return the string in rax
    ret ; ret rax from strcpy



exit:
    mov rax,0
    ret
