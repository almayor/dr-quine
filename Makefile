CC = cc
RM = rm

C/Colleen/Colleen : C/Colleen/Colleen.c
	$(CC) $< -o $@

C/Grace/Grace : C/Grace/Grace.c
	$(CC) $< -o $@

C/Sully/Sully : C/Sully/Sully.c
	$(CC) $< -o $@

.DEFAULT_GOAL = all

.PHONY : all clean fclean re test

all : C/Colleen/Colleen C/Grace/Grace C/Sully/Sully

clean :
	$(RM) -f C/Colleen/Colleen
	$(RM) -f C/Grace/Grace C/Grace/Grace_kid.c
	$(RM) -f C/Sully/Sully C/Sully/*_*

fclean : clean

re : fclean all

test : C/Colleen/Colleen C/Grace/Grace C/Sully/Sully
	@-bash -c 'diff C/Colleen/Colleen.c <(C/Colleen/Colleen) && echo -e "Colleen:\tOK"'
	@-(cd C/Grace && ./Grace) && diff C/Grace/Grace.c C/Grace/Grace_kid.c && echo "Grace:\t\tOK"
	@-echo "Sully:\n" && (cd C/Sully && ./Sully) && diff C/Sully/Sully.c C/Sully/Sully_1.c || diff C/Sully/Sully_5.c C/Sully/Sully_3.c
