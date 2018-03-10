#ifndef DMX_PROXY_H
#define DMX_PROXY_H

#include <inttypes.h>

#include <StandardCplusplus.h>
#include <vector>

#include "Uart.h"

class DmxProxy {
private:
	static const uint16_t BAUD_RATE = 250000UL;

private:
	typedef void (callback_t)(std::vector<uint8_t>, std::vector<uint8_t>);

public:
	DmxProxy(uint8_t uartIndex);
	~DmxProxy();

	void setFrameProcessorCallback(callback_t *_callback) { this->callback = _callback; }

	void begin();
	void process();

private:
	Uart *uart;
	callback_t *callback;

	std::vector<uint8_t> framebuffer_in;
	std::vector<uint8_t> framebuffer_out;
};

#endif // DMX_PROXY_H
