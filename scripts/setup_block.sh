#!/bin/bash
# Script to set up a new block directory structure
# Usage: ./setup_block.sh <block-name>

if [ $# -eq 0 ]; then
    echo "Usage: ./setup_block.sh <block-name>"
    echo "Example: ./setup_block.sh dff"
    exit 1
fi

BLOCK_NAME=$1
BLOCK_DIR="design/blocks/${BLOCK_NAME}"
TB_DIR="verification/testbenches/${BLOCK_NAME}"

echo "Setting up directory structure for block: ${BLOCK_NAME}"

# Create block directories
mkdir -p "${BLOCK_DIR}/schematic"
mkdir -p "${BLOCK_DIR}/char"
mkdir -p "${BLOCK_DIR}/layout"

# Create testbench directories
mkdir -p "${TB_DIR}"
mkdir -p "${TB_DIR}/plots"

# Create README template for block
cat > "${BLOCK_DIR}/README.md" << EOF
# ${BLOCK_NAME}

## Description

Brief description of the block functionality.

## Specifications

Key specifications:
- Parameter 1: value
- Parameter 2: value

See [DESIGN_SPECIFICATIONS.md](../../../docs/DESIGN_SPECIFICATIONS.md) for complete specifications.

## Design Approach

Describe your design approach:

## Files

- \`schematic/${BLOCK_NAME}.sch\` - xschem schematic
- \`schematic/${BLOCK_NAME}.sym\` - xschem symbol
- \`char/${BLOCK_NAME}.yaml\` - CACE configuration
- \`layout/${BLOCK_NAME}.gds\` - KLayout layout

## Simulation Results

### Functional Verification

Results of functional tests:

### Timing Analysis

- Setup time: TBD
- Hold time: TBD
- Propagation delay: TBD
- Max frequency: TBD

### Corner Analysis

| Corner | Status | Notes |
|--------|--------|-------|
| TT | TBD | |
| FF | TBD | |
| SS | TBD | |

### Power Analysis

- Static power: TBD
- Dynamic power @ 10MHz: TBD

## Layout

- Area: TBD
- DRC: TBD
- LVS: TBD

![Layout Screenshot](layout/screenshot.png)

## Issues and Notes

Any design decisions, challenges, or notes:

## Authors

- Group N
- Member 1
- Member 2
- Member 3
EOF

# Create README template for testbench
cat > "${TB_DIR}/README.md" << EOF
# ${BLOCK_NAME} Testbench

## Description

This directory contains the testbench and simulation results for the ${BLOCK_NAME} block.

## Files

- \`${BLOCK_NAME}_tb.sch\` - xschem testbench schematic
- \`${BLOCK_NAME}_tb.spice\` - ngspice netlist
- \`plots/\` - Simulation waveforms and results

## Test Cases

### Test 1: [Test Name]

**Purpose**: 

**Procedure**:
1. 
2. 

**Expected Result**:

**Actual Result**:

**Status**: PASS / FAIL

![Waveform](plots/test1.png)

## Simulation Commands

\`\`\`bash
# Generate netlist from xschem
xschem -n -q ${BLOCK_NAME}_tb.sch

# Run simulation
ngspice ${BLOCK_NAME}_tb.spice

# Or interactive
ngspice -i ${BLOCK_NAME}_tb.spice
\`\`\`

## Results Summary

All tests: PASS / FAIL

Notes:
EOF

echo "✓ Created block directory: ${BLOCK_DIR}"
echo "✓ Created testbench directory: ${TB_DIR}"
echo "✓ Created README templates"
echo ""
echo "Next steps:"
echo "1. cd ${BLOCK_DIR}/schematic"
echo "2. xschem ${BLOCK_NAME}.sch"
echo "3. Design your schematic"
echo "4. Create symbol for hierarchical use"
echo ""
echo "See docs/STUDENT_WORKFLOW.md for detailed workflow."
