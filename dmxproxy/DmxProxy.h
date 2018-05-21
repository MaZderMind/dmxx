#ifndef DMX_PROXY_H
#define DMX_PROXY_H

#include <inttypes.h>

#include <StandardCplusplus.h>
#include <vector>

#include "Uart.h"

class DmxProxy {
private:
	static const uint16_t BAUD_RATE = 250000UL;
	static const uint16_t FRAME_SIZE = 512;

private:
	typedef void (callback_t)(std::vector<uint8_t>, std::vector<uint8_t>);

public:
	DmxProxy(uint8_t uartIndex);
	~DmxProxy();

	void setFrameProcessorCallback(callback_t *callback) { this->callback = callback; }

	void begin();
	void process();

private:
	Uart *uart;
	callback_t *callback;
	bool foundFrame;

	std::vector<uint8_t> framebufferIn;
	std::vector<uint8_t> framebufferOut;

	uint16_t framebufferInIndex;
};

#endif // DMX_PROXY_H
