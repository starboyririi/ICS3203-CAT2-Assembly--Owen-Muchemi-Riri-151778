section .data
    prompt db "Enter a number: ", 0        ; Message prompting the user to enter a number
    result_msg db "Factorial is: ", 0      ; Message to display the result of the factorial computation

section .bss
    num resd 1                             ; Reserve space for the input number (4 bytes)
    result resd 1                          ; Reserve space for the result of the factorial (4 bytes)

section .text
    global _start                          ; Entry point of the program

_start:
    ; Display the prompt message asking the user to enter a number
    mov edx, 16                            ; Length of the prompt message
    mov ecx, prompt                        ; Address of the prompt message
    mov ebx, 1                             ; File descriptor for standard output (stdout)
    mov eax, 4                             ; System call number for sys_write (write to stdout)
    int 0x80                               ; Interrupt to invoke the system call

    ; Read the number entered by the user into the num variable
    mov edx, 4                             ; Read 4 bytes (size of a dword, which is 1 integer)
    mov ecx, num                           ; Address of the num variable (where to store input)
    mov ebx, 0                             ; File descriptor for standard input (stdin)
    mov eax, 3                             ; System call number for sys_read (read from stdin)
    int 0x80                               ; Interrupt to invoke the system call

    ; Load the input number into eax register and call the factorial function
    mov eax, [num]                         ; Load the number from memory into eax
    call factorial                         ; Call the factorial function
    mov [result], eax                      ; Store the result of factorial into the result variable

    ; Output the result message: "Factorial is: "
    mov edx, 16                            ; Length of the result_msg
    mov ecx, result_msg                    ; Address of the result message
    mov ebx, 1                             ; File descriptor for stdout (1)
    mov eax, 4                             ; System call number for sys_write (write to stdout)
    int 0x80                               ; Interrupt to invoke the system call

    ; Exit the program
    mov eax, 1                             ; System call number for sys_exit (exit the program)
    xor ebx, ebx                           ; Set exit code to 0
    int 0x80                               ; Interrupt to invoke the system call to exit the program

;---------------------------------------------------------------
; factorial function: Computes the factorial of the number in eax
;---------------------------------------------------------------
factorial:
    push ebp                               ; Save the base pointer
    mov ebp, esp                           ; Set the base pointer to the current stack pointer
    push eax                                ; Save eax (the input number) on the stack
    
    ; Base case: if eax <= 1, return 1
    cmp eax, 1
    jle done_factorial                     ; If eax is 1 or less, jump to done_factorial

    dec eax                                 ; Decrease eax (n-1)
    call factorial                          ; Recursive call to factorial(n-1)
    pop ebx                                 ; Restore the original value of eax (n)
    imul eax, ebx                           ; Multiply eax (n) by the result of factorial(n-1)

    jmp end_factorial                       ; Jump to end_factorial to return the result

done_factorial:
    mov eax, 1                              ; If base case is met, set eax to 1 (factorial of 1 is 1)

end_factorial:
    leave                                   ; Restore the stack pointer
    ret                                     ; Return from the function
