#include <avr/io.h>
.equ LED_PINA, 0
.equ LED_PINB, 1
.equ LED_PINC, 2
.section .text
.global main

main:
    ; ----- Configurar PB0,PB1 Y PB2 como salida -----
    sbi _SFR_IO_ADDR(DDRB), LED_PINA
    sbi _SFR_IO_ADDR(DDRB), LED_PINB
    sbi _SFR_IO_ADDR(DDRB), LED_PINC

MAIN_LOOP:
    ;------- LED A -------
    sbi _SFR_IO_ADDR(PORTB), LED_PINA
    rcall DELAY
    cbi _SFR_IO_ADDR(PORTB), LED_PINA
    rcall DELAY

    ; ----- LED B -----
    sbi _SFR_IO_ADDR(PORTB), LED_PINB
    rcall DELAY
    cbi _SFR_IO_ADDR(PORTB), LED_PINB
    rcall DELAY

    ; ----- LED C -----
    sbi _SFR_IO_ADDR(PORTB), LED_PINC
    rcall DELAY
    cbi _SFR_IO_ADDR(PORTB), LED_PINC
    rcall DELAY
    
    ;----- LED B -----
    sbi _SFR_IO_ADDR(PORTB), LED_PINB
    rcall DELAY
    cbi _SFR_IO_ADDR(PORTB), LED_PINB
    rcall DELAY

    
    rjmp MAIN_LOOP

; ============================================================
;  Subrutina de retardo
; ============================================================
DELAY:
    ldi R18, 0x10
DELAY1:
    ldi R19, 0xFF
DELAY2:
    ldi R20, 0xFF
DELAY3:
    subi R20, 1
    brne DELAY3
    subi R19, 1
    brne DELAY2
    subi R18, 1
    brne DELAY1
    ret


