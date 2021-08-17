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
	$(RM) -f C/Sully/Sully C/Sully/Sully_*
	$(RM) -f python/Grace/Grace_kid.py
	$(RM) -f python/Sully/Sully_*.py

fclean : clean

re : fclean all

test : C/Colleen/Colleen C/Grace/Grace C/Sully/Sully
	@-bash -c 'diff C/Colleen/Colleen.c <(C/Colleen/Colleen) && echo -e "C/Colleen:\tOK"'
	@-(cd C/Grace && ./Grace) && diff C/Grace/Grace.c C/Grace/Grace_kid.c && echo "C/Grace:\tOK"
	@-echo "C/Sully:\tNA\n" && (cd C/Sully && ./Sully) && diff C/Sully/Sully.c C/Sully/Sully_1.c || true
	@-bash -c 'diff python/Colleen/Colleen.py <(python/Colleen/Colleen.py) && echo -e "\npy/Colleen:\tOK"'
	@-(cd python/Grace && ./Grace.py) && diff python/Grace/Grace.py python/Grace/Grace_kid.py && echo "py/Grace:\tOK"
	@-echo "py/Sully:\tNA\n" && (cd python/Sully && ./Sully.py) && diff python/Sully/Sully.py python/Sully/Sully_3.py || true
