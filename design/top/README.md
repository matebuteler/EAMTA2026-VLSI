# Top-Level Design

This directory will contain the top-level integration of the 4-bit counter.

## Purpose

This directory is for integrating all the individual blocks into the complete 4-bit counter design.

## Structure

```
top/
├── README.md              # This file
├── schematic/
│   ├── counter_4bit.sch  # Top-level schematic
│   └── counter_4bit.sym  # Top-level symbol
└── layout/
    └── counter_4bit.gds  # Top-level layout
```

## Integration Process

The top-level design will be completed after individual blocks are ready:

1. **Phase 1**: Wait for basic blocks (gates, DFF) to be completed
2. **Phase 2**: Integrate counter stages
3. **Phase 3**: Create 4-bit counter with control logic
4. **Phase 4**: Layout integration and verification

## Top-Level Specifications

See [DESIGN_SPECIFICATIONS.md](../../docs/DESIGN_SPECIFICATIONS.md#5-4-bit-counter-top-level) for detailed specifications.

**Summary**:
- Input: CLK, RST
- Output: Q[3:0] (4-bit count)
- Functionality: Binary counter 0-15 with wraparound
- Max frequency: > 10 MHz

## Integration Notes

### Block Dependencies

```
AND2, XOR2, INV (Level 1)
    ↓
DFF (Level 2)
    ↓
Counter Stage (Level 3)
    ↓
4-bit Counter (Level 4)
```

### Integration Tasks

1. **Instantiate blocks**: Use symbols from individual blocks
2. **Connect hierarchy**: Wire blocks together
3. **Add top-level I/O**: CLK, RST, Q[3:0]
4. **System verification**: Test complete counter
5. **Layout integration**: Combine block layouts
6. **Final verification**: DRC, LVS, timing

## Verification

The top-level counter must be verified to:
- Count correctly from 0 to 15
- Wrap around properly
- Reset synchronously
- Meet timing specifications
- Pass all corner analyses

See [VERIFICATION_PLAN.md](../../docs/VERIFICATION_PLAN.md) for verification procedures.

## Timeline

Integration will begin after individual blocks reach a stable state. Monitor the progress in [GROUP_ASSIGNMENTS.md](../../docs/GROUP_ASSIGNMENTS.md).

## Responsible Party

The integration will be coordinated by the instructors or assigned to an advanced student group.

## Status

Current status: Waiting for block completion

Required blocks:
- [ ] AND2
- [ ] XOR2
- [ ] DFF
- [ ] Counter Stage

Integration progress:
- [ ] Schematic integration
- [ ] Simulation
- [ ] Layout integration
- [ ] Final verification
