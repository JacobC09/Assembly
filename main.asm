default rel
bits 64

segment .data
    welcome_string db "Calculate factorial of: ", 0 
    output_string db "factorial of %ld is %ld", 0 
    scanf_format db "%ld", 0  
    in_val dq 0

segment .text

global main
global factorial

extern printf
extern scanf

extern ExitProcess

a equ 0
result equ 8

factorial:
    push rbp
    mov rbp, rsp 
    sub rsp, 32

    n equ 16

    mov [rsp + a], rcx 

    cmp rcx, 1
    jg if_greater  
    mov eax, 1

    leave
    ret

if_greater:
    mov [rsp + n], rcx 
    dec rcx   
    call factorial
    mov rcx, [rsp + n]  
    imul rax, rcx  

    leave 
    ret   

main:
    push rbp  
    mov rbp, rsp
    sub rsp, 32   

    lea rcx, [welcome_string]
    call printf

    ; Read user input
    lea rcx, [scanf_format]
    lea rdx, [in_val]  
    call scanf

    mov rcx, [in_val]   
    call factorial   

    lea rcx, [output_string] 
    mov rdx, [in_val] 
    mov r8, rax 
    call printf

    xor rcx, rcx   
    call ExitProcess