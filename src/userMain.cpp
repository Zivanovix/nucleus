#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../lib/console.h"


typedef struct Point {
	int x,y;
}Point;
extern "C" void userMain() {
// korisnicki rezim, ali su prekidi maskirani, ra nije odredjen lepo
	Point* a = (Point*)mem_alloc((size_t)sizeof(Point));
	a->x = 40;
	a->y = 8;
	/*__putc('H');
	__putc('i');
	__putc(' ');
	__putc('n');
	__putc('u');
	__putc('c');
	__putc('l');
	__putc('e');
	__putc('u');
	__putc('s');
	__putc('\n');*/

	__putc(a->x + a->y);

	int status = mem_free(a);
	if (status < 0) __putc('L');
	else {
		a = 0;
		__putc('W');
	}
}