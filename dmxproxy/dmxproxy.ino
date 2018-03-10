#include "DmxProxy.h"

DmxProxy proxy(1);

void frameCallback(std::vector<uint8_t> input, std::vector<uint8_t> output) {
	output[0] = input[0];
	output[1] = 255 - input[0];

	output[2] = input[1];
	output[3] = input[1];
	output[4] = input[1];
}

void setup() {
	proxy.setFrameProcessorCallback(&frameCallback);
	proxy.begin();
}

void loop() {
	proxy.process();
}
