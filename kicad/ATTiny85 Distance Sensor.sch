EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Ultrasonic Distance Sensor"
Date "2020 May 5"
Rev "v1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R?
U 1 1 5EAE8233
P 3400 2400
F 0 "R?" V 3193 2400 50  0001 C CNN
F 1 "220" V 3400 2400 50  0000 C CNN
F 2 "" V 3330 2400 50  0001 C CNN
F 3 "~" H 3400 2400 50  0001 C CNN
	1    3400 2400
	0    1    1    0   
$EndComp
$Comp
L Display_Character:HDSP-7503 U4
U 1 1 5EAE38F3
P 3850 2000
F 0 "U4" H 3850 2667 50  0000 C CNN
F 1 "7-Segment LED" H 3850 2576 50  0000 C CNN
F 2 "Display_7Segment:HDSP-A151" H 3850 1450 50  0001 C CNN
F 3 "https://docs.broadcom.com/docs/AV02-2553EN" H 3450 2550 50  0001 C CNN
	1    3850 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EAF0F48
P 3400 2300
F 0 "R?" V 3193 2300 50  0001 C CNN
F 1 "220" V 3400 2300 50  0000 C CNN
F 2 "" V 3330 2300 50  0001 C CNN
F 3 "~" H 3400 2300 50  0001 C CNN
	1    3400 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EAF122E
P 3400 2200
F 0 "R?" V 3193 2200 50  0001 C CNN
F 1 "220" V 3400 2200 50  0000 C CNN
F 2 "" V 3330 2200 50  0001 C CNN
F 3 "~" H 3400 2200 50  0001 C CNN
	1    3400 2200
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EAF154D
P 3400 2100
F 0 "R?" V 3193 2100 50  0001 C CNN
F 1 "220" V 3400 2100 50  0000 C CNN
F 2 "" V 3330 2100 50  0001 C CNN
F 3 "~" H 3400 2100 50  0001 C CNN
	1    3400 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EAF17D4
P 3400 2000
F 0 "R?" V 3193 2000 50  0001 C CNN
F 1 "220" V 3400 2000 50  0000 C CNN
F 2 "" V 3330 2000 50  0001 C CNN
F 3 "~" H 3400 2000 50  0001 C CNN
	1    3400 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EAF19E9
P 3400 1900
F 0 "R?" V 3193 1900 50  0001 C CNN
F 1 "220" V 3400 1900 50  0000 C CNN
F 2 "" V 3330 1900 50  0001 C CNN
F 3 "~" H 3400 1900 50  0001 C CNN
	1    3400 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EAF1BD8
P 3400 1800
F 0 "R?" V 3193 1800 50  0001 C CNN
F 1 "220" V 3400 1800 50  0000 C CNN
F 2 "" V 3330 1800 50  0001 C CNN
F 3 "~" H 3400 1800 50  0001 C CNN
	1    3400 1800
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EAF1F43
P 3400 1700
F 0 "R?" V 3193 1700 50  0001 C CNN
F 1 "220" V 3400 1700 50  0000 C CNN
F 2 "" V 3330 1700 50  0001 C CNN
F 3 "~" H 3400 1700 50  0001 C CNN
	1    3400 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 2400 3250 2500
Wire Wire Line
	3150 2500 3150 2300
Wire Wire Line
	3150 2300 3250 2300
Wire Wire Line
	3050 2500 3050 2200
Wire Wire Line
	3050 2200 3250 2200
Wire Wire Line
	2950 2500 2950 2100
Wire Wire Line
	2950 2100 3250 2100
Wire Wire Line
	2850 2500 2850 2000
Wire Wire Line
	2850 2000 3250 2000
Wire Wire Line
	2750 2500 2750 1900
Wire Wire Line
	2750 1900 3250 1900
Wire Wire Line
	2650 2500 2650 1800
Wire Wire Line
	2650 1800 3250 1800
Wire Wire Line
	2550 2500 2550 1700
Wire Wire Line
	2550 1700 3250 1700
$Comp
L power:+5V #PWR?
U 1 1 5EAF568E
P 1800 4400
F 0 "#PWR?" H 1800 4250 50  0001 C CNN
F 1 "+5V" H 1815 4573 50  0000 C CNN
F 2 "" H 1800 4400 50  0001 C CNN
F 3 "" H 1800 4400 50  0001 C CNN
	1    1800 4400
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EAF6ADE
P 1450 4400
F 0 "#PWR?" H 1450 4150 50  0001 C CNN
F 1 "GND" H 1455 4227 50  0000 C CNN
F 2 "" H 1450 4400 50  0001 C CNN
F 3 "" H 1450 4400 50  0001 C CNN
	1    1450 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C1
