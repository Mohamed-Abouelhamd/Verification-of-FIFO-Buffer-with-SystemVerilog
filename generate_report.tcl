vmap work work
vlog -coveropt 3 +cover +acc design.sv testbench.sv
vsim -coverage -vopt work.top -c -do "coverage save -onexit -directive -codeAll FIFO_test.ucdb; run -all"
vcover report -html FIFO_test.ucdb
vsim -coverage -vopt work.top -c -do "coverage save -onexit -directive -codeAll verification.ucdb; run -all"
  