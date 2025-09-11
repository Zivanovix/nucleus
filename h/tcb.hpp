//
// Created by os on 9/6/25.
//

#ifndef TCB_HPP
#define TCB_HPP

#include "../lib/hw.h"
#include "scheduler.hpp"
#include "riscv.hpp"
#include "semaphore.hpp"


class TCB {
public:
	friend class Riscv;
	friend class Semaphore;
	using Body = void (*)(void*);

	enum class ThreadStatus {
		READY,
		FINISHED,
		BLOCKED
	};

	enum class PrivilegeLevel {
		USER,
		SUPERVISOR
	};

	static TCB* createThread(Body body, uint64 sp, void* arg = nullptr, PrivilegeLevel mode = PrivilegeLevel::USER);
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

	PrivilegeLevel getRunMode() const { return runMode; }

protected:
	struct Context {
		uint64 ra;
		uint64 sp;
	};

	TCB (Body body, uint64 sp, void* arg = nullptr, PrivilegeLevel mode = PrivilegeLevel::USER);

	static void threadWrapper();

	static void contextSwitch(Context* oldContext, Context* newContext);

	static void dispatch();

private:

	Body body;

	void* arg;

	uint64 stackBound, timeSlice;

	Context context;

	ThreadStatus status;

	PrivilegeLevel runMode; // 0 for user mode 1 for supervisor mode

	static uint64 timeSliceCounter;


};



#endif