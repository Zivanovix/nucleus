#include "../lib/hw.h"
#include "../h/syscall_c.hpp"
#include "../h/print.hpp"
#include "../h/workers.hpp"
#include "../h/tcb.hpp"


typedef struct Point {
	int x,y;
}Point;
extern "C" void userMain() {
	thread_t threadHandles[4];

	thread_create(&threadHandles[0], workerBodyA, nullptr);

	thread_create(&threadHandles[1], workerBodyB, nullptr);

	thread_create(&threadHandles[2], workerBodyC, nullptr);

	thread_create(&threadHandles[3], workerBodyD, nullptr);

	while (true) {

		thread_dispatch();
	}

/*
	thread_create(&threadHandles[1], workerBodyB, nullptr);
	printString("Thread B created\n");

	thread_create(&threadHandles[2], workerBodyC, nullptr);
	printString("Thread C created\n");

	thread_create(&threadHandles[3], workerBodyD, nullptr);
	printString("Thread D created\n");



	while (true) {
		thread_dispatch();
	}
*/

}