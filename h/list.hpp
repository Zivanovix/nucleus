#ifndef LIST_HPP
#define LIST_HPP


template<typename T>
class List {

private:
	struct Elem {
		T* data;
		Elem* next;

		Elem(T* data, Elem* next) : data(data), next(next){}
	};

	Elem* head;
	Elem* tail;

public:
	int size;
	List() : head(0), tail(0) {}

	// do not generate default copy conostructor and assigment operator
	List(const List<T>& other) = delete;
	List<T>& operator=(const List<T>& other) = delete;

	void addFirst(T* data) {
		size++;
		Elem* elem = new Elem(data, head);
		head = elem;
		if (!tail) tail = head;
	}

	void addLast(T* data) {
		size++;
		Elem* elem = new Elem(data, 0);
		if (tail) {
			tail->next = elem;
			tail = elem;

		} else {
			head = tail = elem;
		}
	}

	T* removeFirst() {
		if (!head) return 0;

		Elem* elem = head;
		head = head->next;
		if (!head) tail = 0;

		T* ret = elem->data;
		delete elem;
		size--;
		return ret;
	}

	T* peekFirst() {
		if (!head) return 0;

		return head->data;
	}

	T* removeLast() {
		if (!head) return 0;

		Elem* prev = 0;
		Elem* curr = head;
		while (curr !=  tail) {
			prev = curr;
			curr = curr->next;
		}

		Elem* elem = tail;
		if (prev) prev->next = 0;
		else head = 0;
		tail = prev;

		T* ret = elem->data;
		delete elem;
		size--;
		return ret;
	}

	T* peekLast() {

		if (!tail) return 0;
		return tail->data;
	}

};

#endif