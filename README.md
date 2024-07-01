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
