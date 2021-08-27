global _main
extern _printf

section .text
exit:
	mov rax, 0
	ret

; This is Colleen!

_main:
	lea rdi, [rel s]
	mov rsi, 10
	mov rdx, 34
	lea rcx, [rel s]
	mov r8, 9
	push rbp
	call _printf
	pop rbp
	; Hello from Dr Quine!
	jmp exit

section .data
s: db "global _main%1$cextern _printf%1$c%1$csection .text%1$cexit:%1$c%4$cmov rax, 0%1$c%4$cret%1$c%1$c; This is Colleen!%1$c%1$c_main:%1$c%4$clea rdi, [rel s]%1$c%4$cmov rsi, 10%1$c%4$cmov rdx, 34%1$c%4$clea rcx, [rel s]%1$c%4$cmov r8, 9%1$c%4$cpush rbp%1$c%4$ccall _printf%1$c%4$cpop rbp%1$c%4$c; Hello from Dr Quine!%1$c%4$cjmp exit%1$c%1$csection .data%1$cs: db %2$c%3$s%2$c, 0%1$c", 0
