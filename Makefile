# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vifontai <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/14 11:11:16 by vifontai          #+#    #+#              #
#    Updated: 2021/04/14 11:11:36 by vifontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRCS =	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s	\
		ft_read.s	\
		ft_strdup.s

OBJS = $(SRCS:.s=.o)

%.o	: %.s
	@nasm -f macho64 $< -o $@

$(NAME): $(OBJS) 
	@ar rcs $(NAME) $(OBJS)

all: $(NAME)

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME)

re: fclean all
