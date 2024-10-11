NAME = libftpp.a
CC = c++
CFLAGS = -Wall -Wextra -Werror -g -std=c++20

SRC_DIR = src/
DATA_DIR = $(SRC_DIR)data/

DATA_FILES = pool.cpp

SRCS = $(addprefix $(DATA_DIR), $(DATA_FILES))\

OBJ_DIR = .o
OBJTS = $(addprefix $(OBJ_DIR)/, $(SRCS:.cpp=.o))

RM = rm -f

$(OBJ_DIR)/%.o: %.cpp
	mkdir -p $(@D)
	$(CC) $(CFLAGS) $< -o $@

$(NAME): $(OBJTS)
	ar rcs $(NAME) $(OBJTS)

all: $(NAME)

clean:
	$(RM) -r $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re