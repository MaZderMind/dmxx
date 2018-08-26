#include "bits.h"
#include "Uart.h"

Uart::Uart(int uartIndex) : uartIndex(uartIndex) {
	configurePins();
}
void Uart::configure8N1() {
	#if !UART_SUPPORTS_MULTIPLE
		SETBITS(UCSRC, BIT(UCSZ1) | BIT(UCSZ0));  // Asynchron 8N1
	#else
		switch(uartIndex) {
			case 0:
				SETBITS(UCSR0C, BIT(UCSZ00) | BIT(UCSZ01));  // Asynchron 8N1
			break;
			case 1:
				SETBITS(UCSR1C, BIT(UCSZ10) | BIT(UCSZ11));  // Asynchron 8N1
			break;
			case 2:
				SETBITS(UCSR2C, BIT(UCSZ20) | BIT(UCSZ21));  // Asynchron 8N1
			break;
			case 3:
				SETBITS(UCSR3C, BIT(UCSZ30) | BIT(UCSZ31));  // Asynchron 8N1
			break;
		}
	#endif
}

void Uart::configure8N2() {
	#if !UART_SUPPORTS_MULTIPLE
		SETBITS(UCSRC, BIT(USBS) | BIT(UCSZ1) | BIT(UCSZ0));  // Asynchron 8N2
	#else
		switch(uartIndex) {
			case 0:
				SETBITS(UCSR0C, BIT(USBS0) | BIT(UCSZ00) | BIT(UCSZ01));  // Asynchron 8N2
			break;
			case 1:
				SETBITS(UCSR1C, BIT(USBS1) | BIT(UCSZ10) | BIT(UCSZ11));  // Asynchron 8N2
			break;
			case 2:
				SETBITS(UCSR2C, BIT(USBS2) | BIT(UCSZ20) | BIT(UCSZ21));  // Asynchron 8N2
			break;
			case 3:
				SETBITS(UCSR3C, BIT(USBS3) | BIT(UCSZ30) | BIT(UCSZ31));  // Asynchron 8N2
			break;
		}
	#endif
}

void Uart::configurePins() {
	#if !UART_SUPPORTS_MULTIPLE
		CLEARBIT(UART_DDR, UART_PIN_RX); // input
		CLEARBIT(UART_PORT, UART_PIN_RX); // pullup off
		SETBIT(UART_DDR, UART_PIN_TX);    // output
		CLEARBIT(UART_PORT, UART_PIN_TX); // low
	#else
		switch(uartIndex) {
			case 0:
				CLEARBIT(UART0_DDR, UART0_PIN_RX);  // input
				CLEARBIT(UART0_PORT, UART0_PIN_RX); // pullup off
				SETBIT(UART0_DDR, UART0_PIN_TX);    // output
				CLEARBIT(UART0_PORT, UART0_PIN_TX); // low
			break;
			case 1:
				CLEARBIT(UART1_DDR, UART1_PIN_RX);  // input
				CLEARBIT(UART1_PORT, UART1_PIN_RX); // pullup off
				SETBIT(UART1_DDR, UART1_PIN_TX);    // output
				CLEARBIT(UART1_PORT, UART1_PIN_TX); // low
			break;
			case 2:
				CLEARBIT(UART2_DDR, UART2_PIN_RX);  // input
				CLEARBIT(UART2_PORT, UART2_PIN_RX); // pullup off
				SETBIT(UART2_DDR, UART2_PIN_TX);    // output
				CLEARBIT(UART2_PORT, UART2_PIN_TX); // low
			break;
			case 3:
				CLEARBIT(UART3_DDR, UART3_PIN_RX);  // input
				CLEARBIT(UART3_PORT, UART3_PIN_RX); // pullup off
				SETBIT(UART3_DDR, UART3_PIN_TX);    // output
				CLEARBIT(UART3_PORT, UART3_PIN_TX); // low
			break;
		}
	#endif
}

void Uart::setTxLevel(bool value) {
	#if !UART_SUPPORTS_MULTIPLE
		SETBITIF(UART_PORT, UART_PIN_TX, value);
	#else
		switch(uartIndex) {
			case 0:
				SETBITIF(UART0_PORT, UART0_PIN_TX, value);
			break;
			case 1:
				SETBITIF(UART1_PORT, UART1_PIN_TX, value);
			break;
			case 2:
				SETBITIF(UART2_PORT, UART2_PIN_TX, value);
			break;
			case 3:
				SETBITIF(UART3_PORT, UART3_PIN_TX, value);
			break;
		}
	#endif
}

