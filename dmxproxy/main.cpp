#include "DmxProxy.h"
#include "Debug.h"

Debug debug(0);
//DebugStub debug;
DmxProxy proxy(1);

void frameCallback(uint8_t *input, uint8_t *output) {
	debug.println("got frame");
	for(uint16_t i = 0; i < DmxProxy::FRAME_SIZE; i++) {
		debug.print(input[i]);
		debug.print(" "); 
	}
	debug.println();

	output[0] = input[0];
	output[1] = 255 - input[0];

	output[2] = input[1];
	output[3] = input[1];
	output[4] = input[1];

	debug.println("new frame");
	for(uint16_t i = 0; i < DmxProxy::FRAME_SIZE; i++) {
		debug.print(output[i]);
		debug.print(" "); 
	}
	debug.println();
}

int main() {
	debug.println("setup");

	proxy.setFrameProcessorCallback(&frameCallback);
	proxy.enable();

	debug.println("done");

	while(true) {
//		debug.println("process");
		proxy.process();
//		debug.println("done");
	}
}
