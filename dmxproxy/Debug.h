#ifndef DEBUG_H
#define DEBUG_H

#include <inttypes.h>

#include "Uart.h"

class Debug {
public:
	Debug(uint8_t uartIndex);

	void print(const char* message);
	void print(const uint8_t number);

private:
	Uart uart;
};

class DebugStub {
public:
	void print(const char* message) { (void)(message); }
	void print(const uint8_t number) { (void)(number); }
};

#endif
