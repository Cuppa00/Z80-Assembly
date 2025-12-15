10 LET a=32500          REM Starting address for machine code
20 FOR i=1 TO 4         REM Loop through each byte
30 READ n: POKE a,n     REM Write byte to memory
40 LET a=a+1            REM Increment memory pointer
50 NEXT i               REM Repeat loop
60 PRINT USR 32500      REM Call machine code and print result
70 DATA 1,99,0,201      REM Machine code: ld bc, 99; ret