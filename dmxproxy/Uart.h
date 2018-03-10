#ifndef UART_H
#define UART_H

#include <inttypes.h>

class Uart {
public:
	Uart(int uartIndex);

	void configureBaudRate(uint16_t baudRate);

public:
	uint8_t* ucsra, ucsrb, ucsrc; // UART Control and Status Register A/B/C
	uint8_t* udr; // UART Data Register
	uint8_t* ubrrl, ubrrh; // UART Baud Rate Register Low/High
};

#endif
