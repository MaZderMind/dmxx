#include "Debug.h"

#include <stdlib.h>
#include "bits.h"

Debug::Debug()
{
	SETBIT(BLINK_DDR, BLINK_PIN);
}
void Debug::blink() {
	blink(true);
	blink(false);
}

void Debug::blink(bool value) {
	SETBITIF(BLINK_PORT, BLINK_PIN, value);
}

void Debug::toggle() {
	TOGGLEBIT(BLINK_PORT, BLINK_PIN);
}
