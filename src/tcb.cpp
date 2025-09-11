//
// Created by os on 9/6/25.
//

#include "../h/tcb.hpp"
#include "../h/syscall_c.hpp"
#include "../h/print.hpp"


TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB* TCB::createThread(Body body, uint64 sp, void* arg, PrivilegeLevel mode) {
	return new TCB(body, sp, arg, mode);
}


TCB::TCB (Body body, uint64 sp, void* arg, PrivilegeLevel mode) : body(body), arg(arg),
										stackBound(body ? sp - DEFAULT_STACK_SIZE : 0),
										timeSlice(DEFAULT_TIME_SLICE),
										context({
											(uint64) &threadWrapper,
											sp
										}), status(ThreadStatus::READY), runMode(mode)
{
	if (body) Scheduler::put(this);
}

void TCB::dispatch() {
	TCB* old = running;
	timeSliceCounter = 0;


	if(!old->isFinished() && old->body)
		Scheduler::put(old);

	running = Scheduler::get();

	if(old->getRunMode() == PrivilegeLevel::SUPERVISOR) {
		Riscv::pushRegisters();
	}

	TCB::contextSwitch(&old->context, &running->context);

	if(running->getRunMode() == PrivilegeLevel::SUPERVISOR) {
		Riscv::popRegisters();
	}

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
	void* par = running->arg;
	Riscv::popSppSpie();
	running->body(par);
	running->setFinished();
	thread_dispatch(); // yield ili sistemski poziv

}

