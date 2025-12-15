        ld a,2          ; Select channel 2 (upper screen)
        call 5633       ; ROM routine: open the selected channel

        ld a,21         ; Starting row (near bottom of screen)
        ld (xcoord),a   ; Store initial vertical (row) position

loop    call setxy      ; Position the cursor at (xcoord, ycoord)

        ld a,'*'        ; ASCII character '*' to be displayed
        rst 16          ; ROM routine: print character in A

        call delay      ; Pause so the movement is visible

        call setxy      ; Re-position cursor at current coordinates
        ld a,32         ; ASCII code for space character
        rst 16          ; Erase the previous asterisk

        ld hl,xcoord    ; HL points to the vertical position variable
        dec (hl)        ; Move the asterisk up one row

        ld a,(hl)       ; Load updated row value into A
        cp 255          ; Check if row has wrapped past the top
        jr nz, loop     ; If not 255, continue moving upwards

        ret             ; Return to BASIC when finished

; Delay routine
delay   ld b,10         ; Set delay loop counter

delay0  halt            ; Wait for one frame (interrupt)
        djnz delay0     ; Repeat until B reaches zero
        ret             ; Return from delay

; Set cursor position routine
setxy   ld a,22         ; ASCII control code for AT (cursor positioning)
        rst 16          ; Print control code

        ld a,(xcoord)   ; Load row (vertical position)
        rst 16          ; Print row value

        ld a,(ycoord)   ; Load column (horizontal position)
        rst 16          ; Print column value

        ret             ; Return to caller

; Variables
xcoord  defb 0           ; Current vertical screen position (row)
ycoord  defb 15          ; Fixed horizontal screen position (column)