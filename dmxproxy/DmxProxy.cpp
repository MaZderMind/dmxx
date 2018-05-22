#include "DmxProxy.h"
#include "bits.h"

DmxProxy::DmxProxy(uint8_t uartIndex):
	uart(uartIndex),
	foundFrame(false),
	framebufferInIndex(0),
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
	uart.busyLoopUntilError();
	uart.busyLoopUntilRxComplete();
	uint8_t inputByte = uart.lastByte();

	framebufferIn[++framebufferInIndex] = inputByte;

	if(framebufferInIndex == DmxProxy::FRAME_SIZE) {
		callback(framebufferIn, framebufferOut);
		framebufferInIndex = 0;
	}
}
