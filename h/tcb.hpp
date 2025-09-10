//
// Created by os on 9/6/25.
//

#ifndef TCB_HPP
#define TCB_HPP

#include "../lib/hw.h"
#include "scheduler.hpp"
#include "riscv.hpp"

class Semaphore;

class TCB {
public:
	friend class Riscv;
	friend class Semaphore;
	using Body = void (*)();

	enum class ThreadStatus {
		READY,
		FINISHED,
		BLOCKED
	};

	static TCB* createThread(Body body, uint64 sp);
	~TCB() = default;

	static TCB* running;

	static void yield();

	uint64 getTimeSlice() const { return timeSlice; }

	bool isFinished() const { return status == ThreadStatus::FINISHED; }

	bool isBlocked() const { return status == ThreadStatus::BLOCKED; }

	bool isReady() const { return status == ThreadStatus::READY; }

	void setFinished() { status = ThreadStatus::FINISHED; }

	void setBlocked() { status = ThreadStatus::BLOCKED; }

	void setReady() { status = ThreadStatus::READY; }

private:
	TCB (Body body, uint64 sp) : body(body),
										stackBound(body ? sp - DEFAULT_STACK_SIZE : 0),
										context({
											(uint64) &threadWrapper,
											sp
										}), timeSlice(DEFAULT_TIME_SLICE),
										status(ThreadStatus::READY)
	{
		if (body) Scheduler::put(this);
	}

	struct Context {
		uint64 ra;
		uint64 sp;
	};

	Body body;
	uint64 stackBound;
	Context context;
	uint64 timeSlice;
	ThreadStatus status;


	static uint64 timeSliceCounter;

	static void threadWrapper();

	static void contextSwitch(Context* oldContext, Context* newContext);

	static void dispatch();

};



#endif