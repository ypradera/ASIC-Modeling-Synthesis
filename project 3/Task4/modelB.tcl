# Fill with your directory path and library 
lappend search_path /u/ypradera/Desktop/Project_3/Task4
set target_library osu05_stdcells.db
set link_library [concat "*" $target_library]
link

read_file -format sverilog modelB.sv
current_design modelB
compile
report_area
report_cell
report_power
write -format Verilog -hierarchy -output modelB.netlist
link
