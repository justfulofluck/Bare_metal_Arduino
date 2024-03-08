#include <avr/io.h>
#include <util/delay.h>

#define F_CPU 16000000L
#define uart_0_ucsrA
#define uart_0_ucsrB
#define uart_0_ucsrC
#define uart_0_UDR

void UART_Init0();
void UART_RXChar0();
char UART_TXChar0();
void rxstring0(char *buffer);
void printstring0(const char *mystring);
void bit0(uint32_t val);
void decimal(uint32_t val);

#include "UART.cpp"