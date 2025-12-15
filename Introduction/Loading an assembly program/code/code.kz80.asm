ld bc, 99 ; Load the value 99 into register BC
          ; B = high byte (0), C = low byte (99)
ret       ; Return from subroutine
          ; When called via PRINT USR, the value in BC is returned to BASIC