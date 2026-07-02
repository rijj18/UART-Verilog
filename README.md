# UART-Verilog
UART Transmitter and Receiver implemented in Verilog HDL with configurable baud rate, FSM-based control logic, simulation, and FPGA implementation using Xilinx Vivado.
# UART Transmitter and Receiver using Verilog HDL

A hardware implementation of a **Universal Asynchronous Receiver Transmitter (UART)** using **Verilog HDL**. The project implements UART transmission and reception with a configurable baud-rate generator, finite state machine (FSM) based control logic, and functional verification using **Xilinx Vivado**.

---

## Features

- UART Transmitter (TX)
- UART Receiver (RX)
- Configurable Baud Rate Generator
- FSM-Based Control Logic
- Modular RTL Design
- Functional Simulation
- Waveform Verification
- Parameterized Design

---

## Tools & Technologies

- Verilog HDL
- Xilinx Vivado
- RTL Design
- Finite State Machines (FSM)
- Digital Logic Design

---

## Repository Structure

```
UART-Verilog/
│
├── src/
│   ├── uart_tx.v
│   ├── uart_rx.v
│   ├── baud_generator.v
│   ├── top.v
│
├── testbench/
│   └── uart_tb.v
│
├── constraints/
│   └── uart.xdc
│
├── simulation/
│   ├── uart_waveform.png
│   └── simulation_results.png
│
├── docs/
│   ├── uart_block_diagram.png
│   └── uart_fsm.png
│
├── README.md
└── LICENSE
```

---

## UART Frame Format

```
+-----------+----------------+-----------+
| Start Bit | 8 Data Bits    | Stop Bit  |
+-----------+----------------+-----------+
|     0     |    D0 ... D7   |     1     |
```

- **Data Bits:** 8
- **Parity:** None
- **Stop Bits:** 1
- **Communication:** Asynchronous

---

## Design Overview

The design consists of the following modules:

### UART Transmitter

- Loads 8-bit parallel data
- Generates Start Bit
- Serially transmits data bits
- Generates Stop Bit
- Indicates transmission complete

### UART Receiver

- Detects Start Bit
- Samples incoming serial data
- Reconstructs the received byte
- Detects Stop Bit
- Generates receive complete signal

### Baud Rate Generator

- Generates baud clock from the system clock
- Configurable using Verilog parameters

---

## Simulation

The design has been verified using **Xilinx Vivado**.

Simulation verifies:

- UART Transmission
- UART Reception
- Start Bit Detection
- Stop Bit Detection
- Correct Data Transfer
- Baud Rate Timing

> Add your waveform screenshots inside the **simulation/** folder.

---

## Skills Demonstrated

- Verilog HDL
- RTL Design
- FPGA Design
- Digital Logic Design
- Finite State Machines (FSM)
- UART Communication Protocol
- Functional Verification
- Testbench Development
- Waveform Analysis
- Xilinx Vivado

---

## Future Improvements

- UART with Parity Bit
- FIFO Buffer Support
- Configurable Data Length
- Interrupt Support
- FPGA Hardware Validation
- SystemVerilog Testbench

---

## Related Projects

- 🚀 [FPGA Digital System Design](https://github.com/rijj18/FPGA-Digital-System-Design)
- 🔐 [FPGA Secure Communication](https://github.com/rijj18/FPGA-Secure-Communication)
- 🚦 [Traffic Light Controller](https://github.com/rijj18/Traffic-Light-Controller-Verilog)
- 🤖 [Customer Segmentation using Machine Learning](https://github.com/rijj18/Customer-Segmentation-ML)

---

## Author

**Rijul Sharma**

B.E. Electronics and Communication Engineering

Thapar Institute of Engineering & Technology

- GitHub: https://github.com/rijj18
- LinkedIn: https://www.linkedin.com/in/rijul-sharma-a46224322/

---

## License

This project is licensed under the **MIT License**.
