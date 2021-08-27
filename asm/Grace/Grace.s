; This is Grace!

%macro PROG 0

	global _main
	extern _fopen, _fprintf

	section .text
	_main:
		lea rdi, [rel fname]
		lea rsi, [rel fmode]
		sub rsp, 8
		call _fopen
		add rsp, 8
		cmp rax, 0
		jg  replicate
		mov rax, 1
		ret

	REPL

%endmacro

%macro REPL 0

	replicate:
		mov rdi, rax
		lea rsi, [rel fcont]
		mov rdx, 10
		mov rcx, 9
		lea r8,  [rel fcont]
		mov r9,  34
		sub rsp, 8
		call _fprintf
		add rsp, 8
		mov rax, 0
		ret

	section .data
	fname: db "Grace_kid.s", 0
	fmode: db "w", 0
	fcont: db SRCS, 0

%endmacro

%define SRCS "; This is Grace!%1$c%1$c%%macro PROG 0%1$c%1$c%2$cglobal _main%1$c%2$cextern _fopen, _fprintf%1$c%1$c%2$csection .text%1$c%2$c_main:%1$c%2$c%2$clea rdi, [rel fname]%1$c%2$c%2$clea rsi, [rel fmode]%1$c%2$c%2$csub rsp, 8%1$c%2$c%2$ccall _fopen%1$c%2$c%2$cadd rsp, 8%1$c%2$c%2$ccmp rax, 0%1$c%2$c%2$cjg  replicate%1$c%2$c%2$cmov rax, 1%1$c%2$c%2$cret%1$c%1$c%2$cREPL%1$c%1$c%%endmacro%1$c%1$c%%macro REPL 0%1$c%1$c%2$creplicate:%1$c%2$c%2$cmov rdi, rax%1$c%2$c%2$clea rsi, [rel fcont]%1$c%2$c%2$cmov rdx, 10%1$c%2$c%2$cmov rcx, 9%1$c%2$c%2$clea r8,  [rel fcont]%1$c%2$c%2$cmov r9,  34%1$c%2$c%2$csub rsp, 8%1$c%2$c%2$ccall _fprintf%1$c%2$c%2$cadd rsp, 8%1$c%2$c%2$cmov rax, 0%1$c%2$c%2$cret%1$c%1$c%2$csection .data%1$c%2$cfname: db %4$cGrace_kid.s%4$c, 0%1$c%2$cfmode: db %4$cw%4$c, 0%1$c%2$cfcont: db SRCS, 0%1$c%1$c%%endmacro%1$c%1$c%%define SRCS %4$c%3$s%4$c%1$c%1$cPROG%1$c"

PROG
