//
// Created by os on 9/9/25.
//

#ifndef SEMAPHORE_HPP
#define SEMAPHORE_HPP

#include "list.hpp"
#include "../lib/hw.h"

class TCB;

class Semaphore {

public:
	Semaphore (uint32 initVal = 1) : val(initVal), blockedThreadsQueue(){}
	int signal();
	int wait();

	int value() const { return val; }
	void unblockAll();

protected:
	void block();
	int unblock();
private:
	int val;
	List<TCB> blockedThreadsQueue;


};


#endif