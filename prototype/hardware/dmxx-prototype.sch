EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5B82E03A
P 4350 3450
F 0 "A1" H 4350 2364 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4350 2273 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4500 2500 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4350 2450 50  0001 C CNN
	1    4350 3450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5B82E161
P 4150 2450
F 0 "#PWR02" H 4150 2200 50  0001 C CNN
F 1 "GND" V 4155 2322 50  0000 R CNN
F 2 "" H 4150 2450 50  0001 C CNN
F 3 "" H 4150 2450 50  0001 C CNN
	1    4150 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 2450 4250 2450
$Comp
L power:VCC #PWR01
U 1 1 5B82E1DE
P 4050 4450
F 0 "#PWR01" H 4050 4300 50  0001 C CNN
F 1 "VCC" V 4067 4578 50  0000 L CNN
F 2 "" H 4050 4450 50  0001 C CNN
F 3 "" H 4050 4450 50  0001 C CNN
	1    4050 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 4450 4150 4450
$Comp
L Interface_UART:MAX490E U1
U 1 1 5B82E3D6
P 6650 4000
F 0 "U1" H 6650 3322 50  0000 C CNN
F 1 "MAX490E" H 6650 3413 50  0000 C CNN
F 2 "" H 6650 3400 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX1487E-MAX491E.pdf" H 6410 4450 50  0001 C CNN
	1    6650 4000
	1    0    0    1   
$EndComp
$Comp
L Connector:XLR3 J1
U 1 1 5B82E510
P 7800 3500
F 0 "J1" V 7754 3728 50  0000 L CNN
F 1 "XLR_OUT" V 7845 3728 50  0000 L CNN
F 2 "" H 7800 3500 50  0001 C CNN
F 3 " ~" H 7800 3500 50  0001 C CNN
	1    7800 3500
	0    1    1    0   
$EndComp
$Comp
L Connector:XLR3 J2
U 1 1 5B82E5FF
P 7800 4500
F 0 "J2" V 7754 4727 50  0000 L CNN
F 1 "XLR_IN" V 7845 4727 50  0000 L CNN
F 2 "" H 7800 4500 50  0001 C CNN
F 3 " ~" H 7800 4500 50  0001 C CNN
	1    7800 4500
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5B82EB0B
P 5000 4050
F 0 "TP2" H 5000 4300 50  0000 R CNN
F 1 "TP_RX" H 4942 4168 50  0000 R CNN
F 2 "" H 5200 4050 50  0001 C CNN
F 3 "~" H 5200 4050 50  0001 C CNN
	1    5000 4050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5B82EBA4
P 5750 2350
F 0 "TP3" H 5808 2470 50  0000 L CNN
F 1 "TP_GND" H 5808 2379 50  0000 L CNN
F 2 "" H 5950 2350 50  0001 C CNN
F 3 "~" H 5950 2350 50  0001 C CNN
	1    5750 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5B82EBDE
P 5000 3950
F 0 "TP1" H 5000 4200 50  0000 L CNN
F 1 "TP_TX" H 5050 4100 50  0000 L CNN
F 2 "" H 5200 3950 50  0001 C CNN
F 3 "~" H 5200 3950 50  0001 C CNN
	1    5000 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP2
U 1 1 5B82EFB4
P 5700 4050
F 0 "JP2" H 5700 4300 50  0000 C CNN
F 1 "JMP_RX" H 5700 4200 50  0000 C CNN
F 2 "" H 5700 4050 50  0001 C CNN
F 3 "~" H 5700 4050 50  0001 C CNN
	1    5700 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 5B82F08A
P 5700 3950
F 0 "JP1" H 5700 4200 50  0000 C CNN
F 1 "JMP_TX" H 5700 4100 50  0000 C CNN
F 2 "" H 5700 3950 50  0001 C CNN
F 3 "~" H 5700 3950 50  0001 C CNN
	1    5700 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3950 5000 3950
Wire Wire Line
	6000 4050 6150 4050
Wire Wire Line
	6150 4050 6150 4100
Wire Wire Line
	6150 4100 6250 4100
Wire Wire Line
	6250 3900 6150 3900
Wire Wire Line
	6150 3900 6150 3950
Wire Wire Line
	6150 3950 6000 3950
$Comp
L power:VCC #PWR05
U 1 1 5B82F44F
P 6550 4500
F 0 "#PWR05" H 6550 4350 50  0001 C CNN
F 1 "VCC" V 6567 4628 50  0000 L CNN
F 2 "" H 6550 4500 50  0001 C CNN
F 3 "" H 6550 4500 50  0001 C CNN
	1    6550 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6550 4500 6650 4500
$Comp
L power:GND #PWR04
U 1 1 5B82F51C
P 6550 3500
F 0 "#PWR04" H 6550 3250 50  0001 C CNN
F 1 "GND" V 6555 3372 50  0000 R CNN
F 2 "" H 6550 3500 50  0001 C CNN
F 3 "" H 6550 3500 50  0001 C CNN
	1    6550 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 3500 6650 3500
Connection ~ 5000 3950
Wire Wire Line
	5000 3950 5400 3950
Wire Wire Line
	4850 4050 5000 4050
Connection ~ 5000 4050
Wire Wire Line
	5000 4050 5400 4050
$Comp
L power:GND #PWR03
U 1 1 5B82FF8D
P 5750 2450
F 0 "#PWR03" H 5750 2200 50  0001 C CNN
F 1 "GND" H 5755 2277 50  0000 C CNN
F 2 "" H 5750 2450 50  0001 C CNN
F 3 "" H 5750 2450 50  0001 C CNN
	1    5750 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2350 5750 2450
$Comp
L power:GND #PWR06
U 1 1 5B830264
P 7800 3100
F 0 "#PWR06" H 7800 2850 50  0001 C CNN
F 1 "GND" H 7650 3050 50  0000 C CNN
F 2 "" H 7800 3100 50  0001 C CNN
F 3 "" H 7800 3100 50  0001 C CNN
	1    7800 3100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5B83028A
P 7800 4100
F 0 "#PWR07" H 7800 3850 50  0001 C CNN
F 1 "GND" H 7650 4050 50  0000 C CNN
F 2 "" H 7800 4100 50  0001 C CNN
F 3 "" H 7800 4100 50  0001 C CNN
	1    7800 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	7800 4100 7800 4200
Wire Wire Line
	7800 3100 7800 3200
Wire Wire Line
	7500 4500 7500 4200
Wire Wire Line
	7500 4200 7050 4200
Wire Wire Line
	7800 4800 7450 4800
Wire Wire Line
	7450 4800 7450 4100
Wire Wire Line
	7450 4100 7050 4100
Wire Wire Line
	7500 3500 7500 3800
Wire Wire Line
	7500 3800 7050 3800
Wire Wire Line
	7800 3800 7800 3900
Wire Wire Line
	7800 3900 7050 3900
$EndSCHEMATC
