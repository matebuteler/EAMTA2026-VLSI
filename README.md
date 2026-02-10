# EAMTA2026-VLSI
Repository containing the "Introduction to Very Large Scale Integration Design" course from the 2026 Argentine School for Micro-nano Electronics, Technology and Applications

## Course Project: 4-bit Counter Design

This repository contains the design and verification flow for a 4-bit counter implemented in the IHP SG13G2 130nm PDK. The project is structured to allow multiple student groups to work collaboratively on different blocks of the counter.

### Toolchain

- **Container**: hpretl/iic-osic-tools (via podman & distrobox)
- **Schematics**: xschem
- **Simulation**: ngspice
- **Characterization**: CACE
- **Layout**: KLayout
- **PDK**: IHP SG13G2 130nm

### Project Structure

```
.
├── design/              # Design files
│   ├── blocks/         # Individual counter blocks (assigned to student groups)
│   └── top/            # Top-level counter integration
├── verification/        # Verification and testbenches
│   ├── testbenches/    # ngspice testbenches
│   └── vectors/        # Test vectors
├── scripts/            # Automation and flow scripts
├── tools-config/       # Tool configuration files
├── examples/           # Example implementations and tutorials
└── docs/               # Documentation and guidelines

```

### 4-bit Counter Architecture

The 4-bit counter consists of the following blocks:

1. **D Flip-Flop (DFF)** - Basic storage element
2. **XOR Gate** - Toggle logic
3. **AND Gate** - Ripple carry logic
4. **Counter Stage** - Single bit counter stage
5. **Top-Level Counter** - 4-bit counter integration

Each student group will be assigned one or more blocks to design, simulate, characterize, and layout.

### Getting Started

See [docs/GETTING_STARTED.md](docs/GETTING_STARTED.md) for setup instructions.

See [docs/STUDENT_WORKFLOW.md](docs/STUDENT_WORKFLOW.md) for the development workflow.

See [docs/DESIGN_SPECIFICATIONS.md](docs/DESIGN_SPECIFICATIONS.md) for detailed design specifications.

### Group Assignments

Student groups will be assigned blocks through GitHub Issues. See [docs/GROUP_ASSIGNMENTS.md](docs/GROUP_ASSIGNMENTS.md) for details.

### Contributing

Please follow the workflow described in [docs/STUDENT_WORKFLOW.md](docs/STUDENT_WORKFLOW.md). Each group should:

1. Work in their assigned block directory
2. Create feature branches for their work
3. Submit pull requests for review
4. Ensure their design passes verification before submitting

### Resources

- [IHP SG13G2 PDK Documentation](https://github.com/IHP-GmbH/IHP-Open-PDK)
- [xschem Documentation](https://xschem.sourceforge.io/stefan/index.html)
- [ngspice User Manual](http://ngspice.sourceforge.net/docs.html)
- [CACE Documentation](https://github.com/efabless/cace)
- [KLayout Documentation](https://www.klayout.de/doc.html)
