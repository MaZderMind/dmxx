#include "DmxProxy.h"

DmxProxy::DmxProxy(uint8_t uartIndex)
{
	uart = new Uart(uartIndex);
}

void DmxProxy::begin() {
	uart->configureBaudRate(DmxProxy::BAUD_RATE);
}

void DmxProxy::process() {
	callback(framebuffer_in, framebuffer_out);
}

DmxProxy::~DmxProxy() {
	delete uart;
}
