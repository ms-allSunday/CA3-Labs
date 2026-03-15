.global lab1
.syntax unified
.cpu cortex-m4
.thumb

lab1:
    push {lr}

    // a, b, c
    mov r0, #4      // a
    mov r1, #2      // b
    mov r2, #2      // c

    // r3 = a + b
    add r3, r0, r1
    mov r4, #10
    cmp r3, r4
    bgt greater_case

    // ---------- a+b ≤ 10 ----------
    // r5 = (a - b) >> c^2
    sub r5, r0, r1
    mov r6, r2
    mul r6, r6, r6
    lsr r5, r5, r6

    // r8 = a | b
    orr r8, r0, r1

    // result in r9
    add r9, r5, r6
    add r9, r9, r8
    b end

greater_case:
    // ---------- a+b > 10 ----------
    // r5 = (a + b) >> c!
    mov r5, r3
    mov r6, #1
    lsr r5, r5, r6

    // factorial c! in r7
    mov r7, #1
    mov r8, r2
fact_loop:
    cmp r8, #1
    ble fact_done
    mul r7, r7, r8
    sub r8, r8, #1
    b fact_loop
fact_done:

    // r10 = a & b
    and r10, r0, r1

    // final result in r9
    add r9, r5, r7
    add r9, r9, r10

end:
    pop {pc}
