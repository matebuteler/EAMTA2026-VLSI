# Example: Inverter (INV)

This directory contains an example implementation of a simple inverter to demonstrate the design flow.

## Purpose

This example demonstrates:
- How to structure a block directory
- xschem schematic design
- ngspice simulation
- Basic verification
- Documentation

## Block Description

A simple CMOS inverter that inverts the input signal.

**Ports:**
- `IN` (input) - Input signal
- `OUT` (output) - Inverted output signal
- `VDD` (power) - Power supply
- `VSS` (ground) - Ground

## Specifications

- Supply voltage: 1.2V
- Propagation delay: < 200ps
- Output load: 20fF

## Files

- `schematic/inv.sch` - xschem schematic (placeholder)
- `schematic/inv.sym` - xschem symbol (placeholder)
- `README.md` - This file

## Design Notes

### Schematic Design

The inverter uses:
- PMOS transistor for pull-up
- NMOS transistor for pull-down
- Sized for balanced rise/fall times

Typical sizing:
- PMOS: W=2μm, L=130nm
- NMOS: W=1μm, L=130nm

### Simulation

See `../../verification/testbenches/inv_example/` for testbench.

Test cases:
1. DC transfer characteristic
2. Transient response
3. Propagation delay measurement

### Expected Results

- VOH ≈ 1.2V
- VOL ≈ 0V
- Threshold ≈ 0.6V (VDD/2)
- tpd ≈ 50-100ps (depending on load)

## Usage for Students

This is a simplified example. Your actual blocks will require:
1. More detailed schematics following PDK guidelines
2. Complete testbenches with multiple test cases
3. Corner analysis
4. CACE characterization
5. Layout design
6. Complete documentation

## Learning Points

1. **Organization**: Note the directory structure
2. **Documentation**: Each block needs a comprehensive README
3. **Verification**: Multiple test cases are needed
4. **Results**: Document all measurements and observations

## Next Steps

For your assigned block:
1. Use `scripts/setup_block.sh <block-name>` to create structure
2. Follow the design specifications exactly
3. Complete all verification steps
4. Document everything thoroughly

## References

- [STUDENT_WORKFLOW.md](../../docs/STUDENT_WORKFLOW.md)
- [DESIGN_SPECIFICATIONS.md](../../docs/DESIGN_SPECIFICATIONS.md)
- [VERIFICATION_PLAN.md](../../docs/VERIFICATION_PLAN.md)
