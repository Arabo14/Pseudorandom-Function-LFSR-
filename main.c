#include <stdio.h>
#include <stdint.h>

// Assembly version of lfsr32 will be linked

extern unsigned int lfsr32(unsigned int seed);


int main() {
    uint32_t seed = 0x5AA5FF00;
    printf("First 20 values of LFSR32 (seed = 0x%X):\n", seed);
    for (int i = 0; i < 20; i++) {
        seed = lfsr32(seed);
        printf("%2d: 0x%08X\n", i + 1, seed);
    }

    return 0;
}
