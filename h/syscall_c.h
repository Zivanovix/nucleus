

#ifndef PROJECT_BASE_SYSCALL_C_H
#define PROJECT_BASE_SYSCALL_C_H
#include "../lib/hw.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
	MEM_ALLOC = 0X01,
	MEM_FREE = 0X02
} SyscallId;

uint64 trigger_syscall(SyscallId id, uint64* args, uint8 argc) ;

void* mem_alloc(size_t size);
int mem_free(void*);

#ifdef __cplusplus
}
#endif

#endif //PROJECT_BASE_SYSCALL_C_H