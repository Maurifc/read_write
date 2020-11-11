bits 64

%define STDIN 0
%define STDOUT 1
%define BUFFER_SIZE 30

section .data
welcomeMsg	db	"Please, enter some text: ",0x0
welcomeMsgLen	equ	$-welcomeMsg

finalMsg	db	"You've entered: ",0x0
finalMsgLen	equ	$-finalMsg

section .bss
buffer	resb	30	

section .text

global _start
_start:
	mov rsi, welcomeMsg		; Msg to be printed
	mov rdx, welcomeMsgLen		; Its lenght
	call write_msg

	mov rdi, STDIN 			; File descriptor
	mov rsi, buffer
	mov rdx, BUFFER_SIZE 
	mov rax, 0 			; kernel_read
	syscall

	mov rsi, finalMsg		; Prints "You've entere.."
	mov rdx, finalMsgLen
	call write_msg

	mov rsi, buffer			; Prints user input
	mov rdx, BUFFER_SIZE
	call write_msg

	xor rdi, rdi 			; Cod de retorno 0
	mov rax, 60 			; Código da syscall exit 
	syscall	

write_msg:
	mov rdi, STDOUT
	mov rax, 1			; kernel_write
	syscall
	
	ret
