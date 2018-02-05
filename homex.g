; Sensorless Homing test file for RepRapFirmware on corexy
M400			; make sure everything has stopped before we make changes
M574 X1 S3		; set endstops to use motor stall
M913 X50 		; reduce motor current to 50% to prevent belts slipping
G91			; use relative positioning
G1 S1 X-325 F3500 	; 
G90			; back to absolute positioning
M400			; make sure everything has stopped before we reset the motor currents
M913 X100 		; motor currents back to normal
M574 X2 S1		;set endstops back to normal so that homedelta.g works