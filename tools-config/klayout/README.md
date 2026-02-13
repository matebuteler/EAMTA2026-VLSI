# KLayout Configuration

This directory contains configuration files and guidelines for KLayout layout work.

## Technology File

The IHP SG13G2 PDK includes a KLayout technology file. It should be loaded automatically in the container.

Check with:
```bash
klayout -v
# Should show SG13G2 technology available
```

## Layer Properties

The SG13G2 PDK defines the following key layers (example subset):

| Layer | Name | GDS# | Purpose |
|-------|------|------|---------|
| Activ | Active | 1 | Active area |
| GatPoly | Gate | 5 | Polysilicon gate |
| Metal1 | M1 | 8 | First metal layer |
| Metal2 | M2 | 10 | Second metal layer |
| Via1 | V1 | 19 | Via between M1 and M2 |

Refer to the PDK documentation for complete layer definitions.

## DRC Check

To run Design Rule Check:

1. Open your layout in KLayout
2. Tools → DRC → Run DRC
3. Select the SG13G2 DRC deck
4. Run and review violations

Command line DRC:
```bash
klayout -b -r $PDK_ROOT/sg13g2/libs.tech/klayout/drc/sg13g2.lydrc \
  -rd input=your_layout.gds \
  -rd report=drc_report.xml
```

## LVS Check

To run Layout vs. Schematic:

1. Generate netlist from schematic (xschem)
2. Extract netlist from layout (KLayout)
3. Compare with LVS tool

Command line LVS:
```bash
klayout -b -r $PDK_ROOT/sg13g2/libs.tech/klayout/lvs/sg13g2.lylvs \
  -rd input=your_layout.gds \
  -rd schematic=your_schematic.spice \
  -rd report=lvs_report.xml
```

## Layout Guidelines

### General Rules

1. **Minimum width**: Follow PDK DRC for each layer
2. **Minimum spacing**: Follow PDK DRC for each layer
3. **Via rules**: Ensure proper via enclosure
4. **Metal density**: Meet density requirements
5. **Antenna rules**: Avoid antenna violations

### Best Practices

1. **Grid**: Always work on grid (0.005μm for SG13G2)
2. **Symmetry**: Keep symmetric layouts for matched devices
3. **Power routing**: Use wide metal for power/ground
4. **Guard rings**: Add guard rings for noise-sensitive circuits
5. **Decoupling**: Include decoupling capacitors near circuits

### Typical Device Sizing

For manual layout of transistors:

**NMOS (sg13_lv_nmos)**:
- Minimum L: 130nm (0.13μm)
- Typical W: 0.5μm - 10μm
- W/L ratio: Choose based on drive requirements

**PMOS (sg13_lv_pmos)**:
- Minimum L: 130nm (0.13μm)
- Typical W: 1μm - 20μm (typically 2-3× NMOS for balanced drive)

### Layout Hierarchy

Organize your layout hierarchically:
```
top_cell
├── block1_cell
│   ├── transistor_array
│   └── interconnect
├── block2_cell
└── power_grid
```

## Exporting

Export to GDS format:
```
File → Save As → GDS
```

Settings:
- Use PDK layer map
- Include all hierarchy
- Proper cell naming

## Common Issues

### Issue: DRC violations after initial layout

**Solution**: 
- Check minimum width/spacing
- Verify via enclosures
- Check metal density
- Review design rules

### Issue: LVS mismatch

**Solution**:
- Verify all connections
- Check pin names match schematic
- Ensure proper substrate/well connections
- Check device parameters (W, L)

### Issue: Layout is too large

**Solution**:
- Optimize placement
- Use tighter routing
- Consider device folding
- Remove unnecessary white space

## Keyboard Shortcuts

Useful KLayout shortcuts:
- `F2`: Fit in window
- `Shift+F2`: Fit selection
- `Ctrl+I`: Select instance
- `Ctrl+Shift+I`: Select all
- `E`: Edit mode
- `M`: Move
- `C`: Copy
- `Del`: Delete
- `R`: Rotate
- `X`: Mirror horizontally
- `Y`: Mirror vertically

## Tips

1. **Start with floorplan**: Plan your layout before detailed work
2. **Check DRC frequently**: Don't wait until the end
3. **Use rulers**: Measure distances for verification
4. **Save often**: KLayout can crash, save your work
5. **Use layers wisely**: Don't skip required layers
6. **Document**: Take screenshots of your layout

## References

- [KLayout Documentation](https://www.klayout.de/doc.html)
- [KLayout DRC Language](https://www.klayout.de/doc-qt5/about/drc_ref.html)
- [IHP SG13G2 PDK](https://github.com/IHP-GmbH/IHP-Open-PDK)
