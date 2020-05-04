/*
  ATtiny85 Ultrasound Distance Measurement with Dual 7-Segment LED Display

  This project uses the HC-SR04 ultrasonic distance module to determine distance
  an provide output via two 7-segment display.  In Imperial unit mode, it will show inches
  for short distances less than 1 foot, then it will show feet with decimal until the distance
  reaches 10 feet and will continue to show feet.  In SI uit mode, it will show centimeters
  for distances less than 1 meter, then it will show meters with decimal until the distance
  reaches 10 meters and will continue to show meters only.

  To toggle Units:  Hold the distance to 4 (either unit) for ~4 seconds and it will toggle
  between units.  Imperial mode will flash "in" and SI mode will flash "c".

  The HC-SR04 provides 2cm to 400cm (1in to 13ft) of non-contact measurement functionality.

  Components:
      ATiny85 Microcontroller
      HC-SR04 Ultrasonic Distance Sensor
      74HC595 8-bit Shift Register (Qty 2)
      7-Segement LED Display (Qty 2)
      0.1uF Ceramic Capacitor
      100uF Electrolytic Capacitor
      5V Power Supply

  Author: Jason A. Cox - @jasonacox - https://github.com/jasonacox/UltrasonicDistanceDisplay

  Date: 5 May 2020 
  
*/

/* ATtiny85 Pins */
#define clockPin 0    // Pin connected to SH_CP of 74HC595
#define dataPin 1     // Pin connected to    DS of 74HC595
#define trigPin 2     // Pin connected to TRIG  of HC-SR04 
#define latchPin 3    // Pin connected to ST_CP of 74HC595
#define echoPin 4     // Pin connected to ECHO  of HC-SR04

/* Sleep Settings */
#define SENSITIVITY 2           // Distance tolerance (inches) to sleep/wake up (-1 to disable)
#define MAX (1000L/250L)*60L    // Go to sleep mode if distance static for this amount
#define SLEEP 500               // Sleep mode wait
#define WAIT 250                // Wake mode wait

/* Global variables */
byte numArray[31];    // 7-Segement LED Digit Definition
byte startArray[24];  // Fancy startup LED sequence
bool units;           // True = SI, False = Imperial
bool sleepmode;       // True = LED off and longer wait between measures
int state;            // State flag to trigger units change
long lastdist;        // Last measured distance
long nochange;        // Cycles with no change

/*
   SETUP
*/
void setup() {

  state = 0;
  lastdist = 0;
  nochange = 0L;
  sleepmode = false;

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
  numArray[0] = 0b11111100; // 0
  numArray[1] = 0b01100000; // 1
  numArray[2] = 0b11011010; // 2
  numArray[3] = 0b11110010; // 3
  numArray[4] = 0b01100110; // 4
  numArray[5] = 0b10110110; // 5
  numArray[6] = 0b10111110; // 6
  numArray[7] = 0b11100000; // 7
  numArray[8] = 0b11111110; // 8
  numArray[9] = 0b11110110; // 9
  numArray[10]= 0b00000000; // All Off
  numArray[20] = 0b11111101; // 0. (Decimal point)
  numArray[21] = 0b01100001; // 1.
  numArray[22] = 0b11011011; // 2.
  numArray[23] = 0b11110011; // 3.
  numArray[24] = 0b01100111; // 4.
  numArray[25] = 0b10110111; // 5.
  numArray[26] = 0b10111111; // 6.
  numArray[27] = 0b11100001; // 7.
  numArray[28] = 0b11111111; // 8.
  numArray[29] = 0b11110111; // 9.
  numArray[30] = 0b00000001; // . (Decimal point only)

  // Startup LED Dance Sequence
  startArray[0] = 0b00010000;
  startArray[1] = 0b00000000;
  startArray[2] = 0b00000000;
  startArray[3] = 0b00010000;
  startArray[4] = 0b00000000;
  startArray[5] = 0b00100000;
  startArray[6] = 0b00000000;
  startArray[7] = 0b01000000;
  startArray[8] = 0b00000000;
  startArray[9] = 0b10000000;
  startArray[10] = 0b10000000;
  startArray[11] = 0b00000000;
  startArray[12] = 0b00000100;
  startArray[13] = 0b00000000;
  startArray[14] = 0b00001000;
  startArray[15] = 0b00000000;
  startArray[16] = 0b11111100; 
  startArray[17] = 0b11111100;
  startArray[18] = 0b00000000;
  startArray[19] = 0b00000000;
  startArray[20] = 0b11111100;
  startArray[21] = 0b11111100;
  startArray[22] = 0b00000000;
  startArray[23] = 0b00000000;
  
  // Flash Decimal on Boot
  for (int x = 0; x < 4; x++) {
    digitalWrite(latchPin, 0);
    sendOut(dataPin, clockPin, 0b00000000);
    sendOut(dataPin, clockPin, 0b00000001);
    digitalWrite(latchPin, 1);
    delay(200);
    digitalWrite(latchPin, 0);
    sendOut(dataPin, clockPin, 0b00000001);
    sendOut(dataPin, clockPin, 0b00000000);
    digitalWrite(latchPin, 1);
    delay(200);
  }
  
  // Fancy LED Dance
  showStart();

  // Display Unit
  units = false;
  showUnits();
}

