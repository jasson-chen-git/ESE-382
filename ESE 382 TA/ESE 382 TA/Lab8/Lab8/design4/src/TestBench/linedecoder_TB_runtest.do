SetActiveLib -work
comp -include "$dsn\src\decode3to8.vhd" 
comp -include "$dsn\src\input_latches.vhd" 
comp -include "$dsn\src\linedecoder.vhd" 
comp -include "$dsn\src\TestBench\linedecoder_TB.vhd" 
asim +access +r TESTBENCH_FOR_linedecoder 
wave 
wave -noreg le_bar
wave -noreg e1_bar
wave -noreg e2
wave -noreg a
wave -noreg y
run 3200.00 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\linedecoder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_linedecoder 
