//
// Created by os on 9/9/25.
//
#include "../h/semaphore.hpp"
#include "../h/tcb.hpp"
#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"
#include "../h/print.hpp"


int Semaphore::signal() {
	//lock() would need it for kernel with preemption on multiprocessor system
	if(++val <= 0)
		return unblock();
	return 0;
	//unlock()
}

int Semaphore::wait() {
	//lock() would need it for kernel with preemption on multiprocessor system
	if(--val < 0) {
		block();
	}

	// thread is put in Ready Que in Scheduler due to
	//it being blocked on semaphore that is deallocate using sem_close
	if(TCB::running->isBlocked()) return -1;

	return 0;
	//unlock()
}

void Semaphore::block() {

	TCB* old = TCB::running;

	old->setBlocked();
	blockedThreadsQueue.addLast(old);

	TCB::running = Scheduler::get();
	TCB::timeSliceCounter = 0;

	if(old->getRunMode() == TCB::PrivilegeLevel::SUPERVISOR) {
		Riscv::pushRegisters();
	}

	TCB::contextSwitch(&old->context, &TCB::running->context);

	if(TCB::running->getRunMode() == TCB::PrivilegeLevel::SUPERVISOR) {
		//Riscv::popSppSpie();
		Riscv::popRegisters();
	}
}

int Semaphore::unblock() {

	TCB* unblockedThread = blockedThreadsQueue.removeFirst();
	if (unblockedThread == 0) return -1;

	unblockedThread->setReady();
	Scheduler::put(unblockedThread);

	return 0;
}

void Semaphore::unblockAll() {

	while(blockedThreadsQueue.size > 0) {
		TCB* unblockedThread = blockedThreadsQueue.removeFirst();
		Scheduler::put(unblockedThread);
	}

}