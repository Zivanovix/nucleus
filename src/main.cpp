#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/MemoryAllocator.hpp"

struct Point {
	int x, y;
};
void main()   {
	int a = 5;
	Point* b = (Point*)MemoryAllocator::Instance()->kmemAlloc(4);
	b->x = 2;
	b->y = 7;

	__putc(b->x + b->y + 48);
	__putc('\n');
	__putc(a);

	if(MemoryAllocator::Instance()->kmemFree(b) == 0)


		__putc('a');

	b->x = 2;
	b->y = 7;
}