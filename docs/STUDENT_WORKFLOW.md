# Student Workflow

This document describes the workflow for student groups working on the 4-bit counter project.

## Overview

Each student group will be assigned one or more blocks of the counter to design, verify, and layout. This workflow ensures proper collaboration and integration.

## Workflow Steps

### 1. Setup and Assignment

1. **Check your assignment**: Look for your group's issue in the GitHub Issues tab
2. **Join your group**: Each group should have 2-3 students
3. **Understand your block**: Read the specifications in [DESIGN_SPECIFICATIONS.md](DESIGN_SPECIFICATIONS.md)
4. **Set up your environment**: Follow [GETTING_STARTED.md](GETTING_STARTED.md)

### 2. Create Your Working Branch

```bash
# Update your local repository
git pull origin main

# Create a branch for your group
git checkout -b group-<N>/<block-name>
# Example: git checkout -b group-1/dff-design
```

### 3. Design Phase

#### 3.1 Schematic Design (xschem)

1. Create your block directory:
   ```bash
   mkdir -p design/blocks/<block-name>/schematic
   cd design/blocks/<block-name>/schematic
   ```

2. Create schematic in xschem:
   ```bash
   xschem <block-name>.sch
   ```

3. Design guidelines:
   - Use proper component naming
   - Add power and ground connections
   - Create a symbol for your block
   - Document pin functions in properties

4. Save both schematic (.sch) and symbol (.sym) files

#### 3.2 Simulation (ngspice)

1. Create a testbench:
   ```bash
   mkdir -p verification/testbenches/<block-name>
   cd verification/testbenches/<block-name>
   ```

2. Create testbench schematic in xschem:
   - Instantiate your block
   - Add stimulus sources
   - Add measurement probes

3. Generate netlist from xschem

4. Run simulation:
   ```bash
   ngspice <block-name>_tb.spice
   ```

5. Verify functionality:
   - Check logic operation
   - Measure timing parameters
   - Verify across corners (TT, FF, SS)

6. Document results in a README.md in your testbench directory

#### 3.3 Characterization (CACE)

1. Create CACE configuration:
   ```bash
   mkdir -p design/blocks/<block-name>/char
   cd design/blocks/<block-name>/char
   ```

2. Create CACE characterization file (<block-name>.yaml)

3. Run characterization:
   ```bash
   cace <block-name>.yaml
   ```

4. Review results and ensure specifications are met

#### 3.4 Layout (KLayout)

1. Create layout directory:
   ```bash
   mkdir -p design/blocks/<block-name>/layout
   cd design/blocks/<block-name>/layout
   ```

2. Create layout in KLayout:
   ```bash
   klayout -e -nn $PDK_ROOT/sg13g2/libs.tech/klayout/tech/sg13g2.lyt
   ```

3. Layout guidelines:
   - Follow DRC rules
   - Minimize area while meeting specifications
   - Proper power/ground routing
   - Add guard rings where appropriate

4. Run DRC:
   - Tools > DRC > Run DRC
   - Fix all violations

5. Run LVS:
   - Tools > LVS > Run LVS
   - Ensure schematic matches layout

6. Save layout in GDS format

### 4. Documentation

Create or update `design/blocks/<block-name>/README.md` with:

1. **Block Description**: Brief overview of functionality
2. **Specifications**: Key parameters and requirements
3. **Design Approach**: How you implemented it
4. **Simulation Results**: Key measurements and plots
5. **Layout**: Screenshots and area report
6. **Issues/Notes**: Any challenges or design decisions

### 5. Version Control

Commit your work regularly:

```bash
# Add your files
git add design/blocks/<block-name>/
git add verification/testbenches/<block-name>/

# Commit with descriptive message
git commit -m "Add <block-name> schematic and simulation"

# Push to your branch
git push origin group-<N>/<block-name>
```

### 6. Pull Request

When your block is complete and verified:

1. Push your final changes
2. Go to GitHub repository
3. Create a Pull Request from your branch to `main`
4. Fill in the PR template:
   - Description of your work
   - Verification results
   - Screenshots
   - Any issues or notes

5. Request review from instructors
6. Address any review comments
7. Wait for approval and merge

### 7. Integration

After individual blocks are merged:

1. Integration team will combine blocks into top-level design
2. System-level verification will be performed
3. Any issues will be reported back to groups

## Best Practices

### Git Practices

- **Commit often**: Small, logical commits are better than large ones
- **Descriptive messages**: Clearly describe what changed and why
- **Don't commit binaries**: Use .gitignore for generated files
- **Pull before push**: Always pull latest changes before pushing

### Design Practices

- **Start simple**: Get basic functionality working first
- **Test early**: Don't wait until design is complete to simulate
- **Document as you go**: Don't leave documentation for the end
- **Ask for help**: Use GitHub Issues or discussions if stuck

### Collaboration

- **Communicate**: Use GitHub Issues/Discussions for questions
- **Coordinate**: If your block depends on another, coordinate with that group
- **Review**: Review other groups' PRs when possible
- **Share**: Share useful tips or findings with the class

## File Organization

Your block directory should look like:

```
design/blocks/<block-name>/
├── README.md              # Block documentation
├── schematic/
│   ├── <block-name>.sch   # xschem schematic
│   └── <block-name>.sym   # xschem symbol
├── char/
│   ├── <block-name>.yaml  # CACE config
│   └── results/           # CACE results
└── layout/
    └── <block-name>.gds   # KLayout layout

verification/testbenches/<block-name>/
├── README.md              # Simulation results
├── <block-name>_tb.sch    # Testbench schematic
├── <block-name>_tb.spice  # Testbench netlist
└── plots/                 # Simulation plots
```

## Timeline

Refer to the course schedule for specific deadlines. General timeline:

- **Week 1-2**: Setup, schematic design
- **Week 3-4**: Simulation and verification
- **Week 5-6**: Characterization
- **Week 7-8**: Layout
- **Week 9-10**: Integration and final verification

## Getting Help

- **GitHub Issues**: Create an issue for technical questions
- **GitHub Discussions**: For general questions or discussions
- **Pull Requests**: For code review and feedback
- **Course Forum**: Check the course website for forum link

## Deliverables Checklist

Before submitting your PR, ensure:

- [ ] Schematic complete and properly documented
- [ ] Symbol created for hierarchical use
- [ ] Testbench demonstrates all functionality
- [ ] Simulations pass across all corners
- [ ] Timing specifications met
- [ ] CACE characterization complete
- [ ] Layout complete with DRC/LVS clean
- [ ] README.md with complete documentation
- [ ] All files committed to git
- [ ] PR created with detailed description

## Common Issues

### Issue: xschem can't find PDK components
**Solution**: Ensure PDK_ROOT environment variable is set and xschemrc is configured

### Issue: ngspice simulation errors
**Solution**: Check netlist for proper syntax, verify all models are included

### Issue: Layout DRC violations
**Solution**: Review PDK design rules, check minimum spacing and width requirements

### Issue: LVS mismatch
**Solution**: Verify all connections in layout match schematic, check pin names

### Issue: Git conflicts
**Solution**: Pull latest changes, resolve conflicts manually, ask for help if needed

## References

- [xschem Tutorial](https://xschem.sourceforge.io/stefan/xschem_man/tutorial_xschem_step1.html)
- [ngspice Examples](http://ngspice.sourceforge.net/docs.html)
- [KLayout User Manual](https://www.klayout.de/doc-qt5/index.html)
- [Git Basics](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)
