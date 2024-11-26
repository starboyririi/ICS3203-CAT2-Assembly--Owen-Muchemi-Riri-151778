section .data
    ; Declare strings for user prompts and output messages
    prompt db "Enter a number: ", 0          ; Message asking the user to input a number
    positive_msg db "POSITIVE", 0            ; Message to indicate the input is positive
    negative_msg db "NEGATIVE", 0            ; Message to indicate the input is negative
    zero_msg db "ZERO", 0                    ; Message to indicate the input is zero

section .bss
    num resd 1                               ; Reserve space for storing the user's input (4 bytes)

section .text
    global _start                            ; Entry point of the program

_start:
    ; Display the prompt to ask the user for input
    mov edx, 16                              ; Length of the prompt message
    mov ecx, prompt                          ; Address of the prompt string
    mov ebx, 1                               ; File descriptor: 1 (stdout)
    mov eax, 4                               ; System call number: 4 (sys_write)
    int 0x80                                  ; Make the system call to print the prompt

    ; Read the user input (number) from stdin
    mov edx, 4                               ; Size of the input buffer (4 bytes for a 32-bit integer)
    mov ecx, num                             ; Address where the input will be stored
    mov ebx, 0                               ; File descriptor: 0 (stdin)
    mov eax, 3                               ; System call number: 3 (sys_read)
    int 0x80                                  ; Make the system call to read user input

    ; Convert the input to an integer (already stored in num)
    mov eax, [num]                           ; Load the value of the user input into the eax register
    cmp eax, 0                                ; Compare the input with zero
    je is_zero                               ; If the value is zero, jump to is_zero label
    jl is_negative                           ; If the value is less than zero, jump to is_negative label

is_positive:
    ; If the number is positive, prepare to display "POSITIVE" message
    mov edx, 8                               ; Length of the positive message
    mov ecx, positive_msg                    ; Address of the "POSITIVE" message
    jmp display_result                       ; Jump to the code that displays the message

is_negative:
    ; If the number is negative, prepare to display "NEGATIVE" message
    mov edx, 8                               ; Length of the negative message
    mov ecx, negative_msg                    ; Address of the "NEGATIVE" message
    jmp display_result                       ; Jump to the code that displays the message

is_zero:
    ; If the number is zero, prepare to display "ZERO" message
    mov edx, 4                               ; Length of the zero message
    mov ecx, zero_msg                        ; Address of the "ZERO" message

display_result:
    ; Display the result message
    mov ebx, 1                               ; File descriptor: 1 (stdout)
    mov eax, 4                               ; System call number: 4 (sys_write)
    int 0x80                                  ; Make the system call to print the result message

    ; Exit the program
    mov eax, 1                               ; System call number: 1 (sys_exit)
    xor ebx, ebx                             ; Exit code: 0
    int 0x80                                  ; Make the system call to exit the program
