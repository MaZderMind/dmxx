#include "Debug.h"

#include <stdlib.h>
#include "bits.h"

Debug::Debug(uint8_t uartIndex) : uart(uartIndex)
{
	uart.configureBaudRate(Debug::BAUD_RATE);
	uart.enable();

	SETBIT(BLINK_DDR, BLINK_PIN);
}

void Debug::print(const char* message) {
	const char * ptr;

	for (ptr = message; *ptr != '\0'; ptr++) {
		uart.transmit(*ptr);
		while(!uart.txComplete()); // maybe avoid busy loop in debug logic with buffer later
	}
}

void Debug::println(const char* message) {
	print(message);
	print("\r\n");
}

void Debug::println() {
	print("\r\n");
}

void Debug::print(const uint8_t number) {
	char buf[4]; // "255\0"
	itoa(number, buf, 10);
	print(buf);
}

void Debug::blink() {
	TOGGLEBIT(BLINK_PORT, BLINK_PIN);
}
