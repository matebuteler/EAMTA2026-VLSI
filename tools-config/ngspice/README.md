# ngspice Configuration

This directory contains configuration and reference files for ngspice simulations.

## Basic Simulation Template

Here's a basic template for ngspice simulations:

```spice
* Testbench for <block_name>
* Date: <date>
* Author: <name>

.title <Block Name> Testbench

* Include PDK models
.lib '$PDK_ROOT/sg13g2/libs.tech/ngspice/models/sg13_lv_models.lib' typical

* Power supply
Vdd vdd 0 DC 1.2
Vss vss 0 DC 0

* Include your circuit netlist here
.include <block_name>.spice

* Stimulus
Vclk clk 0 PULSE(0 1.2 0 100p 100p 5n 10n)
Vrst rst 0 PULSE(1.2 0 20n 100p 100p 100n 0)

* Load capacitance
Cload out 0 20f

* Instantiate your block
Xdut clk rst out vdd vss <block_name>

* Analysis
.tran 10p 100n

* Measurements
.measure tran tpd_rise 
+ TRIG v(clk)=0.6 RISE=2
+ TARG v(out)=0.6 RISE=1

.measure tran tpd_fall
+ TRIG v(clk)=0.6 FALL=2
+ TARG v(out)=0.6 FALL=1

* Control block
.control
run
plot v(clk) v(rst) v(out)
print tpd_rise tpd_fall
.endc

.end
```

## Corner Simulation Template

```spice
* Corner simulation template

.title <Block Name> Corner Analysis

* Sweep through corners
* Typical corner
.lib '$PDK_ROOT/sg13g2/libs.tech/ngspice/models/sg13_lv_models.lib' typical

* For FF corner, use:
* .lib '$PDK_ROOT/sg13g2/libs.tech/ngspice/models/sg13_lv_models.lib' fast

* For SS corner, use:
* .lib '$PDK_ROOT/sg13g2/libs.tech/ngspice/models/sg13_lv_models.lib' slow

* Rest of netlist...

.control
* Set temperature for corner
* TT: 27°C, FF: -40°C, SS: 125°C
set temp=27

run
* Your measurements
.endc

.end
```

## Power Analysis Template

```spice
* Power analysis template

.title <Block Name> Power Analysis

.lib '$PDK_ROOT/sg13g2/libs.tech/ngspice/models/sg13_lv_models.lib' typical

* Power supply with current measurement
Vdd vdd 0 DC 1.2
Vss vss 0 DC 0

* Your circuit here

* Analysis
.tran 10p 1u

.control
run
* Measure average current
meas tran idd_avg AVG i(vdd) FROM=100n TO=1u
* Calculate power
let pwr_dynamic = idd_avg*1.2
print pwr_dynamic
.endc

.end
```

## Useful ngspice Commands

Interactive mode:
```bash
ngspice
ngspice 1 -> source testbench.spice
ngspice 2 -> run
ngspice 3 -> plot v(out)
ngspice 4 -> quit
```

Batch mode:
```bash
ngspice -b testbench.spice -o output.log
```

## Measurement Commands

Common `.measure` commands:

```spice
* Find a value at a specific time
.measure tran vout_10n FIND v(out) AT=10n

* Measure delay between two signals
.measure tran delay 
+ TRIG v(in)=0.6 RISE=1
+ TARG v(out)=0.6 RISE=1

* Measure average value
.measure tran vavg AVG v(out) FROM=10n TO=100n

* Measure RMS value
.measure tran vrms RMS v(out) FROM=10n TO=100n

* Measure maximum value
.measure tran vmax MAX v(out)

* Measure minimum value
.measure tran vmin MIN v(out)
```

## Tips

1. **Use appropriate time steps**: For digital circuits, use small time steps (10p-100p)
2. **Set proper simulation time**: Long enough to capture behavior, short enough to run quickly
3. **Add measurements**: Always measure key parameters automatically
4. **Save plots**: Use `gnuplot` output for reports
5. **Check convergence**: If simulation doesn't converge, try:
   - Smaller time steps
   - Different solver options
   - Check for floating nodes

## References

- [ngspice Manual](http://ngspice.sourceforge.net/docs/ngspice-html-manual/manual.xhtml)
- [Measurement Commands](http://ngspice.sourceforge.net/docs/ngspice-html-manual/manual.xhtml#magicparlabel-85989)
