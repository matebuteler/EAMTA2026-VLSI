# Scripts

This directory contains automation scripts for the 4-bit counter project.

## Available Scripts

### setup_block.sh

Creates directory structure for a new block.

**Usage:**
```bash
./scripts/setup_block.sh <block-name>
```

**Example:**
```bash
./scripts/setup_block.sh dff
```

This creates:
- `design/blocks/dff/` with subdirectories for schematic, char, layout
- `verification/testbenches/dff/` with subdirectories for tests
- README templates for documentation

### Verification Scripts

Located in `verification/` subdirectory.

#### run_corners.sh

Runs corner simulations (TT, FF, SS) for a testbench.

**Usage:**
```bash
./scripts/verification/run_corners.sh <path-to-testbench.spice>
```

**Example:**
```bash
./scripts/verification/run_corners.sh verification/testbenches/dff/dff_tb.spice
```

This will:
1. Run simulation at TT corner (typical, 27°C)
2. Run simulation at FF corner (fast, -40°C)
3. Run simulation at SS corner (slow, 125°C)
4. Generate log files for each corner

## Adding New Scripts

When adding new scripts:

1. **Make them executable:**
   ```bash
   chmod +x scripts/your_script.sh
   ```

2. **Add usage instructions:**
   - Include a help message when run without arguments
   - Document parameters and examples

3. **Document in this README:**
   - Add script name and description
   - Include usage examples
   - Note any dependencies

4. **Follow conventions:**
   - Use bash for shell scripts
   - Add error checking
   - Provide informative output

## Script Ideas for Students

Students may want to create additional scripts for:

- Automated testing of their blocks
- Batch processing of simulations
- Report generation
- Layout automation
- Data extraction from simulation results

Place custom scripts in your block's directory or submit them for inclusion here.

## Tips

1. **Test scripts thoroughly** before relying on them
2. **Check file paths** - scripts assume they're run from project root
3. **Handle errors gracefully** - add error checking
4. **Make scripts reusable** - parameterize rather than hardcode
5. **Document dependencies** - note any required tools or packages

## Contributing

If you create a useful script, consider contributing it:

1. Test it thoroughly
2. Add clear documentation
3. Make it general-purpose
4. Submit a pull request

## References

- [Bash Scripting Guide](https://www.gnu.org/software/bash/manual/)
- [ngspice Batch Mode](http://ngspice.sourceforge.net/docs.html)
