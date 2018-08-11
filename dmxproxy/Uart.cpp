#include "bits.h"
#include "Uart.h"

Uart::Uart(int uartIndex) : uartIndex(uartIndex) {
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
	setTx(true);
}
void Uart::disableTx() {
	setTx(false);
}
void Uart::enableRx() {
	setRx(true);
}
void Uart::disableRx() {
	setRx(false);
}

void Uart::setTx(bool enabled) {
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

void Uart::setRx(bool enabled) {
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

bool Uart::txComplete() {
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
