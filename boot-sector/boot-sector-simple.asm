; Infinite loop (ED FD FF)
loop:
    jmp loop

; Pad 510 zeros modulo infinite loop
times 510-($-$$) db 0

; Magic constant for BIOS to check byte alignment, i.e. boot sector is in fact
; loaded in the first sector of the storage medium. Required that bytes 511
; and 512 of the candidate boot sector are exactly 0xAA55. Should this check
; pass, then the BIOS can determine that the residing disk is bootable.
dw 0xAA55
