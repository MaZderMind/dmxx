#include "DmxProxy.h"
#include "Debug.h"
#include "bits.h"

#include <string.h>

extern Debug debug;

DmxProxy::DmxProxy(uint8_t uartIndex):
	uart(uartIndex),
	framebufferIndex(0),
	framebufferIn(),
	framebufferOut()
{
}

void DmxProxy::enable() {
	// set 250 kBaud
	uart.configureBaudRate(DmxProxy::BAUD_RATE);
	uart.enable();
}

void DmxProxy::process() {
	debug.print("DmxProxy::process");
	UartBusyLoopReturn state = uart.busyLoopUntilErrorOrRxAndTxComplete();

	if(state == UartBusyLoopReturn::ERROR) {
		if(framebufferIndex > 0) {
			memset(framebufferOut, 0, sizeof(*framebufferOut));
			callback(framebufferIn, framebufferOut);
			memset(framebufferIn, 0, sizeof(*framebufferIn));
		}
	}
	else if(state == UartBusyLoopReturn::RXTX_COMPLETE) {
		if(framebufferIndex > DmxProxy::FRAME_SIZE) {
			return;
		}

		uart.transmit(framebufferOut[framebufferIndex]);

		framebufferIn[++framebufferIndex] = uart.lastRxByte();
	}
}
