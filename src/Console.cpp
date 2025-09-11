//
// Created by os on 9/10/25.
//

#include "../h/Console.hpp"
#include "../lib/hw.h"
#include "../h/print.hpp"

Console* Console::Instance() {
	static Console c;
	return &c;
}

// System call implementation that puts char c in wBuff
void Console::putc(char c) {
	// the producer is user thread requesting to write to console
	wBuff.append(c);
}

char Console::getc() {
	char c = rBuff.pop();
	return c;
}

// This will be run as the consumer kernel thread in S mode for wbuff
void Console::writeToController(void* cons) {
	Console* console = (Console*) cons;
	while(true){
		//printString("Najludja nit u srbijiiiiiiaaaaaaaaaaaaaa-----------");

		char c = (console->wBuff).pop();
		//printString("Najludja nit u srbijiiiiii");

		// polling until console controller is ready to receive next char

		while(!(*(uint8*)(CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT));

		*(char*)(CONSOLE_TX_DATA) = c;

	}
}

// potential run this thread when there are no others in scheduler
void Console::ghostThread(void* x) {
	// this thread is run in a U mode and can be interrupted bu the console controler
	// after console handler has finished it has to unblock the user thread waiting on input
	while(true);
}

void Console::consoleHandler() {

	while(*(uint8*)(CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT) {
		char c = *(char*)(CONSOLE_RX_DATA);
		// ovde necu sinhronizaciju jer ne smem da ugasim nit koja je prekinuta
		// nego cu samo odbaciti karaktere ili sta god
		rBuff.nonBlockingAppend(c);
	}
}




/*extern const uint64 CONSOLE_STATUS;
extern const uint64 CONSOLE_TX_DATA;
extern const uint64 CONSOLE_RX_DATA;

static const uint64 CONSOLE_IRQ = 10;
static const uint64 CONSOLE_TX_STATUS_BIT = 1 << 5;
static const uint64 CONSOLE_RX_STATUS_BIT = 1;*/