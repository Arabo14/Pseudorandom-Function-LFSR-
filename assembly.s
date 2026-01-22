.globl _lfsr32
    .text

# unsigned long lfsr32(unsigned long seed)
# Input:  8(%ebp) � seed
# Output: %eax � updated LFSR value

_lfsr32:
    pushl   %ebp
    movl    %esp, %ebp
    pushl   %ebx
    pushl   %esi
    pushl   %edi

    movl    8(%ebp), %edi          # Load seed into %edi
    cmpl    $0, %edi
    jne     use_seed               # If seed != 0, use it

    movl    lfsr, %eax             # Load stored static LFSR value
    jmp     start_lfsr

use_seed:
    movl    %edi, %eax             # Use provided seed
    movl    %eax, lfsr             # Store as current LFSR value

start_lfsr:
    xorl    %esi, %esi             # result = 0
    movl    $32, %ecx              # Loop counter (32 bits)

lfsr_loop:
    movl    lfsr, %ebx             # Copy current LFSR value
    movl    %ebx, %edx
    shrl    $31, %ebx              # Bit 31
    movl    %edx, %eax
    shrl    $29, %eax              # Bit 29
    xorl    %eax, %ebx
    movl    %edx, %eax
    shrl    $25, %eax              # Bit 25
    xorl    %eax, %ebx
    movl    %edx, %eax
    shrl    $24, %eax              # Bit 24
    xorl    %eax, %ebx
    andl    $1, %ebx               # Isolate feedback bit

    shll    $1, lfsr               # lfsr <<= 1
    orl     %ebx, lfsr             # lfsr |= feedback

    # Optional: build a result of 32 generated bits (not used here)
    shll    $1, %esi
    movl    lfsr, %eax
    andl    $1, %eax
    orl     %eax, %esi

    loop    lfsr_loop

    movl    lfsr, %eax             # Return updated lfsr in %eax

    popl    %edi
    popl    %esi
    popl    %ebx
    popl    %ebp
    ret

.data
lfsr:
    .long   1                      # Default LFSR value if seed is 0
