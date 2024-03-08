

#define F_CPU 16000000L
#include <avr/io.h>
#include <util/delay.h>
#include <GPIO.h>
#include <UART.h>

int main()
{
    UART_Init0();
    char rec[100];
    printstring0("<<<<<<<<<< Application Header >>>>>>>>>>\n\n");

    while (1)
    {
        printstring0("\n Massage Transmited \n");
        rxstring0(rec);

        printstring0("\t Massage Recived \n");
        printstring0(rec);
    }
}