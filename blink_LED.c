#include <avr/io.h>
#include <util/delay.h>

#define MS_DELAY 3000

int main()
{
    DDRB |= _BV(DDB5);

        while (1)
        {
            PORTB |= _BV(PORTB);
            _delay_ms(MS_DELAY);
            PORTB &= ~_BV(PORTB);
            _delay_ms(MS_DELAY);
        }     
}