```markdown
# FPGA Project - Custom Configurable FPGA Design

## Project Overview
This project implements a custom-configurable FPGA architecture comprising multiple modules, including logic blocks, a controller, and a routing mechanism. The architecture enables the execution of simple arithmetic and logic operations using a two-bit full adder, D flip-flops, and multiplexers for routing.

## Architecture
The FPGA design consists of the following six modules:
![image](https://github.com/user-attachments/assets/10ae6cae-5624-4f79-8b3a-48f2e1621b9e)


### 1. Two-bit Full Adder Module
- **Inputs:**
  - `A`, `B`: Two 2-bit input vectors.
  - `Cin`: Carry input.
- **Outputs:**
  - `sum`: 2-bit sum output.
  - `Cout`: Carry output.
- **Functionality:**
  - Implements a 2-bit full adder using a lookup table.
  - Processes inputs `Cin`, `A`, and `B` to compute `sum` and `Cout`.

### 2. D Flip-Flop Module
- **Inputs:**
  - `d`: 2-bit data input.
  - `clk`: Clock input.
  - `reset`: Reset signal.
- **Outputs:**
  - `q`: 2-bit output vector.
- **Functionality:**
  - Stores data on the clock edge and resets to a default value when `reset` is asserted.
  - Used to delay `sum` and `Cout` when selected by a multiplexer in the CLB module.

### 3. Controller Module
- **Inputs:**
  - `bitfile input`: 8-bit configuration data.
- **Outputs:**
  - Four sets of 2-bit control signals (`Control signal1` to `Control signal4`).
- **Functionality:**
  - Slices the 8-bit configuration data into four 2-bit control signals.
  - Controls multiplexer selection for CLBs and routing.

### 4. CLB (Configurable Logic Block) Module
- **Inputs:**
  - `clk`, `reset`
  - `In1`, `In2`: Two 2-bit inputs.
  - `Cin`: Carry input.
  - `mux_in`: Multiplexer selection signal.
- **Outputs:**
  - `out1_final`, `out2_final`: Two 2-bit outputs.
- **Functionality:**
  - Contains a two-bit full adder followed by D flip-flops.
  - Selects between direct or delayed output using a multiplexer.

### 5. Config FPGA Module
- **Inputs:**
  - Two sets of 8-bit inputs (`In1`, `In2`).
  - Four sets of 2-bit sum and carry outputs from CLBs.
  - Four control signals (`sel1` to `sel4`).
- **Outputs:**
  - `Sum`: 8-bit concatenated sum output.
  - `Cout_final`: Carry output.
- **Functionality:**
  - Routes outputs between CLBs based on control signals.
  - Uses multiplexers to determine input and carry paths.
  - Configures interconnections dynamically.

### 6. FPGA Module (Top-Level)
- **Inputs:**
  - `clk`, `reset`
  - Two 8-bit inputs (`In1`, `In2`)
  - 8-bit configuration data (`bitfile input`)
- **Outputs:**
  - `Sum`: 8-bit sum output.
  - `Cout`: Carry output.
- **Functionality:**
  - Instantiates Controller, CLBs, and Config FPGA modules.
  - Configures interconnections based on bitfile input.

## Verilog Implementation
Each module is implemented in Verilog. The `two_bit_full_adder`, `d_flip_flop`, `controller`, `clb`, `config_fpga`, and `fpga` modules work together to enable configurable arithmetic processing.

## Future Improvements
- Implementing sum routing using configurable multiplexers.
- Enhancing control logic to allow dynamic configuration updates.
- Adding support for additional arithmetic operations.

## Author
**Sadiqah Mushtaq**

## Instructor
**Dr. Arsalan Javed**

## Course
**Digital System Design - CE325**

---
This project demonstrates a simplified FPGA design with configurable logic blocks and routing mechanisms, providing insights into FPGA architecture and Verilog programming.
```
