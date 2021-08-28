global _main
extern _fopen, _fprintf, _system, _fflush, _sprintf

section .text
_main:
	sub rsp, 8		; aligning stack
	lea rdi, [rel name]
	lea rsi, [rel fname]
	mov rdx, [rel num]
	call _sprintf

	lea rdi, [rel cmd]
	lea rsi, [rel fcmd]
	mov rdx, [rel num]
	call _sprintf

	lea rdi, [rel name]
	lea rsi, [rel fmode]
	call _fopen
	add rsp, 8		; restoring stack
	push rax		; saving FILE pointer

	cmp rax, 0
	jg replicate
	mov rax, -1
	ret

replicate:
	mov rdi, rax
	lea rsi, [rel finj]
	mov rdx, 10
	mov rcx, 9
	mov r8,  [rel num]
	dec r8
	mov r9,  34

	sub rsp, 8		; aligning stack
	lea r11, [rel finj]
	push r11
	lea r11, [rel fcmd]
	push r11
	lea r11, [rel fname]
	push r11

	call _fprintf
	add rsp, 32		; restoring stack

	pop rdi			; restoring FILE pointer
	sub rsp, 8		; aligning stack
	call _fflush

	lea rdi, [rel cmd]
	call _system
	
	add rsp, 8		; restoring stack
	mov rax, 0
	ret


section .data
num: dd 5
fmode: db "w", 0
fname: db "Sully_%1$i.s", 0
fcmd: db "nasm -fmacho64 Sully_%1$i.s && gcc Sully_%1$i.o -o Sully_%1$i && if [ %1$i -gt 0 ]; then ./Sully_%1$i; fi", 0
finj: db "global _main%1$cextern _fopen, _fprintf, _system, _fflush, _sprintf%1$c%1$csection .text%1$c_main:%1$c%2$csub rsp, 8%2$c%2$c; aligning stack%1$c%2$clea rdi, [rel name]%1$c%2$clea rsi, [rel fname]%1$c%2$cmov rdx, [rel num]%1$c%2$ccall _sprintf%1$c%1$c%2$clea rdi, [rel cmd]%1$c%2$clea rsi, [rel fcmd]%1$c%2$cmov rdx, [rel num]%1$c%2$ccall _sprintf%1$c%1$c%2$clea rdi, [rel name]%1$c%2$clea rsi, [rel fmode]%1$c%2$ccall _fopen%1$c%2$cadd rsp, 8%2$c%2$c; restoring stack%1$c%2$cpush rax%2$c%2$c; saving FILE pointer%1$c%1$c%2$ccmp rax, 0%1$c%2$cjg replicate%1$c%2$cmov rax, -1%1$c%2$cret%1$c%1$creplicate:%1$c%2$cmov rdi, rax%1$c%2$clea rsi, [rel finj]%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8,  [rel num]%1$c%2$cdec r8%1$c%2$cmov r9,  34%1$c%1$c%2$csub rsp, 8%2$c%2$c; aligning stack%1$c%2$clea r11, [rel finj]%1$c%2$cpush r11%1$c%2$clea r11, [rel fcmd]%1$c%2$cpush r11%1$c%2$clea r11, [rel fname]%1$c%2$cpush r11%1$c%1$c%2$ccall _fprintf%1$c%2$cadd rsp, 32%2$c%2$c; restoring stack%1$c%1$c%2$cpop rdi%2$c%2$c%2$c; restoring FILE pointer%1$c%2$csub rsp, 8%2$c%2$c; aligning stack%1$c%2$ccall _fflush%1$c%1$c%2$clea rdi, [rel cmd]%1$c%2$ccall _system%1$c%2$c%1$c%2$cadd rsp, 8%2$c%2$c; restoring stack%1$c%2$cmov rax, 0%1$c%2$cret%1$c%1$c%1$csection .data%1$cnum: dd %3$d%1$cfmode: db %4$cw%4$c, 0%1$cfname: db %4$c%5$s%4$c, 0%1$cfcmd: db %4$c%6$s%4$c, 0%1$cfinj: db %4$c%7$s%4$c, 0%1$c%1$c%1$csection .bss%1$cname: resb 100%1$ccmd: resb 100%1$c", 0


section .bss
name: resb 100
cmd: resb 100
