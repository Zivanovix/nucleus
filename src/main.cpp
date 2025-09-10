#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

#include "../h/tcb.hpp"
#include "../h/print.hpp"
#include "../h/workers.hpp"
#include "../h/riscv.hpp"

extern "C" void userMain();

/*
extern "C" void supervisorTrap();


typedef struct Context {
    uint64 s0;  // Offset 0x00
    uint64 s1;  // Offset 0x08
    uint64 s2;  // Offset 0x10
    uint64 s3;  // Offset 0x18
    uint64 s4;  // Offset 0x20
    uint64 s5;  // Offset 0x28
    uint64 s6;  // Offset 0x30
    uint64 s7;  // Offset 0x38
    uint64 s8;  // Offset 0x40
    uint64 s9;  // Offset 0x48
    uint64 s10; // Offset 0x50
    uint64 s11; // Offset 0x58

    uint64 ra;  // Offset 0x60

    uint64 a0;  // Offset 0x68
    uint64 a1;  // Offset 0x70
    uint64 a2;  // Offset 0x78
    uint64 a3;  // Offset 0x80
    uint64 a4;  // Offset 0x88
    uint64 a5;  // Offset 0x90
    uint64 a6;  // Offset 0x98
    uint64 a7;  // Offset 0xA0

    uint64 t0;  // Offset 0xA8
    uint64 t1;  // Offset 0xB0
    uint64 t2;  // Offset 0xB8
    uint64 t3;  // Offset 0xC0
    uint64 t4;  // Offset 0xC8
    uint64 t5;  // Offset 0xD0
    uint64 t6;  // Offset 0xD8

    uint64 gp;  // Offset 0xE0
    uint64 tp;  // Offset 0xE8
    uint64 sp;  // Offset 0xF0
} Context;



void handleSystemCall(Context* context) {
	// read the syscall id from a0 and based on it call the correct kernel function
	SyscallId syscall_id = static_cast<SyscallId>(context->a0);
	uint64 result = 0;

	switch (syscall_id) {
		case MEM_ALLOC: {
			size_t arg1 = static_cast<size_t>(context->a1);
			result = (uint64)MemoryAllocator::Instance()->kmemAlloc(arg1);
			break;
		}
		case MEM_FREE: {
			void* arg1 = reinterpret_cast<void*>(context->a1);
			result = (uint64)MemoryAllocator::Instance()->kmemFree(arg1);
			break;
		}
		 default:
		 	result = -1;
		 	break; // wrong syscall id
	}
	context->a0 = result;

}
extern "C" void handleSupervisorTrap(Context* context) {
	uint64 scauseVal;
	__asm__ volatile ("csrr %0, scause" : "=r" (scauseVal));
	// user system calls
	if (scauseVal ==  (0x08UL)) {
		// set correct returning address to avoid infinite loop
		uint64 sepcVal;
		__asm__ volatile ("csrr %0, sepc" : "=r" (sepcVal));
		sepcVal += 4; // 4 is the length of ecall instruction
		__asm__ volatile ("csrw sepc, %0" : : "r" (sepcVal));
		// read the registers
		handleSystemCall(context);
		__putc('H');
		__putc('i');
		__putc(' ');
		__putc('m');
		__putc('y');
		__putc(' ');
		__putc('u');
		__putc('s');
		__putc('e');
		__putc('r');
		__putc('\n');


		__asm__ volatile ("csrc sip, 0x02");
	}
	if (scauseVal == (0x01UL << 63 | 0x01)){
		__asm__ volatile ("csrc sip, 0x02");
	}
	if (scauseVal == (0x01UL << 63 | 0x09)) {
		console_handler();
	}
}
void countReturnAddress() {
	__putc('\n');
}
*/


void main() {
	/*
	uint64 raVal;
	__asm__ volatile ("csrw stvec, %[trapHandlerAddr]" : : [trapHandlerAddr] "r" (&supervisorTrap));


	__asm__ volatile ("csrw sepc, %[userMainAddr]" : : [userMainAddr] "r" (&userMain));
	countReturnAddress();
	__asm__ volatile ("mv %0, ra" : "=r" (raVal));
	raVal += 16;
	__asm__ volatile ("mv ra, %0" : : "r" (raVal));
	__asm__ volatile ("sret");


	TCB* threads[5];
	threads[0] = TCB::createThread(nullptr);
	TCB::running = threads[0];

	threads[1] = TCB::createThread(workerBodyA);
	printString("Thread A created\n");

	threads[2] = TCB::createThread(workerBodyB);
	printString("Thread B created\n");

	threads[3] = TCB::createThread(workerBodyC);
	printString("Thread C created\n");

	threads[4] = TCB::createThread(workerBodyD);
	printString("Thread D created\n");

	Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

	while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
			threads[3]->isFinished() && threads[4]->isFinished())) {

		TCB::yield();
	}

	for (auto thread :  threads) {
		delete thread;
	}
	*/
	Riscv::w_stvec((uint64) &Riscv::supervisorTrap);



	size_t size = MemoryAllocator::bytesToBlocksCeil(DEFAULT_STACK_SIZE);
	//void* stack = MemoryAllocator::Instance()->kmemAlloc(size);
	void* stack = MemoryAllocator::Instance()->kmemAlloc(size);
	void* stack_pointer = (char*)stack + DEFAULT_STACK_SIZE;

	TCB* threads[2];
	threads[0] = TCB::createThread(nullptr, 0);
	TCB::running = threads[0];

	threads[1] = TCB::createThread(&userMain, (uint64)stack_pointer);

	//while(!(threads[1]->isFinished()))
	//{
		printString("Yield from kernel main\n");
		TCB::yield();
	//}




}