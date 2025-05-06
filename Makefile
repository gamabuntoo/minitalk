# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gule-bat <gule-bat@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/07 15:02:03 by gule-bat          #+#    #+#              #
#    Updated: 2025/05/02 14:27:48 by gule-bat         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


.SILENT:
RED = \033[31m
GREEN = \033[32m
YELLOW = \033[33m
BLUE = \033[34m
MAGENTA = \033[35m
CYAN = \033[36m
RESET = \033[0m
#\033[u 
VOID =  \033[2J
#\033[2J 
#end

NAME = pipex

SRCS =  srcs/else.c		srcs/main.c		srcs/parsing.c		srcs/pipes.c 	srcs/innout.c

INCLUDES = -I ./includes/

CC = cc
CFLAGS = -Wall -Wextra -Werror -g3 -o $(NAME) $(INCLUDES)
RM = rm -f
OBJS = ($(SRCS).c )

all: $(NAME)

$(NAME): $(OBJS)
	@echo "$(MAGENTA) Compilation de $(YELLOW)PIPEX$(RESET) en cours ... $(RESET)"	
	@$(MAKE) -C ./libft
	@$(MAKE) tabfast
	@cp ./libft/libft.a .
	@cc -Wall -Wextra -Werror $(SRCS) libft.a -g3 -o $(NAME)
	@echo "$(GREEN)PIPEX $(NAME) CRÉÉ$(RESET)"
	@sleep 0.1



tab:
	@sleep 0.1
	@echo "[$(YELLOW)....$(RESET)]"
	@sleep 0.2
	@echo "$(VOID)"
	@echo "[$(YELLOW)/...$(RESET)]"
	@sleep 0.1
	@echo "$(VOID)"
	@echo "[$(MAGENTA)//..$(RESET)]"
	@sleep 0.1
	@echo "$(VOID)"
	@echo "[$(MAGENTA)///.$(RESET)]"
	@sleep 0.2
	@echo "$(VOID)"
	@echo "[$(RED)////$(RESET)]"
	@sleep 0.2
	@echo "$(VOID)"
	@sleep 0.4
	@echo "[$(GREEN)✓✓✓✓$(RESET)]"
	@sleep 0.1
	@echo "\t$(GREEN)COMPILED$(RESET)\t"
	@sleep 0.2

tabfast:
	@sleep 0.1
	@echo "[$(YELLOW)....$(RESET)]"
	@sleep 0.1
	@echo "$(VOID)"
	@echo "[$(YELLOW)/...$(RESET)]"
	@sleep 0.1
	@echo "$(VOID)"
	@echo "[$(MAGENTA)//..$(RESET)]"
	@sleep 0.1
	@echo "$(VOID)"
	@echo "[$(MAGENTA)///.$(RESET)]"
	@sleep 0.1
	@echo "$(VOID)"
	@echo "[$(RED)////$(RESET)]"
	@sleep 0.1
	@echo "$(VOID)"
	@sleep 0.1
	@echo "[$(GREEN)✓✓✓✓$(RESET)]"
	@sleep 0.1
	@echo "\t$(GREEN)COMPILED$(RESET)\t"
	@sleep 0.2

clean:
	@$(RM) $(OBJS)
	@$(RM) libft.a
	@echo "$(MAGENTA) Archive en supression ... \n $(GREEN)$(RESET)"
	@echo "$(GREEN)Pipex correctement effacé.$(RESET)"


fclean: clean
	@$(RM) $(NAME)
	@echo "$(GREEN)Minnitalk, $(NAME) et son stuff,\n correctement effacés.$(RESET)"

re: fclean all

#r: all clean tabfast

.PHONY: all clean fclean re

