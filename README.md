# RISC-V Multithreaded Kernel Project

This project aims to implement a small yet fully functional, multithreaded operating system kernel with time-sharing capabilities. This document provides an overview of the kernel's design, features, and implementation details.

## Project Goal

The primary goal is to realize a "library-like" kernel, meaning the user program (application) and the kernel share the same address space. They are statically linked into a single executable program, pre-loaded into the computer's operating memory. This configuration is typical for embedded systems, where the combined program (application + OS) is built into the target hardware rather than running arbitrary user-loaded programs.

## Key Features

The kernel provides the following core functionalities:

* **Memory Allocator:** Custom implementation for memory management.

* **Thread Management:** Support for lightweight processes (threads) within the application.

* **Semaphores:** Synchronization primitives for inter-thread communication.

* **Time Sharing:** Mechanisms for sharing processor time among multiple threads.

* **Asynchronous Context Switching:** Ability to switch between thread contexts.

* **Preemption:** Support for preemption on timer interrupts and keyboard interrupts.

## Architecture and Execution Environment

* **Target Architecture:** The kernel is implemented for the **RISC-V processor architecture** and a simulated "school computer" environment.

* **Implementation Language:** The kernel is developed primarily in **C++**, with assembly language used for the target processor as needed.

* **Virtual Environment:** The implemented kernel will execute within a **RISC-V processor emulator**, simulating the hardware.

* **Host System (xv6):** The combined kernel and user application run within a significantly modified `xv6` operating system, which acts as a minimalistic host. This host system is stripped of many functionalities (context switching, process scheduling, memory management, file system, disk management, etc.). Its role is limited to booting, initializing target hardware (timer, console), creating a single process with a virtual address space spanning the entire physical memory, loading the kernel+application program, and starting its execution.

* **Hardware Services:** The host system provides basic hardware services: periodic timer interrupts and console access (keyboard and screen).

* **Single Address Space:** The implemented kernel perceives its platform as a simple RISC-V computer with a unified physical address space, mirroring embedded system characteristics.

## Relationship between Kernel and User Application

* The user application (containing test cases) is provided as a set of source files and compiled/linked with the kernel's code and two static libraries: `app.lib` and `hw.lib`.

* `app.lib` contains the compiled user test program code.

* `hw.lib` contains modules for accessing the (virtual) hardware, acting as stubs that the kernel depends on.

* The main entry point for the user application's control flow must be a function named:
void userMain();

* The `main()` function (without arguments or return value) remains under the kernel's control. The kernel will perform its initialization actions and then launch a thread to execute `userMain()`.

* The entire program (kernel + application) is expected to terminate regularly once all user application threads have finished.

## Development Guidelines and Restrictions

* **From Scratch Implementation:** It is strictly forbidden to use services from the host operating system (xv6 or the underlying PC OS) related to threads, processes, semaphores, interrupts, synchronization, or inter-thread/process communication. All required concepts and functionalities must be implemented entirely from scratch.

* **No Standard Libraries:** Besides the explicitly provided `app.lib` and `hw.lib`, no other libraries, including standard C/C++ libraries (static or dynamic), are allowed, as they typically contain host OS system calls.

## Kernel Interface Layers

The kernel provides three layered interfaces to the user program, as illustrated below:

```
+------------------------------------+
| User's program (app.lib)           |
+------------------------------------+
|            C++ OO API              |
+------------------------------------+
|              C API                 |
+------------------------------------+
|              ABI                   |
+====================================+ <-- Privilege Boundary (User/System Mode)
|              Kernel                |
+------------------------------------+
|   HW access module (hw.lib)        |
+------------------------------------+
```


The task involves implementing all shaded software layers (C++ OO API, C API, ABI, and Kernel). The hardware access module (`hw.lib`) and user test program (`app.lib`) are provided as static libraries. All layers are statically linked into a single executable.

* **Privilege Levels:** Code below the thick dark line (Kernel and `hw.lib`) executes in the privileged (system) mode of the target processor, while layers above execute in unprivileged (user) mode. The kernel (and its `main` function) will initially start in system mode.

* **ABI (Application Binary Interface):**

  * This is the binary interface for system calls, performed via a software interrupt of the target processor.

  * It handles argument passing via processor registers, transitions to privileged mode, and transfers control to the kernel code.

  * System call, exception, and interrupt handling are implemented using direct mode.

* **C API (Application Programming Interface):**

  * A classic, procedural (non-object-oriented) programming interface for system calls, implemented as a set of functions.

  * These functions can wrap one, multiple, or no ABI system calls depending on their role.

* **C++ API:**

  * An object-oriented API providing an object-oriented view of the concepts supported by the kernel.

  * Implemented as a simple object-oriented wrapper around the functions from the C API layer, written in C++.

## How to Build and Run

*(Placeholder: Instructions for building the project using CLion's CMake integration and running it within the RISC-V emulator will go here.)*
