section .data
    sensor_value db 0        ; Simulated sensor value. Initial value is 0.
    motor_status db 0        ; Motor status (0 = off, 1 = on).
    alarm_status db 0        ; Alarm status (0 = off, 1 = triggered).

section .text
    global _start            ; Entry point for the program.

_start:
    ; Read the sensor value
    mov al, [sensor_value]   ; Load the sensor value into the AL register.
    cmp al, 80               ; Compare the sensor value with 80.
    jg high_level            ; If the sensor value is greater than 80, jump to high_level.

    cmp al, 50               ; If the value is not greater than 80, check if it is less than or equal to 50.
    jle moderate_level       ; If the sensor value is less than or equal to 50, jump to moderate_level.

high_level:
    mov byte [motor_status], 0 ; Stop the motor (motor_status = 0).
    mov byte [alarm_status], 1 ; Trigger the alarm (alarm_status = 1).
    jmp end_program           ; Jump to end_program to exit the program.

moderate_level:
    mov byte [motor_status], 1 ; Turn on the motor (motor_status = 1).
    mov byte [alarm_status], 0 ; Disable the alarm (alarm_status = 0).
    jmp end_program           ; Jump to end_program to exit the program.

end_program:
    ; Exit the program
    mov eax, 1               ; System call number for exit (sys_exit).
    xor ebx, ebx             ; Set the exit code to 0.
    int 0x80                 ; Interrupt to invoke the system call to exit the program.
