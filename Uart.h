#ifndef UART_H
#define UART_H

#include <avr/io.h>
#include <inttypes.h>

#ifdef __AVR_ATmega1280__
	#define UART0_PORT PORTE
	#define UART0_DDR DDRE
	#define UART0_PIN_TX PE1
	#define UART0_PIN_RX PE0

	#define UART1_PORT PORTD
	#define UART1_DDR DDRD
	#define UART1_PIN_TX PD3
	#define UART1_PIN_RX PD1

	#define UART2_PORT PORTH
	#define UART2_DDR DDRH
	#define UART2_PIN_TX PH1
	#define UART2_PIN_RX PH0

	#define UART3_PORT PORTJ
	#define UART3_DDR  DDRJ
	#define UART3_PIN_TX PJ1
	#define UART3_PIN_RX PJ0
#else
	#ifdef __AVR_ATmega328P__
		#define UART_PORT PORTD
		#define UART_DDR DDRD
		#define UART_PIN_TX PD1
		#define UART_PIN_RX PD0
	#else
		#error UART Pinset unknown for this Device
	#endif
#endif


#ifdef UDR3
	// supports up to 4 UARTs
	#define UART_SUPPORTS_MULTIPLE (1)
	#pragma message("UART_SUPPORTS_MULTIPLE")
#else
	// only supports one UART but has numbered naming
	#ifdef UDR0
		#define UART_SUPPORTS_MULTIPLE (0)
		#pragma message("NO UART_SUPPORTS_MULTIPLE - NUMBERED")

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
		//#define URSEL URSEL0
		#define UMSEL UMSEL0
		#define UPM1 UPM10
		#define UPM0 UPM00
		#define USBS USBS0
		#define UCSZ1 UCSZ01
		#define UCSZ0 UCSZ00
		#define UCPOL UCPOL0
	#else
		#ifdef UDR
			// only supports one UART with default-naming
			#define UART_SUPPORTS_MULTIPLE (0)
			#pragma message("NO UART_SUPPORTS_MULTIPLE - NOT NUMBERED")
		#else
			#error Unsupported UART Configuration
		#endif
	#endif
#endif

class Uart {
public:
	Uart(int uartIndex);

	void configureBaudRate(uint32_t baudRate);
	void configure8N1();
	void configure8N2();

	void enable();

	void enableTx();
	void disableTx();

	void enableRx();
	void disableRx();

	void setTxLevel(bool level);

	void setTxEnabled(bool enabled);
	void setRxEnabled(bool enabled);

	bool rxComplete();
	bool txPossible();
	bool frameError();
	uint8_t lastRxByte();

	void transmit(const uint8_t byte);

private:
	void configurePins();

private:
	int uartIndex;
};

#endif
