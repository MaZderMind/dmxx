#ifndef DEBUG_H
#define DEBUG_H

#include <inttypes.h>

#include "Uart.h"

#ifdef __AVR_ATmega1280__
	#define BLINK_PORT PORTB
	#define BLINK_DDR DDRB
	#define BLINK_PIN PB7
#else
	#ifdef __AVR_ATmega328P__
		#define BLINK_PORT PORTB
		#define BLINK_DDR DDRB
		#define BLINK_PIN PB5
	#else
		#error Debug Pinset unknown for this Device
	#endif
#endif

class Debug {
public:
	Debug();

	void blink(bool value);
	void blink();
	void toggle();
};

#endif
