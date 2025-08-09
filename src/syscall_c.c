
#include "../h/syscall_c.h"
#define MAX_ARG_COUNT 7


uint64 trigger_syscall(SyscallId id, uint64* args, uint8 argc) {
	if (argc < 0 || argc > MAX_ARG_COUNT) return -2; // wrong number of args

	// put syscall_id in a0 - it should already be there
	__asm__ volatile ("mv a0, %0" : : "r"(id));
	// put parsedArgs[i-1] into register ai
	if (argc >= 1) __asm__ volatile ("mv a1, %0" : : "r"(args[0]));
	if (argc >= 2) __asm__ volatile ("mv a2, %0" : : "r"(args[1]));
	if (argc >= 3) __asm__ volatile ("mv a3, %0" : : "r"(args[2]));
	if (argc >= 4) __asm__ volatile ("mv a4, %0" : : "r"(args[3]));
	if (argc >= 5) __asm__ volatile ("mv a5, %0" : : "r"(args[4]));
	if (argc >= 6) __asm__ volatile ("mv a6, %0" : : "r"(args[5]));
	if (argc == 7) __asm__ volatile ("mv a7, %0" : : "r"(args[6]));

	__asm__ volatile ("ecall");

	// The value returned from system call is stored in a0
    uint64 ret_val;
    __asm__ volatile ("mv %0, a0" : "=r"(ret_val));

    return ret_val;
}

void* mem_alloc(size_t size) {
	uint64 args[1], ret_val;
	size_t size_in_blocks = (size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
	args[0] = (uint64)size_in_blocks;
	trigger_syscall(MEM_ALLOC, args, 1);

    __asm__ volatile ("mv %0, a0" : "=r"(ret_val));
    return (void*)ret_val;

}
int mem_free(void* addr) {
	uint64 args[1], ret_val;
	args[0] = (uint64)addr;
	trigger_syscall(MEM_FREE, args, 1);

	__asm__ volatile ("mv %0, a0" : "=r"(ret_val));
    return (int)ret_val;
}