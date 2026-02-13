# Testbenches

This directory contains testbenches for verifying the counter blocks.

## Organization

Each block has its own testbench directory:

```
testbenches/
├── <block-name>/
│   ├── README.md              # Test documentation
│   ├── <block>_tb.sch         # xschem testbench
│   ├── <block>_tb.spice       # ngspice netlist
│   └── plots/                 # Simulation plots
```

## Creating a Testbench

1. **Create directory** for your block:
   ```bash
   mkdir -p verification/testbenches/<block-name>/plots
   ```

2. **Design testbench** in xschem:
   - Instantiate your block
   - Add stimulus (voltage/current sources)
   - Add measurement probes
   - Configure analysis (.tran, .dc, .ac)

3. **Generate netlist** from xschem

4. **Run simulation**:
   ```bash
   ngspice <block>_tb.spice
   ```

5. **Document results** in testbench README

## Testbench Guidelines

### Good Testbench Practices

1. **Clear stimulus**: Well-defined input signals
2. **Comprehensive coverage**: Test all functionality
3. **Proper measurements**: Use .measure commands
4. **Reasonable runtime**: Not too long, not too short
5. **Good documentation**: Explain what's being tested

### Common Test Cases

For digital blocks:
- Functional test (truth table)
- Timing test (setup/hold, propagation delay)
- Corner test (TT, FF, SS)
- Power test (static and dynamic)

For sequential blocks:
- State transitions
- Reset behavior
- Clock edge sensitivity
- Setup/hold time validation

### Measurement Examples

See [tools-config/ngspice/README.md](../../tools-config/ngspice/README.md) for measurement templates.

## Corner Testing

Use the corner simulation script:
```bash
./scripts/verification/run_corners.sh verification/testbenches/<block>/tb.spice
```

This automatically runs TT, FF, and SS corners.

## Documentation

Each testbench directory should have a README.md with:

1. **Test description**: What is being tested
2. **Test procedure**: How the test works
3. **Expected results**: What should happen
4. **Actual results**: Measurements and observations
5. **Plots**: Key waveforms
6. **Status**: Pass/Fail for each test

## Tips

1. **Start simple**: Get basic functionality working first
2. **Build incrementally**: Add test cases one at a time
3. **Save plots**: Capture waveforms for documentation
4. **Automate**: Use .measure for automatic measurements
5. **Compare**: Check results against specifications

## Examples

See example testbenches in [examples/](../../examples/) directory.

## References

- [VERIFICATION_PLAN.md](../../docs/VERIFICATION_PLAN.md)
- [ngspice Documentation](http://ngspice.sourceforge.net/docs.html)
