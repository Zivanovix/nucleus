
#include "../h/syscall_c.hpp"
#include "../h/print.hpp"
#define MAX_ARG_COUNT 7


#ifdef __cplusplus
extern "C" {
#endif

uint64 trigger_syscall(SyscallId id, uint64 args[], uint8 argc) {

	if (argc < 0 || argc > MAX_ARG_COUNT) return -2;

	uint64 local_args[MAX_ARG_COUNT];
	uint64 ret_val;


	for (uint64 i = 0; i < argc; i++) {
		local_args[i] = args[i];
	}

	asm volatile (
		"mv a0, %1\n\t"          // syscall ID u a0
		"mv a1, %2\n\t"          // arg0 u a1
		"mv a2, %3\n\t"          // arg1 u a2
		"mv a3, %4\n\t"          // arg2 u a3
		"mv a4, %5\n\t"          // arg3 u a4
		"mv a5, %6\n\t"          // arg4 u a5
		"mv a6, %7\n\t"          // arg5 u a6
		"mv a7, %8\n\t"          // arg6 u a7
		"ecall\n\t"              // sistemski poziv
		"mv %0, a0"              // povratna vrednost iz a0
		: "=r" (ret_val)         // output
		: "r" (id),              // %1
		  "r" (argc >= 1 ? local_args[0] : 0),  // %2
		  "r" (argc >= 2 ? local_args[1] : 0),  // %3
		  "r" (argc >= 3 ? local_args[2] : 0),  // %4
		  "r" (argc >= 4 ? local_args[3] : 0),  // %5
		  "r" (argc >= 5 ? local_args[4] : 0),  // %6
		  "r" (argc >= 6 ? local_args[5] : 0),  // %7
		  "r" (argc >= 7 ? local_args[6] : 0)   // %8
		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7"  // clobbered registers
	);

	return ret_val;
}


/*
uint64 trigger_syscall(SyscallId id, uint64 args[], uint8 argc) {

	//printInteger(id);
	if (argc < 0 || argc > MAX_ARG_COUNT) return -2; // wrong number of args
	//printInteger(args[1]);
	// put syscall_id in a0 - it should already be there
	__asm__ volatile ("mv a0, %0" : : "r"(id));
	// put parsedArgs[i-1] into register ai
	if (argc == 7) __asm__ volatile ("mv a7, %0" : : "r"(args[6]));
	if (argc >= 6) __asm__ volatile ("mv a6, %0" : : "r"(args[5]));
	if (argc >= 5) __asm__ volatile ("mv a5, %0" : : "r"(args[4]));
	if (argc >= 4) __asm__ volatile ("mv a4, %0" : : "r"(args[3]));
	if (argc >= 3) __asm__ volatile ("mv a3, %0" : : "r"(args[2]));
	if (argc >= 2) __asm__ volatile ("mv a2, %0" : : "r"(args[1]));
	if (argc >= 1) __asm__ volatile ("mv a1, %0" : : "r"(args[0]));

	__asm__ volatile ("ecall");

	// The value returned from system call is stored in a0
    uint64 ret_val;
    __asm__ volatile ("mv %0, a0" : "=r"(ret_val));

    return ret_val;
}
*/

void* mem_alloc(size_t size) {
	uint64 args[1];
	size_t size_in_blocks = (size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
	args[0] = (uint64)size_in_blocks;
	return (void*)trigger_syscall(MEM_ALLOC, args, 1);
}

int mem_free(void* addr) {
	uint64 args[1];
	args[0] = (uint64)addr;
	return (int)(long)trigger_syscall(MEM_FREE, args, 1);
}

size_t mem_get_free_space() {

	return trigger_syscall(GET_LARGEST_FREE_BLOCK, 0, 0);
}

size_t mem_get_largest_free_block() {
	return trigger_syscall(GET_FREE_SPACE, 0, 0);
}

int thread_create(thread_t* handle, void (*start_routine)(void*), void* arg) {

	uint64 args[4];

	void* stack = mem_alloc(DEFAULT_STACK_SIZE) ;

	if (!stack) return -1; // unable to allocate stack

	void* thread_stack_pointer = (char*)stack + DEFAULT_STACK_SIZE; // point to the last (biggest) address in allocated stack

	args[0] = (uint64)handle;
	args[1] = (uint64)start_routine;
	args[2] = (uint64)arg;
	args[3] = (uint64)thread_stack_pointer;

	return (int)(long)trigger_syscall(THREAD_CREATE, args, 4);
}

void thread_dispatch() {
	trigger_syscall(THREAD_DISPATCH, 0, 0);
}

int thread_exit() {
	return (int)(long)trigger_syscall(THREAD_EXIT, 0, 0);
}

int sem_open(sem_t* handle, unsigned init) {
	uint64 args[2];
	args[0] = (uint64)handle;
	args[1] = (uint64)init;

	return (int)(long)trigger_syscall(SEM_OPEN, args, 2);
}

int sem_close(sem_t handle) {
	uint64 args[1];
	args[0] = (uint64)handle;

	return (int)(long)trigger_syscall(SEM_CLOSE, args, 1);
}

int sem_wait(sem_t id) {
	uint64 args[1];
	args[0] = (uint64)id;

	return (int)(long)trigger_syscall(SEM_WAIT, args, 1);
}

int sem_signal(sem_t id) {
	uint64 args[1];
	args[0] = (uint64)id;

	return (int)(long)trigger_syscall(SEM_SIGNAL, args, 1);
}

#ifdef __cplusplus
}
#endif