# RISC-V Single-Cycle Harvard Architecture Processor Using Verilog HDL

## Overview

This project presents the design and implementation of a **32-bit Single-Cycle RISC-V Processor** based on the **Harvard Architecture** using **Verilog HDL**. The processor was developed as a hardware implementation project to demonstrate the fundamental concepts of computer architecture, datapath design, and digital system verification.

The processor executes each instruction in a single clock cycle while maintaining separate instruction and data memories to improve memory access efficiency. The implementation follows the basic RISC-V ISA principles and supports arithmetic, logical, branching, and memory access operations.

---

# Features

* 32-bit RISC-V processor implementation
* Single-cycle datapath architecture
* Harvard architecture design
* Separate instruction and data memories
* Verilog HDL implementation
* Arithmetic and logical instruction support
* Branch and jump instruction support
* Load and store memory operations
* Register file implementation
* ALU and control unit design
* Fully simulated and verified using ModelSim
* Fibonacci sequence validation program

---

# Architecture

## Harvard Architecture

The processor uses a **Harvard Architecture**, where:

* Instruction Memory stores program instructions.
* Data Memory stores runtime data.
* Both memories are accessed independently.

This separation removes memory access conflicts and improves execution efficiency compared to Von Neumann architectures.

---

# Processor Components

## 1. Program Counter (PC)

The Program Counter stores the address of the current instruction and updates every clock cycle.

### Responsibilities

* Fetch next instruction address
* Handle branching and jumps
* Increment PC by 4 for sequential execution

---

## 2. Instruction Memory

Stores machine instructions that are fetched using the PC address.

### Functions

* Provides instruction to datapath
* Supports instruction decoding
* Separate from data memory

---

## 3. Control Unit

The Control Unit generates all required control signals based on the instruction opcode and function fields.

### Generated Signals

* RegWrite
* MemWrite
* MemRead
* ALUSrc
* Branch
* ResultSrc
* PCSrc
* ALUControl

---

## 4. Register File

The register file contains general-purpose registers used during instruction execution.

### Capabilities

* Two simultaneous read ports
* One write port
* 32 registers
* 32-bit data width

---

## 5. Arithmetic Logic Unit (ALU)

The ALU performs arithmetic and logical operations.

### Supported Operations

* Addition
* Subtraction
* AND
* OR
* XOR
* Comparison operations
* Shift operations

---

## 6. Immediate Generator

Extracts and sign-extends immediate values from instruction fields.

### Supported Immediate Types

* I-Type
* S-Type
* B-Type
* J-Type

---

## 7. Data Memory

Stores runtime data used in load/store instructions.

### Supported Operations

* Load Word (LW)
* Store Word (SW)

---

# Datapath Design

The datapath integrates all processor components to execute instructions in one clock cycle.

## Execution Stages

Even though the processor is single-cycle, the logical stages include:

1. Instruction Fetch
2. Instruction Decode
3. Execute
4. Memory Access
5. Write Back

All stages are completed within a single clock pulse.

---

# Supported Instructions

## Arithmetic Instructions

* ADD
* SUB
* ADDI

## Logical Instructions

* AND
* OR
* XOR

## Memory Instructions

* LW
* SW

## Branch Instructions

* BEQ
* BNE

## Jump Instructions

* JAL

---

# Verilog HDL Implementation

The processor was fully implemented using Verilog HDL in a modular structure.

## Main Modules

* Top Module
* Datapath Module
* Control Unit
* ALU
* Register File
* Program Counter
* Immediate Generator
* Instruction Memory
* Data Memory

Each module was designed independently and later integrated into the complete processor system.

---

# Simulation and Verification

## Simulation Tool

* ModelSim

## Verification Process

The processor was tested using several assembly programs to validate:

* Correct instruction execution
* Proper ALU operations
* Register write-back
* Memory access correctness
* Branching functionality
* Datapath signal behavior

---

# Fibonacci Sequence Test

A Fibonacci sequence generation program was executed to validate the processor functionality.

## Validation Results

* Correct memory outputs achieved
* Accurate register updates verified
* Proper branch execution confirmed
* Simulation completed successfully

Waveform analysis and ModelSim transcripts confirmed that the datapath and control logic behaved as expected.

---

# Waveform Analysis

Simulation waveforms were used to monitor:

* Clock signals
* Reset behavior
* Instruction execution
* ALU results
* Register values
* Memory writes
* Branch control signals

The final simulation state demonstrated 100% datapath and control unit accuracy.

---

# Project Objectives

The project aimed to:

* Understand processor architecture design
* Implement a RISC-V CPU using Verilog HDL
* Learn datapath and control unit integration
* Apply digital design principles
* Perform hardware verification using simulation tools

---
