#include "DmxProxy.h"

Uart debugUart(0);
DmxProxy proxy(1);

void frameCallback(uint8_t *input, uint8_t *output) {
	debugUart.transmit("got frame \n");
	for(uint16_t i = 0; i < DmxProxy::FRAME_SIZE; i++) {
		debugUart.transmit(input[i]);
		debugUart.transmit(" "); 
	}
	debugUart.transmit("\n");

	output[0] = input[0];
	output[1] = 255 - input[0];

	output[2] = input[1];
	output[3] = input[1];
	output[4] = input[1];

	debugUart.transmit("new frame \n");
	for(uint16_t i = 0; i < DmxProxy::FRAME_SIZE; i++) {
		debugUart.transmit(output[i]);
		debugUart.transmit(" "); 
	}
	debugUart.transmit("\n");
}

int main() {
	debugUart.configureBaudRate(115200);
	debugUart.enable();

	debugUart.transmit("setup\n");

	proxy.setFrameProcessorCallback(&frameCallback);
	proxy.enable();

	debugUart.transmit("done");

	while(true) {
		debugUart.transmit("process");
		proxy.process();
		debugUart.transmit("done");
	}
}
