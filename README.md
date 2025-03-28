# Register File 

This repository contains  VHDL files for implementing Register Files. The testbench simulates reading and writing operations in the register file.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Simulation Process](#simulation-process)
- [Getting Started](#getting-started)
- [License](#license)

# Overview
The testbench is designed to validate the functionality of a **Register File**, which stores and retrieves data from registers based on control signals. The simulation includes:
- Writing values to registers.
- Reading values from different registers.
- A clock signal for sequential operation.

## Features
- Implements **register read and write operations**.
- Uses **clock-driven simulation**.
- Tests multiple register addresses and values.

## Project Structure
```
├── registerFile.vhd           # Register File module
├── registerFile_Testbench.vhd # Testbench for Register File
├── README.md                  # Documentation
├── Screenshots                #Photos of Code and simulations
```

## Simulation Process
1. **Clock Signal Generation**
   - The testbench generates a clock signal with a 2 ns period.
2. **Write Operations**
   - Data is written to registers when `write_enable` is **high**.
3. **Read Operations**
   - Data is read from registers and verified.
4. **Disabling Write Operations**
   - `write_enable` is set to **low**, ensuring registers retain values.

## Getting Started
### Prerequisites
- VHDL Simulator (e.g., **ModelSim**, **Xilinx Vivado**, **Quartus**).

### Running the Testbench
1. Open your VHDL simulation tool.
2. Load `registerFile_Testbench.vhd` and `registerFile.vhd`.
3. Compile and simulate the testbench.
4. Observe register operations in the waveform viewer.

## License
This project is open-source and available under the **MIT License**.

