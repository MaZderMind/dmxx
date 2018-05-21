#include "DmxProxy.h"

DmxProxy proxy(1);

void frameCallback(std::vector<uint8_t> input, std::vector<uint8_t> output) {
	Serial.print("got frame ");
	for(auto byte: input) { Serial.print(byte); Serial.print(" "); }
	Serial.println();

	output[0] = input[0];
	output[1] = 255 - input[0];

	output[2] = input[1];
	output[3] = input[1];
	output[4] = input[1];

	Serial.print("new frame ");
	for(auto byte: output) { Serial.print(byte); Serial.print(" "); }
	Serial.println();
}

void setup() {
	Serial.begin(115200);
	Serial.println("setup");
	proxy.setFrameProcessorCallback(&frameCallback);
	proxy.begin();
	Serial.println("done");
}

void loop() {
	Serial.println("process");
	proxy.process();
	Serial.println("done");
}
