; Pause macro file
M106 P2 S0				; Laser off
M83					; relative extruder moves
G1 E-3 F2500		; retract 4mm
G91					; relative moves
G1 Z2 F5000			; raise nozzle 2mm
G90					; absolute moves
G1 X0 Y85 F5000		; move head out of the way of the print
