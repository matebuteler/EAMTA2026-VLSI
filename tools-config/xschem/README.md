# xschem Configuration

This directory contains configuration files for xschem.

## xschemrc

The `xschemrc` file should be placed in your home directory or the project root to configure xschem for the IHP SG13G2 PDK.

Example configuration:

```tcl
#### xschem configuration for SG13G2 PDK

#### PDK paths
set PDK_ROOT $env(PDK_ROOT)
set PDK sg13g2

#### Library paths
append XSCHEM_LIBRARY_PATH :${PDK_ROOT}/${PDK}/libs.tech/xschem
append XSCHEM_LIBRARY_PATH :${PDK_ROOT}/${PDK}/libs.ref/sg13_stdcell/xschem

#### Simulation setup
set netlist_dir ./simulation
set simulate_dir ./simulation

#### Colors and appearance
set dark_colorscheme 1
set light_colors {
  "#ffffff" "#0044ee" "#aaaaaa" "#222222" "#229900"
  "#bb2200" "#00ccee" "#ff0000" "#888800" "#00aaaa"
  "#880088" "#00ff00" "#0000cc" "#666600" "#557755"
  "#aa2222" "#7ccc40" "#00ffcc" "#ce0097"
}
```

## Setup Instructions

1. In the container, check if PDK_ROOT is set:
   ```bash
   echo $PDK_ROOT
   ```

2. Create or edit `~/.xschem/xschemrc`:
   ```bash
   mkdir -p ~/.xschem
   cp tools-config/xschem/xschemrc.example ~/.xschem/xschemrc
   ```

3. Verify xschem can find PDK libraries:
   ```bash
   xschem
   # File → New Schematic
   # Insert → choose library → should see sg13g2 libraries
   ```

## Troubleshooting

**Issue**: xschem can't find PDK libraries

**Solution**: 
- Verify PDK_ROOT environment variable
- Check paths in xschemrc
- Ensure you're in the container with the PDK installed

**Issue**: Netlisting fails

**Solution**:
- Check that ngspice models path is correct
- Verify PDK installation is complete
- Check netlist directory permissions

## References

- [xschem Documentation](https://xschem.sourceforge.io/stefan/index.html)
- [IHP SG13G2 PDK](https://github.com/IHP-GmbH/IHP-Open-PDK)
