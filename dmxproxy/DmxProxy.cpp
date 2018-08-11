#include "DmxProxy.h"
#include "Debug.h"
#include "bits.h"

#include <string.h>

extern Debug debug;

DmxProxy::DmxProxy(uint8_t uartIndex):
	uart(uartIndex),
	framebufferInIndex(0),
	framebufferOutIndex(0),
	framebufferIn(),
	framebufferOut()
{
}

void DmxProxy::enable() {
	uart.configureBaudRate(DmxProxy::BAUD_RATE);
	uart.enableRx();
}

void DmxProxy::process() {
	if(uart.rxComplete()) {
		uint8_t byte = uart.lastRxByte();

		if(uart.frameError()) {
			debug.blink();
			debug.blink();
		}

//		debug.print(byte);
//		debug.print(" ");
	}
}
