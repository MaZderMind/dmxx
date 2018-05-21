#include "Uart.h"

Uart::Uart(int uartIndex) : uartIndex(uartIndex) {
}

void Uart::configureBaudRate(uint16_t baud) {
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
	switch(uartIndex) {
		case 0:
			SETBITIF(UCSRA, U2X, u2x);
			UBRRH = (uint8_t)(baud_setting >> 8);
			UBRRL = (uint8_t)baud_setting;
		break;

		case 1:
			SETBITIF(UCSRA, U2X, u2x);
			UBRRH = (uint8_t)(baud_setting >> 8);
			UBRRL = (uint8_t)baud_setting;
		break;

		case 0:
			SETBITIF(UCSRA, U2X, u2x);
			UBRRH = (uint8_t)(baud_setting >> 8);
			UBRRL = (uint8_t)baud_setting;
		break;

		case 0:
			SETBITIF(UCSRA, U2X, u2x);
			UBRRH = (uint8_t)(baud_setting >> 8);
			UBRRL = (uint8_t)baud_setting;
		break;
}


void Uart::enableTx() {

}
void Uart::disableTx() {

}

void Uart::enableRx() {

}
void Uart::disableRx() {

}
