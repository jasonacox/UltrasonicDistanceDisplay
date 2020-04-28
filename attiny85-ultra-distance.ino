/*
  ATtiny85 Ultrasound Distance Measurement with Dual 7-Segment LED Display

  This project uses the HC-SR04 ultrasonic distance module to determine distance
  an provide output via two 7-segment display.  It will show inches for short distances less
  than 1 foot, then it will show feet with decimal until the distance reaches 10 feet and will
  continue to show feet.  The HC-SR04 provides 2cm to 400cm (1in to 13ft) of non-contact
  measurement functionality.

  Components:
    * ATiny85 Microcontroller
    * HC-SR04 Ultrasonic Distance Sensor
    * 74HC595 8-bit Shift Register (Qty 2)
    * 7-Segement LED Display (Qty 2)
    * 0.1uF Ceramic Capacitor
    * 100uF Electrolytic Capacitor
    * 5V Power Supply

*/

/* ATtiny85 Pins */
#define clockPin 0    // Pin connected to SH_CP of 74HC595
#define dataPin 1     // Pin connected to    DS of 74HC595
#define trigPin 2     // Pin connected to TRIG  of HC-SR04 
#define latchPin 3    // Pin connected to ST_CP of 74HC595
#define echoPin 4     // Pin connected to ECHO  of HC-SR04

/* Global variables */
byte numArray[30];    // 7-Segement LED Digit Definition

/*
   SETUP
*/
void setup() {

  // pinMode(led, OUTPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  pinMode(dataPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(latchPin, OUTPUT);

  /* Set up 7-segment LED Binary Data

     |--A--|
     F     B
     |--G--|
     E     C
     |--D--|
            H - Decimal

     0b00000000
       ABCDEFGH
  */
  numArray[0] = 0b00000011; // no decimal 0-9
  numArray[1] = 0b10011111;
  numArray[2] = 0b00100101;
  numArray[3] = 0b00001101;
  numArray[4] = 0b10011001;
  numArray[5] = 0b01001001;
  numArray[6] = 0b01000001;
  numArray[7] = 0b00011111;
  numArray[8] = 0b00000001;
  numArray[9] = 0b00001001;
  numArray[10] = 0b11111111; // all off
  numArray[20] = 0b00000010; // decimal on 20-29
  numArray[21] = 0b10011110;
  numArray[22] = 0b00100100;
  numArray[23] = 0b00001100;
  numArray[24] = 0b10011000;
  numArray[25] = 0b01001000;
  numArray[26] = 0b01000000;
  numArray[27] = 0b00011110;
  numArray[28] = 0b00000000;
  numArray[29] = 0b00001000;

  // Flash Decimal on Boot
  for (int x = 0; x < 4; x++) {
    digitalWrite(latchPin, 0);
    sendOut(dataPin, clockPin, 0b11111111 - 0b11111111);
    sendOut(dataPin, clockPin, 0b11111111 - 0b11111110);
    digitalWrite(latchPin, 1);
    delay(200);
    digitalWrite(latchPin, 0);
    sendOut(dataPin, clockPin, 0b11111111 - 0b11111110);
    sendOut(dataPin, clockPin, 0b11111111 - 0b11111111);
    digitalWrite(latchPin, 1);
    delay(200);
  }

  //analogWrite(led, 0);
}

/*
    MAIN LOOP
*/
void loop() {

  // determine distance
  long duration, distance;
  long minduration = -1;
  int a, b;
  for (int x = 1; x < 5; x++) { // make 4 measurements
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    duration = pulseIn(echoPin, HIGH);
    if (minduration < 0) minduration = duration;
    if (duration < minduration) minduration = duration;
    delay(10);
  }
  distance = (minduration / 2) / 29.1; // to cm
  distance = distance / 2.54; // cm to inches
  
  // inches
  if (distance < 12.0) {
    // Buidl output - ab
    b = distance % 10;              // ones
    a = ((distance - b) / 10) % 10; // tens
    if (distance < 10.0 && a == 0) {
      a = 10;
    }
  }
  // feet with decimal
  if (distance >= 12.0 && distance < (12.0 * 10)) {
    long d = (distance / 12.0) * 10;
    // Buidl output - ab
    b = d % 10;              // ones
    a = ((d - b) / 10) % 10; // tens
    if (a == 0) {
      a = 10;
    }
    a = a + 20;
  }
  // feet only >= 10 feet
  if (distance >= (12.0 * 10)) {
    long d = (distance / 12.0);
    // Buidl output - ab
    b = d % 10;              // ones
    a = ((d - b) / 10) % 10; // tens
    b = b + 20;
  }
  digitalWrite(latchPin, 0);
  sendOut(dataPin, clockPin, 0b11111111 - numArray[a]);
  sendOut(dataPin, clockPin, 0b11111111 - numArray[b]);
  digitalWrite(latchPin, 1);

  delay(250);
}

void sendOut(int myDataPin, int myClockPin, byte myDataOut) {
  // This shifts 8 bits out MSB first,
  // on the rising edge of the clock,
  // clock idles low
  //internal function setup
  int i = 0;
  int pinState;
  pinMode(myClockPin, OUTPUT);
  pinMode(myDataPin, OUTPUT);
  // clear everything out just in case to
  // prepare shift register for bit shifting
  digitalWrite(myDataPin, 0);
  digitalWrite(myClockPin, 0);
  // for each bit in the byte myDataOut�
  // NOTICE THAT WE ARE COUNTING DOWN in our for loop
  // This means that %00000001 or "1" will go through such
  // that it will be pin Q0 that lights.
  for (i = 7; i >= 0; i--)  {
    digitalWrite(myClockPin, 0);
    // if the value passed to myDataOut and a bitmask result
    // true then... so if we are at i=6 and our value is
    // %11010100 it would the code compares it to %01000000
    // and proceeds to set pinState to 1.
    if ( myDataOut & (1 << i) ) {
      pinState = 1;
    }
    else {
      pinState = 0;
    }
    //Sets the pin to HIGH or LOW depending on pinState
    digitalWrite(myDataPin, pinState);
    //register shifts bits on upstroke of clock pin
    digitalWrite(myClockPin, 1);
    //zero the data pin after shift to prevent bleed through
    digitalWrite(myDataPin, 0);
  }
  //stop shifting
  digitalWrite(myClockPin, 0);
}
