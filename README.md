ICS3203-CAT2-Assembly--Owen-Muchemi-Riri-151778
ICS3203 CAT2 - Assembly Language Processing (Owen Muchemi Riri)

This repository contains the solutions for the **CAT2 (Assembly Language Processing)** project. The project involves various tasks in Assembly language, including input/output operations, control structures, recursion, and system call handling.

 Project Overview

This project contains the following key tasks:

1. **Task 1: Data Monitoring and Control Using Port-Based Simulation**
   - Simulating a control program to manage a water level sensor, motor, and alarm system based on the sensor input.
   
2. **Task 2: Factorial Calculation Using Recursion**
   - A recursive Assembly program to calculate the factorial of a given number.

3. **Task 3: Register Management and Stack Operations**
   - Implementing and managing registers and stack frames for a function that computes the factorial of a number recursively.

4. **Task 4: Input/Output Management in Assembly**
   - Demonstrating how to read input, reverse arrays, and display the reversed values using Assembly language.

---

## Requirements

- **Linux/WSL (Windows Subsystem for Linux)**: The Assembly code is intended to run on a Linux-like environment (WSL for Windows users).
- **Assembler**: You'll need an assembler like `nasm` to assemble the code.
- **Debugger/Simulator**: `gdb` or similar tools may be useful for debugging the Assembly code.

---

Setup Instructions

1. Install Necessary Tools
Make sure you have the necessary tools installed for Assembly programming.

On Ubuntu (WSL or Linux), you can install them using:

```bash
sudo apt update
sudo apt install nasm
sudo apt install gcc
```

 2. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/starboyririi/ICS3203-CAT2-Assembly--Owen-Muchemi-Riri-151778.git
cd ICS3203-CAT2-Assembly--Owen-Muchemi-Riri-151778
```

3. Assemble the Code

To assemble a `.asm` file, use `nasm`:

```bash
nasm -f elf32 your_code.asm -o your_code.o
```

 4. Link the Object File

Once the code is assembled, link it with `gcc`:

```bash
gcc -m32 your_code.o -o your_program
```

 5. Run the Program

Execute the program:

```bash
./your_program
```

---

 Task Descriptions

Task 1: Data Monitoring and Control Using Port-Based Simulation

**Objective**: Simulate a water level sensor input and based on its value, control a motor and alarm system.

**Approach**: 
  - Read a simulated sensor value from a memory location (or port).
  - If the sensor value exceeds a threshold (e.g., 80), trigger the alarm and stop the motor. If the value is moderate (between 50 and 80), start the motor and disable the alarm.
  - The motor status and alarm status are stored in memory, and their values are updated accordingly.

**Key Concepts**: 
  - Using `mov` to load and manipulate values.
  - Using conditional jumps (`jge`, `jle`) to check values and make decisions.
  - System calls to simulate I/O operations.

---

### Task 2: Factorial Calculation Using Recursion

**Objective**: Implement a recursive Assembly function to calculate the factorial of a number.

**Approach**:
  - Prompt the user to enter a number.
  - Load the entered number into a register.
  - Call a recursive function to compute the factorial.
  - Output the result using system calls for output.
  
**Key Concepts**:
  - Recursive function calls in Assembly.
  - Register manipulation to pass values between functions.
  - Using `cmp` and `jle` for base cases in recursion.

---

### Task 3: Register Management and Stack Operations

**Objective**: Demonstrate the preservation and restoration of registers using the stack.

**Approach**: 
  - In the recursive factorial function, push the registers onto the stack before making a recursive call and pop them afterward.
  - This ensures that the values in registers (e.g., `eax`) are preserved across function calls.
  
**Key Concepts**:
  - Using `push` and `pop` instructions to manage the stack.
  - Manipulating the `ebp` (base pointer) to manage function calls and local variables.
  - Restoring registers before returning from a function.

---

### Task 4: Input/Output Management in Assembly

**Objective**: Reverse an array of integers and display the result.

**Approach**:
  - Read a series of integers from user input.
  - Reverse the array in place using a loop and two pointers (`esi` and `edi`).
  - Output the reversed array using system calls to display the values.
  
**Key Concepts**:
  - Using `mov` to copy values between memory locations.
  - Using `inc` and `dec` for moving array pointers.
  - Using system calls to read input (`sys_read`) and output the result (`sys_write`).

---


