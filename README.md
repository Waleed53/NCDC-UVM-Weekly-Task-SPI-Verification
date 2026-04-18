# NCDC UVM Module - Weekly Task: SPI Verification

## Course
**NCDC Cohort 02/2025 - Design Verification (DV)**  
NUST Chip Design Centre

## Module
Universal Verification Methodology (UVM) Module

## Task Description
Verification of an **SPI (Serial Peripheral Interface)** controller using **UVM (Universal Verification Methodology)** in SystemVerilog.

UVM is a standardized methodology for verifying digital designs, providing a structured framework for creating reusable, scalable verification environments.

### UVM Verification Environment Components
- **UVM Agent**: Contains Driver, Monitor, and Sequencer
- **UVM Sequencer**: Controls stimulus generation
- **UVM Driver**: Drives stimulus to DUT (Design Under Test)
- **UVM Monitor**: Observes and records DUT behavior
- **UVM Scoreboard**: Checks expected vs actual outputs
- **UVM Coverage Collector**: Measures functional coverage
- **UVM Test**: Top-level test class
- **UVM Environment**: Encapsulates the complete verification environment

### Verification Plan
- Functional coverage for all SPI modes (CPOL/CPHA combinations)
- Constrained random stimulus generation
- Protocol compliance checking
- Data integrity verification
- Corner case testing

## Files
- `SPI_Verification.zip` - Complete UVM verification environment for SPI controller

## Submission Details
- **Submitted:** Thursday, 4 December 2025
- **Module:** Universal Verification Methodology (UVM)
- **Grade:** 4.50 / 100.00
