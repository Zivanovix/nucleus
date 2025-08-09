.extern handleSupervisorTrap
.global supervisorTrap
.align 4
supervisorTrap:
    addi sp, sp, -248

    sd	s0, 0x00(sp)
    sd	s1, 0x08(sp)
    sd	s2, 0x10(sp)
    sd	s3, 0x18(sp)
    sd	s4, 0x20(sp)
    sd	s5, 0x28(sp)
    sd	s6, 0x30(sp)
    sd	s7, 0x38(sp)
    sd	s8, 0x40(sp)
    sd	s9, 0x48(sp)
    sd	s10, 0x50(sp)
    sd	s11, 0x58(sp)

    sd	ra, 0x60(sp)

    sd	a0, 0x68(sp)
    sd	a1, 0x70(sp)
    sd	a2, 0x78(sp)
    sd	a3, 0x80(sp)
    sd	a4, 0x88(sp)
    sd	a5, 0x90(sp)
    sd	a6, 0x98(sp)
    sd	a7, 0xA0(sp)

    sd	t0, 0xA8(sp)
    sd	t1, 0xB0(sp)
    sd	t2, 0xB8(sp)
    sd	t3, 0xC0(sp)
    sd	t4, 0xC8(sp)
    sd	t5, 0xD0(sp)
    sd	t6, 0xD8(sp)
    sd	gp, 0xE0(sp)
    sd	tp, 0xE8(sp)
    sd	sp, 0xF0(sp)

    mv a0, sp;
    call handleSupervisorTrap

    ld	s0, 0x00(sp)
    ld	s1, 0x08(sp)
    ld	s2, 0x10(sp)
    ld	s3, 0x18(sp)
    ld	s4, 0x20(sp)
    ld	s5, 0x28(sp)
    ld	s6, 0x30(sp)
    ld	s7, 0x38(sp)
    ld	s8, 0x40(sp)
    ld	s9, 0x48(sp)
    ld	s10, 0x50(sp)
    ld	s11, 0x58(sp)
    ld	ra, 0x60(sp)

    ld	a0, 0x68(sp)
    ld	a1, 0x70(sp)
    ld	a2, 0x78(sp)
    ld	a3, 0x80(sp)
    ld	a4, 0x88(sp)
    ld	a5, 0x90(sp)
    ld	a6, 0x98(sp)
    ld	a7, 0xA0(sp)

    ld	t0, 0xA8(sp)
    ld	t1, 0xB0(sp)
    ld	t2, 0xB8(sp)
    ld	t3, 0xC0(sp)
    ld	t4, 0xC8(sp)
    ld	t5, 0xD0(sp)
    ld	t6, 0xD8(sp)
    ld	gp, 0xE0(sp)
    ld	tp, 0xE8(sp)
    ld	sp, 0xF0(sp)

    addi sp, sp, 248
    sret