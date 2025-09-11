//
// Created by os on 9/10/25.
//

#ifndef CONSOLE_HPP
#define CONSOLE_HPP

#include "BoundedBuffer.hpp"

class  Console {

public:
	static Console* Instance();

	void putc(char c);
	char getc();

	static void writeToController(void*);


protected:
	Console(){}

private:
	BoundedBuffer wBuff;
	BoundedBuffer rBuff;


};

#endif //PROJECT_BASE_CONSOLE_HPP