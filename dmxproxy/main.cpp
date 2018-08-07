#include "DmxProxy.h"
#include "Debug.h"

Debug debug(0);
//DebugStub debug;
DmxProxy proxy(1);

void frameCallback(uint8_t *input, uint8_t *output) {
	debug.print("got frame \n");
	for(uint16_t i = 0; i < DmxProxy::FRAME_SIZE; i++) {
		debug.print(input[i]);
		debug.print(" "); 
	}
	debug.print("\n");

	output[0] = input[0];
	output[1] = 255 - input[0];

	output[2] = input[1];
	output[3] = input[1];
	output[4] = input[1];

	debug.print("new frame \n");
	for(uint16_t i = 0; i < DmxProxy::FRAME_SIZE; i++) {
		debug.print(output[i]);
		debug.print(" "); 
	}
	debug.print("\n");
}

int main() {
	debug.print("setup\n");

	proxy.setFrameProcessorCallback(&frameCallback);
	proxy.enable();

	debug.print("done");

	while(true) {
		debug.print("process");
		proxy.process();
		debug.print("done");
	}
}
