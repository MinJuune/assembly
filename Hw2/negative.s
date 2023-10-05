fmt2:   .asciz "정수 n값:%d, 정수 -n값:%d\n"
        .align 4
        .global main
main:   save    %sp, -96, %sp
        mov     34, %l0
        mov     -1, %l1
        xor     %l0, %l1, %l2
        add     %l2, 1, %l2
next_r: set     fmt2, %o0
        mov     %l0, %o1
        mov     %l2, %o2
        call    printf
        nop

        ret
        restore