void Uart::configureBaudRate(uint32_t baud) {
	// Try u2x mode first
	uint16_t baud_setting = (F_CPU / 4 / baud - 1) / 2;
	bool u2x = true;

	// hardcoded exception for 57600 for compatibility with the bootloader
	// shipped with the Duemilanove and previous boards and the firmware
	// on the 8U2 on the Uno and Mega 2560. Also, The baud_setting cannot
	// be > 4095, so switch back to non-u2x mode if the baud rate is too
	// low.
	if (((F_CPU == 16000000UL) && (baud == 57600)) || (baud_setting >4095))
	{
		u2x = false;
		baud_setting = (F_CPU / 8 / baud - 1) / 2;
	}

	// assign the baud_setting, a.k.a. ubrr (USART Baud Rate Register)
	#if !UART_SUPPORTS_MULTIPLE
		SETBITIF(UCSRA, U2X, u2x);
		UBRRH = (uint8_t)(baud_setting >> 8);
		UBRRL = (uint8_t)baud_setting;
	#else
		uint8_t ubrrh = (uint8_t)(baud_setting >> 8);
		uint8_t ubrrl = (uint8_t)baud_setting;
		switch(uartIndex) {
			case 0:
				SETBITIF(UCSR0A, U2X0, u2x);
				UBRR0H = ubrrh;
				UBRR0L = ubrrl;
			break;

			case 1:
				SETBITIF(UCSR1A, U2X1, u2x);
				UBRR1H = ubrrh;
				UBRR1L = ubrrl;
			break;

			case 2:
				SETBITIF(UCSR2A, U2X2, u2x);
				UBRR2H = ubrrh;
				UBRR2L = ubrrl;
			break;

			case 3:
				SETBITIF(UCSR3A, U2X3, u2x);
				UBRR3H = ubrrh;
				UBRR3L = ubrrl;
			break;
		}
	#endif
}

void Uart::enable() {
	enableRx();
	enableTx();
}

void Uart::enableTx() {
	setTxEnabled(true);
}
void Uart::disableTx() {
	setTxEnabled(false);
}
void Uart::enableRx() {
	setRxEnabled(true);
}
void Uart::disableRx() {
	setRxEnabled(false);
}

void Uart::setTxEnabled(bool enabled) {
	#if !UART_SUPPORTS_MULTIPLE
		SETBITIF(UCSRB, TXEN, enabled);
	#else
		switch(uartIndex) {
			case 0:
				SETBITIF(UCSR0B, TXEN0, enabled)
			break;
			case 1:
				SETBITIF(UCSR1B, TXEN1, enabled)
			break;
			case 2:
				SETBITIF(UCSR2B, TXEN2, enabled)
			break;
			case 3:
				SETBITIF(UCSR3B, TXEN3, enabled)
			break;
		}
	#endif
}

void Uart::setRxEnabled(bool enabled) {
	#if !UART_SUPPORTS_MULTIPLE
		SETBITIF(UCSRB, RXEN, enabled);
	#else
		switch(uartIndex) {
			case 0:
				SETBITIF(UCSR0B, RXEN0, enabled)
			break;
			case 1:
				SETBITIF(UCSR1B, RXEN1, enabled)
			break;
			case 2:
				SETBITIF(UCSR2B, RXEN2, enabled)
			break;
			case 3:
				SETBITIF(UCSR3B, RXEN3, enabled)
			break;
		}
	#endif
}

bool Uart::txPossible() {
	#if !UART_SUPPORTS_MULTIPLE
		return BITSET(UCSRA, UDRE);
	#else
		switch(uartIndex) {
			case 0:
				return BITSET(UCSR0A, UDRE0);
			break;
			case 1:
				return BITSET(UCSR1A, UDRE1);
			break;
			case 2:
				return BITSET(UCSR2A, UDRE2);
			break;
			case 3:
				return BITSET(UCSR3A, UDRE3);
			break;
		}
	#endif

	return false;
}

bool Uart::rxComplete() {
	#if !UART_SUPPORTS_MULTIPLE
		return BITSET(UCSRA, RXC);
	#else
		switch(uartIndex) {
			case 0:
				return BITSET(UCSR0A, RXC0);
			break;
			case 1:
				return BITSET(UCSR1A, RXC1);
			break;
			case 2:
				return BITSET(UCSR2A, RXC2);
			break;
			case 3:
				return BITSET(UCSR3A, RXC3);
			break;
		}
	#endif

	return false;
}

bool Uart::frameError() {
	#if !UART_SUPPORTS_MULTIPLE
		return BITSET(UCSRA, FE);
	#else
		switch(uartIndex) {
			case 0:
				return BITSET(UCSR0A, FE0);
			break;
			case 1:
				return BITSET(UCSR1A, FE1);
			break;
			case 2:
				return BITSET(UCSR2A, FE2);
			break;
			case 3:
				return BITSET(UCSR3A, FE3);
			break;
		}
	#endif

	return false;
}

uint8_t Uart::lastRxByte() {
	#if !UART_SUPPORTS_MULTIPLE
		return UDR;
	#else
		switch(uartIndex) {
			case 0:
				return UDR0;
			break;
			case 1:
				return UDR1;
			break;
			case 2:
				return UDR2;
			break;
			case 3:
				return UDR3;
			break;
		}
	#endif

	return 0;
}

void Uart::transmit(const uint8_t byte) {
	#if !UART_SUPPORTS_MULTIPLE
		UDR = byte;
	#else
		switch(uartIndex) {
			case 0:
				UDR0 = byte;
			break;
			case 1:
				UDR1 = byte;
			break;
			case 2:
				UDR2 = byte;
			break;
			case 3:
				UDR3 = byte;
			break;
		}
	#endif
}
