#include <avr/io.h>

.section .text
.global main

main:
    ldi r16, 0x10  
    ldi r17, 0x20

    add r16, r17

MAIN_LOOP:
    rjmp MAIN_LOOP


