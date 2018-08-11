#include "DmxProxy.h"
#include "Debug.h"

Debug debug(0);
//DebugStub debug;
DmxProxy proxy(1);

uint16_t frameCallback(uint8_t *input, uint8_t *output) {
	uint16_t total = input[7];
	output[0*16 + 4] = total * input[0] / 255; // total fixture 0
	output[1*16 + 4] = total * input[1] / 255; // total fixture 1
	output[2*16 + 4] = total * input[2] / 255; // total fixture 2
	output[3*16 + 4] = total * input[3] / 255; // total fixture 3

	uint8_t cold = input[6];
	uint8_t warm = 255 - cold;

	output[0*16 + 0] = cold; // cold fixture 0
	output[0*16 + 1] = warm; // warm fixture 0

	output[1*16 + 0] = cold; // cold fixture 1
	output[1*16 + 1] = warm; // warm fixture 1

	output[2*16 + 0] = cold; // cold fixture 2
	output[2*16 + 1] = warm; // warm fixture 2

	output[3*16 + 0] = cold; // cold fixture 3
	output[3*16 + 1] = warm; // warm fixture 3

	return 4*16; // number of channels to transmit = 4 fixtures * 16 channels
}

int main() {
	debug.println("setup");

	proxy.setFrameProcessorCallback(&frameCallback);
	proxy.enable();

	debug.println("done");

	while(true) {
		proxy.process();
	}
}
