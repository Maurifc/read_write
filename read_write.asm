bits 64

%define STDIN 0
%define BUFFER_SIZE 30

section .bss
buffer	resb	30	

section .text

global _start
_start:
	mov rdi, STDIN 			; File descriptor
	mov rsi, buffer
	mov rdx, BUFFER_SIZE 
	mov rax, 0 			; kernel_read
	syscall

	xor rdi, rdi 			; Cod de retorno 0
	mov rax, 60 			; Código da syscall exit 
	syscall	
