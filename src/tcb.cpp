//
// Created by os on 9/6/25.
//

#include "../h/tcb.hpp"
#include "../h/syscall_c.hpp"
#include "../h/print.hpp"


TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB* TCB::createThread(Body body, uint64 sp) {
	return new TCB(body, sp);
}

void TCB::dispatch() {
	TCB* old = running;
	timeSliceCounter = 0;


	if(!old->isFinished() && old->body)
		Scheduler::put(old);

	running = Scheduler::get();

	TCB::contextSwitch(&old->context, &running->context);

}

void TCB::yield(){
	//__asm__ volatile("ecall");
	Riscv::pushRegisters();
	uint64 sepc = Riscv::r_sepc();
	uint64 sstatus = Riscv::r_sstatus();

	dispatch();

	Riscv::w_sstatus(sstatus);
	Riscv::w_sepc(sepc);
	Riscv::popRegisters();

}

void TCB::threadWrapper() {
	Riscv::popSppSpie();
	running->body();
	running->setFinished();
	thread_dispatch(); // yield ili sistemski poziv

}

