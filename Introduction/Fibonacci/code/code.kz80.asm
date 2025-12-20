; Variables - lines 10-20 in BASIC code
n       defb    10      ; Fibonacci input
a_var   defb    0       ; a = 0
b_var   defb    1       ; b = 1
c_var   defb    0
i_var   defb    1       ; Loop counter

; LOOP
loop:   
        ld a,(i_var)    ; 'A' register only register that can load from a memory address 
        ld b,a          ; register 'B' = i_var

        ld a,(n)        ; Load register A with n
        dec a           ; Decrement A (n-1)
        cp b            ; Compare registers A and B '(n-1) - i_var'
        jr z,done       ; If zero then branch

        ; c=a+b
        ld a,(a_var)    
        ld d,a

        ld a,(b_var)
        add a,d
        ld (c_var),a

        ; a=b
        ld a,(b_var)
        ld (a_var),a

        ; b=c
        ld a,(c_var)
        ld (b_var),a

        ; i=i+1
        ld a,(i_var)
        inc a
        ld (i_var),a

        jr loop

done:
        ld a,(a_var)    ; Load register A with a_var
        add a,48        ; Convert 0-9 to ASCII
        rst 16          ; Print to screen
        ret             ; Return to BASIC