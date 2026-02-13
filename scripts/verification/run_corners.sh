#!/bin/bash
# Script to run corner simulations for a block
# Usage: ./run_corners.sh <testbench_path>

if [ $# -eq 0 ]; then
    echo "Usage: ./run_corners.sh <testbench.spice>"
    echo "Example: ./run_corners.sh verification/testbenches/dff/dff_tb.spice"
    exit 1
fi

TESTBENCH=$1

if [ ! -f "$TESTBENCH" ]; then
    echo "Error: Testbench file not found: $TESTBENCH"
    exit 1
fi

BASENAME=$(basename "$TESTBENCH" .spice)
DIR=$(dirname "$TESTBENCH")

echo "Running corner simulations for: $TESTBENCH"
echo ""

# Define corners
declare -A CORNERS
CORNERS[TT]="typical"
CORNERS[FF]="fast"
CORNERS[SS]="slow"

# Run each corner
for corner in TT FF SS; do
    echo "================================================"
    echo "Running corner: $corner (${CORNERS[$corner]})"
    echo "================================================"
    
    # Create corner-specific netlist
    CORNER_FILE="${DIR}/${BASENAME}_${corner}.spice"
    
    # Copy original and modify for corner
    sed "s/\.lib.*models.*lib.*/\.lib '\$PDK_ROOT\/sg13g2\/libs.tech\/ngspice\/models\/sg13_lv_models.lib' ${CORNERS[$corner]}/g" \
        "$TESTBENCH" > "$CORNER_FILE"
    
    # Run simulation
    echo "Running simulation..."
    ngspice -b "$CORNER_FILE" -o "${DIR}/${BASENAME}_${corner}.log"
    
    if [ $? -eq 0 ]; then
        echo "✓ Corner $corner simulation complete"
        echo "  Log: ${DIR}/${BASENAME}_${corner}.log"
    else
        echo "✗ Corner $corner simulation failed"
        echo "  Check log: ${DIR}/${BASENAME}_${corner}.log"
    fi
    echo ""
done

echo "================================================"
echo "All corner simulations complete"
echo "================================================"
echo "Results:"
ls -lh "${DIR}/${BASENAME}"_*.log
echo ""
echo "Review the log files for results and measurements."
