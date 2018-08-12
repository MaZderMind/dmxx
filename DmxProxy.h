#ifndef DMX_PROXY_H
#define DMX_PROXY_H

#include <inttypes.h>

#include "Uart.h"

enum class DmxProxyTxState { BREAK, MARK_AFTER_BREAK, SLOT0, CONTENT };

class DmxProxy {
public:
	static const uint16_t FRAME_SIZE = 512;

private:
	static const uint32_t BAUD_RATE = 250000;
	static const uint8_t MARK_AFTER_BREAK_COUNT = 12; // ~100µs

public:
	typedef uint16_t (callback_t)(uint8_t*, uint8_t*);

public:
	DmxProxy(uint8_t uartIndex);

	void setFrameProcessorCallback(callback_t *callback) { this->callback = callback; }

	void enable();
	void process();

private:
	void processRx();
	void processTx();

private:
	Uart uart;
	callback_t *callback;

	DmxProxyTxState txState;
	uint8_t txMarkAfterBreakCounter;

	uint16_t framebufferInIndex;
	uint16_t framebufferOutIndex;
	uint16_t framebufferOutUsed;

	uint8_t framebufferIn[FRAME_SIZE];
	uint8_t framebufferOut[FRAME_SIZE];
};

#endif // DMX_PROXY_H