U 1 1 5EAF7974
P 1650 3650
F 0 "C1" V 1878 3650 50  0000 C CNN
F 1 "100uF" V 1787 3650 50  0000 C CNN
F 2 "" H 1650 3650 50  0001 C CNN
F 3 "~" H 1650 3650 50  0001 C CNN
	1    1650 3650
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB14FE3
P 5700 2400
F 0 "R?" V 5493 2400 50  0001 C CNN
F 1 "220" V 5700 2400 50  0000 C CNN
F 2 "" V 5630 2400 50  0001 C CNN
F 3 "~" H 5700 2400 50  0001 C CNN
	1    5700 2400
	0    1    1    0   
$EndComp
$Comp
L Display_Character:HDSP-7503 U5
U 1 1 5EB14FF0
P 6150 2000
F 0 "U5" H 6150 2667 50  0000 C CNN
F 1 "7-Segment LED" H 6150 2576 50  0000 C CNN
F 2 "Display_7Segment:HDSP-A151" H 6150 1450 50  0001 C CNN
F 3 "https://docs.broadcom.com/docs/AV02-2553EN" H 5750 2550 50  0001 C CNN
	1    6150 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EB14FF6
P 5700 2300
F 0 "R?" V 5493 2300 50  0001 C CNN
F 1 "220" V 5700 2300 50  0000 C CNN
F 2 "" V 5630 2300 50  0001 C CNN
F 3 "~" H 5700 2300 50  0001 C CNN
	1    5700 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB14FFC
P 5700 2200
F 0 "R?" V 5493 2200 50  0001 C CNN
F 1 "220" V 5700 2200 50  0000 C CNN
F 2 "" V 5630 2200 50  0001 C CNN
F 3 "~" H 5700 2200 50  0001 C CNN
	1    5700 2200
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB15002
P 5700 2100
F 0 "R?" V 5493 2100 50  0001 C CNN
F 1 "220" V 5700 2100 50  0000 C CNN
F 2 "" V 5630 2100 50  0001 C CNN
F 3 "~" H 5700 2100 50  0001 C CNN
	1    5700 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB15008
P 5700 2000
F 0 "R?" V 5493 2000 50  0001 C CNN
F 1 "220" V 5700 2000 50  0000 C CNN
F 2 "" V 5630 2000 50  0001 C CNN
F 3 "~" H 5700 2000 50  0001 C CNN
	1    5700 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB1500E
P 5700 1900
F 0 "R?" V 5493 1900 50  0001 C CNN
F 1 "220" V 5700 1900 50  0000 C CNN
F 2 "" V 5630 1900 50  0001 C CNN
F 3 "~" H 5700 1900 50  0001 C CNN
	1    5700 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB15014
P 5700 1800
F 0 "R?" V 5493 1800 50  0001 C CNN
F 1 "220" V 5700 1800 50  0000 C CNN
F 2 "" V 5630 1800 50  0001 C CNN
F 3 "~" H 5700 1800 50  0001 C CNN
	1    5700 1800
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB1501A
P 5700 1700
F 0 "R?" V 5493 1700 50  0001 C CNN
F 1 "220" V 5700 1700 50  0000 C CNN
F 2 "" V 5630 1700 50  0001 C CNN
F 3 "~" H 5700 1700 50  0001 C CNN
	1    5700 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 2400 5550 2500
Wire Wire Line
	5450 2500 5450 2300
Wire Wire Line
	5450 2300 5550 2300
Wire Wire Line
	5350 2500 5350 2200
Wire Wire Line
	5350 2200 5550 2200
Wire Wire Line
	5250 2500 5250 2100
Wire Wire Line
	5250 2100 5550 2100
Wire Wire Line
	5150 2500 5150 2000
Wire Wire Line
	5150 2000 5550 2000
Wire Wire Line
	5050 2500 5050 1900
Wire Wire Line
	5050 1900 5550 1900
Wire Wire Line
	4950 2500 4950 1800
Wire Wire Line
	4950 1800 5550 1800
Wire Wire Line
	4850 2500 4850 1700
Wire Wire Line
	4850 1700 5550 1700
Wire Wire Line
	6550 1050 6550 2300
Wire Wire Line
	6550 2300 6450 2300
Wire Wire Line
	6550 2300 6550 2400
