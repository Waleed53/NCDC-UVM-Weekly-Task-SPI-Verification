# NCDC UVM Module — Weekly Task: SPI Verification

## Course
**NCDC Cohort 02/2025 — Design Verification (DV)**
NUST Chip Design Centre (NCDC), NUST

## Module
**Universal Verification Methodology (UVM) Module** — Weekly Task

---

## Overview

This project builds a complete **UVM-based verification environment** for a real open-source **SPI controller** (`simple_spi_top.v`). The environment uses the Universal Verification Methodology (UVM) to generate constrained-random stimulus, drive it into the DUT, monitor outputs, and check correctness using a scoreboard. A FIFO (`fifo4.v`) is also included as part of the DUT's internal buffering mechanism.

---

## Design Under Test (DUT)

| File | Description |
|------|-------------|
| `simple_spi_top.v` | Open-source SPI master controller with Wishbone bus interface |
| `fifo4.v` | 4-entry synchronous FIFO used internally by the SPI controller |
| `SPI_Module_Design_Specifications.pdf` | Full specification document for the SPI module |

---

## UVM Verification Environment Architecture

```
uvm_test
  └── uvm_env (spi_environment)
        ├── spi_agent
        │     ├── spi_sequencer    # Manages sequence execution
        │     ├── spi_driver       # Drives transactions onto DUT interface
        │     └── spi_monitor      # Observes DUT outputs non-intrusively
        ├── scoreboard             # Checks actual vs. expected outputs
        └── coverage_collector     # Functional coverage model
```

---

## Repository Structure

```
SPI_Verification/SPI_Verification/
├── simple_spi_top.v                    # DUT — SPI master controller (Wishbone interface)
├── fifo4.v                             # DUT — internal 4-entry FIFO
├── SPI_Module_Design_Specifications.pdf
└── verification/
    ├── spi_heir1.png                   # UVM hierarchy diagram
    ├── pkts_spi_wb123.png              # Waveform — Wishbone/SPI transactions 1-3
    ├── pkts_spi_wb45.png               # Waveform — Wishbone/SPI transactions 4-5
    ├── spi_sv/
    │   ├── spi_pkg.sv                  # UVM package — imports all components
    │   ├── spi_transaction.sv          # UVM sequence_item — defines a single SPI transfer
    │   ├── spi_sequencer.sv            # UVM sequencer — arbitrates sequence execution
    │   ├── spi_seqs.sv                 # UVM sequences — constrained-random test scenarios
    │   ├── spi_driver.sv               # UVM driver — converts transactions to pin-level stimulus
    │   ├── spi_monitor.sv              # UVM monitor — captures and broadcasts DUT activity
    │   ├── spi_agent.sv                # UVM agent — bundles driver, monitor, sequencer
    │   └── spi_environment.sv          # UVM environment — top-level verification container
    └── tb/
        ├── spi_tb.sv                   # Top-level testbench — instantiates DUT + UVM test
        ├── spi_if.sv                   # SystemVerilog interface — DUT-to-TB signal bundle
        ├── spi_test.sv                 # UVM test class — selects sequences to run
        └── cshrc                       # Shell setup script for simulation tools
```

---

## Verification Features

- **Constrained Random Stimulus:** UVM sequences generate random SPI transactions with configurable data width, mode, and transfer count.
- **Protocol Checking:** The monitor passively observes the SPI signals and reconstructs transactions, which are forwarded to a scoreboard for comparison.
- **Functional Coverage:** Coverage groups track SPI modes (CPOL/CPHA), data patterns, and transaction counts.
- **Wishbone Interface:** The DUT uses a Wishbone bus interface; the driver handles register-level programming of the SPI controller.

---

## How to Simulate

```bash
# Using QuestaSim / ModelSim
cd verification/tb
vlog ../spi_sv/*.sv *.sv ../../*.v
vsim spi_tb -do "run -all; quit"

# Using Xcelium (Cadence)
xrun -sv ../spi_sv/*.sv *.sv ../../*.v -top spi_tb
```

---

## Concepts Demonstrated
- Full UVM testbench architecture (transaction, sequence, sequencer, driver, monitor, agent, environment, test)
- Constrained random verification using `uvm_sequence_item` and ``randomize()``
- Interface-based DUT connection using SystemVerilog virtual interfaces
- Functional coverage collection with `covergroup` and `coverpoint`
- Wishbone bus protocol register access for peripheral configuration
