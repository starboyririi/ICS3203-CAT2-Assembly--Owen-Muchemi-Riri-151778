section .data
    prompt db "Enter 5 numbers separated by space: ", 0   ; Prompt for user to enter 5 numbers
    output_msg db "Reversed array: ", 0                    ; Message to display the reversed array
    array db 5, 0, 0, 0, 0, 0                             ; Declare an array to store 5 numbers (initialized to 0)

section .text
    global _start                                          ; Entry point of the program

_start:
    ; Display the prompt asking the user to enter 5 numbers
    mov edx, 32                                            ; Length of the prompt message
    mov ecx, prompt                                        ; Address of the prompt string
    mov ebx, 1                                             ; File descriptor: 1 (stdout - standard output)
    mov eax, 4                                             ; System call number: 4 (sys_write - write to output)
    int 0x80                                               ; Make the system call to write the prompt to the screen

    ; Read the user's input numbers into the array
    mov ecx, array                                         ; Address of the array where input will be stored
    mov ebx, 0                                             ; File descriptor: 0 (stdin - standard input)
    mov eax, 3                                             ; System call number: 3 (sys_read - read from input)
    int 0x80                                               ; Make the system call to read input from the user

    ; Reverse the array in place (using two pointers)
    mov esi, array                                         ; Start pointer (points to the beginning of the array)
    lea edi, [array+4]                                     ; End pointer (points to the last element in the array)
reverse_loop:
    cmp esi, edi                                           ; Compare the start and end pointers
    jge end_reverse                                        ; If the start pointer has crossed the end pointer, exit the loop
    mov al, [esi]                                          ; Load the value from the start pointer into the AL register
    mov bl, [edi]                                          ; Load the value from the end pointer into the BL register
    mov [esi], bl                                          ; Store the value from the end pointer in the start pointer location
    mov [edi], al                                          ; Store the value from the start pointer in the end pointer location
    inc esi                                                ; Move the start pointer forward
    dec edi                                                ; Move the end pointer backward
    jmp reverse_loop                                       ; Repeat the loop until the pointers cross

end_reverse:
    ; Output the "Reversed array" message
    mov edx, 16                                            ; Length of the output message
    mov ecx, output_msg                                    ; Address of the "Reversed array" message
    mov ebx, 1                                             ; File descriptor: 1 (stdout - standard output)
    mov eax, 4                                             ; System call number: 4 (sys_write - write to output)
    int 0x80                                               ; Make the system call to write the message

    ; Output the reversed array
    mov ecx, array                                         ; Address of the array
    mov edx, 5                                             ; Number of elements to print (5 numbers)
    call print_array                                       ; Call the print_array procedure

    ; Exit the program
    mov eax, 1                                             ; System call number: 1 (sys_exit - exit the program)
    xor ebx, ebx                                           ; Exit code: 0 (indicating successful completion)
    int 0x80                                               ; Make the system call to exit the program

; Convert each byte to ASCII and print it
print_array:
    push ecx                                                ; Save ecx (array pointer)
    push edx                                                ; Save edx (length counter)
    mov edx, 5                                              ; Set the number of elements to print
print_loop:
    cmp edx, 0                                              ; Check if we've printed all elements
    je print_done                                           ; Jump to done if all elements are printed
    mov al, [ecx]                                          ; Load the value from the array into AL register
    add al, '0'                                             ; Convert the byte value to ASCII
    mov [temp], al                                          ; Store ASCII character in temp
    mov eax, 4                                              ; System call number: 4 (sys_write)
    mov ebx, 1                                              ; File descriptor: 1 (stdout)
    mov ecx, temp                                           ; Address of the temp string
    mov edx, 1                                              ; Length of the string (1 byte)
    int 0x80                                                ; Write the character to stdout
    inc ecx                                                 ; Move to the next byte in the array
    dec edx                                                 ; Decrement the element counter
    jmp print_loop                                          ; Repeat the loop

print_done:
    pop edx                                                 ; Restore edx
    pop ecx                                                 ; Restore ecx
    ret                                                     ; Return to the calling function

section .bss
    temp resb 1                                             ; Temporary storage for one ASCII character
