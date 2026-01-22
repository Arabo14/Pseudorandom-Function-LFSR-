# 32-bit Linear Feedback Shift Register (LFSR) – C and Assembly

This project demonstrates a **32-bit Linear Feedback Shift Register (LFSR)** implemented in **x86 (IA-32) assembly** and tested using a **C driver program**. The LFSR generates a sequence of pseudo-random values based on a given seed and fixed tap positions.

## Features
- 32-bit LFSR implementation written entirely in x86 assembly
- C program used to drive and test the assembly function
- Supports seeding the LFSR with a non-zero initial value
- Generates deterministic pseudo-random output
- Demonstrates C and assembly language integration

## LFSR Configuration
The LFSR uses the following tap positions:
- Bit 31
- Bit 29
- Bit 25
- Bit 24

These bits are XORed to generate the feedback bit, which is shifted into the least significant bit during each iteration.

## Project Structure
- `main.c` – C driver program that calls the assembly LFSR function and prints output
- `lfsr32.s` – x86 assembly implementation of the 32-bit LFSR
- `README.md` – Project documentation

## How It Works
The C program initializes a seed value and repeatedly calls the assembly function `lfsr32`. The assembly routine updates a static LFSR state using XOR-based feedback logic and returns the next pseudo-random value. If a seed value of zero is passed, the function continues from the previously stored LFSR state.

## How to Compile and Run

### Compile
```bash
gcc -m32 main.c lfsr32.s -o lfsr32
