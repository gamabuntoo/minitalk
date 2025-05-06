# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gule-bat <gule-bat@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/07 15:02:03 by gule-bat          #+#    #+#              #
#    Updated: 2025/05/06 15:22:59 by gule-bat         ###   ########.fr        #
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

NAME = client
NAME2 = server

SRCS = client.c
SRCS2 = server.c 

INCLUDES = -I ./includes/

CC = cc
CFLAGS = -Wall -Wextra -Werror -g3 -o $(NAME) $(INCLUDES)
RM = rm -f
OBJS = $(SRCS:.c=.o)
OBJS2 = $(SRCS2:.c=.o)

all: $(NAME)

$(NAME) $(NAME2): $(OBJS)
	@echo "$(MAGENTA) Compilation de $(YELLOW)MINITALK$(RESET) en cours ... $(RESET)"	
	@$(MAKE) -C ./libft
	@$(MAKE) tabfast
	@cp ./libft/libft.a .
	@cc -Wall -Wextra -Werror $(SRCS) libft.a -g3 -o $(NAME)
	@cc -Wall -Wextra -Werror $(SRCS2) libft.a -g3 -o $(NAME)
	@echo "$(GREEN)MINITALK $(NAME) CRÉÉ$(RESET)"
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
	@$(RM) $(OBJS2)
	@$(RM) libft.a
	@$(MAKE) clean -C ./libft
	@$(MAKE) tabfast
	@echo "$(MAGENTA) Archive en supression ... \n $(GREEN)$(RESET)"
	@echo "$(GREEN)MINITALK correctement effacé.$(RESET)"


fclean: clean
	@$(RM) $(NAME)
	@echo "$(GREEN)Minitalk, $(NAME) et son stuff,\n correctement effacés.$(RESET)"

re: fclean all

#r: all clean tabfast

.PHONY: all clean fclean re

