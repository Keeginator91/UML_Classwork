* rlc_circuit


* netlist with resistor, capacitor and inductor
*node 0 is ground

R0 Vac 2 250
C0 2 output 50u
L0 output 0 50u

* input AC signal
V0 Vac 0 dc 0 ac 2 sin(0 2 50k)

* do a transient simulation from 0us to 200us on 0.01us steps
.tran 0.01u 0200u 0u

.control
* control block
run
plot vac output

*perform ac singal analysis
ac dec 10 0.01 100MEG
plot vm(output) vp(output) xlog
.endc
.end

