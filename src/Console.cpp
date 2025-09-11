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

// This will be run as the consumer kernel thread for wbuff
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


/*extern const uint64 CONSOLE_STATUS;
extern const uint64 CONSOLE_TX_DATA;
extern const uint64 CONSOLE_RX_DATA;

static const uint64 CONSOLE_IRQ = 10;
static const uint64 CONSOLE_TX_STATUS_BIT = 1 << 5;
static const uint64 CONSOLE_RX_STATUS_BIT = 1;*/