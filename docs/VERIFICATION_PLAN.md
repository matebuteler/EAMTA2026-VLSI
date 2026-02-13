# Verification Plan

This document describes the verification methodology for the 4-bit counter project.

## Overview

Each block must undergo comprehensive verification before integration. This includes functional verification, timing analysis, corner analysis, and power analysis.

## Verification Levels

### Level 1: Block-Level Verification

Each individual block (DFF, gates, counter stage) must be verified independently.

### Level 2: Integration Verification

The complete 4-bit counter must be verified as a system.

## Verification Flow

```
Design Complete
    ↓
Functional Verification
    ↓
Timing Verification
    ↓
Corner Analysis
    ↓
Power Analysis
    ↓
Layout Verification (DRC/LVS)
    ↓
Post-Layout Simulation
    ↓
Sign-off
```

## Functional Verification

### D Flip-Flop (DFF)

**Test Cases:**
1. **Basic Operation**
   - Verify Q follows D on clock rising edge
   - Test multiple clock cycles

2. **Reset Functionality**
   - Verify synchronous reset (Q=0 when RST=1 on clock edge)
   - Test reset during various D values

3. **Setup/Hold Time**
   - Test D changing near clock edge
   - Verify minimum setup time
   - Verify minimum hold time

**Success Criteria:**
- Q correctly captures D on rising clock edge
- Reset works synchronously
- No metastability issues

### AND2 Gate

**Test Cases:**
1. **Truth Table**
   - Test all four input combinations (00, 01, 10, 11)
   - Verify output matches AND function

**Success Criteria:**
- Correct logic operation for all inputs

### XOR2 Gate

**Test Cases:**
1. **Truth Table**
   - Test all four input combinations
   - Verify output matches XOR function

**Success Criteria:**
- Correct logic operation for all inputs

### Counter Stage

**Test Cases:**
1. **Toggle Operation**
   - Verify Q toggles when EN=1 on clock edge
   - Verify Q holds when EN=0

2. **Carry Generation**
   - Verify CO=1 when Q=1 and EN=1
   - Verify CO=0 otherwise

3. **Reset**
   - Verify synchronous reset to 0

**Success Criteria:**
- Correct toggle behavior
- Correct carry propagation
- Reset works properly

### 4-bit Counter (Top-Level)

**Test Cases:**
1. **Count Sequence**
   - Verify counts from 0 to 15
   - Verify wrap-around from 15 to 0

2. **Reset**
   - Verify reset to 0000 at any count value

3. **Frequency Test**
   - Test at target maximum frequency (10 MHz)
   - Test at higher frequencies to find limit

**Success Criteria:**
- Correct counting sequence
- No missing or incorrect states
- Meets frequency requirement

## Timing Verification

### Setup/Hold Time Analysis

For sequential elements (DFF, Counter Stage):

```spice
.measure tran tsetup 
+ WHEN v(clk)=0.6 CROSS=1
+ - WHEN v(d)=0.6 CROSS=1

.measure tran thold
+ WHEN v(d)=0.6 CROSS=1
+ - WHEN v(clk)=0.6 CROSS=1
```

### Propagation Delay

For combinational logic (AND2, XOR2):

```spice
.measure tran tpd_rise
+ TRIG v(a)=0.6 RISE=1
+ TARG v(y)=0.6 RISE=1

.measure tran tpd_fall
+ TRIG v(a)=0.6 FALL=1
+ TARG v(y)=0.6 FALL=1
```

### Clock-to-Q Delay

For flip-flops:

```spice
.measure tran tclk2q
+ TRIG v(clk)=0.6 RISE=1
+ TARG v(q)=0.6 RISE=1
```

## Corner Analysis

All blocks must be verified across process corners and temperature.

### PVT Corners

Test at the following corners:

| Corner | Process | Voltage | Temperature |
|--------|---------|---------|-------------|
| TT | Typical | 1.2V | 27°C |
| FF | Fast | 1.32V | -40°C |
| SS | Slow | 1.08V | 125°C |
| FS | Fast-Slow | 1.32V | 27°C |
| SF | Slow-Fast | 1.08V | 27°C |

### Corner Simulation Template

```spice
.title Corner Analysis for <block>

.lib '<pdk_path>/models/sg13_lv_models.lib' <corner>

* Circuit netlist here

.control
set temp=<temperature>
dc vdd 1.08 1.32 0.01
plot v(out)
.endc

.end
```

