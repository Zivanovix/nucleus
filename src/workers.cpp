//
// Created by os on 9/6/25.
//

#include "../lib/hw.h"
#include "../h/tcb.hpp"
#include "../h/print.hpp"
#include "../h/syscall_c.hpp"

sem_t mutex;


void workerBodyA(void* p) {
	int x = sem_open(&mutex, 1);
	if(x == 0)
	sem_wait(mutex);
	for (uint64 i = 0; i < 10; i++) {

		printString("A: i=");
		printInteger(i);
		printString("\n");

		for (uint64 j = 0; j < 10000; j++) {
			for (uint64 k = 0; k < 30000; k++){
				// busy wait
			}
		}
	}
	if(mutex)
	sem_signal(mutex);
	// TCB::yield()
}

void workerBodyB(void* p) {
	if(mutex)
		sem_wait(mutex);
	for (uint64 i = 0; i < 16; i++) {

		printString("B: i=");
		printInteger(i);
		printString("\n");
		for (uint64 j = 0; j < 10000; j++) {
			for (uint64 k = 0; k < 30000; k++){
				// busy wait
			}
		}
	}
	if(mutex)
	sem_signal(mutex);
	// TCB::yield()
}

static uint64 fibonacci(uint64 n) {

	if (n == 0 || n == 1)
		return n;
	if(n % 10 == 0)
		thread_dispatch();
	return fibonacci(n-1) + fibonacci(n-2);

}

void workerBodyC(void* p) {

	uint8 i = 0;
	for (; i < 3; i++) {
		printString("C: i=");
		printInteger(i);
		printString("\n");

	}

	printString("C: yield\n");
	__asm__ ("li t1, 7");

	thread_dispatch();
	uint64 t1 = 0;
	__asm__ ("mv %[t1], t1" : [t1] "=r"(t1));

	printString("C: t1=");
	printInteger(t1);
	printString("\n");

	uint64 result = fibonacci(12);
	printString("C: fibonacci=");
	printInteger(result);
	printString("\n");

	for(; i < 6; i++) {

		printString("C: i=");
		printInteger(i);
		printString("\n");
	}
	// TCB::yield()
}


void workerBodyD(void* p) {

	uint8 i = 10;
	for (; i < 13; i++) {
		printString("D: i=");
		printInteger(i);
		printString("\n");

	}

	printString("D: yield\n");
	__asm__ ("li t1, 5");

	thread_dispatch();
	uint64 t1 = 0;

	__asm__ ("mv %[t1], t1" : [t1] "=r"(t1));

	printString("D: t1=");
	printInteger(t1);
	printString("\n");

	uint64 result = fibonacci(23);
	printString("D: fibonacci=");
	printInteger(result);
	printString("\n");

	for(; i < 16; i++) {

		printString("D: i=");
		printInteger(i);
		printString("\n");
	}
	// TCB::yield()
}