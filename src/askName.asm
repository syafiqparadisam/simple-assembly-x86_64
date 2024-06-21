section .data
    ask db "What is your name ? " ; string ask =  "What is your name ? 20 bytes
    maxName db "max name is 20 character", 10 ; 25 bytes
    hello db "Your name is " ; string hello = "Your name is ?\n" 12 bytes
    nl db 10

section .bss
    name resb 20 ; string name; max 20 bytes

section .text
    global _start

_start:
    call _askName
    call _answerUser
    call _printName
    call _getName

    mov rax, 60
    mov rdi, 0
    syscall

_answerUser:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 20
    syscall
    ret

_askName:
    mov rax, 1
    mov rdi, 1
    mov rsi, maxName
    mov rdx, 25
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, ask
    mov rdx, 20
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, hello
    mov rdx, 13
    syscall
    ret

_getName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 20
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, nl
    mov rdx, 1
    syscall
    ret