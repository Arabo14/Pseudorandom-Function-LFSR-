This project implements a 32-bit Linear Feedback Shift Register (LFSR) in both C and IA-32 (x86)
Assembly using AT&T syntax. The LFSR uses taps at bit positions 32, 30, 26, and 25 (i.e., zero-indexed
bits 31, 29, 25, and 24) to generate a maximal length pseudorandom sequence. A total of 4294967295 unique
32-bit values can be generated.
The implementation uses the Fibonacci LFSR approach, where feedback is inserted at the least significant bit
after being computed from XORing the tap bits.
