
#define F_CPU 16000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdint.h>

volatile uint16_t contador_ms = 0;
volatile uint16_t velocidad = 1000;

ISR(TIMER1_COMPA_vect)
{
    contador_ms++;

    if (contador_ms >= velocidad / 2) {

        PORTC ^= (1 << PC2);

        contador_ms = 0;
    }
}

int main()
{
    // LED en PC2 como salida
    DDRC |= (1 << DDC2);

    // DIP switches en PD2 y PD3 como entradas
    DDRD &= ~((1 << DDD2) | (1 << DDD3));

    // Activar resistencias pull-up
    PORTD |= (1 << PORTD2) | (1 << PORTD3);

    // Configuración Timer1
    TCCR1A = 0;
    TCCR1B = 0;
    TCNT1 = 0;

    OCR1A = 249;

    // Modo CTC
    TCCR1B |= (1 << WGM12);

    // Prescaler 64
    TCCR1B |= (1 << CS11) | (1 << CS10);

    // Habilitar interrupción
    TIMSK1 |= (1 << OCIE1A);

    sei();

    while(1)
    {
        uint8_t dip1 = !(PIND & (1 << PD2));
        uint8_t dip2 = !(PIND & (1 << PD3));

        if(dip1 == 0 && dip2 == 0)
        {
            velocidad = 1000;
        }
        else if(dip1 == 1 && dip2 == 0)
        {
            velocidad = 500;
        }
        else if(dip1 == 0 && dip2 == 1)
        {
            velocidad = 100;
        }
        else
        {
            velocidad = 1000;
        }
    }
}

