$example HSPICE setup file

$transistor model
.include "/proj/cad/library/mosis/GF65_LPe/cmos10lpe_CDS_oa_dl064_11_20160415/models/YI-SM00030/Hspice/models/design.inc"
.include "d_ff.pex.netlist"


.option post runlvl=5

xi GND! Q VDD! CLK R D S d_ff

vdd VDD! GND! 1.2v
vin CLK GND! pwl(0ns 1.2v 1ns 1.2v 1.075ns 0v 2ns 0v 2.075ns 1.2v 3ns 1.2v 3.075ns 0v 4ns 0v 4.075ns 1.2v 5ns 1.2v 5.075ns 0v 6ns 0v 6.075ns 1.2v 7ns 1.2v 7.075ns 0v 8ns 0v 8.075ns 1.2v 9ns 1.2v 9.075ns 0v 10ns 0v 10.075ns 1.2v 11ns 1.2v 11.075ns 0v 12ns 0v)

vinR R GND! pwl(0ns 1.2v 1ns 1.2v 1.08ns 0v 6ns 0v 8ns 0v 12ns 0v)
vinD D GND! pwl(0ns 0v 'test' 0v 'test+80ps' 1.2v)
vinS S GND! pwl(0ns 0v 1ns 0v 1.08ns 0v 6ns 0v 8ns 0v 12ns 0v)


cout Q GND! 70f

$transient analysis
.TRAN 1ps 12ns sweep test 2800ps 3000ps 60ps 

$example of parameter sweep, replace numeric value W of pfet with WP in invlvs.sp
$.tr 1ps 12ns sweep WP 1.616u 9u 0.0.899u test 2.9ns 3.1ns 10ps

.measure tsu trig v(D) val=0.6v rise=1 targ v(CLK) val=0.6v fall=2
.measure tclk_q trig v(CLK) val=0.6 fall=2 targ v(Q) val=0.6 rise=1 
.measure tran delay param = 'tsu + tclk_q'

.end
