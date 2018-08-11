#ifndef DEBUG_H
#define DEBUG_H

#include <inttypes.h>

#include "Uart.h"

#define BLINK_PORT PORTB
#define BLINK_DDR DDRB
#define BLINK_PIN PB7

class Debug {
private:
	static const uint32_t BAUD_RATE = 57600;

public:
	Debug(uint8_t uartIndex);

	void print(const char* message);
	void println(const char* message);
	void println();
	void print(const uint8_t number);

	void blink();

private:
	Uart uart;
};

class DebugStub {
public:
	void print(const char* message) { (void)(message); };
	void println(const char* message) { (void)(message); };
	void println() { };
	void print(const uint8_t number) { (void)(number); };
	void blink() { };
};

#endif
