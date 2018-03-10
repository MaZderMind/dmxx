#include <inttypes.h>
#include <stdlib.h>

#include <avr/interrupt.h>
#include <avr/io.h>

#include <util/delay.h>

#include <Arduino.h>
#include <inttypes.h>

#define DMX_UBRRH UBRR1H
#define DMX_UBRRL UBRR1L
#define DMX_UCSRC UCSR1C
#define DMX_USBS USBS1
#define DMX_UCSZ0 UCSZ10
#define DMX_UCSZ1 UCSZ11
#define DMX_USBS USBS1
#define DMX_UCSRB UCSR1B
#define DMX_TXEN TXEN1
#define DMX_RXEN RXEN1
#define DMX_UCSRA UCSR1A
#define DMX_UDRE UDRE1
#define DMX_UDR UDR1
#define DMX_RXC RXC1
#define DMX_UDR UDR1
#define DMX_FE FE1

#define DMX_SLAVE_CHANNELS 20
#define DMX_MASTER_CHANNELS 20

#define BAUD 250000UL      // Baudrate

// Berechnungen
#define UBRR_VAL ((F_CPU+BAUD*8)/(BAUD*16)-1)   // clever runden
#define BAUD_REAL (F_CPU/(16*(UBRR_VAL+1)))     // Reale Baudrate
#define BAUD_ERROR ((BAUD_REAL*1000)/BAUD) // Fehler in Promille, 1000 = kein Fehler.

#if ((BAUD_ERROR<990) || (BAUD_ERROR>1010))
  #error Systematischer Fehler der Baudrate grösser 1% und damit zu hoch! 
#endif

const int ledPin = 13;
const int errPin = 2;

void blink() {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(500);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(500);                       // wait for a second
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(500);                       // wait for a second
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(500);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
}

// initialize the Hardware serial port with the given baud rate
// using 8 data data bits an 2 stop bits.
void initBoud()
{
  // assign the baud_setting to the USART Baud Rate Register
  DMX_UBRRH = UBRR_VAL >> 8;
  DMX_UBRRL = UBRR_VAL & 0xFF;

  // 2 stop bits and 8 bit character size, no parity
  DMX_UCSRC = (1<<DMX_USBS) | (1<<DMX_UCSZ0) | (1<<DMX_UCSZ1);
}

void initUart() {
    DMX_UCSRC = (1<<DMX_USBS);
    initBoud();
    DMX_UCSRB = (1<<DMX_TXEN) | (1<<DMX_RXEN);
    // Rc interrupt (1<<RXCIE0)
    // Tx interrupt (1<<TXCIE0)
}

void initSerial() {
  Serial.begin(115200);
  Serial.write("Hello!\n");
}

void setup() {
  pinMode(ledPin, OUTPUT);

  initUart();

  blink();
  initSerial();
}

void dmxWrite(uint8_t data)
{
  // Wait for empty transmit buffer
  while (! (DMX_UCSRA & (1 << DMX_UDRE)))
    // busy
    ;

  // Put data into buffer, sends the data
  UDR0 = data;
}

void loop() 
{
  Serial.write("Waiting for error bit\n");

  // WAIT FOR ERROR
  while (! (DMX_UCSRA & (1<<DMX_FE))) {
    (void) DMX_UDR;
  }

  DMX_UCSRA &= ~(1<<DMX_FE);
  Serial.write("Found error bit\n");

  // WAIT FOR FIRST COMPLETE DATA
  while (!(DMX_UCSRA & (1<<DMX_RXC)))
    // busy
    ;

  if (DMX_UDR != 0) {
    Serial.write("FIRST BYTE WAS NOT ZERO! HALT AND CATCH FIRE\n");
    while(true);
  }

  Serial.write("Found first byte\n");
  
  digitalWrite(ledPin, HIGH);

  int i = 10;
  while (--i > 0) {
    Serial.print(DMX_UDR, DEC);
    Serial.write("\n");
  }
}