/*
    MAIN LOOP
*/
void loop() {

  // determine distance
  long duration, distance;
  long minduration = -1;
  int a, b;
  for (int x = 0; x < 5; x++) { // make 5 measurements
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    duration = pulseIn(echoPin, HIGH);
    if (minduration < 0) minduration = duration;
    if (duration < minduration) minduration = duration;
    delay(20);
  }
  distance = (minduration / 2) / 29.1; // to cm

  if (units) {
    // SI Units - cm and meters
    if (distance < 100) {
      // Buidl output - ab
      b = distance % 10;              // ones
      a = ((distance - b) / 10) % 10; // tens
      if (distance < 10.0 && a == 0) {
        a = 10;
      }
    }
    // meters with decimal
    if (distance >= 100.0 && distance < (100.0 * 10)) {
      long d = (distance / 100.0) * 10;
      // Buidl output - ab
      b = d % 10;              // ones
      a = ((d - b) / 10) % 10; // tens
      if (a == 0) {
        a = 10;
      }
      a = a + 20; // add decimal point
    }
    // meters only > 10m
    if (distance >= (100.0 * 10)) {
      long d = (distance / 100.0);
      // Buidl output - ab
      b = d % 10;              // ones
      a = ((d - b) / 10) % 10; // tens
      b = b + 20;
    }
  }
  
  distance = distance / 2.54; // cm to inches

  if (!units) {
    // Imperial Units - inches and feet
    
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
      a = a + 20; // add decimal point
    }
    // feet only >= 10 feet
    if (distance >= (12.0 * 10)) {
      long d = (distance / 12.0);
      // Buidl output - ab
      b = d % 10;              // ones
      a = ((d - b) / 10) % 10; // tens
      b = b + 20;
    }
  }

  if (sleepmode == true) {
    if (abs(lastdist - distance) > SENSITIVITY) {
      sleepmode = false;
      nochange = 0;
    }
  }

  if (sleepmode == false) {
    digitalWrite(latchPin, 0);
    sendOut(dataPin, clockPin, numArray[a]);
    sendOut(dataPin, clockPin, numArray[b]);
    digitalWrite(latchPin, 1);

    // Check for trigger to change units
    if (a == 10 && b == 4) {
      state++;
      if (state > 5) {
        state = 0;
        // Trigger happened - switch to other units.
        if (units) {
          units = false;
        }
        else {
          units = true;
        }
        showStart();
        showUnits();
      }
    }
    else {
      state = 0;
    }
    if (abs(lastdist - distance) <= SENSITIVITY) {
      nochange++;
      if (nochange >= MAX) {
        // Go into sleep mode - turn off display
        digitalWrite(latchPin, 0);
        sendOut(dataPin, clockPin, 0b00000000);
        sendOut(dataPin, clockPin, 0b00000000);
        digitalWrite(latchPin, 1);
        sleepmode = true;
      }
    }
  }

  lastdist = distance;
  if (sleepmode == true) {
    delay(SLEEP);
  }
  else {
    delay(250);
  }
}

/*
   Send myDataOut to 8 bit register

   This sifts 8 bits out MSB first on the rising edge of the clock
*/
void sendOut(int myDataPin, int myClockPin, byte myDataOut) {
  int i = 0;
  int pinState;
  pinMode(myClockPin, OUTPUT);
  pinMode(myDataPin, OUTPUT);

  // Clear data and clock output
  digitalWrite(myDataPin, 0);
  digitalWrite(myClockPin, 0);
  // Send each bit in the byte myDataOut

  for (i = 7; i >= 0; i--)  {
    digitalWrite(myClockPin, 0);
    if ( myDataOut & (1 << i) ) {
      pinState = 1;
    }
    else {
      pinState = 0;
    }
    // Send pinState
    digitalWrite(myDataPin, pinState);

    // Shift register with Clock
    digitalWrite(myClockPin, 1);
    // Zero out data pin
    digitalWrite(myDataPin, 0);
  }
  digitalWrite(myClockPin, 0);
}

/*
   Display "c" for SI unit mode and "in" for Imperial unit mode

   Uses: global bool "units"
*/
void showUnits() {
  for (int x = 0; x < 2; x++) {
    if (units) {
      // SI = Display " c"
      digitalWrite(latchPin, 0);
      sendOut(dataPin, clockPin, 0b00000000);
      sendOut(dataPin, clockPin, 0b00011010);
      digitalWrite(latchPin, 1);
    }
    else {
      // Imperial = Display "in"
      digitalWrite(latchPin, 0);
      sendOut(dataPin, clockPin, 0b00100000);
      sendOut(dataPin, clockPin, 0b00101010);
      digitalWrite(latchPin, 1);
    }
    delay(500);

    // Clear
    digitalWrite(latchPin, 0);
    sendOut(dataPin, clockPin, 0b00000000);
    sendOut(dataPin, clockPin, 0b00000000);
    digitalWrite(latchPin, 1);
    delay(500);
  }
}

/*
   Display starup LED dance and flash "00"
*/
void showStart() {
  for (int x = 0; x <= 14; x = x + 2) {
    digitalWrite(latchPin, 0);
    sendOut(dataPin, clockPin, startArray[x]);
    sendOut(dataPin, clockPin, startArray[x + 1]);
    digitalWrite(latchPin, 1);
    delay(50);
  }
  for (int x = 0; x <= 22; x = x + 2) {
    digitalWrite(latchPin, 0);
    sendOut(dataPin, clockPin, startArray[x]);
    sendOut(dataPin, clockPin, startArray[x + 1]);
    digitalWrite(latchPin, 1);
    delay(50);
  }
  delay(100);
}