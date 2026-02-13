# Block Designs

This directory contains the individual block designs for the 4-bit counter project.

## Directory Structure

Each block should have the following structure:

```
<block-name>/
├── README.md              # Block documentation
├── schematic/
│   ├── <block>.sch       # xschem schematic
│   └── <block>.sym       # xschem symbol
├── char/
│   ├── <block>.yaml      # CACE configuration
│   └── results/          # Characterization results
└── layout/
    └── <block>.gds       # KLayout layout
```

## Creating a New Block

Use the setup script to create a new block:

```bash
./scripts/setup_block.sh <block-name>
```

This will create the directory structure and README templates.

## Block Assignments

See [docs/GROUP_ASSIGNMENTS.md](../../docs/GROUP_ASSIGNMENTS.md) for current assignments.

## Blocks Overview

The 4-bit counter is composed of:

1. **Basic Gates**
   - AND2 - 2-input AND gate
   - XOR2 - 2-input XOR gate
   - INV - Inverter

2. **Sequential Element**
   - DFF - D Flip-Flop with reset

3. **Counter Building Block**
   - Counter Stage - Single-bit counter stage

4. **Top-Level**
   - 4-bit Counter - Complete counter implementation

## Design Guidelines

When implementing your block:

1. **Follow specifications** in [DESIGN_SPECIFICATIONS.md](../../docs/DESIGN_SPECIFICATIONS.md)
2. **Use standard naming** for files and signals
3. **Document thoroughly** in block README
4. **Test comprehensively** - see [VERIFICATION_PLAN.md](../../docs/VERIFICATION_PLAN.md)
5. **Follow workflow** in [STUDENT_WORKFLOW.md](../../docs/STUDENT_WORKFLOW.md)

## Integration Notes

Blocks will be integrated in hierarchical order:
1. Basic gates (can be done in parallel)
2. DFF (uses gates)
3. Counter stage (uses DFF and gates)
4. Top-level counter (uses counter stages)

Coordinate with other groups if your block depends on theirs.

## Status

Track status of blocks in [GROUP_ASSIGNMENTS.md](../../docs/GROUP_ASSIGNMENTS.md).

## Examples

See [examples/](../../examples/) directory for reference implementations.
