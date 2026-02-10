# Quick Start Guide - EAMTA2026-VLSI

This is a quick reference for getting started with the 8-bit counter design project.

## For Students - First Time Setup

### 1. Clone and Setup (5 minutes)
```bash
# Clone the repository
git clone https://github.com/matebuteler/EAMTA2026-VLSI.git
cd EAMTA2026-VLSI

# Check project structure
make verify-structure

# Review available commands
make help
```

### 2. Read Documentation (30 minutes)
Priority reading order:
1. [README.md](README.md) - Project overview
2. [docs/BLOCK_ASSIGNMENTS.md](docs/BLOCK_ASSIGNMENTS.md) - Find your assignment
3. [docs/DESIGN_SPEC.md](docs/DESIGN_SPEC.md) - Understand requirements
4. [docs/STUDENT_GUIDE.md](docs/STUDENT_GUIDE.md) - Learn the workflow

### 3. Install Tools (1-2 hours)
Follow [docs/SETUP.md](docs/SETUP.md) to install:
- xschem (schematic editor)
- ngspice (simulator)
- CACE (characterization)
- KLayout (layout)
- IHP SG13G2 PDK

### 4. Start Your Work (Week 1)
```bash
# Create your feature branch
git checkout -b feature/group-XX-your-block

# Create your block directory
cd design/blocks
mkdir group-XX-your-block
cd group-XX-your-block

# Copy template
cp ../README_TEMPLATE.md README.md

# Start designing!
```

## For Instructors - Repository Management

### Initial Setup
```bash
# Verify everything is in place
make verify-structure
make check-tools  # May fail if tools not installed - this is OK

# Review student assignments
cat docs/BLOCK_ASSIGNMENTS.md

# Check CI/CD status
# Visit: https://github.com/matebuteler/EAMTA2026-VLSI/actions
```

### Managing Student Work
```bash
# Review all blocks
make status

# Run all simulations (once students submit)
make simulate-all

# Run all characterizations
make characterize-all

# Verify all layouts
make verify-layout
```

### Pull Request Review Checklist
- [ ] Block documentation complete (README.md)
- [ ] Schematic design present
- [ ] Testbench included
- [ ] Simulation results documented
- [ ] CACE configuration created
- [ ] Layout present (if applicable)
- [ ] DRC clean (if layout submitted)
- [ ] LVS clean (if layout submitted)
- [ ] Follows naming conventions
- [ ] Git history is clean

## Project Timeline

### Phase 1: Setup (Week 0-1)
- Install tools
- Read documentation
- Form groups
- Start schematic design

### Phase 2: Design (Week 1-4)
- Complete schematics
- Create testbenches
- Run initial simulations
- Create symbols for hierarchy

### Phase 3: Verification (Week 3-6)
- Complete all simulations
- Perform corner analysis
- Setup CACE characterization
- Document results

### Phase 4: Layout (Week 7-9)
- Create layouts in KLayout
- Run DRC
- Run LVS
- Iterate until clean

### Phase 5: Integration (Week 10)
- Submit pull requests
- Code review
- Final integration
- Project presentation

## Common Commands

### Daily Workflow
```bash
# Pull latest changes
git pull origin main

# Work on your feature
# ... make changes ...

# Commit regularly
git add design/blocks/your-block/
git commit -m "Add feature X"
git push origin feature/group-XX-your-block
```

### Testing Your Work
```bash
# Test schematic (in xschem)
xschem design/schematics/your_block.sch
# Click: Netlist → Simulate

# Test from command line
cd simulation
ngspice -b ../design/testbenches/your_block_tb.spice

# Run characterization
cd characterization/your-block
cace your_block.yaml

# Verify layout
cd layout/your-block
klayout your_block.gds
# Tools → DRC → Run DRC
```

### Getting Help
```bash
# Check documentation
ls docs/

# View specific guide
cat docs/STUDENT_GUIDE.md

# Check tool configuration
ls tools/
```

## Directory Structure Quick Reference

```
EAMTA2026-VLSI/
├── design/           # Your work goes here
│   ├── blocks/      # Create your block directory here
│   ├── schematics/  # xschem files
│   └── testbenches/ # Test circuits
├── simulation/       # Simulation outputs (auto-generated)
├── characterization/ # CACE files
├── layout/          # KLayout files
├── docs/            # READ THIS FIRST
├── scripts/         # Automation (don't modify)
└── tools/           # Tool configs (reference only)
```

## Important Files

### Must Read
- `README.md` - Project overview
- `docs/STUDENT_GUIDE.md` - Complete workflow
- `docs/DESIGN_SPEC.md` - Technical requirements
- `docs/BLOCK_ASSIGNMENTS.md` - Your assignment

### Templates
- `design/blocks/README_TEMPLATE.md` - Use for your block
- `tools/cace_template.yaml` - Use for CACE setup
- `design/testbenches/testbench_template.spice` - Use for testbenches

### Configuration
- `tools/xschemrc` - xschem configuration
- `tools/klayout_layers.lyp` - KLayout layer definitions
- `.gitignore` - Files to exclude from git

## Troubleshooting Quick Fixes

### Tools not found
```bash
# Setup environment
source scripts/setup_env.sh

# Or add to ~/.bashrc
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### PDK not found
```bash
# Set PDK_ROOT
export PDK_ROOT=$HOME/tools/IHP-Open-PDK

# Or add to ~/.bashrc
echo 'export PDK_ROOT=$HOME/tools/IHP-Open-PDK' >> ~/.bashrc
```

### Simulation fails
```bash
# Check if PDK models are accessible
ls $PDK_ROOT/libs.ref/sg13g2_pr/spice/

# Verify testbench syntax
head design/testbenches/your_tb.spice
```

### Git issues
```bash
# Discard local changes
git checkout -- filename

# Pull latest
git pull origin main

# Resolve conflicts (ask for help if needed)
```

## Resources

### Documentation Links
- Main docs: [docs/README.md](docs/README.md)
- Setup: [docs/SETUP.md](docs/SETUP.md)
- Workflow: [docs/STUDENT_GUIDE.md](docs/STUDENT_GUIDE.md)

### External Resources
- IHP PDK: https://github.com/IHP-GmbH/IHP-Open-PDK
- xschem: http://repo.hu/projects/xschem/
- ngspice: http://ngspice.sourceforge.net/
- CACE: https://github.com/efabless/cace
- KLayout: https://www.klayout.de/

### Getting Help
1. Check documentation in `docs/`
2. Search GitHub issues
3. Ask in course forum
4. Contact instructor

## Next Steps

1. ✅ Read this guide
2. ✅ Install tools (see [docs/SETUP.md](docs/SETUP.md))
3. ✅ Check your assignment (see [docs/BLOCK_ASSIGNMENTS.md](docs/BLOCK_ASSIGNMENTS.md))
4. ✅ Follow the workflow (see [docs/STUDENT_GUIDE.md](docs/STUDENT_GUIDE.md))
5. ✅ Start designing!

Good luck with your VLSI design! 🎓⚡
