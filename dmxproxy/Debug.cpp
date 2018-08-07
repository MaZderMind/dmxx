#include "Debug.h"

Debug::Debug(uint8_t uartIndex) : uart(uartIndex)
{
	uart.configureBaudRate(115200);
	uart.enable();
}

void Debug::print(const char* message) {
	uart.transmit(message);
}

void Debug::print(const uint8_t number) {
	uart.transmit(number);
}
