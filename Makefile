##
## EPITECH PROJECT, 2021
## A Fantastic Epitech Project
## File description:
## Makefile
##

## path for each scripts
SRC			=	$(addprefix src/,) ##comment this line if you have only one file
MAIN		=	
TEST		=	tests/unit_test.c
INCLUDEPATH	=	./include
TESTOBJ		=	$(TEST:.c=.o)
OBJ			=	$(SRC:.c=.o)
MAINOBJ		=	$(MAIN:.c=.o)

## name of the binaries
EXEC		=	
DEBUGBIN	=	
TESTBIN		=	

## flags
CFLAGS		=	$(addprefix -I, $(INCLUDEPATH)) #-Wextra -Wall
DEBUGFLAGS	=	-g3
TESTFLAGS	=	-lcriterion

## compilator
$(CC)	=	gcc

#-------------------------------------------------------------
#DO NOT EDIT BELOW THIS LINE
#-------------------------------------------------------------

%.o: %.c
	@$(CC) $(CFLAGS) -c -o $@ $^\
	&& printf "[\033[1;35mcompiled\033[0m] % 29s\n" $< |  tr ' ' '.'\
	|| printf "[\033[1;31merror\033[0m] % 29s\n" $< |  tr ' ' '.'

all: $(EXEC)

$(EXEC): $(OBJ) $(MAINOBJ)
	@$(CC) -o $@ $^ $(CFLAGS)
	@echo -e "\e[1;36mFinished compiling $@\e[0m"

clean:
	@rm -f *#
	@rm -f *~
	@rm -f $(OBJ)
	@rm -f $(MAINOBJ)
	@rm -f $(TESTOBJ)
	@printf "\e[0;33mDeleted all .o of $(EXEC)\e[0m\n"
	@echo -e "\e[1;36mDeleted all temporary files\e[0m"

fclean: clean
	@rm -f $(EXEC)
	@rm -f $(DEBUGBIN)
	@rm -f $(TESTBIN)
	@printf "\e[0;33mDeleted $(EXEC) binary\e[0m\n"
	@echo -e "\e[1;36mDeleted all temporary files\e[0m"

re: fclean all

debug: CFLAGS += $(DEBUGFLAGS)
debug: fclean $(OBJ) $(MAINOBJ)
	@$(CC) -o $(DEBUGBIN) $(OBJ) $(MAINOBJ) $(LDFLAGS) $(CFLAGS)
	@echo -e "\e[1;36mFinished compiling $(DEBUGBIN) $@\e[0m"

unit_tests: fclean $(OBJ)
	@$(CC) -o $(TESTBIN) $(OBJ) $(TEST OBJ) $(LDFLAGS) $(CFLAGS) $(TESTFLAGS)
	@echo -e "\e[1;36mFinished compiling $(TESTBIN) $@\e[0m"

run_tests: unit_tests
	./$(TESTBIN)

.PHONY:	all	clean fclean re debug unit_tests run_tests update_libmy