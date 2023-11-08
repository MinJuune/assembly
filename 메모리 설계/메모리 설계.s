        .section ".text"

        a_s = -4
        b_s = -5
        c_s = -8
        d_s = -12
        e_s = -14
        total_s = -20
fmt:    .asciz "5개의 값(정수)을 입력하시오"
fmts:   .asciz "%d %hhd %hd %d %hd"
fmtp:   .asciz "total = %d\n"

        .align 4
        .global main, scanf, printf
main:   save %sp, -120, %sp

        set fmt, %o0
        call printf
        nop

        set fmts, %o0
        add %fp, a_s, %o1
        add %fp, b_s, %o2
        add %fp, c_s, %o3
        add %fp, d_s, %o4
        add %fp, e_s, %o5
        call scanf
        nop

        ld [%fp+a_s], %l0
        ldub [%fp+b_s], %l1
        add %l0, %l1, %l0
        st %l0, [%fp+total_s]

        ld [%fp+total_s], %l0
        lduh [%fp+c_s], %l1
        add %l0, %l1, %l0
        st %l0, [%fp+total_s]

        ld [%fp+total_s], %l0
        ld [%fp+d_s], %l2
        add %l0, %l2, %l0
        st %l0, [%fp+total_s]

        ld [%fp+total_s], %l0
        lduh [%fp+e_s], %l2
        add %l0, %l2, %l0
        st %l0, [%fp+total_s]

        set fmtp, %o0
        ld [%fp+total_s], %o1
        call printf
        nop

        ret
        restore
