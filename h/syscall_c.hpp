

#ifndef PROJECT_BASE_SYSCALL_C_H
#define PROJECT_BASE_SYSCALL_C_H
#include "../lib/hw.h"

#ifdef __cplusplus
extern "C" {
#endif

class TCB;
typedef TCB* thread_t;

class Semaphore;
typedef Semaphore* sem_t;

const int EOF = -1;

typedef enum {
	MEM_ALLOC = 0X01,
	MEM_FREE = 0X02UL,
	GET_FREE_SPACE = 0x03,
	GET_LARGEST_FREE_BLOCK = 0x04,
	THREAD_CREATE = 0x11,
	THREAD_EXIT = 0X12,
	THREAD_DISPATCH = 0x13,
	SEM_OPEN = 0x21,
	SEM_CLOSE = 0X22,
	SEM_WAIT = 0X23,
	SEM_SIGNAL = 0X24,
	GETC = 0X41,
	PUTC = 0x42
} SyscallId;

uint64 trigger_syscall(SyscallId id, uint64* args, uint8 argc) ;

void* mem_alloc(size_t size);
int mem_free(void*);
size_t mem_get_free_space();
size_t mem_get_largest_free_block();

int thread_create(thread_t* handle, void (*start_routine)(void*), void* arg);
void thread_dispatch();
int thread_exit();

int sem_open(sem_t* handle, unsigned init);
int sem_close(sem_t handle);
int sem_wait(sem_t id);
int sem_signal(sem_t id);

void putc(char c);

#ifdef __cplusplus
}
#endif

#endif //PROJECT_BASE_SYSCALL_C_H

