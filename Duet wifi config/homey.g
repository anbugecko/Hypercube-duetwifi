; slow down for homing 
M201 Y200			; max acceleration (mm/s^2)
M566 Y200			; max instantaneous speed change (mm/min) (jerk)


; Sensorless Homing test file for RepRapFirmware on corexy
M400			              	; make sure everything has stopped before we make changes
M574 Y2 S3		          	; set endstops to use motor stall
M913 Y75 		            	; reduce motor current to 50% to prevent belts slipping
G91			                ; use relative positioning
G1 S1 Y325 F2500 S2     		; move all carriages up 700mm, stopping at the endstops
G90			                ; back to absolute positioning
M400			             	; make sure everything has stopped before we reset the motor currents
M913 Y100 		        	; motor currents back to normal
M574 Y2 S1		          	; set endstops to use motor stall

; Normal speed
M201 Y4200 
M566 Y800 
