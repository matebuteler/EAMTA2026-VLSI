# Design Specifications: 4-bit Counter

## Overview

This document specifies the design requirements for the 4-bit synchronous counter project.

## Counter Architecture

The 4-bit counter is a synchronous binary counter that counts from 0000 to 1111 (0 to 15) and wraps around.

### Block Diagram

```
       ┌─────────────────────────────────────────┐
       │         4-bit Counter                   │
       │                                         │
CLK ───┤                                         │
       │  ┌────┐  ┌────┐  ┌────┐  ┌────┐        │
RST ───┤  │ S0 │  │ S1 │  │ S2 │  │ S3 │        │
       │  └────┘  └────┘  └────┘  └────┘        │
       │    │       │       │       │            │
       └────┼───────┼───────┼───────┼────────────┘
            │       │       │       │
          Q[0]    Q[1]    Q[2]    Q[3]
```

### Hierarchy

1. **Basic Gates** (Level 1)
   - AND2 - 2-input AND gate
   - XOR2 - 2-input XOR gate
   - INV - Inverter

2. **D Flip-Flop** (Level 2)
   - DFF - Positive edge-triggered D flip-flop with reset

3. **Counter Stage** (Level 3)
   - Single-bit counter stage with toggle logic

4. **Top-Level Counter** (Level 4)
   - 4-bit counter integration

## Detailed Block Specifications

### 1. D Flip-Flop (DFF)

**Ports:**
- `CLK` (input) - Clock signal
- `RST` (input) - Active-high synchronous reset
- `D` (input) - Data input
- `Q` (output) - Data output

**Functionality:**
- Positive edge-triggered
- Synchronous reset (when RST=1, Q=0 on next clock edge)
- Setup time: < 100ps
- Hold time: < 100ps
- Clock-to-Q delay: < 500ps

**Implementation:**
- Use transmission gate-based master-slave design
- Or use standard cell from PDK if available

### 2. XOR2 Gate

**Ports:**
- `A` (input)
- `B` (input)
- `Y` (output) - Y = A ⊕ B

**Specifications:**
- Propagation delay: < 200ps
- Balanced rise/fall times

### 3. AND2 Gate

**Ports:**
- `A` (input)
- `B` (input)
- `Y` (output) - Y = A · B

**Specifications:**
- Propagation delay: < 200ps
- Balanced rise/fall times

### 4. Counter Stage

**Ports:**
- `CLK` (input) - Clock signal
- `RST` (input) - Reset signal
- `EN` (input) - Enable signal (carry from previous stage)
- `Q` (output) - Counter bit output
- `CO` (output) - Carry out to next stage

**Functionality:**
- Toggles on clock edge when EN=1
- Generates carry out when Q=1 and EN=1
- Resets to 0 when RST=1

**Implementation:**
```
D = Q ⊕ EN
CO = Q · EN
```

### 5. 4-bit Counter (Top-Level)

**Ports:**
- `CLK` (input) - Clock signal
- `RST` (input) - Active-high reset
- `Q[3:0]` (output) - 4-bit counter output

**Functionality:**
- Counts from 0 to 15 on each clock edge
- Wraps to 0 after reaching 15
- Synchronous reset

**Timing:**
- Maximum clock frequency: > 10 MHz
- Setup time: < 100ps
- Hold time: < 100ps

## Electrical Specifications

### Supply Voltage
- VDD: 1.2V (nominal)
- VSS: 0V

### Operating Conditions
- Temperature: -40°C to 125°C
- Process corners: TT, FF, SS

### Signal Levels
- Logic HIGH: > 0.8 × VDD
- Logic LOW: < 0.2 × VDD

### Drive Strength
- All outputs should be able to drive 20fF load

### Power Consumption (Target)
- Static power: < 1μW
- Dynamic power @ 10MHz: < 100μW

## Verification Requirements

Each block must pass the following verification:

1. **Functional Verification**
   - Correct logic operation
   - Reset functionality
   - Counting sequence
   
2. **Timing Verification**
   - Setup/hold time compliance
   - Maximum frequency check
   - Propagation delay measurements

3. **Corner Analysis**
   - TT, FF, SS corners
   - Temperature variation
   - Voltage variation (±10%)

4. **Power Analysis**
   - Static power
   - Dynamic power at various frequencies

## Deliverables

For each assigned block, student groups must deliver:

1. **Schematic** (xschem)
   - Complete schematic with proper connectivity
   - Symbol for hierarchical use

2. **Simulation** (ngspice)
   - Testbench demonstrating functionality
   - Timing analysis
   - Corner analysis results

3. **Characterization** (CACE)
   - Complete characterization results
   - Parameter extraction

4. **Layout** (KLayout)
   - Complete layout
   - DRC clean
   - LVS clean

5. **Documentation**
   - Design description
   - Simulation results
   - Layout screenshots
   - Performance summary

## Design Rules

1. Use only standard cells or custom cells that follow PDK DRC rules
2. All signals must be properly named
3. Power/ground connections must be explicit
4. Include proper decoupling capacitors in layout
5. Follow PDK guidelines for routing and placement

## Testing Methodology

See [VERIFICATION_PLAN.md](VERIFICATION_PLAN.md) for detailed verification procedures.
