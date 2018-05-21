#include "Arduino.h"

#include "DmxProxy.h"
#include "bits.h"

DmxProxy::DmxProxy(uint8_t uartIndex):
	foundFrame(false),
	framebufferInIndex(0),
	framebufferIn(FRAME_SIZE),
	framebufferOut(FRAME_SIZE)
{
	uart = new Uart(uartIndex);
}

void DmxProxy::begin() {
	// set 250 kBaud
	uart->configureBaudRate(DmxProxy::BAUD_RATE);

	uart->enableTx();
	uart->enableRx();
}

void DmxProxy::process() {
	uart->busyLoopUntilRxComplete();

	// read byte
	uint8_t inputByte = uart->udr;

	framebufferIn[++framebufferInIndex] = inputByte;

	if(framebufferInIndex == DmxProxy::FRAME_SIZE) {
		Serial.println("Calling Callback");
		callback(framebufferIn, framebufferOut);
		framebufferInIndex = 0;
	}
}

DmxProxy::~DmxProxy() {
	delete uart;
}
