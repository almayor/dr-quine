CC  = cc
RM  = rm
ASM = nasm -fmacho64

C/Colleen/Colleen : C/Colleen/Colleen.c
	$(CC) $< -o $@

C/Grace/Grace : C/Grace/Grace.c
	$(CC) $< -o $@

C/Sully/Sully : C/Sully/Sully.c
	$(CC) $< -o $@

asm/Colleen/Colleen : asm/Colleen/Colleen.s
	$(ASM) $< && $(CC) asm/Colleen/Colleen.o -o $@

asm/Grace/Grace : asm/Grace/Grace.s
	$(ASM) $< && $(CC) asm/Grace/Grace.o -o $@

asm/Sully/Sully : asm/Sully/Sully.s
	$(ASM) $< && $(CC) asm/Sully/Sully.o -o $@

.DEFAULT_GOAL = all

.PHONY : all clean fclean re test

all : C/Colleen/Colleen C/Grace/Grace C/Sully/Sully asm/Colleen/Colleen asm/Grace/Grace asm/Sully/Sully

clean :
	$(RM) -f C/Colleen/Colleen
	$(RM) -f C/Grace/Grace C/Grace/Grace_kid.c
	$(RM) -f C/Sully/Sully C/Sully/Sully_*
	$(RM) -f python/Grace/Grace_kid.py
	$(RM) -f python/Sully/Sully_*.py
	$(RM) -f asm/Colleen/Colleen.o asm/Colleen/Colleen
	$(RM) -f asm/Grace/Grace.o asm/Grace/Grace asm/Grace/Grace_kid.s
	$(RM) -f asm/Sully/Sully.o asm/Sully/Sully asm/Sully/Sully_*

fclean : clean

re : fclean all

test : all
	@-bash -c 'diff C/Colleen/Colleen.c <(C/Colleen/Colleen) && echo -e "C/Colleen:\tOK"'
	@-(cd C/Grace && ./Grace) && diff C/Grace/Grace.c C/Grace/Grace_kid.c && echo "C/Grace:\tOK"
	@-echo "C/Sully:\tNA\n" && (cd C/Sully && ./Sully) && diff C/Sully/Sully.c C/Sully/Sully_3.c || true
	@-bash -c 'diff python/Colleen/Colleen.py <(python/Colleen/Colleen.py) && echo -e "\npy/Colleen:\tOK"'
	@-(cd python/Grace && ./Grace.py) && diff python/Grace/Grace.py python/Grace/Grace_kid.py && echo "py/Grace:\tOK"
	@-echo "py/Sully:\tNA\n" && (cd python/Sully && ./Sully.py) && diff python/Sully/Sully.py python/Sully/Sully_3.py || true
	@-bash -c 'diff asm/Colleen/Colleen.s <(asm/Colleen/Colleen) && echo -e "\nasm/Colleen:\tOK"'
	@-(cd asm/Grace && ./Grace) && diff asm/Grace/Grace.s asm/Grace/Grace_kid.s && echo "asm/Grace:\tOK"
	@-echo "asm/Sully:\tNA\n" && (cd asm/Sully && ./Sully) && diff asm/Sully/Sully.s asm/Sully/Sully_3.s || true
