#ifndef DMX_PROXY_H
#define DMX_PROXY_H

#include <inttypes.h>

#include "Uart.h"

class DmxProxy {
public:
	static const uint16_t FRAME_SIZE = 512;

private:
	static const uint32_t BAUD_RATE = 250000;

private:
	typedef void (callback_t)(uint8_t*, uint8_t*);

public:
	DmxProxy(uint8_t uartIndex);

	void setFrameProcessorCallback(callback_t *callback) { this->callback = callback; }

	void enable();
	void process();

private:
	Uart uart;
	callback_t *callback;

	uint16_t framebufferIndex;

	uint8_t framebufferIn[FRAME_SIZE];
	uint8_t framebufferOut[FRAME_SIZE];
};

#endif // DMX_PROXY_H