Wire Wire Line
	6550 2400 6450 2400
Connection ~ 6550 2300
Wire Wire Line
	6150 4150 6150 4500
Wire Wire Line
	6150 4500 7200 4500
Wire Wire Line
	7200 4500 7200 2300
Wire Wire Line
	7200 2300 6550 2300
$Comp
L hc-sr04:HC-SR04 U6
U 1 1 5EB1C58E
P 6350 4000
F 0 "U6" H 6022 4098 60  0000 R CNN
F 1 "HC-SR04" H 6022 3992 60  0000 R CNN
F 2 "" H 6350 4000 60  0000 C CNN
F 3 "" H 6350 4000 60  0000 C CNN
F 4 "Ultrasonic" H 6400 4450 50  0000 R CNN "Field4"
F 5 "Distance Sensor" H 6500 4350 50  0000 R CNN "Field5"
	1    6350 4000
	-1   0    0    -1  
$EndComp
$Comp
L DigiKey:74HC595D_118 U3
U 1 1 5EB3C590
P 5650 3000
F 0 "U3" V 5798 3144 60  0000 L CNN
F 1 "74HC595" V 5692 3144 60  0000 L CNN
F 2 "digikey-footprints:SOIC-16_W3.90mm" H 5850 3200 60  0001 L CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT595.pdf" H 5850 3300 60  0001 L CNN
F 4 "1727-2821-1-ND" H 5850 3400 60  0001 L CNN "Digi-Key_PN"
F 5 "74HC595D,118" H 5850 3500 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 5850 3600 60  0001 L CNN "Category"
F 7 "Logic - Shift Registers" H 5850 3700 60  0001 L CNN "Family"
F 8 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT595.pdf" H 5850 3800 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/nexperia-usa-inc/74HC595D,118/1727-2821-1-ND/763394" H 5850 3900 60  0001 L CNN "DK_Detail_Page"
F 10 "IC SHIFT REGISTER 8BIT 16SOIC" H 5850 4000 60  0001 L CNN "Description"
F 11 "Nexperia USA Inc." H 5850 4100 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5850 4200 60  0001 L CNN "Status"
F 13 "8-Bit Shift Register" V 5594 3144 50  0000 L CNN "Field13"
	1    5650 3000
	0    1    -1   0   
$EndComp
Wire Wire Line
	5750 3000 5750 3450
Connection ~ 5750 3850
Wire Wire Line
	5750 3850 6150 3850
Wire Wire Line
	1450 1050 1450 3000
$Comp
L DigiKey:74HC595D_118 U2
U 1 1 5EB57B26
P 3350 3000
F 0 "U2" V 3498 3144 60  0000 L CNN
F 1 "74HC595" V 3392 3144 60  0000 L CNN
F 2 "digikey-footprints:SOIC-16_W3.90mm" H 3550 3200 60  0001 L CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT595.pdf" H 3550 3300 60  0001 L CNN
F 4 "1727-2821-1-ND" H 3550 3400 60  0001 L CNN "Digi-Key_PN"
F 5 "74HC595D,118" H 3550 3500 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 3550 3600 60  0001 L CNN "Category"
F 7 "Logic - Shift Registers" H 3550 3700 60  0001 L CNN "Family"
F 8 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT595.pdf" H 3550 3800 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/nexperia-usa-inc/74HC595D,118/1727-2821-1-ND/763394" H 3550 3900 60  0001 L CNN "DK_Detail_Page"
F 10 "IC SHIFT REGISTER 8BIT 16SOIC" H 3550 4000 60  0001 L CNN "Description"
F 11 "Nexperia USA Inc." H 3550 4100 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3550 4200 60  0001 L CNN "Status"
F 13 "8-Bit Shift Register" V 3294 3144 50  0000 L CNN "Field13"
	1    3350 3000
	0    1    -1   0   
$EndComp
Wire Wire Line
	2250 3000 2200 3000
Connection ~ 1450 3000
Wire Wire Line
	3450 3000 3450 3400
Connection ~ 3450 3850
Wire Wire Line
	3450 3850 4400 3850
Wire Wire Line
	5250 3400 5250 3700
Wire Wire Line
	5250 4300 4900 4300
Wire Wire Line
	4950 4200 4950 3400
Wire Wire Line
	6150 3950 5100 3950
Wire Wire Line
	5150 3400 5150 3600
