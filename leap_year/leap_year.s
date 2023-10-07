fmt0:   .asciz "년도를 입력하세요(종료:음수)"
fmt1:   .asciz "%d"
fmt2:   .asciz "%d 윤년입니다.\n"
fmt3:   .asciz "%d 평년입니다.\n"

        .align 4
        .global main, scanf, printf

main:   save %sp, -96, %sp

loop:   set fmt0, %o0
        call printf
        nop

        set fmt1, %o0
        call scanf
        add %fp, -4, %o1
        nop
        ld [%fp-4], %l0

        ba contents
        nop

contents:
        cmp %l0, 0
        bl exit

        mov %l0, %o0
        mov 400, %o1
        call .rem
        nop

        mov %o0, %l1
        cmp %l1, 0
        bne contents2
        nop

        set fmt2,%o0
        call printf
        mov %l0, %o1
        ba loop
        nop

contents2:
        mov %l0, %o0
        mov 4, %o1
        call .rem
        nop

        mov %o0, %l2
        cmp %l2, 0
        be divide
        nop

        set fmt3, %o0
        call printf
        mov %l0, %o1
        ba loop
        nop
        
leap_year:
        set fmt2, %o0
        call printf
        mov %l0, %o1
        ba loop
        nop

divide: mov %l0, %o0
        mov 100, %o1
        call .rem
        nop

        cmp %o0, 0
        bne leap_year
        nop

        set fmt3, %o0
        call printf
        mov %l0, %o1
        ba loop
        nop

exit:   ret
        restore
        
