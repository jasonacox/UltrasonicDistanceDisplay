# UltrasonicDistanceDisplay
ATtiny85 Ultrasound Distance Measurement with Dual Segment LED Display

## Description
This project uses the HC-SR04 ultrasonic distance module to determine distance and provide output via two 7-segment display.  It will show inches for short distances less
than 1 foot, then it will show feet with decimal until the distance reaches 10 feet and will continue to show feet.  The HC-SR04 provides 2cm to 400cm (1in to 13ft) of non-contact
measurement functionality.

Components:
* ATiny85 Microcontroller
* HC-SR04 Ultrasonic Distance Sensor
* 74HC595 8-bit Shift Register (Qty 2)
* 7-Segement LED Display (Qty 2)
* 0.1uF Ceramic Capacitor
* 100uF Electrolytic Capacitor
* 5V Power Supply

## Circuit
Note: Currently the circuit prototype is being tested.

### Schematic
![Circuit Board](images/schematic.png)

## List of Materials
#### Integrated Circuits
* 1 x ATiny85 Microcontroller
* 2 x 74HC595 8-bit Shift Register
#### Sensors
* 1 x HC-SR04 Ultrasonic Distance Sensor
#### Display/LED
* 2 x 7-Segement LED Display
#### Power Supply
* 5V Power Supply
#### Misc
* 16 x 220 Ohm Resistor
* 1 x 100uF Electrolytic Capacitor [DigiKey](https://www.digikey.com/product-detail/en/panasonic-electronic-components/ECA-1CM101I/P10408TB-ND/268493)
* 1 x 220uF Electrolytic Capacitor
* 1 x 0.1uF Ceramic Capactior - [Amazon](https://www.amazon.com/Almencla-100Pcs-Ceramic-Capacitor-Electronic/dp/B07LD9T497)


## References
* Hackster ATtiny85 with 7-Segment LED - https://www.hackster.io/taunoerik/selfmade-i2c-7-segment-display-with-attiny85-a637d0

* Instructables ATtiny85 HC-SR04 Ultrasonic Ruler - 
https://www.instructables.com/id/Pocket-Sized-Ultrasonic-Ruler/

