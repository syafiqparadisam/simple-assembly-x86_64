
section .data
        text db "Hello, World!", 10 ; label memory address is text

section .text
        global _start

_start:
        mov rax, 1 ; sys_write number means stdout
        mov rdi, 1 ; file descriptor 1 is stdout
        mov rsi, text ; pointer to the string text means text label in section .text above
        mov rdx, 14 ; bytes to write "Hello, World!/n" 14 bytes
        syscall ; make syscall

        mov rax, 60 ; sys_exit number means want to exit
        mov rdi, 0 ; exit code 0
        syscall ; make syscall 