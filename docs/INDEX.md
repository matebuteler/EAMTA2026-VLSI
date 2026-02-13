# Documentation Index

Welcome to the EAMTA2026 VLSI Course documentation!

## Quick Start

New to the project? Start here:

1. [GETTING_STARTED.md](GETTING_STARTED.md) - Set up your environment
2. [DESIGN_SPECIFICATIONS.md](DESIGN_SPECIFICATIONS.md) - Understand the project requirements
3. [STUDENT_WORKFLOW.md](STUDENT_WORKFLOW.md) - Learn the development workflow
4. [GROUP_ASSIGNMENTS.md](GROUP_ASSIGNMENTS.md) - Find your group assignment

## Core Documentation

### Project Overview
- [README.md](../README.md) - Main project README
- [DESIGN_SPECIFICATIONS.md](DESIGN_SPECIFICATIONS.md) - Complete design specifications
- [GROUP_ASSIGNMENTS.md](GROUP_ASSIGNMENTS.md) - Team assignments and status

### Getting Started
- [GETTING_STARTED.md](GETTING_STARTED.md) - Environment setup
- [STUDENT_WORKFLOW.md](STUDENT_WORKFLOW.md) - Step-by-step workflow
- [VERIFICATION_PLAN.md](VERIFICATION_PLAN.md) - How to verify your design

## By Topic

### Design
- [DESIGN_SPECIFICATIONS.md](DESIGN_SPECIFICATIONS.md) - What to design
- [../design/blocks/README.md](../design/blocks/README.md) - Block organization
- [../design/top/README.md](../design/top/README.md) - Top-level integration

### Verification
- [VERIFICATION_PLAN.md](VERIFICATION_PLAN.md) - Verification methodology
- [../verification/testbenches/README.md](../verification/testbenches/README.md) - Testbench guidelines
- [../verification/vectors/README.md](../verification/vectors/README.md) - Test vectors

### Tools
- [../tools-config/xschem/README.md](../tools-config/xschem/README.md) - xschem configuration
- [../tools-config/ngspice/README.md](../tools-config/ngspice/README.md) - ngspice templates
- [../tools-config/klayout/README.md](../tools-config/klayout/README.md) - KLayout guidelines

### Scripts and Automation
- [../scripts/README.md](../scripts/README.md) - Available scripts
- [../scripts/setup_block.sh](../scripts/setup_block.sh) - Block setup script
- [../scripts/verification/run_corners.sh](../scripts/verification/run_corners.sh) - Corner simulation script

### Examples
- [../examples/README.md](../examples/README.md) - Example implementations
- [../examples/inv_example/README.md](../examples/inv_example/README.md) - Inverter example

## By Role

### For Students

**Starting out:**
1. [GETTING_STARTED.md](GETTING_STARTED.md)
2. [GROUP_ASSIGNMENTS.md](GROUP_ASSIGNMENTS.md)
3. [STUDENT_WORKFLOW.md](STUDENT_WORKFLOW.md)

**Designing:**
1. [DESIGN_SPECIFICATIONS.md](DESIGN_SPECIFICATIONS.md)
2. [../tools-config/xschem/README.md](../tools-config/xschem/README.md)
3. [../examples/](../examples/)

**Simulating:**
1. [../tools-config/ngspice/README.md](../tools-config/ngspice/README.md)
2. [VERIFICATION_PLAN.md](VERIFICATION_PLAN.md)
3. [../scripts/verification/](../scripts/verification/)

**Layout:**
1. [../tools-config/klayout/README.md](../tools-config/klayout/README.md)
2. [DESIGN_SPECIFICATIONS.md](DESIGN_SPECIFICATIONS.md)

### For Instructors

**Setup:**
1. [GROUP_ASSIGNMENTS.md](GROUP_ASSIGNMENTS.md) - Assign groups
2. GitHub Issues - Create block assignments
3. GitHub Projects - Track progress

**Monitoring:**
- Check GitHub Issues for questions
- Review pull requests
- Update GROUP_ASSIGNMENTS.md

**Integration:**
- [../design/top/README.md](../design/top/README.md)

## Reference Sections

### Design Specifications

Each block type has detailed specs in [DESIGN_SPECIFICATIONS.md](DESIGN_SPECIFICATIONS.md):
- D Flip-Flop (DFF)
- XOR2 Gate  
- AND2 Gate
- Counter Stage
- 4-bit Counter

### Verification Procedures

[VERIFICATION_PLAN.md](VERIFICATION_PLAN.md) covers:
- Functional verification
- Timing verification
- Corner analysis
- Power analysis
- Layout verification

### Workflow Steps

[STUDENT_WORKFLOW.md](STUDENT_WORKFLOW.md) includes:
- Branch creation
- Schematic design
- Simulation
- Characterization
- Layout
- Pull request process

## GitHub Resources

### Issue Templates
- Block Assignment: Use for assigning blocks to groups
- Bug Report: Report issues with design or tools
- Question: Ask questions about the project

### Pull Request Template
- Block Submission: Submit completed block design

## Additional Resources

### External Documentation
- [IHP SG13G2 PDK](https://github.com/IHP-GmbH/IHP-Open-PDK)
- [xschem](https://xschem.sourceforge.io/stefan/index.html)
- [ngspice](http://ngspice.sourceforge.net/docs.html)
- [CACE](https://github.com/efabless/cace)
- [KLayout](https://www.klayout.de/doc.html)

### Container
- [IIC-OSIC-Tools](https://github.com/hpretl/iic-osic-tools)

## Getting Help

1. **Check documentation**: Search this documentation first
2. **GitHub Issues**: Create an issue for questions
3. **GitHub Discussions**: For general discussion
4. **Course forum**: Check course website for link
5. **Ask your group**: Collaborate with team members
6. **Tool documentation**: Refer to tool-specific docs

## Contributing to Documentation

Found an error or have a suggestion?

1. Create a GitHub Issue
2. Or submit a pull request with fixes
3. Help improve documentation for future students

## Document Status

This documentation is maintained as part of the course. Last major update coincides with repository setup.

For the most current information, always refer to the main branch of the repository.
