#include "../h/MemoryAllocator.hpp"
#include "../lib/mem.h"

void* operator new (uint64 n){

	return MemoryAllocator::Instance()->kmemAlloc(n);
	//return __mem_alloc(n);
}

void* operator new[] (uint64 n){

	return MemoryAllocator::Instance()->kmemAlloc(n);
	//return __mem_alloc(n);
}


void operator delete (void* p) noexcept {

	MemoryAllocator::Instance()->kmemFree(p);
	//__mem_free(p);
}


void operator delete[] (void* p) noexcept {

	MemoryAllocator::Instance()->kmemFree(p);
	//__mem_free(p);
}