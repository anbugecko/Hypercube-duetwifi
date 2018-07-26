;Speed up for probing
M201 Z2400            		; Maximum accelerations (mm/s^2) 
M566 Z1200              		; Maximum jerk in mm/min 
M203 Z1200 

G91
G1 Z10 S2  			; move bed down
G90
G30

;Normal speed
M201 Z700
M566 Z300              		
M203 Z600