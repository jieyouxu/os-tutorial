; tty mode: teletype mode

; Target:
;   - write "Hello" to `al` register (lower of `ax`)
;   - write `0x0e` to `ah` register (higher of `ax`)
;   - raise interrupt `0x10` (general video services interrupt)

; `0x0e` on `ah` provides information to the video interrupt that the desired
; functionality to perform is to write contents of `al` in tty mode.

mov al, 'H'
mov ah, 0x0E
int 0x10

mov al, 'e'
mov ah, 0x0E
int 0x10

mov al, 'l'
mov ah, 0x0E
int 0x10
; since al still contains 'l'
int 0x10

mov al, 'o'
mov ah, 0x0E
int 0x10

; Jump to current address (infinite loop)
jmp $

; Required padding (to 510 bytes)
TIMES 510 - ($-$$) db 0

; Boot sector magic number for BIOS (2 bytes)
dw 0xAA55