$Comp
L Device:C_Small C2
U 1 1 5EB63D2C
P 4400 3400
F 0 "C2" H 4309 3354 50  0000 R CNN
F 1 "0.1uF" H 4309 3445 50  0000 R CNN
F 2 "" H 4400 3400 50  0001 C CNN
F 3 "~" H 4400 3400 50  0001 C CNN
	1    4400 3400
	1    0    0    1   
$EndComp
Wire Wire Line
	1450 1050 4400 1050
Wire Wire Line
	4400 3300 4400 3000
Connection ~ 4400 1050
Wire Wire Line
	4400 1050 6550 1050
Wire Wire Line
	4400 3500 4400 3600
Wire Wire Line
	4400 3600 5150 3600
Connection ~ 5150 3600
Wire Wire Line
	5150 3600 5150 4100
Wire Wire Line
	4400 3600 2850 3600
Wire Wire Line
	2850 3600 2850 3400
Connection ~ 4400 3600
Wire Wire Line
	4150 2300 4200 2300
Connection ~ 4400 2300
Wire Wire Line
	4400 2300 4400 1050
Wire Wire Line
	4150 2400 4200 2400
Wire Wire Line
	4200 2400 4200 2300
Connection ~ 4200 2300
Wire Wire Line
	4200 2300 4400 2300
$Comp
L MCU_Microchip_ATtiny:ATtiny85-20PU U1
U 1 1 5EB8C52E
P 5200 5000
F 0 "U1" V 4625 5000 50  0000 C CNN
F 1 "ATtiny85-20PU" V 4534 5000 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5200 5000 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 5200 5000 50  0001 C CNN
	1    5200 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4900 4400 4900 4300
Wire Wire Line
	5000 4400 5000 4200
Wire Wire Line
	5000 4200 4950 4200
Wire Wire Line
	5100 4400 5100 3950
Wire Wire Line
	5200 4400 5200 4100
Wire Wire Line
	5200 4100 5150 4100
Wire Wire Line
	5300 4400 5300 4050
Wire Wire Line
	5300 4050 6150 4050
Wire Wire Line
	5800 5000 6150 5000
Wire Wire Line
	6150 5000 6150 4500
Connection ~ 6150 4500
Wire Wire Line
	4600 5000 4400 5000
Wire Wire Line
	4400 5000 4400 3850
Connection ~ 4400 3850
Wire Wire Line
	4400 3850 5750 3850
Wire Wire Line
	2750 3400 2750 3550
Wire Wire Line
	2750 3550 2200 3550
Wire Wire Line
	2200 3550 2200 3000
Connection ~ 2200 3000
Wire Wire Line
	2200 3000 1450 3000
Wire Wire Line
	4550 3000 4500 3000
Connection ~ 4400 3000
Wire Wire Line
	4400 3000 4400 2300
Wire Wire Line
	5050 3400 5050 3450
Wire Wire Line
	5050 3450 4500 3450
Wire Wire Line
	4500 3450 4500 3000
Connection ~ 4500 3000
Wire Wire Line
	4500 3000 4400 3000
Wire Wire Line
	2950 3400 2950 3700
Wire Wire Line
	2950 3700 5250 3700
Connection ~ 5250 3700
Wire Wire Line
	5250 3700 5250 4300
Wire Wire Line
	5350 3400 5350 3450
Wire Wire Line
	5350 3450 5750 3450
Connection ~ 5750 3450
Wire Wire Line
	5750 3450 5750 3850
Wire Wire Line
	3050 3400 3450 3400
Connection ~ 3450 3400
Wire Wire Line
	3450 3400 3450 3850
Wire Wire Line
	2650 3500 3950 3500
Wire Wire Line
	2650 3400 2650 3500
Wire Wire Line
	4750 2500 4500 2500
Wire Wire Line
	4500 2500 4500 2650
Wire Wire Line
	4500 2650 3950 2650
Wire Wire Line
	3950 2650 3950 3500
Wire Wire Line
	1800 4400 1800 3850
Wire Wire Line
	1800 3850 3450 3850
Wire Wire Line
	1450 3000 1450 3650
Wire Wire Line
	1750 3650 1800 3650
Wire Wire Line
	1800 3650 1800 3850
Connection ~ 1800 3850
Wire Wire Line
	1550 3650 1450 3650
Connection ~ 1450 3650
Wire Wire Line
	1450 3650 1450 4400
Text Notes 3800 4900 0    50   ~ 0
ATtiny85 Pins\nPB0 clockPin\nPB1 dataPin\nPB2 trigPin\nPB3 latchPin\nPB4 echoPin
$EndSCHEMATC
