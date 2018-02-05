; stop.g
; called when a print is cancelled after a pause.
M106 S0
G91
G1 Z10 			; move bed down
G90
G28 X Y