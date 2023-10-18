fmt0:   .asciz "두 정수를 입력하시오: "
fmt1:   .asciz "%d"
fmt2:   .asciz "최대공약수는 %d입니다.\n"

        .align 4
        .global main, scanf, printf

main:   save %sp, -96, %sp

        st %g0, [%fp-12]
        mov 1, %l0
        st %l0, [%fp-16]

        set fmt0, %o0
        call printf
        nop

        set fmt1, %o0
        add %fp, -4, %o1
        call scanf
        nop

        set fmt1, %o0
        add %fp, -8, %o1
        call scanf
        nop

loop:   ld [%fp-4], %l1
        ld [%fp-8], %l2
        subcc %l1, %l2, %g0
        bne next
        nop

        ld [%fp-16], %l3
        subcc %l3, 1, %g0
        bne prtb
        nop

        set fmt2, %o0
        ld [%fp-4], %o1
        call printf
        nop

        ba exit
        nop

next:   ld [%fp-4], %l1
        ld [%fp-8], %l2
        subcc %l1, %l2, %g0
        ble el
        nop

        ld [%fp-12], %l0
        ld [%fp-4], %l1
        ld [%fp-8], %l2

        sub %l1, %l2, %l0
        st %l0, [%fp-12]
        mov %l2, %l1
        st %l1, [%fp-4]
        mov %l0, %l2
        st %l2, [%fp-8]


        ld [%fp-16], %l0
        mov %g0, %l0
        st %l0, [%fp-16]

        ba loop
        nop

el:     ld [%fp-12], %l0
        ld [%fp-4], %l1
        ld [%fp-8], %l2

        sub %l2, %l1, %l0
        mov %l1, %l2
        mov %l0, %l1

        st %l0, [%fp-12]
        st %l1, [%fp-4]
        st %l2, [%fp-8]

        ba loop
        nop

prtb:   set fmt2, %o0
        ld [%fp-8], %o1
        call printf
        nop

        ba exit
        nop

exit:   ret
        restore
