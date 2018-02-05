; Init ----------------------------
M111 S0 					; Debugging off
M550 PHypercube                    		; PHyperCube
M555 P2 					; Set firmware compatibility to look like Marlin
G21 						; Work in millimetres
G90 						; Send absolute coordinates...
M83 						; ...but relative extruder moves
M667 S1 					; Select CoreXY mode
M208 X298 Y310 Z400 S0 				; Set axis maxima
M563 P1 D0 H1 					; Define tool 0

; Network ----------------------------
M551 ******      + 1              		; wifi pass
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xED 		; MAC Address - If you have more than one Duet on your network, they must all have different MAC addresses, so change the last digits
M552 S1           				; Enable WiFi

; Endstop configuration -----------------------------------
M574 Z1 S32 					; Set endstops controlled by probe
M915 Y S4.5 R0					; Higher S = less sens
M915 X S4.1 R0

;z probe  ----------------------------
M558 P1 X0 Y0 Z1 H3 F200 T3500 R0 		; smart IR Z probe, used for homing Z axis only, dive height 3mm, probe speed 200mm/min, travel speed 5000mm/min, no recovery time
G31 Z2.52 P536					; X offset X18.5 

;mesh grid
M557 X10:275 Y5:275 S130			; Define mesh grid    


; Stepper drive directions ----------------------------
M569 P0 S0 					; X - Drive 0 goes forwards 
M569 P1 S0 					; Y - Drive 1 goes reversed
M569 P2 S0 					; Z - Drive 2 goes forwards
M569 P3 S0 					; E1 - Drive 3 goes backward - Bondtech BMG


; Accleration, jerk, speeds ----------------------------
M201 X1800 Y1800 Z60 E1800            		; Maximum accelerations (mm/s^2) 
M566 X300 Y300 Z60 E600             		; Maximum jerk in mm/min 
M203 X12000 Y12000 Z1200 E3600       		; Maximum travel speeds in mm/min

; Stepper Microstepping ---------------------------------------
M92 X80 Y80 Z400		    		; Set XYZ axis steps/mm, 1/16 microstepping. 
M92 E415:415                            	; Set extruder steps per mm, 1/16 microstepping, Bondtech BMG, 3:1 gear ratio, 415 E-step at 1/16th
M350 X128 Y128 Z128
M906 X1000 Y1000 Z800 E800 I30 			; Set motor currents (mA) and motor idle factor in per cent
M84 S30 					; Set idle timeout


; Thermistors and heaters --------------------------------
M305 P0 T100000 B4138 C0 R4700 			; Bed thermistor
M305 P1 T100000 R4700 B4267  			; E3D thermistor has beta value 4267
M143 H0 S110                        		; Set the maximum bed temperature in c  - default is 110c
M143 H1 S270                        		; Set the maximum temperature of the hot-end in c - default is 263c



; Fans -----------------------------		; Note: Before setting P0 theromstatic (H1), P1 would auto-turn on during boot.
M106 P1 T60 H1                     		; Hotend cooler: Enable fan to kick on at 60c.  
M106 P0 H-1                           		; Filament cooler: Must do H-1, or it'll turn on with P0 for some reason.
M106 P0 S0                            		; Filament cooler: Must do, or will go full blast on start :S

; Firmware Retraction & Pressure Advance -----------------
;M572 D0 S0.1                       		; Pressure Advance, acts like 'coast' in Simplify 3D.
M207 S6.3 R0 F3600 T3600 Z0.075            	; Firmware Retraction : Positive S retracts, negative R unretracts (possitive R extra-extrudes),	
						; F retract speed, T unretract speed, Z zlift - Slicer must insert G10 & G11

     	

 
