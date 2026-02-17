.section .bss
.globl ram
.lcomm ram, 256     # Reserve 256 bytes of RAM (uninitialized memory)

.section .text
.globl fill_ram     # Make function visible to C program

fill_ram:
    # Stores the the sum of 1+2+3+...+10 in RAM location 50H
    
    movl $0, %eax 
    movl $1, %ebx
    movl $11, %ecx  # counter used for the repeat loop
 
    # loop that adds 1+2+...+10
repeat:
    add %ebx, %eax
    inc %ebx
    cmpl %ebx, %ecx  # compares the value ebx and ecx
    jne repeat # if ebx is less than ecx then it calls the repeat function again

    movl %eax, ram+0x50 #moves the hexadecimal value of eax into RAM location 50H

    # prints out 37h in RAM location 50
    
    
    ret                     # Return control back to C program

.section .note.GNU-stack,"",@progbits
