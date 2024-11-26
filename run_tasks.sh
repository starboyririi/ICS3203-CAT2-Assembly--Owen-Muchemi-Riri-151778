#!/bin/bash

# Task 1: Control Flow and Conditional Logic
echo "Running Task 1: Control Flow and Conditional Logic..."
nasm -f elf32 task1.asm -o task1.o    # Assemble in 32-bit mode
ld -m elf_i386 -o task1 task1.o       # Link in 32-bit mode
./task1                               # Run Task 1
echo "Task 1 completed."
echo "-------------------------------"

# Task 2: Array Manipulation with Looping and Reversal
echo "Running Task 2: Array Manipulation with Looping and Reversal..."
nasm -f elf32 task2.asm -o task2.o    # Assemble in 32-bit mode
ld -m elf_i386 -o task2 task2.o       # Link in 32-bit mode
./task2                               # Run Task 2
echo "Task 2 completed."
echo "-------------------------------"

# Task 3: Factorial Calculation
echo "Running Task 3: Factorial Calculation..."
nasm -f elf32 task3.asm -o task3.o    # Assemble in 32-bit mode
ld -m elf_i386 -o task3 task3.o       # Link in 32-bit mode
./task3                               # Run Task 3
echo "Task 3 completed."
echo "-------------------------------"

# Task 4: Data Monitoring and Control
echo "Running Task 4: Data Monitoring and Control..."
nasm -f elf32 task4.asm -o task4.o    # Assemble in 32-bit mode
ld -m elf_i386 -o task4 task4.o       # Link in 32-bit mode
./task4                               # Run Task 4
echo "Task 4 completed."
echo "-------------------------------"

echo "All tasks executed successfully."
