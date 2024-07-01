## RISC V Pipeline Processor

RISC-V (pronounced "risk-five") is an open-standard instruction set architecture (ISA) based on the principles of Reduced Instruction Set Computing (RISC). It was designed with simplicity and modularity in mind, making it ideal for a wide range of applications from microcontrollers to high-performance computing systems.

A pipeline processor in RISC-V architecture allows for efficient and high-speed execution of instructions by overlapping the execution of multiple instructions. This is achieved by breaking down the execution process into several stages, with each stage handling a different part of the instruction. 


## Architecture

![image](https://github.com/faatthy/RISC-V-Pipeline-Processor/assets/110846097/865941cc-bc1a-4f81-9066-eedf734383a1)

## Stages
- Fetch (IF): The instruction is fetched from memory.
- Decode (ID): The fetched instruction is decoded to determine the required operations and the involved operands.
- Execute (EX): The operation specified by the instruction is performed.
- Memory Access (MEM): Access to memory is made if required by the instruction, such as loading from or storing to memory.
- Write Back (WB): The results of the execution are written back to the register file.

## Pipeline Hazzards 
Pipeline hazards are conditions that prevent the next instruction in the instruction stream from executing during its designated clock cycle. These hazards can reduce the efficiency of the pipeline, requiring mechanisms to detect and resolve them. There are three primary types of pipeline hazards: structural hazards, data hazards, and control hazards.

1. Structural Hazards
Structural hazards occur when hardware resources are insufficient to support all the concurrent operations in the pipeline. For example, if two instructions require the use of the same hardware resource at the same time, a structural hazard arises. This can be resolved by:

Stalling: Pausing one instruction until the resource becomes available.
Resource Duplication: Adding additional hardware resources to handle multiple requests simultaneously.

2. Data hazards happen when instructions depend on the results of previous instructions. There are three types of data hazards:

- Read After Write (RAW): Occurs when an instruction needs to read a value that has not yet been written by a previous instruction
- Write After Read (WAR): Occurs when an instruction writes a value to a register that a subsequent instruction reads
- Write After Write (WAW): Occurs when two instructions write to the same register. The order of writes must be preserved

## Resolving Data Hazards
- Forwarding (Data Bypassing): Passing the result of a previous instruction directly to the next instruction that needs it, bypassing the need to write to and read from registers.
- Pipeline Stalling (Interlocks): Introducing stalls (NOPs) to delay the dependent instruction until the required data is available.
- Compiler Techniques: Reordering instructions to avoid hazards without changing the program semantics.

## Design Hazzard Unit 
![image](https://github.com/faatthy/RISC-V-Pipeline-Processor/assets/110846097/5d719c06-867c-4500-994f-095eb9185a8e)

## Instruction set 
The RISC-V ISA is a modern, open, and extensible instruction set designed to be simple and efficient. It provides a modular approach, allowing different extensions to be used for various applications, making it suitable for everything from small embedded systems to powerful supercomputers. Here is an overview of the key components and features of the RISC-V ISA:
- Arithmetic and Logical Operations:

- ADD rd, rs1, rs2 : Adds two registers.
- SUB rd, rs1, rs2 : Subtracts one register from another.
- AND rd, rs1, rs2 : Bitwise AND.
- OR rd, rs1, rs2 : Bitwise OR.
- XOR rd, rs1, rs2 : Bitwise XOR.
- SLL rd, rs1, rs2 : Logical shift left.
- SRL rd, rs1, rs2 : Logical shift right.
- SRA rd, rs1, rs2 : Arithmetic shift right.
- Memory Access:

- LW rd, offset(rs1) : Load word from memory.
- SW rs2, offset(rs1) : Store word to memory.
- Control Flow:

- BEQ rs1, rs2, offset : Branch if equal.
- BNE rs1, rs2, offset : Branch if not equal.
- JAL rd, offset : Jump and link (used for function calls).
- JALR rd, offset(rs1) : Jump and link register (used for indirect jumps).
