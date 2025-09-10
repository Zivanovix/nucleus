//
// Created by os on 9/6/25.
//

#include "../h/riscv.hpp"
#include "../lib/console.h"
#include "../h/tcb.hpp"
#include "../h/print.hpp"
#include "../h/syscall_c.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/semaphore.hpp"

void Riscv::popSppSpie(){
	//mc_sie(SIP_SSIP);
	__asm__ volatile("csrw sepc, ra");
	__asm__ volatile("sret");

}

void Riscv::handleSupervisorTrap(Context* context) {

	uint64 scause = r_scause();

	if (scause == 0x09UL) {
	// ecall from S mode
		uint64 sepc = r_sepc() + 4;
		uint64 sstatus = r_sstatus();

		TCB::dispatch();

		w_sstatus(sstatus);
		w_sepc(sepc);

	}
	else if (scause == 0x08UL) {
	// ecall from U mode
		uint64 sepc = r_sepc() + 4;
		uint64 sstatus = r_sstatus();

		handleSystemCalls(context);

		w_sstatus(sstatus);
		w_sepc(sepc);
	}
	else if (scause == (0x01UL << 63 | 0x01)) {
	// timer interrupt
		TCB::timeSliceCounter++;
		if(TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
			uint64 sepc = r_sepc();
			uint64 sstatus = r_sstatus();

			TCB::dispatch();

			w_sstatus(sstatus);
			w_sepc(sepc);
		}
		mc_sip(SIP_SSIP);

	}
	else if (scause == (0x01UL << 63 | 0x09)) {
	 // external hardware interrupt (console)
		console_handler();

	}
	else{
	// other
		printString("Unhandled reason for jump in trap handler\nReason: ");
		printInteger(scause);
		printString("\n");
	}

}

void Riscv::handleSystemCalls(Context* context) {
	// read the syscall id from a0(x10) and based on it call the correct kernel function
	SyscallId syscall_id = static_cast<SyscallId>(context->x[10]);
	uint64 result = 0;

	switch (syscall_id) {
		case MEM_ALLOC: {
			size_t arg1 = static_cast<size_t>(context->x[11]); // x11 = a1
			result = reinterpret_cast<uint64>(MemoryAllocator::Instance()->kmemAlloc(arg1));
			break;
		}
		case MEM_FREE: {
			void* arg1 = reinterpret_cast<void*>(context->x[11]);
			// convert int to uint64
			result = static_cast<uint64>(static_cast<long>(MemoryAllocator::Instance()->kmemFree(arg1)));
			break;
		}
		case GET_LARGEST_FREE_BLOCK: {
			result = MemoryAllocator::Instance()->kgetLargestFreeBlock();
			break;
		}
		case GET_FREE_SPACE: {
			result = MemoryAllocator::Instance()->kgetFreeSpace();
			break;
		}
		case THREAD_CREATE: {
			TCB** handle = reinterpret_cast<TCB**>(context->x[11]);
			void (*startRoutine)() = reinterpret_cast<void (*)()>(context->x[12]);
			//void* arg = reinterpret_cast<void*>(context->x[13]);
			uint64 threadSp = context->x[14];

			TCB* thread = TCB::createThread(startRoutine, threadSp);
			// ako se ne uspe sa alokacijom objekta jezgra digni gresku!
			if (handle && thread)
				*handle = thread;
			else
				result = -1; // cannot allocate thread or invalid handle

			break;
		}
		case THREAD_DISPATCH: {

			TCB::dispatch();

			break;
		}
		case THREAD_EXIT: {
			TCB::running->setFinished();
			TCB::dispatch();
			break;
		}
		case SEM_OPEN: {
			Semaphore** handle = reinterpret_cast<Semaphore**>(context->x[11]);
			uint32 init = static_cast<uint32>(context->x[12]);

			Semaphore* sem = new Semaphore(init);

			if (handle && sem)
				*handle = sem;
			else
				result = -1; // cannot allocate thread or invalid handle

			break;
		}
		case SEM_CLOSE: {
			Semaphore* semHandle = reinterpret_cast<Semaphore*>(context->x[11]);
			semHandle->unblockAll();
			int deallocStatus = MemoryAllocator::Instance()->kmemFree(semHandle);
			if (deallocStatus < 0) result = -1; // Cannot deallocate semaphore given by the handle

			break;
		}
		case SEM_WAIT: {
			Semaphore* semHandle = reinterpret_cast<Semaphore*>(context->x[11]);
			result = semHandle->wait();
			break;
		}
		case SEM_SIGNAL: {
			Semaphore* semHandle = reinterpret_cast<Semaphore*>(context->x[11]);
			result = semHandle->signal();
			break;
		}
		default: {
			result = -1;
			break; // wrong syscall id
		}
	}

	context->x[10] = result;


}
