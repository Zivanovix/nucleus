//
// Created by os on 9/6/25.
//

#include "../h/scheduler.hpp"

List<TCB> Scheduler::readyThreadQueue;
int Scheduler::size = 0;

TCB* Scheduler::get() {
	return readyThreadQueue.removeFirst();
	size--;
}

void Scheduler::put(TCB* tcb) {
	size++;
	readyThreadQueue.addLast(tcb);
}