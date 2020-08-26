# Fill with your directory path and library 
lappend search_path /u/ypradera/Desktop/Project_3/Task3
set target_library osu05_stdcells.db
set link_library [concat "*" $target_library]
link

read_file -format sverilog adder_sub.sv
current_design adder_sub
compile
report_area
report_cell
report_power
write -format Verilog -hierarchy -output adder_sub.netlist
link
