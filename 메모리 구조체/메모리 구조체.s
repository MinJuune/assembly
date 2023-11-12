        SIZE = 5
        name = 0
        id = 12
        salary = 20
        emp = -120
        sum = -124
        avg = -128

fmtp:   .asciz ">>직원의 정보(이름,ID,급여)를 입력하세요.<<\n"
fmtr1:  .asciz "%d번:"
fmts:   .asciz "%s %s %d"
fmtr2:  .asciz "\n---------------\n"
fmtr3:  .asciz "급여가 %d만원(평균) 이상인 직원 정보"
fmtr4:  .asciz "\t %s,\t %d만원\n"
fmtr5:  .asciz "---------------\n"
        .align 4
        .global main, scanf, printf

main:   save %sp, -(94+120+8)&-8, %sp

        set emp, %l5
        add %fp, %l5, %l5

        st %g0, [%fp+sum]
        st %g0, [%fp+avg]

        set fmtp, %o0
        call printf
        nop

        mov %g0, %l0
        ba forInputTest
        nop

forInputLoop:
        set fmtr1, %o0
        add %l0, 1, %l1
        mov %l1, %o1
        call printf
        nop

        set fmts, %o0
        add %l5, name, %o1
        add %l5, id, %o2
        add %l5, salary, %o3
        call scanf
        nop

        ld [%fp+sum], %l2
        ld [%l5+salary], %l3
        add %l2, %l3, %l2
        st %l2, [%fp+sum]

inc_i:  inc %l0
        add %l5, 24, %l5

forInputTest:
        cmp %l0, SIZE
        bl forInputLoop
        nop

next:   ld [%fp+sum], %l3
        mov %l3, %o0
        mov SIZE, %o1
        call .div
        nop
        mov %o0, %l3
        ld [%fp+avg], %l4
        mov %l3, %l4
        st %l4, [%fp+avg]

        set fmtr2, %o0
        call printf
        nop

        set fmtr3, %o0
        ld [%fp+avg], %o1
        call printf
        nop

        set fmtr2, %o0
        call printf
        nop

        mov %g0, %l0
        set emp, %l5
        add %fp, %l5, %l5

outputLoop:
        ld [%l5+salary], %l3
        ld [%fp+avg], %l4
        cmp %l3, %l4
        bl inc_i2
        nop

        set fmtr4, %o0
        add %l5, id, %o1
        ld [%l5+salary], %o2
        call printf
        nop

inc_i2: inc %l0
        add %l5, 24, %l5

outputTest:
        cmp %l0, SIZE
        bl outputLoop
        nop

result: set fmtr5, %o0
        call printf
        nop

        ret
        restore
