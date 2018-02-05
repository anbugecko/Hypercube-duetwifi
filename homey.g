; Sensorless Homing test file for RepRapFirmware on corexy
M400			; make sure everything has stopped before we make changes
M574 Y2 S3		; set endstops to use motor stall
M913 Y85 		; reduce motor current to 50% to prevent belts slipping
G91			; use relative positioning
G1 S1 Y325 F3000 	; move all carriages up 700mm, stopping at the endstops
G90			; back to absolute positioning
M400			; make sure everything has stopped before we reset the motor currents
M913 Y100 		; motor currents back to normal
M574 Y2 S1		;set endstops back to normal so that homedelta.g works