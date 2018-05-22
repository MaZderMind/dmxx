#ifndef UART_H
#define UART_H

#include <avr/io.h>
#include <inttypes.h>

#ifdef UDR4
	// supports up to 4 UARTs
	#define UART_SUPPORTS_MULTIPLE (1)
#else
	// only supports one UART but has numbered naming
	#ifdef UDR0
		#define UART_SUPPORTS_MULTIPLE (0)

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
	#else
		#ifdef UDR
		// only supports one UART with default-naming
			#define UART_SUPPORTS_MULTIPLE (0)
		#else
			#error Unsupported UART Configuration
		#endif
	#endif
#endif

class Uart {
public:
	Uart(int uartIndex);

	void configureBaudRate(uint32_t baudRate);

	void enable();

	void enableTx();
	void disableTx();

	void enableRx();
	void disableRx();

	void busyLoopUntilRxComplete();
	uint8_t lastByte();

	void transmit(const char* message);
	void transmit(const uint8_t number);

private:
	int uartIndex;
};

#endif
