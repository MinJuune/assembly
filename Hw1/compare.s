fmt:    .asciz "sorted value=%d, %d\n"
        .align 4

        .global main
main:   save %sp, -96, %sp
        mov 30, %l0
        mov 10, %l1
        mov 0 , %l2
loop:   subcc %l1,%l0, %g0
        bg next_r
        nop
        mov %l0, %l2
        mov %l1, %l0
        mov %l2, %l1
        ba loop
        nop
next_r: set fmt, %o0
        mov %l0, %o1
        mov %l1, %o2
        call printf
        nop

        ret
        restore
~
