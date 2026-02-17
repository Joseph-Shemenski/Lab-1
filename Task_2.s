.section .bss
.globl ram
.lcomm ram, 256     # Reserve 256 bytes of RAM (uninitialized memory)

.section .text
.globl fill_ram     # Make function visible to C program

fill_ram:
    # Store FFh into RAM locations 50H - 58H using indirect addressing
     
    mov $ram+0x50, %ebx
    mov $0, %eax # counter for how many times the function loops
    mov $9, %ecx # amount of times the function should loop

repeat:
    movb $0xFF, (%ebx)  
    incl %ebx           # increments to the next RAM location
    incl %eax           # increments the counter
    cmpl %eax, %ecx     # compares the counter to the max amount of loops
    jne repeat          # calls the function to loop again

    ret                     # Return control back to C program

.section .note.GNU-stack,"",@progbits
