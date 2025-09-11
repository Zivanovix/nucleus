//
// Created by os on 9/10/25.
//

#include "../h/BoundedBuffer.hpp"


BoundedBuffer::BoundedBuffer() : spaceAvailable(N), itemAvailable(0), head(0), tail(0) {}

void BoundedBuffer::append(char c) {
	// producer thread will wait here if the buffer is full
	spaceAvailable.wait();

	buffer[tail] = c;
	tail = (tail + 1) % N;

	// unblock consumer thread if buffer was empty and there were threads waiting
	itemAvailable.signal();
}

char BoundedBuffer::pop() {
	// consumer thread will wait here if the buffer is full
	itemAvailable.wait();

	char c = buffer[head];
	head = (head + 1) % N;

	// unblock producer thread if it was waiting for free place in buffer
	spaceAvailable.signal();

	return c;
}