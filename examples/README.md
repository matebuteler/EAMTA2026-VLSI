# Examples

This directory contains example implementations to help students understand the design flow.

## Available Examples

### inv_example/

A simple CMOS inverter demonstrating:
- Block directory structure
- Basic documentation
- How to organize files

**Note**: This is a placeholder example. Students should refer to xschem and PDK documentation for actual circuit design.

## Purpose

These examples serve as:
1. **Templates**: Show proper file organization
2. **Reference**: Demonstrate documentation style
3. **Learning aids**: Help understand the workflow

## What's Included

Each example includes:
- Block README with description and specifications
- Directory structure for schematic, characterization, and layout
- Documentation templates

## What's NOT Included

Due to the nature of this repository, examples do NOT include:
- Actual xschem schematics (.sch files)
- Actual ngspice simulation files
- Actual KLayout layouts

Students should create these files following the PDK guidelines and tool documentation.

## How to Use

1. **Review structure**: See how directories are organized
2. **Read documentation**: Understand what information to include
3. **Adapt for your block**: Use as a template for your own work
4. **Don't copy blindly**: Your block will have different requirements

## Creating More Examples

If you create a good reference implementation that could help other students:

1. Ensure it's complete and well-documented
2. Remove any sensitive or proprietary information
3. Submit as a pull request to add to examples/

## Learning Path

Suggested order for learning:

1. **Read**: [GETTING_STARTED.md](../docs/GETTING_STARTED.md)
2. **Explore**: Review example structures here
3. **Practice**: Try xschem tutorials and PDK examples
4. **Design**: Start your assigned block
5. **Verify**: Follow verification plan
6. **Document**: Write comprehensive documentation

## External Resources

For actual circuit examples, refer to:
- xschem example library (built into tool)
- IHP SG13G2 PDK example circuits
- Course materials and lectures
- Tool documentation and tutorials

## Tips

1. **Start small**: Understand simple examples before complex ones
2. **Ask questions**: Use GitHub Issues if something is unclear
3. **Share knowledge**: Help other students when you figure things out
4. **Document discoveries**: If you find useful techniques, document them

## References

- [STUDENT_WORKFLOW.md](../docs/STUDENT_WORKFLOW.md)
- [DESIGN_SPECIFICATIONS.md](../docs/DESIGN_SPECIFICATIONS.md)
- xschem: Launch with `xschem` and explore File → Examples
- IHP SG13G2 PDK: Check `$PDK_ROOT/sg13g2/libs.ref/` for examples
