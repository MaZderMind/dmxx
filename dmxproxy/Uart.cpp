#include <avr/io.h>
#include "Uart.h"

// define generic register and bit names
#ifndef UDR
	#define UCSRA UCSR0A
	#define UCSRB UCSR0B
	#define UCSRC UCSR0C
	#define UDR UDR0
	#define UBRRL UBRR0L
	#define UBRRH UBRR0H

	#define RXC RXC0
	#define TXC TXC0
	#define UDRE UDRE0
	#define FE FE0
	#define DOR DOR0
	#define PE PE0
	#define U2X U2X0
	#define MPCM MPCM0
	#define RXCIE RXCIE0
	#define TXCIE TXCIE0
	#define UDRIE UDRIE0
	#define RXEN RXEN0
	#define TXEN TXEN0
	#define UCSZ2 UCSZ20
	#define RXB8 RXB80
	#define TXB8 TXB80
	#define URSEL URSEL0
	#define UMSEL UMSEL0
	#define UPM1 UPM10
	#define UPM0 UPM00
	#define USBS USBS0
	#define UCSZ1 UCSZ10
	#define UCSZ0 UCSZ00
	#define UCPOL UCPOL0
#endif

Uart::Uart(int uartIndex) {
	switch(uartIndex) {
		case 0:
			this->ucsra = UCSRA;
			this->ucsrb = UCSRB;
			this->ucsrc = UCSRC;
			this->udr = UDR;
			this->ubrrl = UBRRL;
			this->ubrrh = UBRRH;

#ifdef UDR1
	case 1:
			this->ucsra = UCSR1A;
			this->ucsrb = UCSR1B;
			this->ucsrc = UCSR1C;
			this->udr = UDR1;
			this->ubrrl = UBRR1L;
			this->ubrrh = UBRR1H;
#endif

#ifdef UDR2
	case 2:
			this->ucsra = UCSR2A;
			this->ucsrb = UCSR2B;
			this->ucsrc = UCSR2C;
			this->udr = UDR2;
			this->ubrrl = UBRR2L;
			this->ubrrh = UBRR2H;
#endif

#ifdef UDR3
	case 3:
			this->ucsra = UCSR3A;
			this->ucsrb = UCSR3B;
			this->ucsrc = UCSR3C;
			this->udr = UDR3;
			this->ubrrl = UBRR3L;
			this->ubrrh = UBRR3H;
#endif
	}
}

void Uart::configureBaudRate(uint16_t baud) {
	// Try u2x mode first
	uint16_t baud_setting = (F_CPU / 4 / baud - 1) / 2;
	this->ucsra = 1 << U2X;

	// hardcoded exception for 57600 for compatibility with the bootloader
	// shipped with the Duemilanove and previous boards and the firmware
	// on the 8U2 on the Uno and Mega 2560. Also, The baud_setting cannot
	// be > 4095, so switch back to non-u2x mode if the baud rate is too
	// low.
	if (((F_CPU == 16000000UL) && (baud == 57600)) || (baud_setting >4095))
	{
		this->ucsra = 0;
		baud_setting = (F_CPU / 8 / baud - 1) / 2;
	}

	// assign the baud_setting, a.k.a. ubrr (USART Baud Rate Register)
	this->ubrrh = baud_setting >> 8;
	this->ubrrl = baud_setting;
}