### Success Criteria

- Functionality maintained across all corners
- Timing specifications met at worst corner
- No oscillations or instability

## Power Analysis

### Static Power

Measure leakage current with no switching activity:

```spice
.measure dc idd_leak FIND i(vdd) AT=<time>
.param pwr_static='idd_leak*1.2'
```

### Dynamic Power

Measure average current during switching:

```spice
.measure tran idd_avg AVG i(vdd) FROM=<start> TO=<end>
.param pwr_dynamic='idd_avg*1.2'
```

### Power Verification Template

```spice
.title Power Analysis for <block>

Vdd vdd 0 DC 1.2
Vss vss 0 DC 0

* Circuit here

.control
tran 10p 1u
meas tran idd_avg AVG i(vdd)
let pwr = idd_avg*1.2
print pwr
.endc

.end
```

## Layout Verification

### Design Rule Check (DRC)

1. Open layout in KLayout
2. Tools → DRC → Run DRC
3. Select sg13g2 DRC deck
4. Run and verify zero violations

**Common DRC Issues:**
- Minimum width violations
- Minimum spacing violations
- Metal density issues
- Antenna violations

### Layout vs. Schematic (LVS)

1. Generate netlist from schematic
2. Extract netlist from layout
3. Run LVS in KLayout
4. Verify exact match

**Common LVS Issues:**
- Missing connections
- Swapped pins
- Wrong device sizes
- Missing devices

## Post-Layout Simulation

After layout is complete, extract parasitics and re-run simulations:

1. **Extract RC parasitics** from layout
2. **Re-run all functional tests** with extracted netlist
3. **Verify timing** still meets specifications
4. **Check for layout-induced issues**:
   - Coupling between signals
   - IR drop effects
   - Cross-talk

## Documentation Requirements

For each verification step, document:

1. **Test Setup**: Circuit configuration, stimulus
2. **Expected Results**: What should happen
3. **Actual Results**: Measurements, waveforms
4. **Pass/Fail**: Clear indication
5. **Issues**: Any problems encountered
6. **Screenshots**: Key waveforms and measurements

### Verification Report Template

```markdown
# Verification Report: <Block Name>

## Date: <date>
## Engineer: <name>

## Functional Verification

### Test 1: <test name>
- **Setup**: <description>
- **Expected**: <expected result>
- **Result**: PASS/FAIL
- **Waveform**: ![waveform](path/to/image)
- **Notes**: <any observations>

## Timing Verification

### Setup Time: <value> (Spec: <spec>)
### Hold Time: <value> (Spec: <spec>)
### Propagation Delay: <value> (Spec: <spec>)

## Corner Analysis

| Corner | Functional | Timing | Status |
|--------|-----------|---------|--------|
| TT | PASS | PASS | ✓ |
| FF | PASS | PASS | ✓ |
| SS | PASS | PASS | ✓ |

## Power Analysis

- Static Power: <value> (Spec: <spec>)
- Dynamic Power @ 10MHz: <value> (Spec: <spec>)

## Layout Verification

- DRC: CLEAN (0 violations)
- LVS: CLEAN (exact match)

## Summary

Overall Status: PASS/FAIL

All specifications met: YES/NO

Issues: <list any issues>
```

## Automation Scripts

Use the scripts in `scripts/verification/` to automate verification:

```bash
# Run all corner simulations
./scripts/verification/run_corners.sh <block_name>

# Run power analysis
./scripts/verification/analyze_power.sh <block_name>

# Generate verification report
./scripts/verification/generate_report.sh <block_name>
```

## Sign-off Checklist

Before considering a block complete:

- [ ] All functional tests pass
- [ ] Timing specifications met at all corners
- [ ] Power consumption within budget
- [ ] DRC clean
- [ ] LVS clean
- [ ] Post-layout simulation matches pre-layout
- [ ] Documentation complete
- [ ] Peer review completed

## Troubleshooting

### Simulation Convergence Issues

- Reduce time step
- Adjust solver tolerances
- Check for floating nodes
- Verify initial conditions

### Timing Violations

- Check critical paths
- Review RC parasitics
- Consider buffering
- Optimize layout

### Power Issues

- Check for short circuits
- Verify proper power gating
- Review switching activity
- Check for leakage paths

## References

- ngspice Manual: Measurement commands
- CACE Documentation: Automated characterization
- KLayout Manual: DRC/LVS procedures
- IHP SG13G2 PDK: Design rules and models
