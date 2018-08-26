#include "DmxProxy.h"
#include "bits.h"

#include <string.h>

DmxProxy::DmxProxy(uint8_t uartIndex):
	uart(uartIndex),
	txState(DmxProxyTxState::BREAK),
	txMarkAfterBreakCounter(0),
	framebufferInIndex(0),
	framebufferOutIndex(0),
	framebufferOutUsed(0),
	framebufferIn(),
	framebufferOut()
{
}

void DmxProxy::enable() {
	uart.configureBaudRate(DmxProxy::BAUD_RATE);
	uart.configure8N2();
	uart.enableRx();
}

void DmxProxy::process() {
	processRx();
	processTx();
}

void DmxProxy::processRx() {
	if(uart.rxComplete()) {
		// something recevied
		uint8_t byte = uart.lastRxByte();

		if(uart.frameError()) {
			if(framebufferOutIndex == framebufferOutUsed) {
				// everything in the out-buffer has been transmitted
				// calculate new data for the out-buffer

				// process received channels
				framebufferOutUsed = callback(framebufferIn, framebufferOut);
				framebufferOutIndex = 0;

				if(framebufferOutUsed > 0) {
					// if something has to be transmitted, enable the transmitter
					uart.enableTx();
					txState = DmxProxyTxState::MARK_AFTER_BREAK;
				}

				// reset in-buffer pointer
				framebufferInIndex = 0;
			}
		}
		else {
			// read & store byte
			framebufferIn[framebufferInIndex++] = byte;

			if(framebufferInIndex > DmxProxy::FRAME_SIZE) {
				// wrap around after receiving 512 channels
				framebufferInIndex = 0;
			}
		}
	}
}

void DmxProxy::processTx() {
	if(framebufferOutIndex < framebufferOutUsed) {
		if(txState == DmxProxyTxState::MARK_AFTER_BREAK) {
			// set tx-pin high for as long as configured by MARK_AFTER_BREAK_COUNT
			if(txMarkAfterBreakCounter < DmxProxy::MARK_AFTER_BREAK_COUNT) {
				uart.setTxLevel(true);
				txMarkAfterBreakCounter++;
			}
			else {
				// end MARK_AFTER_BREAK otherwise and switch to Slot0
				txMarkAfterBreakCounter = 0;
				txState = DmxProxyTxState::SLOT0;
				uart.setTxLevel(false);
			}
		}
		else if(txState == DmxProxyTxState::SLOT0) {
			// if transmission is possible, transmit slot0
			if(uart.txPossible()) {
				uart.transmit(0);
				txState = DmxProxyTxState::CONTENT;
			}
		}
		else if(txState == DmxProxyTxState::CONTENT) {
			// if transmission is possible, transmit data
			if(uart.txPossible()) {
				uart.transmit(framebufferOut[framebufferOutIndex++]);
			}

			if(framebufferOutIndex == framebufferOutUsed) {
				// eveything has been transmitted, disable the transmitter and enter BREAK
				uart.disableTx();
				txState = DmxProxyTxState::BREAK;
			}
		}
	}
}
