# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gleger <gleger@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/12/31 19:03:08 by gleger            #+#    #+#              #
#    Updated: 2014/01/09 15:02:07 by gleger           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC		= gcc
NAME	= ft_select
FLAGS	= -Wall -Wextra -Werror -O3 -I ./includes
LIB		= -L /usr/lib -ltermcap
SRC		=	ft_stuff.c \
			ft_select.c \
			ft_memory.c \
			ft_more.c \
			ft_list.c \
			main.c
OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\033[1;35;m[Linking] \t\t\033[0m: " | tr -d '\n'
	$(CC) $(FLAGS) $(LIB) -o $@ $^ 
	@echo "\033[1;32;m[Success] \t\t\t\033[0m"

%.o: %.c includes/ft_select.h
	@echo "\033[1;36;m[Compiling $<]\t\033[0m: " | tr -d '\n'
	$(CC) $(FLAGS) -c $<

clean:
	@echo "\033[0;33;m[Cleaning] \t\t\033[0m: " | tr -d '\n'
	rm -f $(OBJ)

fclean: clean
	@echo "\033[0;31;m[Deleting $(NAME)] \t\033[0m: " | tr -d '\n'
	rm -f $(NAME)

re: fclean all

.PHONY: re clean fclean
