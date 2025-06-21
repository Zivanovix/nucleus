
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	20813103          	ld	sp,520(sp) # 80004208 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	04c010ef          	jal	ra,80001068 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <main>:
#include "../lib/console.h"
#include "../lib/hw.h"



void main() {
    80001000:	ff010113          	addi	sp,sp,-16
    80001004:	00113423          	sd	ra,8(sp)
    80001008:	00813023          	sd	s0,0(sp)
    8000100c:	01010413          	addi	s0,sp,16
    __putc('o');
    80001010:	06f00513          	li	a0,111
    80001014:	00002097          	auipc	ra,0x2
    80001018:	118080e7          	jalr	280(ra) # 8000312c <__putc>
    __putc('s');
    8000101c:	07300513          	li	a0,115
    80001020:	00002097          	auipc	ra,0x2
    80001024:	10c080e7          	jalr	268(ra) # 8000312c <__putc>
    __putc('1');
    80001028:	03100513          	li	a0,49
    8000102c:	00002097          	auipc	ra,0x2
    80001030:	100080e7          	jalr	256(ra) # 8000312c <__putc>
    __putc('\n');
    80001034:	00a00513          	li	a0,10
    80001038:	00002097          	auipc	ra,0x2
    8000103c:	0f4080e7          	jalr	244(ra) # 8000312c <__putc>
    __putc('\n');
    80001040:	00a00513          	li	a0,10
    80001044:	00002097          	auipc	ra,0x2
    80001048:	0e8080e7          	jalr	232(ra) # 8000312c <__putc>

    while(1) {
        char character = __getc();
    8000104c:	00002097          	auipc	ra,0x2
    80001050:	11c080e7          	jalr	284(ra) # 80003168 <__getc>
        __putc(character + 30);
    80001054:	01e5051b          	addiw	a0,a0,30
    80001058:	0ff57513          	andi	a0,a0,255
    8000105c:	00002097          	auipc	ra,0x2
    80001060:	0d0080e7          	jalr	208(ra) # 8000312c <__putc>
    while(1) {
    80001064:	fe9ff06f          	j	8000104c <main+0x4c>

0000000080001068 <start>:
    80001068:	ff010113          	addi	sp,sp,-16
    8000106c:	00813423          	sd	s0,8(sp)
    80001070:	01010413          	addi	s0,sp,16
    80001074:	300027f3          	csrr	a5,mstatus
    80001078:	ffffe737          	lui	a4,0xffffe
    8000107c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff935f>
    80001080:	00e7f7b3          	and	a5,a5,a4
    80001084:	00001737          	lui	a4,0x1
    80001088:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000108c:	00e7e7b3          	or	a5,a5,a4
    80001090:	30079073          	csrw	mstatus,a5
    80001094:	00000797          	auipc	a5,0x0
    80001098:	16078793          	addi	a5,a5,352 # 800011f4 <system_main>
    8000109c:	34179073          	csrw	mepc,a5
    800010a0:	00000793          	li	a5,0
    800010a4:	18079073          	csrw	satp,a5
    800010a8:	000107b7          	lui	a5,0x10
    800010ac:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800010b0:	30279073          	csrw	medeleg,a5
    800010b4:	30379073          	csrw	mideleg,a5
    800010b8:	104027f3          	csrr	a5,sie
    800010bc:	2227e793          	ori	a5,a5,546
    800010c0:	10479073          	csrw	sie,a5
    800010c4:	fff00793          	li	a5,-1
    800010c8:	00a7d793          	srli	a5,a5,0xa
    800010cc:	3b079073          	csrw	pmpaddr0,a5
    800010d0:	00f00793          	li	a5,15
    800010d4:	3a079073          	csrw	pmpcfg0,a5
    800010d8:	f14027f3          	csrr	a5,mhartid
    800010dc:	0200c737          	lui	a4,0x200c
    800010e0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800010e4:	0007869b          	sext.w	a3,a5
    800010e8:	00269713          	slli	a4,a3,0x2
    800010ec:	000f4637          	lui	a2,0xf4
    800010f0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800010f4:	00d70733          	add	a4,a4,a3
    800010f8:	0037979b          	slliw	a5,a5,0x3
    800010fc:	020046b7          	lui	a3,0x2004
    80001100:	00d787b3          	add	a5,a5,a3
    80001104:	00c585b3          	add	a1,a1,a2
    80001108:	00371693          	slli	a3,a4,0x3
    8000110c:	00003717          	auipc	a4,0x3
    80001110:	14470713          	addi	a4,a4,324 # 80004250 <timer_scratch>
    80001114:	00b7b023          	sd	a1,0(a5)
    80001118:	00d70733          	add	a4,a4,a3
    8000111c:	00f73c23          	sd	a5,24(a4)
    80001120:	02c73023          	sd	a2,32(a4)
    80001124:	34071073          	csrw	mscratch,a4
    80001128:	00000797          	auipc	a5,0x0
    8000112c:	6e878793          	addi	a5,a5,1768 # 80001810 <timervec>
    80001130:	30579073          	csrw	mtvec,a5
    80001134:	300027f3          	csrr	a5,mstatus
    80001138:	0087e793          	ori	a5,a5,8
    8000113c:	30079073          	csrw	mstatus,a5
    80001140:	304027f3          	csrr	a5,mie
    80001144:	0807e793          	ori	a5,a5,128
    80001148:	30479073          	csrw	mie,a5
    8000114c:	f14027f3          	csrr	a5,mhartid
    80001150:	0007879b          	sext.w	a5,a5
    80001154:	00078213          	mv	tp,a5
    80001158:	30200073          	mret
    8000115c:	00813403          	ld	s0,8(sp)
    80001160:	01010113          	addi	sp,sp,16
    80001164:	00008067          	ret

0000000080001168 <timerinit>:
    80001168:	ff010113          	addi	sp,sp,-16
    8000116c:	00813423          	sd	s0,8(sp)
    80001170:	01010413          	addi	s0,sp,16
    80001174:	f14027f3          	csrr	a5,mhartid
    80001178:	0200c737          	lui	a4,0x200c
    8000117c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001180:	0007869b          	sext.w	a3,a5
    80001184:	00269713          	slli	a4,a3,0x2
    80001188:	000f4637          	lui	a2,0xf4
    8000118c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001190:	00d70733          	add	a4,a4,a3
    80001194:	0037979b          	slliw	a5,a5,0x3
    80001198:	020046b7          	lui	a3,0x2004
    8000119c:	00d787b3          	add	a5,a5,a3
    800011a0:	00c585b3          	add	a1,a1,a2
    800011a4:	00371693          	slli	a3,a4,0x3
    800011a8:	00003717          	auipc	a4,0x3
    800011ac:	0a870713          	addi	a4,a4,168 # 80004250 <timer_scratch>
    800011b0:	00b7b023          	sd	a1,0(a5)
    800011b4:	00d70733          	add	a4,a4,a3
    800011b8:	00f73c23          	sd	a5,24(a4)
    800011bc:	02c73023          	sd	a2,32(a4)
    800011c0:	34071073          	csrw	mscratch,a4
    800011c4:	00000797          	auipc	a5,0x0
    800011c8:	64c78793          	addi	a5,a5,1612 # 80001810 <timervec>
    800011cc:	30579073          	csrw	mtvec,a5
    800011d0:	300027f3          	csrr	a5,mstatus
    800011d4:	0087e793          	ori	a5,a5,8
    800011d8:	30079073          	csrw	mstatus,a5
    800011dc:	304027f3          	csrr	a5,mie
    800011e0:	0807e793          	ori	a5,a5,128
    800011e4:	30479073          	csrw	mie,a5
    800011e8:	00813403          	ld	s0,8(sp)
    800011ec:	01010113          	addi	sp,sp,16
    800011f0:	00008067          	ret

00000000800011f4 <system_main>:
    800011f4:	fe010113          	addi	sp,sp,-32
    800011f8:	00813823          	sd	s0,16(sp)
    800011fc:	00913423          	sd	s1,8(sp)
    80001200:	00113c23          	sd	ra,24(sp)
    80001204:	02010413          	addi	s0,sp,32
    80001208:	00000097          	auipc	ra,0x0
    8000120c:	0c4080e7          	jalr	196(ra) # 800012cc <cpuid>
    80001210:	00003497          	auipc	s1,0x3
    80001214:	01048493          	addi	s1,s1,16 # 80004220 <started>
    80001218:	02050263          	beqz	a0,8000123c <system_main+0x48>
    8000121c:	0004a783          	lw	a5,0(s1)
    80001220:	0007879b          	sext.w	a5,a5
    80001224:	fe078ce3          	beqz	a5,8000121c <system_main+0x28>
    80001228:	0ff0000f          	fence
    8000122c:	00003517          	auipc	a0,0x3
    80001230:	e0450513          	addi	a0,a0,-508 # 80004030 <console_handler+0xe90>
    80001234:	00001097          	auipc	ra,0x1
    80001238:	a78080e7          	jalr	-1416(ra) # 80001cac <panic>
    8000123c:	00001097          	auipc	ra,0x1
    80001240:	9cc080e7          	jalr	-1588(ra) # 80001c08 <consoleinit>
    80001244:	00001097          	auipc	ra,0x1
    80001248:	158080e7          	jalr	344(ra) # 8000239c <printfinit>
    8000124c:	00003517          	auipc	a0,0x3
    80001250:	ec450513          	addi	a0,a0,-316 # 80004110 <console_handler+0xf70>
    80001254:	00001097          	auipc	ra,0x1
    80001258:	ab4080e7          	jalr	-1356(ra) # 80001d08 <__printf>
    8000125c:	00003517          	auipc	a0,0x3
    80001260:	da450513          	addi	a0,a0,-604 # 80004000 <console_handler+0xe60>
    80001264:	00001097          	auipc	ra,0x1
    80001268:	aa4080e7          	jalr	-1372(ra) # 80001d08 <__printf>
    8000126c:	00003517          	auipc	a0,0x3
    80001270:	ea450513          	addi	a0,a0,-348 # 80004110 <console_handler+0xf70>
    80001274:	00001097          	auipc	ra,0x1
    80001278:	a94080e7          	jalr	-1388(ra) # 80001d08 <__printf>
    8000127c:	00001097          	auipc	ra,0x1
    80001280:	4ac080e7          	jalr	1196(ra) # 80002728 <kinit>
    80001284:	00000097          	auipc	ra,0x0
    80001288:	148080e7          	jalr	328(ra) # 800013cc <trapinit>
    8000128c:	00000097          	auipc	ra,0x0
    80001290:	16c080e7          	jalr	364(ra) # 800013f8 <trapinithart>
    80001294:	00000097          	auipc	ra,0x0
    80001298:	5bc080e7          	jalr	1468(ra) # 80001850 <plicinit>
    8000129c:	00000097          	auipc	ra,0x0
    800012a0:	5dc080e7          	jalr	1500(ra) # 80001878 <plicinithart>
    800012a4:	00000097          	auipc	ra,0x0
    800012a8:	078080e7          	jalr	120(ra) # 8000131c <userinit>
    800012ac:	0ff0000f          	fence
    800012b0:	00100793          	li	a5,1
    800012b4:	00003517          	auipc	a0,0x3
    800012b8:	d6450513          	addi	a0,a0,-668 # 80004018 <console_handler+0xe78>
    800012bc:	00f4a023          	sw	a5,0(s1)
    800012c0:	00001097          	auipc	ra,0x1
    800012c4:	a48080e7          	jalr	-1464(ra) # 80001d08 <__printf>
    800012c8:	0000006f          	j	800012c8 <system_main+0xd4>

00000000800012cc <cpuid>:
    800012cc:	ff010113          	addi	sp,sp,-16
    800012d0:	00813423          	sd	s0,8(sp)
    800012d4:	01010413          	addi	s0,sp,16
    800012d8:	00020513          	mv	a0,tp
    800012dc:	00813403          	ld	s0,8(sp)
    800012e0:	0005051b          	sext.w	a0,a0
    800012e4:	01010113          	addi	sp,sp,16
    800012e8:	00008067          	ret

00000000800012ec <mycpu>:
    800012ec:	ff010113          	addi	sp,sp,-16
    800012f0:	00813423          	sd	s0,8(sp)
    800012f4:	01010413          	addi	s0,sp,16
    800012f8:	00020793          	mv	a5,tp
    800012fc:	00813403          	ld	s0,8(sp)
    80001300:	0007879b          	sext.w	a5,a5
    80001304:	00779793          	slli	a5,a5,0x7
    80001308:	00004517          	auipc	a0,0x4
    8000130c:	f7850513          	addi	a0,a0,-136 # 80005280 <cpus>
    80001310:	00f50533          	add	a0,a0,a5
    80001314:	01010113          	addi	sp,sp,16
    80001318:	00008067          	ret

000000008000131c <userinit>:
    8000131c:	ff010113          	addi	sp,sp,-16
    80001320:	00813423          	sd	s0,8(sp)
    80001324:	01010413          	addi	s0,sp,16
    80001328:	00813403          	ld	s0,8(sp)
    8000132c:	01010113          	addi	sp,sp,16
    80001330:	00000317          	auipc	t1,0x0
    80001334:	cd030067          	jr	-816(t1) # 80001000 <main>

0000000080001338 <either_copyout>:
    80001338:	ff010113          	addi	sp,sp,-16
    8000133c:	00813023          	sd	s0,0(sp)
    80001340:	00113423          	sd	ra,8(sp)
    80001344:	01010413          	addi	s0,sp,16
    80001348:	02051663          	bnez	a0,80001374 <either_copyout+0x3c>
    8000134c:	00058513          	mv	a0,a1
    80001350:	00060593          	mv	a1,a2
    80001354:	0006861b          	sext.w	a2,a3
    80001358:	00002097          	auipc	ra,0x2
    8000135c:	c5c080e7          	jalr	-932(ra) # 80002fb4 <__memmove>
    80001360:	00813083          	ld	ra,8(sp)
    80001364:	00013403          	ld	s0,0(sp)
    80001368:	00000513          	li	a0,0
    8000136c:	01010113          	addi	sp,sp,16
    80001370:	00008067          	ret
    80001374:	00003517          	auipc	a0,0x3
    80001378:	ce450513          	addi	a0,a0,-796 # 80004058 <console_handler+0xeb8>
    8000137c:	00001097          	auipc	ra,0x1
    80001380:	930080e7          	jalr	-1744(ra) # 80001cac <panic>

0000000080001384 <either_copyin>:
    80001384:	ff010113          	addi	sp,sp,-16
    80001388:	00813023          	sd	s0,0(sp)
    8000138c:	00113423          	sd	ra,8(sp)
    80001390:	01010413          	addi	s0,sp,16
    80001394:	02059463          	bnez	a1,800013bc <either_copyin+0x38>
    80001398:	00060593          	mv	a1,a2
    8000139c:	0006861b          	sext.w	a2,a3
    800013a0:	00002097          	auipc	ra,0x2
    800013a4:	c14080e7          	jalr	-1004(ra) # 80002fb4 <__memmove>
    800013a8:	00813083          	ld	ra,8(sp)
    800013ac:	00013403          	ld	s0,0(sp)
    800013b0:	00000513          	li	a0,0
    800013b4:	01010113          	addi	sp,sp,16
    800013b8:	00008067          	ret
    800013bc:	00003517          	auipc	a0,0x3
    800013c0:	cc450513          	addi	a0,a0,-828 # 80004080 <console_handler+0xee0>
    800013c4:	00001097          	auipc	ra,0x1
    800013c8:	8e8080e7          	jalr	-1816(ra) # 80001cac <panic>

00000000800013cc <trapinit>:
    800013cc:	ff010113          	addi	sp,sp,-16
    800013d0:	00813423          	sd	s0,8(sp)
    800013d4:	01010413          	addi	s0,sp,16
    800013d8:	00813403          	ld	s0,8(sp)
    800013dc:	00003597          	auipc	a1,0x3
    800013e0:	ccc58593          	addi	a1,a1,-820 # 800040a8 <console_handler+0xf08>
    800013e4:	00004517          	auipc	a0,0x4
    800013e8:	f1c50513          	addi	a0,a0,-228 # 80005300 <tickslock>
    800013ec:	01010113          	addi	sp,sp,16
    800013f0:	00001317          	auipc	t1,0x1
    800013f4:	5c830067          	jr	1480(t1) # 800029b8 <initlock>

00000000800013f8 <trapinithart>:
    800013f8:	ff010113          	addi	sp,sp,-16
    800013fc:	00813423          	sd	s0,8(sp)
    80001400:	01010413          	addi	s0,sp,16
    80001404:	00000797          	auipc	a5,0x0
    80001408:	2fc78793          	addi	a5,a5,764 # 80001700 <kernelvec>
    8000140c:	10579073          	csrw	stvec,a5
    80001410:	00813403          	ld	s0,8(sp)
    80001414:	01010113          	addi	sp,sp,16
    80001418:	00008067          	ret

000000008000141c <usertrap>:
    8000141c:	ff010113          	addi	sp,sp,-16
    80001420:	00813423          	sd	s0,8(sp)
    80001424:	01010413          	addi	s0,sp,16
    80001428:	00813403          	ld	s0,8(sp)
    8000142c:	01010113          	addi	sp,sp,16
    80001430:	00008067          	ret

0000000080001434 <usertrapret>:
    80001434:	ff010113          	addi	sp,sp,-16
    80001438:	00813423          	sd	s0,8(sp)
    8000143c:	01010413          	addi	s0,sp,16
    80001440:	00813403          	ld	s0,8(sp)
    80001444:	01010113          	addi	sp,sp,16
    80001448:	00008067          	ret

000000008000144c <kerneltrap>:
    8000144c:	fe010113          	addi	sp,sp,-32
    80001450:	00813823          	sd	s0,16(sp)
    80001454:	00113c23          	sd	ra,24(sp)
    80001458:	00913423          	sd	s1,8(sp)
    8000145c:	02010413          	addi	s0,sp,32
    80001460:	142025f3          	csrr	a1,scause
    80001464:	100027f3          	csrr	a5,sstatus
    80001468:	0027f793          	andi	a5,a5,2
    8000146c:	10079c63          	bnez	a5,80001584 <kerneltrap+0x138>
    80001470:	142027f3          	csrr	a5,scause
    80001474:	0207ce63          	bltz	a5,800014b0 <kerneltrap+0x64>
    80001478:	00003517          	auipc	a0,0x3
    8000147c:	c7850513          	addi	a0,a0,-904 # 800040f0 <console_handler+0xf50>
    80001480:	00001097          	auipc	ra,0x1
    80001484:	888080e7          	jalr	-1912(ra) # 80001d08 <__printf>
    80001488:	141025f3          	csrr	a1,sepc
    8000148c:	14302673          	csrr	a2,stval
    80001490:	00003517          	auipc	a0,0x3
    80001494:	c7050513          	addi	a0,a0,-912 # 80004100 <console_handler+0xf60>
    80001498:	00001097          	auipc	ra,0x1
    8000149c:	870080e7          	jalr	-1936(ra) # 80001d08 <__printf>
    800014a0:	00003517          	auipc	a0,0x3
    800014a4:	c7850513          	addi	a0,a0,-904 # 80004118 <console_handler+0xf78>
    800014a8:	00001097          	auipc	ra,0x1
    800014ac:	804080e7          	jalr	-2044(ra) # 80001cac <panic>
    800014b0:	0ff7f713          	andi	a4,a5,255
    800014b4:	00900693          	li	a3,9
    800014b8:	04d70063          	beq	a4,a3,800014f8 <kerneltrap+0xac>
    800014bc:	fff00713          	li	a4,-1
    800014c0:	03f71713          	slli	a4,a4,0x3f
    800014c4:	00170713          	addi	a4,a4,1
    800014c8:	fae798e3          	bne	a5,a4,80001478 <kerneltrap+0x2c>
    800014cc:	00000097          	auipc	ra,0x0
    800014d0:	e00080e7          	jalr	-512(ra) # 800012cc <cpuid>
    800014d4:	06050663          	beqz	a0,80001540 <kerneltrap+0xf4>
    800014d8:	144027f3          	csrr	a5,sip
    800014dc:	ffd7f793          	andi	a5,a5,-3
    800014e0:	14479073          	csrw	sip,a5
    800014e4:	01813083          	ld	ra,24(sp)
    800014e8:	01013403          	ld	s0,16(sp)
    800014ec:	00813483          	ld	s1,8(sp)
    800014f0:	02010113          	addi	sp,sp,32
    800014f4:	00008067          	ret
    800014f8:	00000097          	auipc	ra,0x0
    800014fc:	3cc080e7          	jalr	972(ra) # 800018c4 <plic_claim>
    80001500:	00a00793          	li	a5,10
    80001504:	00050493          	mv	s1,a0
    80001508:	06f50863          	beq	a0,a5,80001578 <kerneltrap+0x12c>
    8000150c:	fc050ce3          	beqz	a0,800014e4 <kerneltrap+0x98>
    80001510:	00050593          	mv	a1,a0
    80001514:	00003517          	auipc	a0,0x3
    80001518:	bbc50513          	addi	a0,a0,-1092 # 800040d0 <console_handler+0xf30>
    8000151c:	00000097          	auipc	ra,0x0
    80001520:	7ec080e7          	jalr	2028(ra) # 80001d08 <__printf>
    80001524:	01013403          	ld	s0,16(sp)
    80001528:	01813083          	ld	ra,24(sp)
    8000152c:	00048513          	mv	a0,s1
    80001530:	00813483          	ld	s1,8(sp)
    80001534:	02010113          	addi	sp,sp,32
    80001538:	00000317          	auipc	t1,0x0
    8000153c:	3c430067          	jr	964(t1) # 800018fc <plic_complete>
    80001540:	00004517          	auipc	a0,0x4
    80001544:	dc050513          	addi	a0,a0,-576 # 80005300 <tickslock>
    80001548:	00001097          	auipc	ra,0x1
    8000154c:	494080e7          	jalr	1172(ra) # 800029dc <acquire>
    80001550:	00003717          	auipc	a4,0x3
    80001554:	cd470713          	addi	a4,a4,-812 # 80004224 <ticks>
    80001558:	00072783          	lw	a5,0(a4)
    8000155c:	00004517          	auipc	a0,0x4
    80001560:	da450513          	addi	a0,a0,-604 # 80005300 <tickslock>
    80001564:	0017879b          	addiw	a5,a5,1
    80001568:	00f72023          	sw	a5,0(a4)
    8000156c:	00001097          	auipc	ra,0x1
    80001570:	53c080e7          	jalr	1340(ra) # 80002aa8 <release>
    80001574:	f65ff06f          	j	800014d8 <kerneltrap+0x8c>
    80001578:	00001097          	auipc	ra,0x1
    8000157c:	098080e7          	jalr	152(ra) # 80002610 <uartintr>
    80001580:	fa5ff06f          	j	80001524 <kerneltrap+0xd8>
    80001584:	00003517          	auipc	a0,0x3
    80001588:	b2c50513          	addi	a0,a0,-1236 # 800040b0 <console_handler+0xf10>
    8000158c:	00000097          	auipc	ra,0x0
    80001590:	720080e7          	jalr	1824(ra) # 80001cac <panic>

0000000080001594 <clockintr>:
    80001594:	fe010113          	addi	sp,sp,-32
    80001598:	00813823          	sd	s0,16(sp)
    8000159c:	00913423          	sd	s1,8(sp)
    800015a0:	00113c23          	sd	ra,24(sp)
    800015a4:	02010413          	addi	s0,sp,32
    800015a8:	00004497          	auipc	s1,0x4
    800015ac:	d5848493          	addi	s1,s1,-680 # 80005300 <tickslock>
    800015b0:	00048513          	mv	a0,s1
    800015b4:	00001097          	auipc	ra,0x1
    800015b8:	428080e7          	jalr	1064(ra) # 800029dc <acquire>
    800015bc:	00003717          	auipc	a4,0x3
    800015c0:	c6870713          	addi	a4,a4,-920 # 80004224 <ticks>
    800015c4:	00072783          	lw	a5,0(a4)
    800015c8:	01013403          	ld	s0,16(sp)
    800015cc:	01813083          	ld	ra,24(sp)
    800015d0:	00048513          	mv	a0,s1
    800015d4:	0017879b          	addiw	a5,a5,1
    800015d8:	00813483          	ld	s1,8(sp)
    800015dc:	00f72023          	sw	a5,0(a4)
    800015e0:	02010113          	addi	sp,sp,32
    800015e4:	00001317          	auipc	t1,0x1
    800015e8:	4c430067          	jr	1220(t1) # 80002aa8 <release>

00000000800015ec <devintr>:
    800015ec:	142027f3          	csrr	a5,scause
    800015f0:	00000513          	li	a0,0
    800015f4:	0007c463          	bltz	a5,800015fc <devintr+0x10>
    800015f8:	00008067          	ret
    800015fc:	fe010113          	addi	sp,sp,-32
    80001600:	00813823          	sd	s0,16(sp)
    80001604:	00113c23          	sd	ra,24(sp)
    80001608:	00913423          	sd	s1,8(sp)
    8000160c:	02010413          	addi	s0,sp,32
    80001610:	0ff7f713          	andi	a4,a5,255
    80001614:	00900693          	li	a3,9
    80001618:	04d70c63          	beq	a4,a3,80001670 <devintr+0x84>
    8000161c:	fff00713          	li	a4,-1
    80001620:	03f71713          	slli	a4,a4,0x3f
    80001624:	00170713          	addi	a4,a4,1
    80001628:	00e78c63          	beq	a5,a4,80001640 <devintr+0x54>
    8000162c:	01813083          	ld	ra,24(sp)
    80001630:	01013403          	ld	s0,16(sp)
    80001634:	00813483          	ld	s1,8(sp)
    80001638:	02010113          	addi	sp,sp,32
    8000163c:	00008067          	ret
    80001640:	00000097          	auipc	ra,0x0
    80001644:	c8c080e7          	jalr	-884(ra) # 800012cc <cpuid>
    80001648:	06050663          	beqz	a0,800016b4 <devintr+0xc8>
    8000164c:	144027f3          	csrr	a5,sip
    80001650:	ffd7f793          	andi	a5,a5,-3
    80001654:	14479073          	csrw	sip,a5
    80001658:	01813083          	ld	ra,24(sp)
    8000165c:	01013403          	ld	s0,16(sp)
    80001660:	00813483          	ld	s1,8(sp)
    80001664:	00200513          	li	a0,2
    80001668:	02010113          	addi	sp,sp,32
    8000166c:	00008067          	ret
    80001670:	00000097          	auipc	ra,0x0
    80001674:	254080e7          	jalr	596(ra) # 800018c4 <plic_claim>
    80001678:	00a00793          	li	a5,10
    8000167c:	00050493          	mv	s1,a0
    80001680:	06f50663          	beq	a0,a5,800016ec <devintr+0x100>
    80001684:	00100513          	li	a0,1
    80001688:	fa0482e3          	beqz	s1,8000162c <devintr+0x40>
    8000168c:	00048593          	mv	a1,s1
    80001690:	00003517          	auipc	a0,0x3
    80001694:	a4050513          	addi	a0,a0,-1472 # 800040d0 <console_handler+0xf30>
    80001698:	00000097          	auipc	ra,0x0
    8000169c:	670080e7          	jalr	1648(ra) # 80001d08 <__printf>
    800016a0:	00048513          	mv	a0,s1
    800016a4:	00000097          	auipc	ra,0x0
    800016a8:	258080e7          	jalr	600(ra) # 800018fc <plic_complete>
    800016ac:	00100513          	li	a0,1
    800016b0:	f7dff06f          	j	8000162c <devintr+0x40>
    800016b4:	00004517          	auipc	a0,0x4
    800016b8:	c4c50513          	addi	a0,a0,-948 # 80005300 <tickslock>
    800016bc:	00001097          	auipc	ra,0x1
    800016c0:	320080e7          	jalr	800(ra) # 800029dc <acquire>
    800016c4:	00003717          	auipc	a4,0x3
    800016c8:	b6070713          	addi	a4,a4,-1184 # 80004224 <ticks>
    800016cc:	00072783          	lw	a5,0(a4)
    800016d0:	00004517          	auipc	a0,0x4
    800016d4:	c3050513          	addi	a0,a0,-976 # 80005300 <tickslock>
    800016d8:	0017879b          	addiw	a5,a5,1
    800016dc:	00f72023          	sw	a5,0(a4)
    800016e0:	00001097          	auipc	ra,0x1
    800016e4:	3c8080e7          	jalr	968(ra) # 80002aa8 <release>
    800016e8:	f65ff06f          	j	8000164c <devintr+0x60>
    800016ec:	00001097          	auipc	ra,0x1
    800016f0:	f24080e7          	jalr	-220(ra) # 80002610 <uartintr>
    800016f4:	fadff06f          	j	800016a0 <devintr+0xb4>
	...

0000000080001700 <kernelvec>:
    80001700:	f0010113          	addi	sp,sp,-256
    80001704:	00113023          	sd	ra,0(sp)
    80001708:	00213423          	sd	sp,8(sp)
    8000170c:	00313823          	sd	gp,16(sp)
    80001710:	00413c23          	sd	tp,24(sp)
    80001714:	02513023          	sd	t0,32(sp)
    80001718:	02613423          	sd	t1,40(sp)
    8000171c:	02713823          	sd	t2,48(sp)
    80001720:	02813c23          	sd	s0,56(sp)
    80001724:	04913023          	sd	s1,64(sp)
    80001728:	04a13423          	sd	a0,72(sp)
    8000172c:	04b13823          	sd	a1,80(sp)
    80001730:	04c13c23          	sd	a2,88(sp)
    80001734:	06d13023          	sd	a3,96(sp)
    80001738:	06e13423          	sd	a4,104(sp)
    8000173c:	06f13823          	sd	a5,112(sp)
    80001740:	07013c23          	sd	a6,120(sp)
    80001744:	09113023          	sd	a7,128(sp)
    80001748:	09213423          	sd	s2,136(sp)
    8000174c:	09313823          	sd	s3,144(sp)
    80001750:	09413c23          	sd	s4,152(sp)
    80001754:	0b513023          	sd	s5,160(sp)
    80001758:	0b613423          	sd	s6,168(sp)
    8000175c:	0b713823          	sd	s7,176(sp)
    80001760:	0b813c23          	sd	s8,184(sp)
    80001764:	0d913023          	sd	s9,192(sp)
    80001768:	0da13423          	sd	s10,200(sp)
    8000176c:	0db13823          	sd	s11,208(sp)
    80001770:	0dc13c23          	sd	t3,216(sp)
    80001774:	0fd13023          	sd	t4,224(sp)
    80001778:	0fe13423          	sd	t5,232(sp)
    8000177c:	0ff13823          	sd	t6,240(sp)
    80001780:	ccdff0ef          	jal	ra,8000144c <kerneltrap>
    80001784:	00013083          	ld	ra,0(sp)
    80001788:	00813103          	ld	sp,8(sp)
    8000178c:	01013183          	ld	gp,16(sp)
    80001790:	02013283          	ld	t0,32(sp)
    80001794:	02813303          	ld	t1,40(sp)
    80001798:	03013383          	ld	t2,48(sp)
    8000179c:	03813403          	ld	s0,56(sp)
    800017a0:	04013483          	ld	s1,64(sp)
    800017a4:	04813503          	ld	a0,72(sp)
    800017a8:	05013583          	ld	a1,80(sp)
    800017ac:	05813603          	ld	a2,88(sp)
    800017b0:	06013683          	ld	a3,96(sp)
    800017b4:	06813703          	ld	a4,104(sp)
    800017b8:	07013783          	ld	a5,112(sp)
    800017bc:	07813803          	ld	a6,120(sp)
    800017c0:	08013883          	ld	a7,128(sp)
    800017c4:	08813903          	ld	s2,136(sp)
    800017c8:	09013983          	ld	s3,144(sp)
    800017cc:	09813a03          	ld	s4,152(sp)
    800017d0:	0a013a83          	ld	s5,160(sp)
    800017d4:	0a813b03          	ld	s6,168(sp)
    800017d8:	0b013b83          	ld	s7,176(sp)
    800017dc:	0b813c03          	ld	s8,184(sp)
    800017e0:	0c013c83          	ld	s9,192(sp)
    800017e4:	0c813d03          	ld	s10,200(sp)
    800017e8:	0d013d83          	ld	s11,208(sp)
    800017ec:	0d813e03          	ld	t3,216(sp)
    800017f0:	0e013e83          	ld	t4,224(sp)
    800017f4:	0e813f03          	ld	t5,232(sp)
    800017f8:	0f013f83          	ld	t6,240(sp)
    800017fc:	10010113          	addi	sp,sp,256
    80001800:	10200073          	sret
    80001804:	00000013          	nop
    80001808:	00000013          	nop
    8000180c:	00000013          	nop

0000000080001810 <timervec>:
    80001810:	34051573          	csrrw	a0,mscratch,a0
    80001814:	00b53023          	sd	a1,0(a0)
    80001818:	00c53423          	sd	a2,8(a0)
    8000181c:	00d53823          	sd	a3,16(a0)
    80001820:	01853583          	ld	a1,24(a0)
    80001824:	02053603          	ld	a2,32(a0)
    80001828:	0005b683          	ld	a3,0(a1)
    8000182c:	00c686b3          	add	a3,a3,a2
    80001830:	00d5b023          	sd	a3,0(a1)
    80001834:	00200593          	li	a1,2
    80001838:	14459073          	csrw	sip,a1
    8000183c:	01053683          	ld	a3,16(a0)
    80001840:	00853603          	ld	a2,8(a0)
    80001844:	00053583          	ld	a1,0(a0)
    80001848:	34051573          	csrrw	a0,mscratch,a0
    8000184c:	30200073          	mret

0000000080001850 <plicinit>:
    80001850:	ff010113          	addi	sp,sp,-16
    80001854:	00813423          	sd	s0,8(sp)
    80001858:	01010413          	addi	s0,sp,16
    8000185c:	00813403          	ld	s0,8(sp)
    80001860:	0c0007b7          	lui	a5,0xc000
    80001864:	00100713          	li	a4,1
    80001868:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000186c:	00e7a223          	sw	a4,4(a5)
    80001870:	01010113          	addi	sp,sp,16
    80001874:	00008067          	ret

0000000080001878 <plicinithart>:
    80001878:	ff010113          	addi	sp,sp,-16
    8000187c:	00813023          	sd	s0,0(sp)
    80001880:	00113423          	sd	ra,8(sp)
    80001884:	01010413          	addi	s0,sp,16
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	a44080e7          	jalr	-1468(ra) # 800012cc <cpuid>
    80001890:	0085171b          	slliw	a4,a0,0x8
    80001894:	0c0027b7          	lui	a5,0xc002
    80001898:	00e787b3          	add	a5,a5,a4
    8000189c:	40200713          	li	a4,1026
    800018a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800018a4:	00813083          	ld	ra,8(sp)
    800018a8:	00013403          	ld	s0,0(sp)
    800018ac:	00d5151b          	slliw	a0,a0,0xd
    800018b0:	0c2017b7          	lui	a5,0xc201
    800018b4:	00a78533          	add	a0,a5,a0
    800018b8:	00052023          	sw	zero,0(a0)
    800018bc:	01010113          	addi	sp,sp,16
    800018c0:	00008067          	ret

00000000800018c4 <plic_claim>:
    800018c4:	ff010113          	addi	sp,sp,-16
    800018c8:	00813023          	sd	s0,0(sp)
    800018cc:	00113423          	sd	ra,8(sp)
    800018d0:	01010413          	addi	s0,sp,16
    800018d4:	00000097          	auipc	ra,0x0
    800018d8:	9f8080e7          	jalr	-1544(ra) # 800012cc <cpuid>
    800018dc:	00813083          	ld	ra,8(sp)
    800018e0:	00013403          	ld	s0,0(sp)
    800018e4:	00d5151b          	slliw	a0,a0,0xd
    800018e8:	0c2017b7          	lui	a5,0xc201
    800018ec:	00a78533          	add	a0,a5,a0
    800018f0:	00452503          	lw	a0,4(a0)
    800018f4:	01010113          	addi	sp,sp,16
    800018f8:	00008067          	ret

00000000800018fc <plic_complete>:
    800018fc:	fe010113          	addi	sp,sp,-32
    80001900:	00813823          	sd	s0,16(sp)
    80001904:	00913423          	sd	s1,8(sp)
    80001908:	00113c23          	sd	ra,24(sp)
    8000190c:	02010413          	addi	s0,sp,32
    80001910:	00050493          	mv	s1,a0
    80001914:	00000097          	auipc	ra,0x0
    80001918:	9b8080e7          	jalr	-1608(ra) # 800012cc <cpuid>
    8000191c:	01813083          	ld	ra,24(sp)
    80001920:	01013403          	ld	s0,16(sp)
    80001924:	00d5179b          	slliw	a5,a0,0xd
    80001928:	0c201737          	lui	a4,0xc201
    8000192c:	00f707b3          	add	a5,a4,a5
    80001930:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80001934:	00813483          	ld	s1,8(sp)
    80001938:	02010113          	addi	sp,sp,32
    8000193c:	00008067          	ret

0000000080001940 <consolewrite>:
    80001940:	fb010113          	addi	sp,sp,-80
    80001944:	04813023          	sd	s0,64(sp)
    80001948:	04113423          	sd	ra,72(sp)
    8000194c:	02913c23          	sd	s1,56(sp)
    80001950:	03213823          	sd	s2,48(sp)
    80001954:	03313423          	sd	s3,40(sp)
    80001958:	03413023          	sd	s4,32(sp)
    8000195c:	01513c23          	sd	s5,24(sp)
    80001960:	05010413          	addi	s0,sp,80
    80001964:	06c05c63          	blez	a2,800019dc <consolewrite+0x9c>
    80001968:	00060993          	mv	s3,a2
    8000196c:	00050a13          	mv	s4,a0
    80001970:	00058493          	mv	s1,a1
    80001974:	00000913          	li	s2,0
    80001978:	fff00a93          	li	s5,-1
    8000197c:	01c0006f          	j	80001998 <consolewrite+0x58>
    80001980:	fbf44503          	lbu	a0,-65(s0)
    80001984:	0019091b          	addiw	s2,s2,1
    80001988:	00148493          	addi	s1,s1,1
    8000198c:	00001097          	auipc	ra,0x1
    80001990:	a9c080e7          	jalr	-1380(ra) # 80002428 <uartputc>
    80001994:	03298063          	beq	s3,s2,800019b4 <consolewrite+0x74>
    80001998:	00048613          	mv	a2,s1
    8000199c:	00100693          	li	a3,1
    800019a0:	000a0593          	mv	a1,s4
    800019a4:	fbf40513          	addi	a0,s0,-65
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	9dc080e7          	jalr	-1572(ra) # 80001384 <either_copyin>
    800019b0:	fd5518e3          	bne	a0,s5,80001980 <consolewrite+0x40>
    800019b4:	04813083          	ld	ra,72(sp)
    800019b8:	04013403          	ld	s0,64(sp)
    800019bc:	03813483          	ld	s1,56(sp)
    800019c0:	02813983          	ld	s3,40(sp)
    800019c4:	02013a03          	ld	s4,32(sp)
    800019c8:	01813a83          	ld	s5,24(sp)
    800019cc:	00090513          	mv	a0,s2
    800019d0:	03013903          	ld	s2,48(sp)
    800019d4:	05010113          	addi	sp,sp,80
    800019d8:	00008067          	ret
    800019dc:	00000913          	li	s2,0
    800019e0:	fd5ff06f          	j	800019b4 <consolewrite+0x74>

00000000800019e4 <consoleread>:
    800019e4:	f9010113          	addi	sp,sp,-112
    800019e8:	06813023          	sd	s0,96(sp)
    800019ec:	04913c23          	sd	s1,88(sp)
    800019f0:	05213823          	sd	s2,80(sp)
    800019f4:	05313423          	sd	s3,72(sp)
    800019f8:	05413023          	sd	s4,64(sp)
    800019fc:	03513c23          	sd	s5,56(sp)
    80001a00:	03613823          	sd	s6,48(sp)
    80001a04:	03713423          	sd	s7,40(sp)
    80001a08:	03813023          	sd	s8,32(sp)
    80001a0c:	06113423          	sd	ra,104(sp)
    80001a10:	01913c23          	sd	s9,24(sp)
    80001a14:	07010413          	addi	s0,sp,112
    80001a18:	00060b93          	mv	s7,a2
    80001a1c:	00050913          	mv	s2,a0
    80001a20:	00058c13          	mv	s8,a1
    80001a24:	00060b1b          	sext.w	s6,a2
    80001a28:	00004497          	auipc	s1,0x4
    80001a2c:	8f048493          	addi	s1,s1,-1808 # 80005318 <cons>
    80001a30:	00400993          	li	s3,4
    80001a34:	fff00a13          	li	s4,-1
    80001a38:	00a00a93          	li	s5,10
    80001a3c:	05705e63          	blez	s7,80001a98 <consoleread+0xb4>
    80001a40:	09c4a703          	lw	a4,156(s1)
    80001a44:	0984a783          	lw	a5,152(s1)
    80001a48:	0007071b          	sext.w	a4,a4
    80001a4c:	08e78463          	beq	a5,a4,80001ad4 <consoleread+0xf0>
    80001a50:	07f7f713          	andi	a4,a5,127
    80001a54:	00e48733          	add	a4,s1,a4
    80001a58:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80001a5c:	0017869b          	addiw	a3,a5,1
    80001a60:	08d4ac23          	sw	a3,152(s1)
    80001a64:	00070c9b          	sext.w	s9,a4
    80001a68:	0b370663          	beq	a4,s3,80001b14 <consoleread+0x130>
    80001a6c:	00100693          	li	a3,1
    80001a70:	f9f40613          	addi	a2,s0,-97
    80001a74:	000c0593          	mv	a1,s8
    80001a78:	00090513          	mv	a0,s2
    80001a7c:	f8e40fa3          	sb	a4,-97(s0)
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	8b8080e7          	jalr	-1864(ra) # 80001338 <either_copyout>
    80001a88:	01450863          	beq	a0,s4,80001a98 <consoleread+0xb4>
    80001a8c:	001c0c13          	addi	s8,s8,1
    80001a90:	fffb8b9b          	addiw	s7,s7,-1
    80001a94:	fb5c94e3          	bne	s9,s5,80001a3c <consoleread+0x58>
    80001a98:	000b851b          	sext.w	a0,s7
    80001a9c:	06813083          	ld	ra,104(sp)
    80001aa0:	06013403          	ld	s0,96(sp)
    80001aa4:	05813483          	ld	s1,88(sp)
    80001aa8:	05013903          	ld	s2,80(sp)
    80001aac:	04813983          	ld	s3,72(sp)
    80001ab0:	04013a03          	ld	s4,64(sp)
    80001ab4:	03813a83          	ld	s5,56(sp)
    80001ab8:	02813b83          	ld	s7,40(sp)
    80001abc:	02013c03          	ld	s8,32(sp)
    80001ac0:	01813c83          	ld	s9,24(sp)
    80001ac4:	40ab053b          	subw	a0,s6,a0
    80001ac8:	03013b03          	ld	s6,48(sp)
    80001acc:	07010113          	addi	sp,sp,112
    80001ad0:	00008067          	ret
    80001ad4:	00001097          	auipc	ra,0x1
    80001ad8:	1d8080e7          	jalr	472(ra) # 80002cac <push_on>
    80001adc:	0984a703          	lw	a4,152(s1)
    80001ae0:	09c4a783          	lw	a5,156(s1)
    80001ae4:	0007879b          	sext.w	a5,a5
    80001ae8:	fef70ce3          	beq	a4,a5,80001ae0 <consoleread+0xfc>
    80001aec:	00001097          	auipc	ra,0x1
    80001af0:	234080e7          	jalr	564(ra) # 80002d20 <pop_on>
    80001af4:	0984a783          	lw	a5,152(s1)
    80001af8:	07f7f713          	andi	a4,a5,127
    80001afc:	00e48733          	add	a4,s1,a4
    80001b00:	01874703          	lbu	a4,24(a4)
    80001b04:	0017869b          	addiw	a3,a5,1
    80001b08:	08d4ac23          	sw	a3,152(s1)
    80001b0c:	00070c9b          	sext.w	s9,a4
    80001b10:	f5371ee3          	bne	a4,s3,80001a6c <consoleread+0x88>
    80001b14:	000b851b          	sext.w	a0,s7
    80001b18:	f96bf2e3          	bgeu	s7,s6,80001a9c <consoleread+0xb8>
    80001b1c:	08f4ac23          	sw	a5,152(s1)
    80001b20:	f7dff06f          	j	80001a9c <consoleread+0xb8>

0000000080001b24 <consputc>:
    80001b24:	10000793          	li	a5,256
    80001b28:	00f50663          	beq	a0,a5,80001b34 <consputc+0x10>
    80001b2c:	00001317          	auipc	t1,0x1
    80001b30:	9f430067          	jr	-1548(t1) # 80002520 <uartputc_sync>
    80001b34:	ff010113          	addi	sp,sp,-16
    80001b38:	00113423          	sd	ra,8(sp)
    80001b3c:	00813023          	sd	s0,0(sp)
    80001b40:	01010413          	addi	s0,sp,16
    80001b44:	00800513          	li	a0,8
    80001b48:	00001097          	auipc	ra,0x1
    80001b4c:	9d8080e7          	jalr	-1576(ra) # 80002520 <uartputc_sync>
    80001b50:	02000513          	li	a0,32
    80001b54:	00001097          	auipc	ra,0x1
    80001b58:	9cc080e7          	jalr	-1588(ra) # 80002520 <uartputc_sync>
    80001b5c:	00013403          	ld	s0,0(sp)
    80001b60:	00813083          	ld	ra,8(sp)
    80001b64:	00800513          	li	a0,8
    80001b68:	01010113          	addi	sp,sp,16
    80001b6c:	00001317          	auipc	t1,0x1
    80001b70:	9b430067          	jr	-1612(t1) # 80002520 <uartputc_sync>

0000000080001b74 <consoleintr>:
    80001b74:	fe010113          	addi	sp,sp,-32
    80001b78:	00813823          	sd	s0,16(sp)
    80001b7c:	00913423          	sd	s1,8(sp)
    80001b80:	01213023          	sd	s2,0(sp)
    80001b84:	00113c23          	sd	ra,24(sp)
    80001b88:	02010413          	addi	s0,sp,32
    80001b8c:	00003917          	auipc	s2,0x3
    80001b90:	78c90913          	addi	s2,s2,1932 # 80005318 <cons>
    80001b94:	00050493          	mv	s1,a0
    80001b98:	00090513          	mv	a0,s2
    80001b9c:	00001097          	auipc	ra,0x1
    80001ba0:	e40080e7          	jalr	-448(ra) # 800029dc <acquire>
    80001ba4:	02048c63          	beqz	s1,80001bdc <consoleintr+0x68>
    80001ba8:	0a092783          	lw	a5,160(s2)
    80001bac:	09892703          	lw	a4,152(s2)
    80001bb0:	07f00693          	li	a3,127
    80001bb4:	40e7873b          	subw	a4,a5,a4
    80001bb8:	02e6e263          	bltu	a3,a4,80001bdc <consoleintr+0x68>
    80001bbc:	00d00713          	li	a4,13
    80001bc0:	04e48063          	beq	s1,a4,80001c00 <consoleintr+0x8c>
    80001bc4:	07f7f713          	andi	a4,a5,127
    80001bc8:	00e90733          	add	a4,s2,a4
    80001bcc:	0017879b          	addiw	a5,a5,1
    80001bd0:	0af92023          	sw	a5,160(s2)
    80001bd4:	00970c23          	sb	s1,24(a4)
    80001bd8:	08f92e23          	sw	a5,156(s2)
    80001bdc:	01013403          	ld	s0,16(sp)
    80001be0:	01813083          	ld	ra,24(sp)
    80001be4:	00813483          	ld	s1,8(sp)
    80001be8:	00013903          	ld	s2,0(sp)
    80001bec:	00003517          	auipc	a0,0x3
    80001bf0:	72c50513          	addi	a0,a0,1836 # 80005318 <cons>
    80001bf4:	02010113          	addi	sp,sp,32
    80001bf8:	00001317          	auipc	t1,0x1
    80001bfc:	eb030067          	jr	-336(t1) # 80002aa8 <release>
    80001c00:	00a00493          	li	s1,10
    80001c04:	fc1ff06f          	j	80001bc4 <consoleintr+0x50>

0000000080001c08 <consoleinit>:
    80001c08:	fe010113          	addi	sp,sp,-32
    80001c0c:	00113c23          	sd	ra,24(sp)
    80001c10:	00813823          	sd	s0,16(sp)
    80001c14:	00913423          	sd	s1,8(sp)
    80001c18:	02010413          	addi	s0,sp,32
    80001c1c:	00003497          	auipc	s1,0x3
    80001c20:	6fc48493          	addi	s1,s1,1788 # 80005318 <cons>
    80001c24:	00048513          	mv	a0,s1
    80001c28:	00002597          	auipc	a1,0x2
    80001c2c:	50058593          	addi	a1,a1,1280 # 80004128 <console_handler+0xf88>
    80001c30:	00001097          	auipc	ra,0x1
    80001c34:	d88080e7          	jalr	-632(ra) # 800029b8 <initlock>
    80001c38:	00000097          	auipc	ra,0x0
    80001c3c:	7ac080e7          	jalr	1964(ra) # 800023e4 <uartinit>
    80001c40:	01813083          	ld	ra,24(sp)
    80001c44:	01013403          	ld	s0,16(sp)
    80001c48:	00000797          	auipc	a5,0x0
    80001c4c:	d9c78793          	addi	a5,a5,-612 # 800019e4 <consoleread>
    80001c50:	0af4bc23          	sd	a5,184(s1)
    80001c54:	00000797          	auipc	a5,0x0
    80001c58:	cec78793          	addi	a5,a5,-788 # 80001940 <consolewrite>
    80001c5c:	0cf4b023          	sd	a5,192(s1)
    80001c60:	00813483          	ld	s1,8(sp)
    80001c64:	02010113          	addi	sp,sp,32
    80001c68:	00008067          	ret

0000000080001c6c <console_read>:
    80001c6c:	ff010113          	addi	sp,sp,-16
    80001c70:	00813423          	sd	s0,8(sp)
    80001c74:	01010413          	addi	s0,sp,16
    80001c78:	00813403          	ld	s0,8(sp)
    80001c7c:	00003317          	auipc	t1,0x3
    80001c80:	75433303          	ld	t1,1876(t1) # 800053d0 <devsw+0x10>
    80001c84:	01010113          	addi	sp,sp,16
    80001c88:	00030067          	jr	t1

0000000080001c8c <console_write>:
    80001c8c:	ff010113          	addi	sp,sp,-16
    80001c90:	00813423          	sd	s0,8(sp)
    80001c94:	01010413          	addi	s0,sp,16
    80001c98:	00813403          	ld	s0,8(sp)
    80001c9c:	00003317          	auipc	t1,0x3
    80001ca0:	73c33303          	ld	t1,1852(t1) # 800053d8 <devsw+0x18>
    80001ca4:	01010113          	addi	sp,sp,16
    80001ca8:	00030067          	jr	t1

0000000080001cac <panic>:
    80001cac:	fe010113          	addi	sp,sp,-32
    80001cb0:	00113c23          	sd	ra,24(sp)
    80001cb4:	00813823          	sd	s0,16(sp)
    80001cb8:	00913423          	sd	s1,8(sp)
    80001cbc:	02010413          	addi	s0,sp,32
    80001cc0:	00050493          	mv	s1,a0
    80001cc4:	00002517          	auipc	a0,0x2
    80001cc8:	46c50513          	addi	a0,a0,1132 # 80004130 <console_handler+0xf90>
    80001ccc:	00003797          	auipc	a5,0x3
    80001cd0:	7a07a623          	sw	zero,1964(a5) # 80005478 <pr+0x18>
    80001cd4:	00000097          	auipc	ra,0x0
    80001cd8:	034080e7          	jalr	52(ra) # 80001d08 <__printf>
    80001cdc:	00048513          	mv	a0,s1
    80001ce0:	00000097          	auipc	ra,0x0
    80001ce4:	028080e7          	jalr	40(ra) # 80001d08 <__printf>
    80001ce8:	00002517          	auipc	a0,0x2
    80001cec:	42850513          	addi	a0,a0,1064 # 80004110 <console_handler+0xf70>
    80001cf0:	00000097          	auipc	ra,0x0
    80001cf4:	018080e7          	jalr	24(ra) # 80001d08 <__printf>
    80001cf8:	00100793          	li	a5,1
    80001cfc:	00002717          	auipc	a4,0x2
    80001d00:	52f72623          	sw	a5,1324(a4) # 80004228 <panicked>
    80001d04:	0000006f          	j	80001d04 <panic+0x58>

0000000080001d08 <__printf>:
    80001d08:	f3010113          	addi	sp,sp,-208
    80001d0c:	08813023          	sd	s0,128(sp)
    80001d10:	07313423          	sd	s3,104(sp)
    80001d14:	09010413          	addi	s0,sp,144
    80001d18:	05813023          	sd	s8,64(sp)
    80001d1c:	08113423          	sd	ra,136(sp)
    80001d20:	06913c23          	sd	s1,120(sp)
    80001d24:	07213823          	sd	s2,112(sp)
    80001d28:	07413023          	sd	s4,96(sp)
    80001d2c:	05513c23          	sd	s5,88(sp)
    80001d30:	05613823          	sd	s6,80(sp)
    80001d34:	05713423          	sd	s7,72(sp)
    80001d38:	03913c23          	sd	s9,56(sp)
    80001d3c:	03a13823          	sd	s10,48(sp)
    80001d40:	03b13423          	sd	s11,40(sp)
    80001d44:	00003317          	auipc	t1,0x3
    80001d48:	71c30313          	addi	t1,t1,1820 # 80005460 <pr>
    80001d4c:	01832c03          	lw	s8,24(t1)
    80001d50:	00b43423          	sd	a1,8(s0)
    80001d54:	00c43823          	sd	a2,16(s0)
    80001d58:	00d43c23          	sd	a3,24(s0)
    80001d5c:	02e43023          	sd	a4,32(s0)
    80001d60:	02f43423          	sd	a5,40(s0)
    80001d64:	03043823          	sd	a6,48(s0)
    80001d68:	03143c23          	sd	a7,56(s0)
    80001d6c:	00050993          	mv	s3,a0
    80001d70:	4a0c1663          	bnez	s8,8000221c <__printf+0x514>
    80001d74:	60098c63          	beqz	s3,8000238c <__printf+0x684>
    80001d78:	0009c503          	lbu	a0,0(s3)
    80001d7c:	00840793          	addi	a5,s0,8
    80001d80:	f6f43c23          	sd	a5,-136(s0)
    80001d84:	00000493          	li	s1,0
    80001d88:	22050063          	beqz	a0,80001fa8 <__printf+0x2a0>
    80001d8c:	00002a37          	lui	s4,0x2
    80001d90:	00018ab7          	lui	s5,0x18
    80001d94:	000f4b37          	lui	s6,0xf4
    80001d98:	00989bb7          	lui	s7,0x989
    80001d9c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80001da0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80001da4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80001da8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80001dac:	00148c9b          	addiw	s9,s1,1
    80001db0:	02500793          	li	a5,37
    80001db4:	01998933          	add	s2,s3,s9
    80001db8:	38f51263          	bne	a0,a5,8000213c <__printf+0x434>
    80001dbc:	00094783          	lbu	a5,0(s2)
    80001dc0:	00078c9b          	sext.w	s9,a5
    80001dc4:	1e078263          	beqz	a5,80001fa8 <__printf+0x2a0>
    80001dc8:	0024849b          	addiw	s1,s1,2
    80001dcc:	07000713          	li	a4,112
    80001dd0:	00998933          	add	s2,s3,s1
    80001dd4:	38e78a63          	beq	a5,a4,80002168 <__printf+0x460>
    80001dd8:	20f76863          	bltu	a4,a5,80001fe8 <__printf+0x2e0>
    80001ddc:	42a78863          	beq	a5,a0,8000220c <__printf+0x504>
    80001de0:	06400713          	li	a4,100
    80001de4:	40e79663          	bne	a5,a4,800021f0 <__printf+0x4e8>
    80001de8:	f7843783          	ld	a5,-136(s0)
    80001dec:	0007a603          	lw	a2,0(a5)
    80001df0:	00878793          	addi	a5,a5,8
    80001df4:	f6f43c23          	sd	a5,-136(s0)
    80001df8:	42064a63          	bltz	a2,8000222c <__printf+0x524>
    80001dfc:	00a00713          	li	a4,10
    80001e00:	02e677bb          	remuw	a5,a2,a4
    80001e04:	00002d97          	auipc	s11,0x2
    80001e08:	354d8d93          	addi	s11,s11,852 # 80004158 <digits>
    80001e0c:	00900593          	li	a1,9
    80001e10:	0006051b          	sext.w	a0,a2
    80001e14:	00000c93          	li	s9,0
    80001e18:	02079793          	slli	a5,a5,0x20
    80001e1c:	0207d793          	srli	a5,a5,0x20
    80001e20:	00fd87b3          	add	a5,s11,a5
    80001e24:	0007c783          	lbu	a5,0(a5)
    80001e28:	02e656bb          	divuw	a3,a2,a4
    80001e2c:	f8f40023          	sb	a5,-128(s0)
    80001e30:	14c5d863          	bge	a1,a2,80001f80 <__printf+0x278>
    80001e34:	06300593          	li	a1,99
    80001e38:	00100c93          	li	s9,1
    80001e3c:	02e6f7bb          	remuw	a5,a3,a4
    80001e40:	02079793          	slli	a5,a5,0x20
    80001e44:	0207d793          	srli	a5,a5,0x20
    80001e48:	00fd87b3          	add	a5,s11,a5
    80001e4c:	0007c783          	lbu	a5,0(a5)
    80001e50:	02e6d73b          	divuw	a4,a3,a4
    80001e54:	f8f400a3          	sb	a5,-127(s0)
    80001e58:	12a5f463          	bgeu	a1,a0,80001f80 <__printf+0x278>
    80001e5c:	00a00693          	li	a3,10
    80001e60:	00900593          	li	a1,9
    80001e64:	02d777bb          	remuw	a5,a4,a3
    80001e68:	02079793          	slli	a5,a5,0x20
    80001e6c:	0207d793          	srli	a5,a5,0x20
    80001e70:	00fd87b3          	add	a5,s11,a5
    80001e74:	0007c503          	lbu	a0,0(a5)
    80001e78:	02d757bb          	divuw	a5,a4,a3
    80001e7c:	f8a40123          	sb	a0,-126(s0)
    80001e80:	48e5f263          	bgeu	a1,a4,80002304 <__printf+0x5fc>
    80001e84:	06300513          	li	a0,99
    80001e88:	02d7f5bb          	remuw	a1,a5,a3
    80001e8c:	02059593          	slli	a1,a1,0x20
    80001e90:	0205d593          	srli	a1,a1,0x20
    80001e94:	00bd85b3          	add	a1,s11,a1
    80001e98:	0005c583          	lbu	a1,0(a1)
    80001e9c:	02d7d7bb          	divuw	a5,a5,a3
    80001ea0:	f8b401a3          	sb	a1,-125(s0)
    80001ea4:	48e57263          	bgeu	a0,a4,80002328 <__printf+0x620>
    80001ea8:	3e700513          	li	a0,999
    80001eac:	02d7f5bb          	remuw	a1,a5,a3
    80001eb0:	02059593          	slli	a1,a1,0x20
    80001eb4:	0205d593          	srli	a1,a1,0x20
    80001eb8:	00bd85b3          	add	a1,s11,a1
    80001ebc:	0005c583          	lbu	a1,0(a1)
    80001ec0:	02d7d7bb          	divuw	a5,a5,a3
    80001ec4:	f8b40223          	sb	a1,-124(s0)
    80001ec8:	46e57663          	bgeu	a0,a4,80002334 <__printf+0x62c>
    80001ecc:	02d7f5bb          	remuw	a1,a5,a3
    80001ed0:	02059593          	slli	a1,a1,0x20
    80001ed4:	0205d593          	srli	a1,a1,0x20
    80001ed8:	00bd85b3          	add	a1,s11,a1
    80001edc:	0005c583          	lbu	a1,0(a1)
    80001ee0:	02d7d7bb          	divuw	a5,a5,a3
    80001ee4:	f8b402a3          	sb	a1,-123(s0)
    80001ee8:	46ea7863          	bgeu	s4,a4,80002358 <__printf+0x650>
    80001eec:	02d7f5bb          	remuw	a1,a5,a3
    80001ef0:	02059593          	slli	a1,a1,0x20
    80001ef4:	0205d593          	srli	a1,a1,0x20
    80001ef8:	00bd85b3          	add	a1,s11,a1
    80001efc:	0005c583          	lbu	a1,0(a1)
    80001f00:	02d7d7bb          	divuw	a5,a5,a3
    80001f04:	f8b40323          	sb	a1,-122(s0)
    80001f08:	3eeaf863          	bgeu	s5,a4,800022f8 <__printf+0x5f0>
    80001f0c:	02d7f5bb          	remuw	a1,a5,a3
    80001f10:	02059593          	slli	a1,a1,0x20
    80001f14:	0205d593          	srli	a1,a1,0x20
    80001f18:	00bd85b3          	add	a1,s11,a1
    80001f1c:	0005c583          	lbu	a1,0(a1)
    80001f20:	02d7d7bb          	divuw	a5,a5,a3
    80001f24:	f8b403a3          	sb	a1,-121(s0)
    80001f28:	42eb7e63          	bgeu	s6,a4,80002364 <__printf+0x65c>
    80001f2c:	02d7f5bb          	remuw	a1,a5,a3
    80001f30:	02059593          	slli	a1,a1,0x20
    80001f34:	0205d593          	srli	a1,a1,0x20
    80001f38:	00bd85b3          	add	a1,s11,a1
    80001f3c:	0005c583          	lbu	a1,0(a1)
    80001f40:	02d7d7bb          	divuw	a5,a5,a3
    80001f44:	f8b40423          	sb	a1,-120(s0)
    80001f48:	42ebfc63          	bgeu	s7,a4,80002380 <__printf+0x678>
    80001f4c:	02079793          	slli	a5,a5,0x20
    80001f50:	0207d793          	srli	a5,a5,0x20
    80001f54:	00fd8db3          	add	s11,s11,a5
    80001f58:	000dc703          	lbu	a4,0(s11)
    80001f5c:	00a00793          	li	a5,10
    80001f60:	00900c93          	li	s9,9
    80001f64:	f8e404a3          	sb	a4,-119(s0)
    80001f68:	00065c63          	bgez	a2,80001f80 <__printf+0x278>
    80001f6c:	f9040713          	addi	a4,s0,-112
    80001f70:	00f70733          	add	a4,a4,a5
    80001f74:	02d00693          	li	a3,45
    80001f78:	fed70823          	sb	a3,-16(a4)
    80001f7c:	00078c93          	mv	s9,a5
    80001f80:	f8040793          	addi	a5,s0,-128
    80001f84:	01978cb3          	add	s9,a5,s9
    80001f88:	f7f40d13          	addi	s10,s0,-129
    80001f8c:	000cc503          	lbu	a0,0(s9)
    80001f90:	fffc8c93          	addi	s9,s9,-1
    80001f94:	00000097          	auipc	ra,0x0
    80001f98:	b90080e7          	jalr	-1136(ra) # 80001b24 <consputc>
    80001f9c:	ffac98e3          	bne	s9,s10,80001f8c <__printf+0x284>
    80001fa0:	00094503          	lbu	a0,0(s2)
    80001fa4:	e00514e3          	bnez	a0,80001dac <__printf+0xa4>
    80001fa8:	1a0c1663          	bnez	s8,80002154 <__printf+0x44c>
    80001fac:	08813083          	ld	ra,136(sp)
    80001fb0:	08013403          	ld	s0,128(sp)
    80001fb4:	07813483          	ld	s1,120(sp)
    80001fb8:	07013903          	ld	s2,112(sp)
    80001fbc:	06813983          	ld	s3,104(sp)
    80001fc0:	06013a03          	ld	s4,96(sp)
    80001fc4:	05813a83          	ld	s5,88(sp)
    80001fc8:	05013b03          	ld	s6,80(sp)
    80001fcc:	04813b83          	ld	s7,72(sp)
    80001fd0:	04013c03          	ld	s8,64(sp)
    80001fd4:	03813c83          	ld	s9,56(sp)
    80001fd8:	03013d03          	ld	s10,48(sp)
    80001fdc:	02813d83          	ld	s11,40(sp)
    80001fe0:	0d010113          	addi	sp,sp,208
    80001fe4:	00008067          	ret
    80001fe8:	07300713          	li	a4,115
    80001fec:	1ce78a63          	beq	a5,a4,800021c0 <__printf+0x4b8>
    80001ff0:	07800713          	li	a4,120
    80001ff4:	1ee79e63          	bne	a5,a4,800021f0 <__printf+0x4e8>
    80001ff8:	f7843783          	ld	a5,-136(s0)
    80001ffc:	0007a703          	lw	a4,0(a5)
    80002000:	00878793          	addi	a5,a5,8
    80002004:	f6f43c23          	sd	a5,-136(s0)
    80002008:	28074263          	bltz	a4,8000228c <__printf+0x584>
    8000200c:	00002d97          	auipc	s11,0x2
    80002010:	14cd8d93          	addi	s11,s11,332 # 80004158 <digits>
    80002014:	00f77793          	andi	a5,a4,15
    80002018:	00fd87b3          	add	a5,s11,a5
    8000201c:	0007c683          	lbu	a3,0(a5)
    80002020:	00f00613          	li	a2,15
    80002024:	0007079b          	sext.w	a5,a4
    80002028:	f8d40023          	sb	a3,-128(s0)
    8000202c:	0047559b          	srliw	a1,a4,0x4
    80002030:	0047569b          	srliw	a3,a4,0x4
    80002034:	00000c93          	li	s9,0
    80002038:	0ee65063          	bge	a2,a4,80002118 <__printf+0x410>
    8000203c:	00f6f693          	andi	a3,a3,15
    80002040:	00dd86b3          	add	a3,s11,a3
    80002044:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002048:	0087d79b          	srliw	a5,a5,0x8
    8000204c:	00100c93          	li	s9,1
    80002050:	f8d400a3          	sb	a3,-127(s0)
    80002054:	0cb67263          	bgeu	a2,a1,80002118 <__printf+0x410>
    80002058:	00f7f693          	andi	a3,a5,15
    8000205c:	00dd86b3          	add	a3,s11,a3
    80002060:	0006c583          	lbu	a1,0(a3)
    80002064:	00f00613          	li	a2,15
    80002068:	0047d69b          	srliw	a3,a5,0x4
    8000206c:	f8b40123          	sb	a1,-126(s0)
    80002070:	0047d593          	srli	a1,a5,0x4
    80002074:	28f67e63          	bgeu	a2,a5,80002310 <__printf+0x608>
    80002078:	00f6f693          	andi	a3,a3,15
    8000207c:	00dd86b3          	add	a3,s11,a3
    80002080:	0006c503          	lbu	a0,0(a3)
    80002084:	0087d813          	srli	a6,a5,0x8
    80002088:	0087d69b          	srliw	a3,a5,0x8
    8000208c:	f8a401a3          	sb	a0,-125(s0)
    80002090:	28b67663          	bgeu	a2,a1,8000231c <__printf+0x614>
    80002094:	00f6f693          	andi	a3,a3,15
    80002098:	00dd86b3          	add	a3,s11,a3
    8000209c:	0006c583          	lbu	a1,0(a3)
    800020a0:	00c7d513          	srli	a0,a5,0xc
    800020a4:	00c7d69b          	srliw	a3,a5,0xc
    800020a8:	f8b40223          	sb	a1,-124(s0)
    800020ac:	29067a63          	bgeu	a2,a6,80002340 <__printf+0x638>
    800020b0:	00f6f693          	andi	a3,a3,15
    800020b4:	00dd86b3          	add	a3,s11,a3
    800020b8:	0006c583          	lbu	a1,0(a3)
    800020bc:	0107d813          	srli	a6,a5,0x10
    800020c0:	0107d69b          	srliw	a3,a5,0x10
    800020c4:	f8b402a3          	sb	a1,-123(s0)
    800020c8:	28a67263          	bgeu	a2,a0,8000234c <__printf+0x644>
    800020cc:	00f6f693          	andi	a3,a3,15
    800020d0:	00dd86b3          	add	a3,s11,a3
    800020d4:	0006c683          	lbu	a3,0(a3)
    800020d8:	0147d79b          	srliw	a5,a5,0x14
    800020dc:	f8d40323          	sb	a3,-122(s0)
    800020e0:	21067663          	bgeu	a2,a6,800022ec <__printf+0x5e4>
    800020e4:	02079793          	slli	a5,a5,0x20
    800020e8:	0207d793          	srli	a5,a5,0x20
    800020ec:	00fd8db3          	add	s11,s11,a5
    800020f0:	000dc683          	lbu	a3,0(s11)
    800020f4:	00800793          	li	a5,8
    800020f8:	00700c93          	li	s9,7
    800020fc:	f8d403a3          	sb	a3,-121(s0)
    80002100:	00075c63          	bgez	a4,80002118 <__printf+0x410>
    80002104:	f9040713          	addi	a4,s0,-112
    80002108:	00f70733          	add	a4,a4,a5
    8000210c:	02d00693          	li	a3,45
    80002110:	fed70823          	sb	a3,-16(a4)
    80002114:	00078c93          	mv	s9,a5
    80002118:	f8040793          	addi	a5,s0,-128
    8000211c:	01978cb3          	add	s9,a5,s9
    80002120:	f7f40d13          	addi	s10,s0,-129
    80002124:	000cc503          	lbu	a0,0(s9)
    80002128:	fffc8c93          	addi	s9,s9,-1
    8000212c:	00000097          	auipc	ra,0x0
    80002130:	9f8080e7          	jalr	-1544(ra) # 80001b24 <consputc>
    80002134:	ff9d18e3          	bne	s10,s9,80002124 <__printf+0x41c>
    80002138:	0100006f          	j	80002148 <__printf+0x440>
    8000213c:	00000097          	auipc	ra,0x0
    80002140:	9e8080e7          	jalr	-1560(ra) # 80001b24 <consputc>
    80002144:	000c8493          	mv	s1,s9
    80002148:	00094503          	lbu	a0,0(s2)
    8000214c:	c60510e3          	bnez	a0,80001dac <__printf+0xa4>
    80002150:	e40c0ee3          	beqz	s8,80001fac <__printf+0x2a4>
    80002154:	00003517          	auipc	a0,0x3
    80002158:	30c50513          	addi	a0,a0,780 # 80005460 <pr>
    8000215c:	00001097          	auipc	ra,0x1
    80002160:	94c080e7          	jalr	-1716(ra) # 80002aa8 <release>
    80002164:	e49ff06f          	j	80001fac <__printf+0x2a4>
    80002168:	f7843783          	ld	a5,-136(s0)
    8000216c:	03000513          	li	a0,48
    80002170:	01000d13          	li	s10,16
    80002174:	00878713          	addi	a4,a5,8
    80002178:	0007bc83          	ld	s9,0(a5)
    8000217c:	f6e43c23          	sd	a4,-136(s0)
    80002180:	00000097          	auipc	ra,0x0
    80002184:	9a4080e7          	jalr	-1628(ra) # 80001b24 <consputc>
    80002188:	07800513          	li	a0,120
    8000218c:	00000097          	auipc	ra,0x0
    80002190:	998080e7          	jalr	-1640(ra) # 80001b24 <consputc>
    80002194:	00002d97          	auipc	s11,0x2
    80002198:	fc4d8d93          	addi	s11,s11,-60 # 80004158 <digits>
    8000219c:	03ccd793          	srli	a5,s9,0x3c
    800021a0:	00fd87b3          	add	a5,s11,a5
    800021a4:	0007c503          	lbu	a0,0(a5)
    800021a8:	fffd0d1b          	addiw	s10,s10,-1
    800021ac:	004c9c93          	slli	s9,s9,0x4
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	974080e7          	jalr	-1676(ra) # 80001b24 <consputc>
    800021b8:	fe0d12e3          	bnez	s10,8000219c <__printf+0x494>
    800021bc:	f8dff06f          	j	80002148 <__printf+0x440>
    800021c0:	f7843783          	ld	a5,-136(s0)
    800021c4:	0007bc83          	ld	s9,0(a5)
    800021c8:	00878793          	addi	a5,a5,8
    800021cc:	f6f43c23          	sd	a5,-136(s0)
    800021d0:	000c9a63          	bnez	s9,800021e4 <__printf+0x4dc>
    800021d4:	1080006f          	j	800022dc <__printf+0x5d4>
    800021d8:	001c8c93          	addi	s9,s9,1
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	948080e7          	jalr	-1720(ra) # 80001b24 <consputc>
    800021e4:	000cc503          	lbu	a0,0(s9)
    800021e8:	fe0518e3          	bnez	a0,800021d8 <__printf+0x4d0>
    800021ec:	f5dff06f          	j	80002148 <__printf+0x440>
    800021f0:	02500513          	li	a0,37
    800021f4:	00000097          	auipc	ra,0x0
    800021f8:	930080e7          	jalr	-1744(ra) # 80001b24 <consputc>
    800021fc:	000c8513          	mv	a0,s9
    80002200:	00000097          	auipc	ra,0x0
    80002204:	924080e7          	jalr	-1756(ra) # 80001b24 <consputc>
    80002208:	f41ff06f          	j	80002148 <__printf+0x440>
    8000220c:	02500513          	li	a0,37
    80002210:	00000097          	auipc	ra,0x0
    80002214:	914080e7          	jalr	-1772(ra) # 80001b24 <consputc>
    80002218:	f31ff06f          	j	80002148 <__printf+0x440>
    8000221c:	00030513          	mv	a0,t1
    80002220:	00000097          	auipc	ra,0x0
    80002224:	7bc080e7          	jalr	1980(ra) # 800029dc <acquire>
    80002228:	b4dff06f          	j	80001d74 <__printf+0x6c>
    8000222c:	40c0053b          	negw	a0,a2
    80002230:	00a00713          	li	a4,10
    80002234:	02e576bb          	remuw	a3,a0,a4
    80002238:	00002d97          	auipc	s11,0x2
    8000223c:	f20d8d93          	addi	s11,s11,-224 # 80004158 <digits>
    80002240:	ff700593          	li	a1,-9
    80002244:	02069693          	slli	a3,a3,0x20
    80002248:	0206d693          	srli	a3,a3,0x20
    8000224c:	00dd86b3          	add	a3,s11,a3
    80002250:	0006c683          	lbu	a3,0(a3)
    80002254:	02e557bb          	divuw	a5,a0,a4
    80002258:	f8d40023          	sb	a3,-128(s0)
    8000225c:	10b65e63          	bge	a2,a1,80002378 <__printf+0x670>
    80002260:	06300593          	li	a1,99
    80002264:	02e7f6bb          	remuw	a3,a5,a4
    80002268:	02069693          	slli	a3,a3,0x20
    8000226c:	0206d693          	srli	a3,a3,0x20
    80002270:	00dd86b3          	add	a3,s11,a3
    80002274:	0006c683          	lbu	a3,0(a3)
    80002278:	02e7d73b          	divuw	a4,a5,a4
    8000227c:	00200793          	li	a5,2
    80002280:	f8d400a3          	sb	a3,-127(s0)
    80002284:	bca5ece3          	bltu	a1,a0,80001e5c <__printf+0x154>
    80002288:	ce5ff06f          	j	80001f6c <__printf+0x264>
    8000228c:	40e007bb          	negw	a5,a4
    80002290:	00002d97          	auipc	s11,0x2
    80002294:	ec8d8d93          	addi	s11,s11,-312 # 80004158 <digits>
    80002298:	00f7f693          	andi	a3,a5,15
    8000229c:	00dd86b3          	add	a3,s11,a3
    800022a0:	0006c583          	lbu	a1,0(a3)
    800022a4:	ff100613          	li	a2,-15
    800022a8:	0047d69b          	srliw	a3,a5,0x4
    800022ac:	f8b40023          	sb	a1,-128(s0)
    800022b0:	0047d59b          	srliw	a1,a5,0x4
    800022b4:	0ac75e63          	bge	a4,a2,80002370 <__printf+0x668>
    800022b8:	00f6f693          	andi	a3,a3,15
    800022bc:	00dd86b3          	add	a3,s11,a3
    800022c0:	0006c603          	lbu	a2,0(a3)
    800022c4:	00f00693          	li	a3,15
    800022c8:	0087d79b          	srliw	a5,a5,0x8
    800022cc:	f8c400a3          	sb	a2,-127(s0)
    800022d0:	d8b6e4e3          	bltu	a3,a1,80002058 <__printf+0x350>
    800022d4:	00200793          	li	a5,2
    800022d8:	e2dff06f          	j	80002104 <__printf+0x3fc>
    800022dc:	00002c97          	auipc	s9,0x2
    800022e0:	e5cc8c93          	addi	s9,s9,-420 # 80004138 <console_handler+0xf98>
    800022e4:	02800513          	li	a0,40
    800022e8:	ef1ff06f          	j	800021d8 <__printf+0x4d0>
    800022ec:	00700793          	li	a5,7
    800022f0:	00600c93          	li	s9,6
    800022f4:	e0dff06f          	j	80002100 <__printf+0x3f8>
    800022f8:	00700793          	li	a5,7
    800022fc:	00600c93          	li	s9,6
    80002300:	c69ff06f          	j	80001f68 <__printf+0x260>
    80002304:	00300793          	li	a5,3
    80002308:	00200c93          	li	s9,2
    8000230c:	c5dff06f          	j	80001f68 <__printf+0x260>
    80002310:	00300793          	li	a5,3
    80002314:	00200c93          	li	s9,2
    80002318:	de9ff06f          	j	80002100 <__printf+0x3f8>
    8000231c:	00400793          	li	a5,4
    80002320:	00300c93          	li	s9,3
    80002324:	dddff06f          	j	80002100 <__printf+0x3f8>
    80002328:	00400793          	li	a5,4
    8000232c:	00300c93          	li	s9,3
    80002330:	c39ff06f          	j	80001f68 <__printf+0x260>
    80002334:	00500793          	li	a5,5
    80002338:	00400c93          	li	s9,4
    8000233c:	c2dff06f          	j	80001f68 <__printf+0x260>
    80002340:	00500793          	li	a5,5
    80002344:	00400c93          	li	s9,4
    80002348:	db9ff06f          	j	80002100 <__printf+0x3f8>
    8000234c:	00600793          	li	a5,6
    80002350:	00500c93          	li	s9,5
    80002354:	dadff06f          	j	80002100 <__printf+0x3f8>
    80002358:	00600793          	li	a5,6
    8000235c:	00500c93          	li	s9,5
    80002360:	c09ff06f          	j	80001f68 <__printf+0x260>
    80002364:	00800793          	li	a5,8
    80002368:	00700c93          	li	s9,7
    8000236c:	bfdff06f          	j	80001f68 <__printf+0x260>
    80002370:	00100793          	li	a5,1
    80002374:	d91ff06f          	j	80002104 <__printf+0x3fc>
    80002378:	00100793          	li	a5,1
    8000237c:	bf1ff06f          	j	80001f6c <__printf+0x264>
    80002380:	00900793          	li	a5,9
    80002384:	00800c93          	li	s9,8
    80002388:	be1ff06f          	j	80001f68 <__printf+0x260>
    8000238c:	00002517          	auipc	a0,0x2
    80002390:	db450513          	addi	a0,a0,-588 # 80004140 <console_handler+0xfa0>
    80002394:	00000097          	auipc	ra,0x0
    80002398:	918080e7          	jalr	-1768(ra) # 80001cac <panic>

000000008000239c <printfinit>:
    8000239c:	fe010113          	addi	sp,sp,-32
    800023a0:	00813823          	sd	s0,16(sp)
    800023a4:	00913423          	sd	s1,8(sp)
    800023a8:	00113c23          	sd	ra,24(sp)
    800023ac:	02010413          	addi	s0,sp,32
    800023b0:	00003497          	auipc	s1,0x3
    800023b4:	0b048493          	addi	s1,s1,176 # 80005460 <pr>
    800023b8:	00048513          	mv	a0,s1
    800023bc:	00002597          	auipc	a1,0x2
    800023c0:	d9458593          	addi	a1,a1,-620 # 80004150 <console_handler+0xfb0>
    800023c4:	00000097          	auipc	ra,0x0
    800023c8:	5f4080e7          	jalr	1524(ra) # 800029b8 <initlock>
    800023cc:	01813083          	ld	ra,24(sp)
    800023d0:	01013403          	ld	s0,16(sp)
    800023d4:	0004ac23          	sw	zero,24(s1)
    800023d8:	00813483          	ld	s1,8(sp)
    800023dc:	02010113          	addi	sp,sp,32
    800023e0:	00008067          	ret

00000000800023e4 <uartinit>:
    800023e4:	ff010113          	addi	sp,sp,-16
    800023e8:	00813423          	sd	s0,8(sp)
    800023ec:	01010413          	addi	s0,sp,16
    800023f0:	100007b7          	lui	a5,0x10000
    800023f4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800023f8:	f8000713          	li	a4,-128
    800023fc:	00e781a3          	sb	a4,3(a5)
    80002400:	00300713          	li	a4,3
    80002404:	00e78023          	sb	a4,0(a5)
    80002408:	000780a3          	sb	zero,1(a5)
    8000240c:	00e781a3          	sb	a4,3(a5)
    80002410:	00700693          	li	a3,7
    80002414:	00d78123          	sb	a3,2(a5)
    80002418:	00e780a3          	sb	a4,1(a5)
    8000241c:	00813403          	ld	s0,8(sp)
    80002420:	01010113          	addi	sp,sp,16
    80002424:	00008067          	ret

0000000080002428 <uartputc>:
    80002428:	00002797          	auipc	a5,0x2
    8000242c:	e007a783          	lw	a5,-512(a5) # 80004228 <panicked>
    80002430:	00078463          	beqz	a5,80002438 <uartputc+0x10>
    80002434:	0000006f          	j	80002434 <uartputc+0xc>
    80002438:	fd010113          	addi	sp,sp,-48
    8000243c:	02813023          	sd	s0,32(sp)
    80002440:	00913c23          	sd	s1,24(sp)
    80002444:	01213823          	sd	s2,16(sp)
    80002448:	01313423          	sd	s3,8(sp)
    8000244c:	02113423          	sd	ra,40(sp)
    80002450:	03010413          	addi	s0,sp,48
    80002454:	00002917          	auipc	s2,0x2
    80002458:	ddc90913          	addi	s2,s2,-548 # 80004230 <uart_tx_r>
    8000245c:	00093783          	ld	a5,0(s2)
    80002460:	00002497          	auipc	s1,0x2
    80002464:	dd848493          	addi	s1,s1,-552 # 80004238 <uart_tx_w>
    80002468:	0004b703          	ld	a4,0(s1)
    8000246c:	02078693          	addi	a3,a5,32
    80002470:	00050993          	mv	s3,a0
    80002474:	02e69c63          	bne	a3,a4,800024ac <uartputc+0x84>
    80002478:	00001097          	auipc	ra,0x1
    8000247c:	834080e7          	jalr	-1996(ra) # 80002cac <push_on>
    80002480:	00093783          	ld	a5,0(s2)
    80002484:	0004b703          	ld	a4,0(s1)
    80002488:	02078793          	addi	a5,a5,32
    8000248c:	00e79463          	bne	a5,a4,80002494 <uartputc+0x6c>
    80002490:	0000006f          	j	80002490 <uartputc+0x68>
    80002494:	00001097          	auipc	ra,0x1
    80002498:	88c080e7          	jalr	-1908(ra) # 80002d20 <pop_on>
    8000249c:	00093783          	ld	a5,0(s2)
    800024a0:	0004b703          	ld	a4,0(s1)
    800024a4:	02078693          	addi	a3,a5,32
    800024a8:	fce688e3          	beq	a3,a4,80002478 <uartputc+0x50>
    800024ac:	01f77693          	andi	a3,a4,31
    800024b0:	00003597          	auipc	a1,0x3
    800024b4:	fd058593          	addi	a1,a1,-48 # 80005480 <uart_tx_buf>
    800024b8:	00d586b3          	add	a3,a1,a3
    800024bc:	00170713          	addi	a4,a4,1
    800024c0:	01368023          	sb	s3,0(a3)
    800024c4:	00e4b023          	sd	a4,0(s1)
    800024c8:	10000637          	lui	a2,0x10000
    800024cc:	02f71063          	bne	a4,a5,800024ec <uartputc+0xc4>
    800024d0:	0340006f          	j	80002504 <uartputc+0xdc>
    800024d4:	00074703          	lbu	a4,0(a4)
    800024d8:	00f93023          	sd	a5,0(s2)
    800024dc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800024e0:	00093783          	ld	a5,0(s2)
    800024e4:	0004b703          	ld	a4,0(s1)
    800024e8:	00f70e63          	beq	a4,a5,80002504 <uartputc+0xdc>
    800024ec:	00564683          	lbu	a3,5(a2)
    800024f0:	01f7f713          	andi	a4,a5,31
    800024f4:	00e58733          	add	a4,a1,a4
    800024f8:	0206f693          	andi	a3,a3,32
    800024fc:	00178793          	addi	a5,a5,1
    80002500:	fc069ae3          	bnez	a3,800024d4 <uartputc+0xac>
    80002504:	02813083          	ld	ra,40(sp)
    80002508:	02013403          	ld	s0,32(sp)
    8000250c:	01813483          	ld	s1,24(sp)
    80002510:	01013903          	ld	s2,16(sp)
    80002514:	00813983          	ld	s3,8(sp)
    80002518:	03010113          	addi	sp,sp,48
    8000251c:	00008067          	ret

0000000080002520 <uartputc_sync>:
    80002520:	ff010113          	addi	sp,sp,-16
    80002524:	00813423          	sd	s0,8(sp)
    80002528:	01010413          	addi	s0,sp,16
    8000252c:	00002717          	auipc	a4,0x2
    80002530:	cfc72703          	lw	a4,-772(a4) # 80004228 <panicked>
    80002534:	02071663          	bnez	a4,80002560 <uartputc_sync+0x40>
    80002538:	00050793          	mv	a5,a0
    8000253c:	100006b7          	lui	a3,0x10000
    80002540:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002544:	02077713          	andi	a4,a4,32
    80002548:	fe070ce3          	beqz	a4,80002540 <uartputc_sync+0x20>
    8000254c:	0ff7f793          	andi	a5,a5,255
    80002550:	00f68023          	sb	a5,0(a3)
    80002554:	00813403          	ld	s0,8(sp)
    80002558:	01010113          	addi	sp,sp,16
    8000255c:	00008067          	ret
    80002560:	0000006f          	j	80002560 <uartputc_sync+0x40>

0000000080002564 <uartstart>:
    80002564:	ff010113          	addi	sp,sp,-16
    80002568:	00813423          	sd	s0,8(sp)
    8000256c:	01010413          	addi	s0,sp,16
    80002570:	00002617          	auipc	a2,0x2
    80002574:	cc060613          	addi	a2,a2,-832 # 80004230 <uart_tx_r>
    80002578:	00002517          	auipc	a0,0x2
    8000257c:	cc050513          	addi	a0,a0,-832 # 80004238 <uart_tx_w>
    80002580:	00063783          	ld	a5,0(a2)
    80002584:	00053703          	ld	a4,0(a0)
    80002588:	04f70263          	beq	a4,a5,800025cc <uartstart+0x68>
    8000258c:	100005b7          	lui	a1,0x10000
    80002590:	00003817          	auipc	a6,0x3
    80002594:	ef080813          	addi	a6,a6,-272 # 80005480 <uart_tx_buf>
    80002598:	01c0006f          	j	800025b4 <uartstart+0x50>
    8000259c:	0006c703          	lbu	a4,0(a3)
    800025a0:	00f63023          	sd	a5,0(a2)
    800025a4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800025a8:	00063783          	ld	a5,0(a2)
    800025ac:	00053703          	ld	a4,0(a0)
    800025b0:	00f70e63          	beq	a4,a5,800025cc <uartstart+0x68>
    800025b4:	01f7f713          	andi	a4,a5,31
    800025b8:	00e806b3          	add	a3,a6,a4
    800025bc:	0055c703          	lbu	a4,5(a1)
    800025c0:	00178793          	addi	a5,a5,1
    800025c4:	02077713          	andi	a4,a4,32
    800025c8:	fc071ae3          	bnez	a4,8000259c <uartstart+0x38>
    800025cc:	00813403          	ld	s0,8(sp)
    800025d0:	01010113          	addi	sp,sp,16
    800025d4:	00008067          	ret

00000000800025d8 <uartgetc>:
    800025d8:	ff010113          	addi	sp,sp,-16
    800025dc:	00813423          	sd	s0,8(sp)
    800025e0:	01010413          	addi	s0,sp,16
    800025e4:	10000737          	lui	a4,0x10000
    800025e8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800025ec:	0017f793          	andi	a5,a5,1
    800025f0:	00078c63          	beqz	a5,80002608 <uartgetc+0x30>
    800025f4:	00074503          	lbu	a0,0(a4)
    800025f8:	0ff57513          	andi	a0,a0,255
    800025fc:	00813403          	ld	s0,8(sp)
    80002600:	01010113          	addi	sp,sp,16
    80002604:	00008067          	ret
    80002608:	fff00513          	li	a0,-1
    8000260c:	ff1ff06f          	j	800025fc <uartgetc+0x24>

0000000080002610 <uartintr>:
    80002610:	100007b7          	lui	a5,0x10000
    80002614:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80002618:	0017f793          	andi	a5,a5,1
    8000261c:	0a078463          	beqz	a5,800026c4 <uartintr+0xb4>
    80002620:	fe010113          	addi	sp,sp,-32
    80002624:	00813823          	sd	s0,16(sp)
    80002628:	00913423          	sd	s1,8(sp)
    8000262c:	00113c23          	sd	ra,24(sp)
    80002630:	02010413          	addi	s0,sp,32
    80002634:	100004b7          	lui	s1,0x10000
    80002638:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000263c:	0ff57513          	andi	a0,a0,255
    80002640:	fffff097          	auipc	ra,0xfffff
    80002644:	534080e7          	jalr	1332(ra) # 80001b74 <consoleintr>
    80002648:	0054c783          	lbu	a5,5(s1)
    8000264c:	0017f793          	andi	a5,a5,1
    80002650:	fe0794e3          	bnez	a5,80002638 <uartintr+0x28>
    80002654:	00002617          	auipc	a2,0x2
    80002658:	bdc60613          	addi	a2,a2,-1060 # 80004230 <uart_tx_r>
    8000265c:	00002517          	auipc	a0,0x2
    80002660:	bdc50513          	addi	a0,a0,-1060 # 80004238 <uart_tx_w>
    80002664:	00063783          	ld	a5,0(a2)
    80002668:	00053703          	ld	a4,0(a0)
    8000266c:	04f70263          	beq	a4,a5,800026b0 <uartintr+0xa0>
    80002670:	100005b7          	lui	a1,0x10000
    80002674:	00003817          	auipc	a6,0x3
    80002678:	e0c80813          	addi	a6,a6,-500 # 80005480 <uart_tx_buf>
    8000267c:	01c0006f          	j	80002698 <uartintr+0x88>
    80002680:	0006c703          	lbu	a4,0(a3)
    80002684:	00f63023          	sd	a5,0(a2)
    80002688:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000268c:	00063783          	ld	a5,0(a2)
    80002690:	00053703          	ld	a4,0(a0)
    80002694:	00f70e63          	beq	a4,a5,800026b0 <uartintr+0xa0>
    80002698:	01f7f713          	andi	a4,a5,31
    8000269c:	00e806b3          	add	a3,a6,a4
    800026a0:	0055c703          	lbu	a4,5(a1)
    800026a4:	00178793          	addi	a5,a5,1
    800026a8:	02077713          	andi	a4,a4,32
    800026ac:	fc071ae3          	bnez	a4,80002680 <uartintr+0x70>
    800026b0:	01813083          	ld	ra,24(sp)
    800026b4:	01013403          	ld	s0,16(sp)
    800026b8:	00813483          	ld	s1,8(sp)
    800026bc:	02010113          	addi	sp,sp,32
    800026c0:	00008067          	ret
    800026c4:	00002617          	auipc	a2,0x2
    800026c8:	b6c60613          	addi	a2,a2,-1172 # 80004230 <uart_tx_r>
    800026cc:	00002517          	auipc	a0,0x2
    800026d0:	b6c50513          	addi	a0,a0,-1172 # 80004238 <uart_tx_w>
    800026d4:	00063783          	ld	a5,0(a2)
    800026d8:	00053703          	ld	a4,0(a0)
    800026dc:	04f70263          	beq	a4,a5,80002720 <uartintr+0x110>
    800026e0:	100005b7          	lui	a1,0x10000
    800026e4:	00003817          	auipc	a6,0x3
    800026e8:	d9c80813          	addi	a6,a6,-612 # 80005480 <uart_tx_buf>
    800026ec:	01c0006f          	j	80002708 <uartintr+0xf8>
    800026f0:	0006c703          	lbu	a4,0(a3)
    800026f4:	00f63023          	sd	a5,0(a2)
    800026f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800026fc:	00063783          	ld	a5,0(a2)
    80002700:	00053703          	ld	a4,0(a0)
    80002704:	02f70063          	beq	a4,a5,80002724 <uartintr+0x114>
    80002708:	01f7f713          	andi	a4,a5,31
    8000270c:	00e806b3          	add	a3,a6,a4
    80002710:	0055c703          	lbu	a4,5(a1)
    80002714:	00178793          	addi	a5,a5,1
    80002718:	02077713          	andi	a4,a4,32
    8000271c:	fc071ae3          	bnez	a4,800026f0 <uartintr+0xe0>
    80002720:	00008067          	ret
    80002724:	00008067          	ret

0000000080002728 <kinit>:
    80002728:	fc010113          	addi	sp,sp,-64
    8000272c:	02913423          	sd	s1,40(sp)
    80002730:	fffff7b7          	lui	a5,0xfffff
    80002734:	00004497          	auipc	s1,0x4
    80002738:	d6b48493          	addi	s1,s1,-661 # 8000649f <end+0xfff>
    8000273c:	02813823          	sd	s0,48(sp)
    80002740:	01313c23          	sd	s3,24(sp)
    80002744:	00f4f4b3          	and	s1,s1,a5
    80002748:	02113c23          	sd	ra,56(sp)
    8000274c:	03213023          	sd	s2,32(sp)
    80002750:	01413823          	sd	s4,16(sp)
    80002754:	01513423          	sd	s5,8(sp)
    80002758:	04010413          	addi	s0,sp,64
    8000275c:	000017b7          	lui	a5,0x1
    80002760:	01100993          	li	s3,17
    80002764:	00f487b3          	add	a5,s1,a5
    80002768:	01b99993          	slli	s3,s3,0x1b
    8000276c:	06f9e063          	bltu	s3,a5,800027cc <kinit+0xa4>
    80002770:	00003a97          	auipc	s5,0x3
    80002774:	d30a8a93          	addi	s5,s5,-720 # 800054a0 <end>
    80002778:	0754ec63          	bltu	s1,s5,800027f0 <kinit+0xc8>
    8000277c:	0734fa63          	bgeu	s1,s3,800027f0 <kinit+0xc8>
    80002780:	00088a37          	lui	s4,0x88
    80002784:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002788:	00002917          	auipc	s2,0x2
    8000278c:	ab890913          	addi	s2,s2,-1352 # 80004240 <kmem>
    80002790:	00ca1a13          	slli	s4,s4,0xc
    80002794:	0140006f          	j	800027a8 <kinit+0x80>
    80002798:	000017b7          	lui	a5,0x1
    8000279c:	00f484b3          	add	s1,s1,a5
    800027a0:	0554e863          	bltu	s1,s5,800027f0 <kinit+0xc8>
    800027a4:	0534f663          	bgeu	s1,s3,800027f0 <kinit+0xc8>
    800027a8:	00001637          	lui	a2,0x1
    800027ac:	00100593          	li	a1,1
    800027b0:	00048513          	mv	a0,s1
    800027b4:	00000097          	auipc	ra,0x0
    800027b8:	5e4080e7          	jalr	1508(ra) # 80002d98 <__memset>
    800027bc:	00093783          	ld	a5,0(s2)
    800027c0:	00f4b023          	sd	a5,0(s1)
    800027c4:	00993023          	sd	s1,0(s2)
    800027c8:	fd4498e3          	bne	s1,s4,80002798 <kinit+0x70>
    800027cc:	03813083          	ld	ra,56(sp)
    800027d0:	03013403          	ld	s0,48(sp)
    800027d4:	02813483          	ld	s1,40(sp)
    800027d8:	02013903          	ld	s2,32(sp)
    800027dc:	01813983          	ld	s3,24(sp)
    800027e0:	01013a03          	ld	s4,16(sp)
    800027e4:	00813a83          	ld	s5,8(sp)
    800027e8:	04010113          	addi	sp,sp,64
    800027ec:	00008067          	ret
    800027f0:	00002517          	auipc	a0,0x2
    800027f4:	98050513          	addi	a0,a0,-1664 # 80004170 <digits+0x18>
    800027f8:	fffff097          	auipc	ra,0xfffff
    800027fc:	4b4080e7          	jalr	1204(ra) # 80001cac <panic>

0000000080002800 <freerange>:
    80002800:	fc010113          	addi	sp,sp,-64
    80002804:	000017b7          	lui	a5,0x1
    80002808:	02913423          	sd	s1,40(sp)
    8000280c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80002810:	009504b3          	add	s1,a0,s1
    80002814:	fffff537          	lui	a0,0xfffff
    80002818:	02813823          	sd	s0,48(sp)
    8000281c:	02113c23          	sd	ra,56(sp)
    80002820:	03213023          	sd	s2,32(sp)
    80002824:	01313c23          	sd	s3,24(sp)
    80002828:	01413823          	sd	s4,16(sp)
    8000282c:	01513423          	sd	s5,8(sp)
    80002830:	01613023          	sd	s6,0(sp)
    80002834:	04010413          	addi	s0,sp,64
    80002838:	00a4f4b3          	and	s1,s1,a0
    8000283c:	00f487b3          	add	a5,s1,a5
    80002840:	06f5e463          	bltu	a1,a5,800028a8 <freerange+0xa8>
    80002844:	00003a97          	auipc	s5,0x3
    80002848:	c5ca8a93          	addi	s5,s5,-932 # 800054a0 <end>
    8000284c:	0954e263          	bltu	s1,s5,800028d0 <freerange+0xd0>
    80002850:	01100993          	li	s3,17
    80002854:	01b99993          	slli	s3,s3,0x1b
    80002858:	0734fc63          	bgeu	s1,s3,800028d0 <freerange+0xd0>
    8000285c:	00058a13          	mv	s4,a1
    80002860:	00002917          	auipc	s2,0x2
    80002864:	9e090913          	addi	s2,s2,-1568 # 80004240 <kmem>
    80002868:	00002b37          	lui	s6,0x2
    8000286c:	0140006f          	j	80002880 <freerange+0x80>
    80002870:	000017b7          	lui	a5,0x1
    80002874:	00f484b3          	add	s1,s1,a5
    80002878:	0554ec63          	bltu	s1,s5,800028d0 <freerange+0xd0>
    8000287c:	0534fa63          	bgeu	s1,s3,800028d0 <freerange+0xd0>
    80002880:	00001637          	lui	a2,0x1
    80002884:	00100593          	li	a1,1
    80002888:	00048513          	mv	a0,s1
    8000288c:	00000097          	auipc	ra,0x0
    80002890:	50c080e7          	jalr	1292(ra) # 80002d98 <__memset>
    80002894:	00093703          	ld	a4,0(s2)
    80002898:	016487b3          	add	a5,s1,s6
    8000289c:	00e4b023          	sd	a4,0(s1)
    800028a0:	00993023          	sd	s1,0(s2)
    800028a4:	fcfa76e3          	bgeu	s4,a5,80002870 <freerange+0x70>
    800028a8:	03813083          	ld	ra,56(sp)
    800028ac:	03013403          	ld	s0,48(sp)
    800028b0:	02813483          	ld	s1,40(sp)
    800028b4:	02013903          	ld	s2,32(sp)
    800028b8:	01813983          	ld	s3,24(sp)
    800028bc:	01013a03          	ld	s4,16(sp)
    800028c0:	00813a83          	ld	s5,8(sp)
    800028c4:	00013b03          	ld	s6,0(sp)
    800028c8:	04010113          	addi	sp,sp,64
    800028cc:	00008067          	ret
    800028d0:	00002517          	auipc	a0,0x2
    800028d4:	8a050513          	addi	a0,a0,-1888 # 80004170 <digits+0x18>
    800028d8:	fffff097          	auipc	ra,0xfffff
    800028dc:	3d4080e7          	jalr	980(ra) # 80001cac <panic>

00000000800028e0 <kfree>:
    800028e0:	fe010113          	addi	sp,sp,-32
    800028e4:	00813823          	sd	s0,16(sp)
    800028e8:	00113c23          	sd	ra,24(sp)
    800028ec:	00913423          	sd	s1,8(sp)
    800028f0:	02010413          	addi	s0,sp,32
    800028f4:	03451793          	slli	a5,a0,0x34
    800028f8:	04079c63          	bnez	a5,80002950 <kfree+0x70>
    800028fc:	00003797          	auipc	a5,0x3
    80002900:	ba478793          	addi	a5,a5,-1116 # 800054a0 <end>
    80002904:	00050493          	mv	s1,a0
    80002908:	04f56463          	bltu	a0,a5,80002950 <kfree+0x70>
    8000290c:	01100793          	li	a5,17
    80002910:	01b79793          	slli	a5,a5,0x1b
    80002914:	02f57e63          	bgeu	a0,a5,80002950 <kfree+0x70>
    80002918:	00001637          	lui	a2,0x1
    8000291c:	00100593          	li	a1,1
    80002920:	00000097          	auipc	ra,0x0
    80002924:	478080e7          	jalr	1144(ra) # 80002d98 <__memset>
    80002928:	00002797          	auipc	a5,0x2
    8000292c:	91878793          	addi	a5,a5,-1768 # 80004240 <kmem>
    80002930:	0007b703          	ld	a4,0(a5)
    80002934:	01813083          	ld	ra,24(sp)
    80002938:	01013403          	ld	s0,16(sp)
    8000293c:	00e4b023          	sd	a4,0(s1)
    80002940:	0097b023          	sd	s1,0(a5)
    80002944:	00813483          	ld	s1,8(sp)
    80002948:	02010113          	addi	sp,sp,32
    8000294c:	00008067          	ret
    80002950:	00002517          	auipc	a0,0x2
    80002954:	82050513          	addi	a0,a0,-2016 # 80004170 <digits+0x18>
    80002958:	fffff097          	auipc	ra,0xfffff
    8000295c:	354080e7          	jalr	852(ra) # 80001cac <panic>

0000000080002960 <kalloc>:
    80002960:	fe010113          	addi	sp,sp,-32
    80002964:	00813823          	sd	s0,16(sp)
    80002968:	00913423          	sd	s1,8(sp)
    8000296c:	00113c23          	sd	ra,24(sp)
    80002970:	02010413          	addi	s0,sp,32
    80002974:	00002797          	auipc	a5,0x2
    80002978:	8cc78793          	addi	a5,a5,-1844 # 80004240 <kmem>
    8000297c:	0007b483          	ld	s1,0(a5)
    80002980:	02048063          	beqz	s1,800029a0 <kalloc+0x40>
    80002984:	0004b703          	ld	a4,0(s1)
    80002988:	00001637          	lui	a2,0x1
    8000298c:	00500593          	li	a1,5
    80002990:	00048513          	mv	a0,s1
    80002994:	00e7b023          	sd	a4,0(a5)
    80002998:	00000097          	auipc	ra,0x0
    8000299c:	400080e7          	jalr	1024(ra) # 80002d98 <__memset>
    800029a0:	01813083          	ld	ra,24(sp)
    800029a4:	01013403          	ld	s0,16(sp)
    800029a8:	00048513          	mv	a0,s1
    800029ac:	00813483          	ld	s1,8(sp)
    800029b0:	02010113          	addi	sp,sp,32
    800029b4:	00008067          	ret

00000000800029b8 <initlock>:
    800029b8:	ff010113          	addi	sp,sp,-16
    800029bc:	00813423          	sd	s0,8(sp)
    800029c0:	01010413          	addi	s0,sp,16
    800029c4:	00813403          	ld	s0,8(sp)
    800029c8:	00b53423          	sd	a1,8(a0)
    800029cc:	00052023          	sw	zero,0(a0)
    800029d0:	00053823          	sd	zero,16(a0)
    800029d4:	01010113          	addi	sp,sp,16
    800029d8:	00008067          	ret

00000000800029dc <acquire>:
    800029dc:	fe010113          	addi	sp,sp,-32
    800029e0:	00813823          	sd	s0,16(sp)
    800029e4:	00913423          	sd	s1,8(sp)
    800029e8:	00113c23          	sd	ra,24(sp)
    800029ec:	01213023          	sd	s2,0(sp)
    800029f0:	02010413          	addi	s0,sp,32
    800029f4:	00050493          	mv	s1,a0
    800029f8:	10002973          	csrr	s2,sstatus
    800029fc:	100027f3          	csrr	a5,sstatus
    80002a00:	ffd7f793          	andi	a5,a5,-3
    80002a04:	10079073          	csrw	sstatus,a5
    80002a08:	fffff097          	auipc	ra,0xfffff
    80002a0c:	8e4080e7          	jalr	-1820(ra) # 800012ec <mycpu>
    80002a10:	07852783          	lw	a5,120(a0)
    80002a14:	06078e63          	beqz	a5,80002a90 <acquire+0xb4>
    80002a18:	fffff097          	auipc	ra,0xfffff
    80002a1c:	8d4080e7          	jalr	-1836(ra) # 800012ec <mycpu>
    80002a20:	07852783          	lw	a5,120(a0)
    80002a24:	0004a703          	lw	a4,0(s1)
    80002a28:	0017879b          	addiw	a5,a5,1
    80002a2c:	06f52c23          	sw	a5,120(a0)
    80002a30:	04071063          	bnez	a4,80002a70 <acquire+0x94>
    80002a34:	00100713          	li	a4,1
    80002a38:	00070793          	mv	a5,a4
    80002a3c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80002a40:	0007879b          	sext.w	a5,a5
    80002a44:	fe079ae3          	bnez	a5,80002a38 <acquire+0x5c>
    80002a48:	0ff0000f          	fence
    80002a4c:	fffff097          	auipc	ra,0xfffff
    80002a50:	8a0080e7          	jalr	-1888(ra) # 800012ec <mycpu>
    80002a54:	01813083          	ld	ra,24(sp)
    80002a58:	01013403          	ld	s0,16(sp)
    80002a5c:	00a4b823          	sd	a0,16(s1)
    80002a60:	00013903          	ld	s2,0(sp)
    80002a64:	00813483          	ld	s1,8(sp)
    80002a68:	02010113          	addi	sp,sp,32
    80002a6c:	00008067          	ret
    80002a70:	0104b903          	ld	s2,16(s1)
    80002a74:	fffff097          	auipc	ra,0xfffff
    80002a78:	878080e7          	jalr	-1928(ra) # 800012ec <mycpu>
    80002a7c:	faa91ce3          	bne	s2,a0,80002a34 <acquire+0x58>
    80002a80:	00001517          	auipc	a0,0x1
    80002a84:	6f850513          	addi	a0,a0,1784 # 80004178 <digits+0x20>
    80002a88:	fffff097          	auipc	ra,0xfffff
    80002a8c:	224080e7          	jalr	548(ra) # 80001cac <panic>
    80002a90:	00195913          	srli	s2,s2,0x1
    80002a94:	fffff097          	auipc	ra,0xfffff
    80002a98:	858080e7          	jalr	-1960(ra) # 800012ec <mycpu>
    80002a9c:	00197913          	andi	s2,s2,1
    80002aa0:	07252e23          	sw	s2,124(a0)
    80002aa4:	f75ff06f          	j	80002a18 <acquire+0x3c>

0000000080002aa8 <release>:
    80002aa8:	fe010113          	addi	sp,sp,-32
    80002aac:	00813823          	sd	s0,16(sp)
    80002ab0:	00113c23          	sd	ra,24(sp)
    80002ab4:	00913423          	sd	s1,8(sp)
    80002ab8:	01213023          	sd	s2,0(sp)
    80002abc:	02010413          	addi	s0,sp,32
    80002ac0:	00052783          	lw	a5,0(a0)
    80002ac4:	00079a63          	bnez	a5,80002ad8 <release+0x30>
    80002ac8:	00001517          	auipc	a0,0x1
    80002acc:	6b850513          	addi	a0,a0,1720 # 80004180 <digits+0x28>
    80002ad0:	fffff097          	auipc	ra,0xfffff
    80002ad4:	1dc080e7          	jalr	476(ra) # 80001cac <panic>
    80002ad8:	01053903          	ld	s2,16(a0)
    80002adc:	00050493          	mv	s1,a0
    80002ae0:	fffff097          	auipc	ra,0xfffff
    80002ae4:	80c080e7          	jalr	-2036(ra) # 800012ec <mycpu>
    80002ae8:	fea910e3          	bne	s2,a0,80002ac8 <release+0x20>
    80002aec:	0004b823          	sd	zero,16(s1)
    80002af0:	0ff0000f          	fence
    80002af4:	0f50000f          	fence	iorw,ow
    80002af8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80002afc:	ffffe097          	auipc	ra,0xffffe
    80002b00:	7f0080e7          	jalr	2032(ra) # 800012ec <mycpu>
    80002b04:	100027f3          	csrr	a5,sstatus
    80002b08:	0027f793          	andi	a5,a5,2
    80002b0c:	04079a63          	bnez	a5,80002b60 <release+0xb8>
    80002b10:	07852783          	lw	a5,120(a0)
    80002b14:	02f05e63          	blez	a5,80002b50 <release+0xa8>
    80002b18:	fff7871b          	addiw	a4,a5,-1
    80002b1c:	06e52c23          	sw	a4,120(a0)
    80002b20:	00071c63          	bnez	a4,80002b38 <release+0x90>
    80002b24:	07c52783          	lw	a5,124(a0)
    80002b28:	00078863          	beqz	a5,80002b38 <release+0x90>
    80002b2c:	100027f3          	csrr	a5,sstatus
    80002b30:	0027e793          	ori	a5,a5,2
    80002b34:	10079073          	csrw	sstatus,a5
    80002b38:	01813083          	ld	ra,24(sp)
    80002b3c:	01013403          	ld	s0,16(sp)
    80002b40:	00813483          	ld	s1,8(sp)
    80002b44:	00013903          	ld	s2,0(sp)
    80002b48:	02010113          	addi	sp,sp,32
    80002b4c:	00008067          	ret
    80002b50:	00001517          	auipc	a0,0x1
    80002b54:	65050513          	addi	a0,a0,1616 # 800041a0 <digits+0x48>
    80002b58:	fffff097          	auipc	ra,0xfffff
    80002b5c:	154080e7          	jalr	340(ra) # 80001cac <panic>
    80002b60:	00001517          	auipc	a0,0x1
    80002b64:	62850513          	addi	a0,a0,1576 # 80004188 <digits+0x30>
    80002b68:	fffff097          	auipc	ra,0xfffff
    80002b6c:	144080e7          	jalr	324(ra) # 80001cac <panic>

0000000080002b70 <holding>:
    80002b70:	00052783          	lw	a5,0(a0)
    80002b74:	00079663          	bnez	a5,80002b80 <holding+0x10>
    80002b78:	00000513          	li	a0,0
    80002b7c:	00008067          	ret
    80002b80:	fe010113          	addi	sp,sp,-32
    80002b84:	00813823          	sd	s0,16(sp)
    80002b88:	00913423          	sd	s1,8(sp)
    80002b8c:	00113c23          	sd	ra,24(sp)
    80002b90:	02010413          	addi	s0,sp,32
    80002b94:	01053483          	ld	s1,16(a0)
    80002b98:	ffffe097          	auipc	ra,0xffffe
    80002b9c:	754080e7          	jalr	1876(ra) # 800012ec <mycpu>
    80002ba0:	01813083          	ld	ra,24(sp)
    80002ba4:	01013403          	ld	s0,16(sp)
    80002ba8:	40a48533          	sub	a0,s1,a0
    80002bac:	00153513          	seqz	a0,a0
    80002bb0:	00813483          	ld	s1,8(sp)
    80002bb4:	02010113          	addi	sp,sp,32
    80002bb8:	00008067          	ret

0000000080002bbc <push_off>:
    80002bbc:	fe010113          	addi	sp,sp,-32
    80002bc0:	00813823          	sd	s0,16(sp)
    80002bc4:	00113c23          	sd	ra,24(sp)
    80002bc8:	00913423          	sd	s1,8(sp)
    80002bcc:	02010413          	addi	s0,sp,32
    80002bd0:	100024f3          	csrr	s1,sstatus
    80002bd4:	100027f3          	csrr	a5,sstatus
    80002bd8:	ffd7f793          	andi	a5,a5,-3
    80002bdc:	10079073          	csrw	sstatus,a5
    80002be0:	ffffe097          	auipc	ra,0xffffe
    80002be4:	70c080e7          	jalr	1804(ra) # 800012ec <mycpu>
    80002be8:	07852783          	lw	a5,120(a0)
    80002bec:	02078663          	beqz	a5,80002c18 <push_off+0x5c>
    80002bf0:	ffffe097          	auipc	ra,0xffffe
    80002bf4:	6fc080e7          	jalr	1788(ra) # 800012ec <mycpu>
    80002bf8:	07852783          	lw	a5,120(a0)
    80002bfc:	01813083          	ld	ra,24(sp)
    80002c00:	01013403          	ld	s0,16(sp)
    80002c04:	0017879b          	addiw	a5,a5,1
    80002c08:	06f52c23          	sw	a5,120(a0)
    80002c0c:	00813483          	ld	s1,8(sp)
    80002c10:	02010113          	addi	sp,sp,32
    80002c14:	00008067          	ret
    80002c18:	0014d493          	srli	s1,s1,0x1
    80002c1c:	ffffe097          	auipc	ra,0xffffe
    80002c20:	6d0080e7          	jalr	1744(ra) # 800012ec <mycpu>
    80002c24:	0014f493          	andi	s1,s1,1
    80002c28:	06952e23          	sw	s1,124(a0)
    80002c2c:	fc5ff06f          	j	80002bf0 <push_off+0x34>

0000000080002c30 <pop_off>:
    80002c30:	ff010113          	addi	sp,sp,-16
    80002c34:	00813023          	sd	s0,0(sp)
    80002c38:	00113423          	sd	ra,8(sp)
    80002c3c:	01010413          	addi	s0,sp,16
    80002c40:	ffffe097          	auipc	ra,0xffffe
    80002c44:	6ac080e7          	jalr	1708(ra) # 800012ec <mycpu>
    80002c48:	100027f3          	csrr	a5,sstatus
    80002c4c:	0027f793          	andi	a5,a5,2
    80002c50:	04079663          	bnez	a5,80002c9c <pop_off+0x6c>
    80002c54:	07852783          	lw	a5,120(a0)
    80002c58:	02f05a63          	blez	a5,80002c8c <pop_off+0x5c>
    80002c5c:	fff7871b          	addiw	a4,a5,-1
    80002c60:	06e52c23          	sw	a4,120(a0)
    80002c64:	00071c63          	bnez	a4,80002c7c <pop_off+0x4c>
    80002c68:	07c52783          	lw	a5,124(a0)
    80002c6c:	00078863          	beqz	a5,80002c7c <pop_off+0x4c>
    80002c70:	100027f3          	csrr	a5,sstatus
    80002c74:	0027e793          	ori	a5,a5,2
    80002c78:	10079073          	csrw	sstatus,a5
    80002c7c:	00813083          	ld	ra,8(sp)
    80002c80:	00013403          	ld	s0,0(sp)
    80002c84:	01010113          	addi	sp,sp,16
    80002c88:	00008067          	ret
    80002c8c:	00001517          	auipc	a0,0x1
    80002c90:	51450513          	addi	a0,a0,1300 # 800041a0 <digits+0x48>
    80002c94:	fffff097          	auipc	ra,0xfffff
    80002c98:	018080e7          	jalr	24(ra) # 80001cac <panic>
    80002c9c:	00001517          	auipc	a0,0x1
    80002ca0:	4ec50513          	addi	a0,a0,1260 # 80004188 <digits+0x30>
    80002ca4:	fffff097          	auipc	ra,0xfffff
    80002ca8:	008080e7          	jalr	8(ra) # 80001cac <panic>

0000000080002cac <push_on>:
    80002cac:	fe010113          	addi	sp,sp,-32
    80002cb0:	00813823          	sd	s0,16(sp)
    80002cb4:	00113c23          	sd	ra,24(sp)
    80002cb8:	00913423          	sd	s1,8(sp)
    80002cbc:	02010413          	addi	s0,sp,32
    80002cc0:	100024f3          	csrr	s1,sstatus
    80002cc4:	100027f3          	csrr	a5,sstatus
    80002cc8:	0027e793          	ori	a5,a5,2
    80002ccc:	10079073          	csrw	sstatus,a5
    80002cd0:	ffffe097          	auipc	ra,0xffffe
    80002cd4:	61c080e7          	jalr	1564(ra) # 800012ec <mycpu>
    80002cd8:	07852783          	lw	a5,120(a0)
    80002cdc:	02078663          	beqz	a5,80002d08 <push_on+0x5c>
    80002ce0:	ffffe097          	auipc	ra,0xffffe
    80002ce4:	60c080e7          	jalr	1548(ra) # 800012ec <mycpu>
    80002ce8:	07852783          	lw	a5,120(a0)
    80002cec:	01813083          	ld	ra,24(sp)
    80002cf0:	01013403          	ld	s0,16(sp)
    80002cf4:	0017879b          	addiw	a5,a5,1
    80002cf8:	06f52c23          	sw	a5,120(a0)
    80002cfc:	00813483          	ld	s1,8(sp)
    80002d00:	02010113          	addi	sp,sp,32
    80002d04:	00008067          	ret
    80002d08:	0014d493          	srli	s1,s1,0x1
    80002d0c:	ffffe097          	auipc	ra,0xffffe
    80002d10:	5e0080e7          	jalr	1504(ra) # 800012ec <mycpu>
    80002d14:	0014f493          	andi	s1,s1,1
    80002d18:	06952e23          	sw	s1,124(a0)
    80002d1c:	fc5ff06f          	j	80002ce0 <push_on+0x34>

0000000080002d20 <pop_on>:
    80002d20:	ff010113          	addi	sp,sp,-16
    80002d24:	00813023          	sd	s0,0(sp)
    80002d28:	00113423          	sd	ra,8(sp)
    80002d2c:	01010413          	addi	s0,sp,16
    80002d30:	ffffe097          	auipc	ra,0xffffe
    80002d34:	5bc080e7          	jalr	1468(ra) # 800012ec <mycpu>
    80002d38:	100027f3          	csrr	a5,sstatus
    80002d3c:	0027f793          	andi	a5,a5,2
    80002d40:	04078463          	beqz	a5,80002d88 <pop_on+0x68>
    80002d44:	07852783          	lw	a5,120(a0)
    80002d48:	02f05863          	blez	a5,80002d78 <pop_on+0x58>
    80002d4c:	fff7879b          	addiw	a5,a5,-1
    80002d50:	06f52c23          	sw	a5,120(a0)
    80002d54:	07853783          	ld	a5,120(a0)
    80002d58:	00079863          	bnez	a5,80002d68 <pop_on+0x48>
    80002d5c:	100027f3          	csrr	a5,sstatus
    80002d60:	ffd7f793          	andi	a5,a5,-3
    80002d64:	10079073          	csrw	sstatus,a5
    80002d68:	00813083          	ld	ra,8(sp)
    80002d6c:	00013403          	ld	s0,0(sp)
    80002d70:	01010113          	addi	sp,sp,16
    80002d74:	00008067          	ret
    80002d78:	00001517          	auipc	a0,0x1
    80002d7c:	45050513          	addi	a0,a0,1104 # 800041c8 <digits+0x70>
    80002d80:	fffff097          	auipc	ra,0xfffff
    80002d84:	f2c080e7          	jalr	-212(ra) # 80001cac <panic>
    80002d88:	00001517          	auipc	a0,0x1
    80002d8c:	42050513          	addi	a0,a0,1056 # 800041a8 <digits+0x50>
    80002d90:	fffff097          	auipc	ra,0xfffff
    80002d94:	f1c080e7          	jalr	-228(ra) # 80001cac <panic>

0000000080002d98 <__memset>:
    80002d98:	ff010113          	addi	sp,sp,-16
    80002d9c:	00813423          	sd	s0,8(sp)
    80002da0:	01010413          	addi	s0,sp,16
    80002da4:	1a060e63          	beqz	a2,80002f60 <__memset+0x1c8>
    80002da8:	40a007b3          	neg	a5,a0
    80002dac:	0077f793          	andi	a5,a5,7
    80002db0:	00778693          	addi	a3,a5,7
    80002db4:	00b00813          	li	a6,11
    80002db8:	0ff5f593          	andi	a1,a1,255
    80002dbc:	fff6071b          	addiw	a4,a2,-1
    80002dc0:	1b06e663          	bltu	a3,a6,80002f6c <__memset+0x1d4>
    80002dc4:	1cd76463          	bltu	a4,a3,80002f8c <__memset+0x1f4>
    80002dc8:	1a078e63          	beqz	a5,80002f84 <__memset+0x1ec>
    80002dcc:	00b50023          	sb	a1,0(a0)
    80002dd0:	00100713          	li	a4,1
    80002dd4:	1ae78463          	beq	a5,a4,80002f7c <__memset+0x1e4>
    80002dd8:	00b500a3          	sb	a1,1(a0)
    80002ddc:	00200713          	li	a4,2
    80002de0:	1ae78a63          	beq	a5,a4,80002f94 <__memset+0x1fc>
    80002de4:	00b50123          	sb	a1,2(a0)
    80002de8:	00300713          	li	a4,3
    80002dec:	18e78463          	beq	a5,a4,80002f74 <__memset+0x1dc>
    80002df0:	00b501a3          	sb	a1,3(a0)
    80002df4:	00400713          	li	a4,4
    80002df8:	1ae78263          	beq	a5,a4,80002f9c <__memset+0x204>
    80002dfc:	00b50223          	sb	a1,4(a0)
    80002e00:	00500713          	li	a4,5
    80002e04:	1ae78063          	beq	a5,a4,80002fa4 <__memset+0x20c>
    80002e08:	00b502a3          	sb	a1,5(a0)
    80002e0c:	00700713          	li	a4,7
    80002e10:	18e79e63          	bne	a5,a4,80002fac <__memset+0x214>
    80002e14:	00b50323          	sb	a1,6(a0)
    80002e18:	00700e93          	li	t4,7
    80002e1c:	00859713          	slli	a4,a1,0x8
    80002e20:	00e5e733          	or	a4,a1,a4
    80002e24:	01059e13          	slli	t3,a1,0x10
    80002e28:	01c76e33          	or	t3,a4,t3
    80002e2c:	01859313          	slli	t1,a1,0x18
    80002e30:	006e6333          	or	t1,t3,t1
    80002e34:	02059893          	slli	a7,a1,0x20
    80002e38:	40f60e3b          	subw	t3,a2,a5
    80002e3c:	011368b3          	or	a7,t1,a7
    80002e40:	02859813          	slli	a6,a1,0x28
    80002e44:	0108e833          	or	a6,a7,a6
    80002e48:	03059693          	slli	a3,a1,0x30
    80002e4c:	003e589b          	srliw	a7,t3,0x3
    80002e50:	00d866b3          	or	a3,a6,a3
    80002e54:	03859713          	slli	a4,a1,0x38
    80002e58:	00389813          	slli	a6,a7,0x3
    80002e5c:	00f507b3          	add	a5,a0,a5
    80002e60:	00e6e733          	or	a4,a3,a4
    80002e64:	000e089b          	sext.w	a7,t3
    80002e68:	00f806b3          	add	a3,a6,a5
    80002e6c:	00e7b023          	sd	a4,0(a5)
    80002e70:	00878793          	addi	a5,a5,8
    80002e74:	fed79ce3          	bne	a5,a3,80002e6c <__memset+0xd4>
    80002e78:	ff8e7793          	andi	a5,t3,-8
    80002e7c:	0007871b          	sext.w	a4,a5
    80002e80:	01d787bb          	addw	a5,a5,t4
    80002e84:	0ce88e63          	beq	a7,a4,80002f60 <__memset+0x1c8>
    80002e88:	00f50733          	add	a4,a0,a5
    80002e8c:	00b70023          	sb	a1,0(a4)
    80002e90:	0017871b          	addiw	a4,a5,1
    80002e94:	0cc77663          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002e98:	00e50733          	add	a4,a0,a4
    80002e9c:	00b70023          	sb	a1,0(a4)
    80002ea0:	0027871b          	addiw	a4,a5,2
    80002ea4:	0ac77e63          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002ea8:	00e50733          	add	a4,a0,a4
    80002eac:	00b70023          	sb	a1,0(a4)
    80002eb0:	0037871b          	addiw	a4,a5,3
    80002eb4:	0ac77663          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002eb8:	00e50733          	add	a4,a0,a4
    80002ebc:	00b70023          	sb	a1,0(a4)
    80002ec0:	0047871b          	addiw	a4,a5,4
    80002ec4:	08c77e63          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002ec8:	00e50733          	add	a4,a0,a4
    80002ecc:	00b70023          	sb	a1,0(a4)
    80002ed0:	0057871b          	addiw	a4,a5,5
    80002ed4:	08c77663          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002ed8:	00e50733          	add	a4,a0,a4
    80002edc:	00b70023          	sb	a1,0(a4)
    80002ee0:	0067871b          	addiw	a4,a5,6
    80002ee4:	06c77e63          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002ee8:	00e50733          	add	a4,a0,a4
    80002eec:	00b70023          	sb	a1,0(a4)
    80002ef0:	0077871b          	addiw	a4,a5,7
    80002ef4:	06c77663          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002ef8:	00e50733          	add	a4,a0,a4
    80002efc:	00b70023          	sb	a1,0(a4)
    80002f00:	0087871b          	addiw	a4,a5,8
    80002f04:	04c77e63          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002f08:	00e50733          	add	a4,a0,a4
    80002f0c:	00b70023          	sb	a1,0(a4)
    80002f10:	0097871b          	addiw	a4,a5,9
    80002f14:	04c77663          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002f18:	00e50733          	add	a4,a0,a4
    80002f1c:	00b70023          	sb	a1,0(a4)
    80002f20:	00a7871b          	addiw	a4,a5,10
    80002f24:	02c77e63          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002f28:	00e50733          	add	a4,a0,a4
    80002f2c:	00b70023          	sb	a1,0(a4)
    80002f30:	00b7871b          	addiw	a4,a5,11
    80002f34:	02c77663          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002f38:	00e50733          	add	a4,a0,a4
    80002f3c:	00b70023          	sb	a1,0(a4)
    80002f40:	00c7871b          	addiw	a4,a5,12
    80002f44:	00c77e63          	bgeu	a4,a2,80002f60 <__memset+0x1c8>
    80002f48:	00e50733          	add	a4,a0,a4
    80002f4c:	00b70023          	sb	a1,0(a4)
    80002f50:	00d7879b          	addiw	a5,a5,13
    80002f54:	00c7f663          	bgeu	a5,a2,80002f60 <__memset+0x1c8>
    80002f58:	00f507b3          	add	a5,a0,a5
    80002f5c:	00b78023          	sb	a1,0(a5)
    80002f60:	00813403          	ld	s0,8(sp)
    80002f64:	01010113          	addi	sp,sp,16
    80002f68:	00008067          	ret
    80002f6c:	00b00693          	li	a3,11
    80002f70:	e55ff06f          	j	80002dc4 <__memset+0x2c>
    80002f74:	00300e93          	li	t4,3
    80002f78:	ea5ff06f          	j	80002e1c <__memset+0x84>
    80002f7c:	00100e93          	li	t4,1
    80002f80:	e9dff06f          	j	80002e1c <__memset+0x84>
    80002f84:	00000e93          	li	t4,0
    80002f88:	e95ff06f          	j	80002e1c <__memset+0x84>
    80002f8c:	00000793          	li	a5,0
    80002f90:	ef9ff06f          	j	80002e88 <__memset+0xf0>
    80002f94:	00200e93          	li	t4,2
    80002f98:	e85ff06f          	j	80002e1c <__memset+0x84>
    80002f9c:	00400e93          	li	t4,4
    80002fa0:	e7dff06f          	j	80002e1c <__memset+0x84>
    80002fa4:	00500e93          	li	t4,5
    80002fa8:	e75ff06f          	j	80002e1c <__memset+0x84>
    80002fac:	00600e93          	li	t4,6
    80002fb0:	e6dff06f          	j	80002e1c <__memset+0x84>

0000000080002fb4 <__memmove>:
    80002fb4:	ff010113          	addi	sp,sp,-16
    80002fb8:	00813423          	sd	s0,8(sp)
    80002fbc:	01010413          	addi	s0,sp,16
    80002fc0:	0e060863          	beqz	a2,800030b0 <__memmove+0xfc>
    80002fc4:	fff6069b          	addiw	a3,a2,-1
    80002fc8:	0006881b          	sext.w	a6,a3
    80002fcc:	0ea5e863          	bltu	a1,a0,800030bc <__memmove+0x108>
    80002fd0:	00758713          	addi	a4,a1,7
    80002fd4:	00a5e7b3          	or	a5,a1,a0
    80002fd8:	40a70733          	sub	a4,a4,a0
    80002fdc:	0077f793          	andi	a5,a5,7
    80002fe0:	00f73713          	sltiu	a4,a4,15
    80002fe4:	00174713          	xori	a4,a4,1
    80002fe8:	0017b793          	seqz	a5,a5
    80002fec:	00e7f7b3          	and	a5,a5,a4
    80002ff0:	10078863          	beqz	a5,80003100 <__memmove+0x14c>
    80002ff4:	00900793          	li	a5,9
    80002ff8:	1107f463          	bgeu	a5,a6,80003100 <__memmove+0x14c>
    80002ffc:	0036581b          	srliw	a6,a2,0x3
    80003000:	fff8081b          	addiw	a6,a6,-1
    80003004:	02081813          	slli	a6,a6,0x20
    80003008:	01d85893          	srli	a7,a6,0x1d
    8000300c:	00858813          	addi	a6,a1,8
    80003010:	00058793          	mv	a5,a1
    80003014:	00050713          	mv	a4,a0
    80003018:	01088833          	add	a6,a7,a6
    8000301c:	0007b883          	ld	a7,0(a5)
    80003020:	00878793          	addi	a5,a5,8
    80003024:	00870713          	addi	a4,a4,8
    80003028:	ff173c23          	sd	a7,-8(a4)
    8000302c:	ff0798e3          	bne	a5,a6,8000301c <__memmove+0x68>
    80003030:	ff867713          	andi	a4,a2,-8
    80003034:	02071793          	slli	a5,a4,0x20
    80003038:	0207d793          	srli	a5,a5,0x20
    8000303c:	00f585b3          	add	a1,a1,a5
    80003040:	40e686bb          	subw	a3,a3,a4
    80003044:	00f507b3          	add	a5,a0,a5
    80003048:	06e60463          	beq	a2,a4,800030b0 <__memmove+0xfc>
    8000304c:	0005c703          	lbu	a4,0(a1)
    80003050:	00e78023          	sb	a4,0(a5)
    80003054:	04068e63          	beqz	a3,800030b0 <__memmove+0xfc>
    80003058:	0015c603          	lbu	a2,1(a1)
    8000305c:	00100713          	li	a4,1
    80003060:	00c780a3          	sb	a2,1(a5)
    80003064:	04e68663          	beq	a3,a4,800030b0 <__memmove+0xfc>
    80003068:	0025c603          	lbu	a2,2(a1)
    8000306c:	00200713          	li	a4,2
    80003070:	00c78123          	sb	a2,2(a5)
    80003074:	02e68e63          	beq	a3,a4,800030b0 <__memmove+0xfc>
    80003078:	0035c603          	lbu	a2,3(a1)
    8000307c:	00300713          	li	a4,3
    80003080:	00c781a3          	sb	a2,3(a5)
    80003084:	02e68663          	beq	a3,a4,800030b0 <__memmove+0xfc>
    80003088:	0045c603          	lbu	a2,4(a1)
    8000308c:	00400713          	li	a4,4
    80003090:	00c78223          	sb	a2,4(a5)
    80003094:	00e68e63          	beq	a3,a4,800030b0 <__memmove+0xfc>
    80003098:	0055c603          	lbu	a2,5(a1)
    8000309c:	00500713          	li	a4,5
    800030a0:	00c782a3          	sb	a2,5(a5)
    800030a4:	00e68663          	beq	a3,a4,800030b0 <__memmove+0xfc>
    800030a8:	0065c703          	lbu	a4,6(a1)
    800030ac:	00e78323          	sb	a4,6(a5)
    800030b0:	00813403          	ld	s0,8(sp)
    800030b4:	01010113          	addi	sp,sp,16
    800030b8:	00008067          	ret
    800030bc:	02061713          	slli	a4,a2,0x20
    800030c0:	02075713          	srli	a4,a4,0x20
    800030c4:	00e587b3          	add	a5,a1,a4
    800030c8:	f0f574e3          	bgeu	a0,a5,80002fd0 <__memmove+0x1c>
    800030cc:	02069613          	slli	a2,a3,0x20
    800030d0:	02065613          	srli	a2,a2,0x20
    800030d4:	fff64613          	not	a2,a2
    800030d8:	00e50733          	add	a4,a0,a4
    800030dc:	00c78633          	add	a2,a5,a2
    800030e0:	fff7c683          	lbu	a3,-1(a5)
    800030e4:	fff78793          	addi	a5,a5,-1
    800030e8:	fff70713          	addi	a4,a4,-1
    800030ec:	00d70023          	sb	a3,0(a4)
    800030f0:	fec798e3          	bne	a5,a2,800030e0 <__memmove+0x12c>
    800030f4:	00813403          	ld	s0,8(sp)
    800030f8:	01010113          	addi	sp,sp,16
    800030fc:	00008067          	ret
    80003100:	02069713          	slli	a4,a3,0x20
    80003104:	02075713          	srli	a4,a4,0x20
    80003108:	00170713          	addi	a4,a4,1
    8000310c:	00e50733          	add	a4,a0,a4
    80003110:	00050793          	mv	a5,a0
    80003114:	0005c683          	lbu	a3,0(a1)
    80003118:	00178793          	addi	a5,a5,1
    8000311c:	00158593          	addi	a1,a1,1
    80003120:	fed78fa3          	sb	a3,-1(a5)
    80003124:	fee798e3          	bne	a5,a4,80003114 <__memmove+0x160>
    80003128:	f89ff06f          	j	800030b0 <__memmove+0xfc>

000000008000312c <__putc>:
    8000312c:	fe010113          	addi	sp,sp,-32
    80003130:	00813823          	sd	s0,16(sp)
    80003134:	00113c23          	sd	ra,24(sp)
    80003138:	02010413          	addi	s0,sp,32
    8000313c:	00050793          	mv	a5,a0
    80003140:	fef40593          	addi	a1,s0,-17
    80003144:	00100613          	li	a2,1
    80003148:	00000513          	li	a0,0
    8000314c:	fef407a3          	sb	a5,-17(s0)
    80003150:	fffff097          	auipc	ra,0xfffff
    80003154:	b3c080e7          	jalr	-1220(ra) # 80001c8c <console_write>
    80003158:	01813083          	ld	ra,24(sp)
    8000315c:	01013403          	ld	s0,16(sp)
    80003160:	02010113          	addi	sp,sp,32
    80003164:	00008067          	ret

0000000080003168 <__getc>:
    80003168:	fe010113          	addi	sp,sp,-32
    8000316c:	00813823          	sd	s0,16(sp)
    80003170:	00113c23          	sd	ra,24(sp)
    80003174:	02010413          	addi	s0,sp,32
    80003178:	fe840593          	addi	a1,s0,-24
    8000317c:	00100613          	li	a2,1
    80003180:	00000513          	li	a0,0
    80003184:	fffff097          	auipc	ra,0xfffff
    80003188:	ae8080e7          	jalr	-1304(ra) # 80001c6c <console_read>
    8000318c:	fe844503          	lbu	a0,-24(s0)
    80003190:	01813083          	ld	ra,24(sp)
    80003194:	01013403          	ld	s0,16(sp)
    80003198:	02010113          	addi	sp,sp,32
    8000319c:	00008067          	ret

00000000800031a0 <console_handler>:
    800031a0:	fe010113          	addi	sp,sp,-32
    800031a4:	00813823          	sd	s0,16(sp)
    800031a8:	00113c23          	sd	ra,24(sp)
    800031ac:	00913423          	sd	s1,8(sp)
    800031b0:	02010413          	addi	s0,sp,32
    800031b4:	14202773          	csrr	a4,scause
    800031b8:	100027f3          	csrr	a5,sstatus
    800031bc:	0027f793          	andi	a5,a5,2
    800031c0:	06079e63          	bnez	a5,8000323c <console_handler+0x9c>
    800031c4:	00074c63          	bltz	a4,800031dc <console_handler+0x3c>
    800031c8:	01813083          	ld	ra,24(sp)
    800031cc:	01013403          	ld	s0,16(sp)
    800031d0:	00813483          	ld	s1,8(sp)
    800031d4:	02010113          	addi	sp,sp,32
    800031d8:	00008067          	ret
    800031dc:	0ff77713          	andi	a4,a4,255
    800031e0:	00900793          	li	a5,9
    800031e4:	fef712e3          	bne	a4,a5,800031c8 <console_handler+0x28>
    800031e8:	ffffe097          	auipc	ra,0xffffe
    800031ec:	6dc080e7          	jalr	1756(ra) # 800018c4 <plic_claim>
    800031f0:	00a00793          	li	a5,10
    800031f4:	00050493          	mv	s1,a0
    800031f8:	02f50c63          	beq	a0,a5,80003230 <console_handler+0x90>
    800031fc:	fc0506e3          	beqz	a0,800031c8 <console_handler+0x28>
    80003200:	00050593          	mv	a1,a0
    80003204:	00001517          	auipc	a0,0x1
    80003208:	ecc50513          	addi	a0,a0,-308 # 800040d0 <console_handler+0xf30>
    8000320c:	fffff097          	auipc	ra,0xfffff
    80003210:	afc080e7          	jalr	-1284(ra) # 80001d08 <__printf>
    80003214:	01013403          	ld	s0,16(sp)
    80003218:	01813083          	ld	ra,24(sp)
    8000321c:	00048513          	mv	a0,s1
    80003220:	00813483          	ld	s1,8(sp)
    80003224:	02010113          	addi	sp,sp,32
    80003228:	ffffe317          	auipc	t1,0xffffe
    8000322c:	6d430067          	jr	1748(t1) # 800018fc <plic_complete>
    80003230:	fffff097          	auipc	ra,0xfffff
    80003234:	3e0080e7          	jalr	992(ra) # 80002610 <uartintr>
    80003238:	fddff06f          	j	80003214 <console_handler+0x74>
    8000323c:	00001517          	auipc	a0,0x1
    80003240:	f9450513          	addi	a0,a0,-108 # 800041d0 <digits+0x78>
    80003244:	fffff097          	auipc	ra,0xfffff
    80003248:	a68080e7          	jalr	-1432(ra) # 80001cac <panic>
	...
