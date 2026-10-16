#include <avr/io.h>

.section .text
.global main

main:
    ldi r16, 0xFF   
    ldi r17, 0x01

    add r16, r17

MAIN_LOOP:
    rjmp MAIN_LOOP
