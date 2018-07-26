; Init ----------------------------
;M111 S0 					; Debugging off
M550 PHypercube                    		; PHyperCube
M555 P2 					; Set firmware compatibility to look like Marlin
G21 						; Work in millimetres
G90 						; Send absolute coordinates...
M83 						; ...but relative extruder moves
M667 S1 					; Select CoreXY mode
M208 X300 Y310 Z390 S0 				; Set axis maxima
M563 P1 D0 H1 					; Define tool 0

; Network ----------------------------
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xE D 		; MAC Address - If you have more than one Duet on your network, they must all have diff erent MAC addresses, so change the last digits
M552 S1           				; Enable WiFi
M586 P1 S1					; enable ftp

; Endstop configuration -----------------------------------
M574 Z1 S2 					; Set endstops controlled by probe
M915 Y S2 R0 F1	 				; Higher S = less sens
M915 X S5 R0 F1

;z probe  ----------------------------
M558 P8 I1 H5 R0.5 F1200 X0 Y0 Z0
G31 X0 Y0 Z0 P10


;mesh grid
M557 X10:290 Y10:290 S92				; Define mesh grid    



; Stepper drive directions ----------------------------
M569 P0 S0 					; X - Drive 0 goes forwards 
M569 P1 S0 					; Y - Drive 1 goes reversed
M569 P2 S0 					; Z - Drive 2 goes forwards
M569 P3 S0 					; E1 - Drive 3 goes backward - Bondtech BMG


; Accleration, jerk, speeds ----------------------------


;M201 X4200 Y4200 Z700 E120            		; Maximum accelerations (mm/s^2) 
;M203 X8000 Y8000 Z600 E1200 			; Maximum travel speeds in mm/min
;M566 X800 Y800 Z300 E40             		; Maximum jerk in mm/min 

M201 X1500 Y1500 Z20 E120 ; Set accelerations (mm/s^2)
M203 X6000 Y6000 Z600 E900 ; Set maximum speeds (mm/min)
M566 X700 Y700 Z200 E80 ; Set maximum instantaneous speed changes (mm/min)


; Stepper Microstepping ---------------------------------------
M92 X80 Y80 Z400		    		; Set XYZ axis steps/mm, 1/16 microstepping. 
M92 E2640	                            	; Set extruder steps per mm, 1/16 microstepping, 
;M92 E2700	                            	; Set extruder steps per mm, 1/16 microstepping, 
M350 X16 Y16 Z16 E16 I1

M906 X800 Y800 Z800 E800 I30 			; Set motor currents (mA) and motor idle factor in per cent
M84 S30 




; Thermistors and heaters --------------------------------

;Bed
M143 H0 S120                        		; Set the maximum bed temperature in c-default is 110c
M305 P0 T100000 B4138 C0 R4700       		; Bed thermistor
M307 H0 A54.8 C100.3 D2.9 S1.00 V24.6 B0	;Set bed to use PID mode

;Hotend
M143 H1 S320                        		; Set the maximum temperature of the hot-end in c - default is 263c
M305 P1 T100000 B4725 C7.060000e-8 R4700   	; hotend thermistor
M307 H1 A268.5 C126.4 D6.6 S1.00 V24.5 B0	; Set hotend to use PID mode

T0 ; Select first tool



; Fans -----------------------------		; Note: Before setting P0 theromstatic (H1), P1 would auto-turn on during boot.
M106 P1 T60 H1                     		; Hotend cooler: Enable fan to kick on at 60c.  
M106 P0 S0 B0.1 				; Filament cooler: Must do, or will go full blast on start :S

; Firmware Retraction & Pressure Advance -----------------
M572 D0 S0.01					; Pressure Advance, acts like 'coast' in Simplify 3D.
M207 S1 R0 F2400 T2400 Z0.4          		; Firmware Retraction : Positive S retracts, negative R unretracts (possitive R extra-extrudes),	
						; F retract speed, T unretract speed, Z zlift - Slicer must insert G10 & G11

     	

 
