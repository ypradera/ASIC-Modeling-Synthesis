## Run Script



read_verilog MY_DESIGN.v
current_design MY_DESIGN 
link
check_design

#write your timing constraints here
create_clock [get_ports clk]  -period 3  -waveform {0 1.5}
set_clock_latency -max 0.3  [get_clocks clk]
set_clock_latency -source -max 0.7  [get_clocks clk]
set_clock_latency -max 0.3  [get_clocks clk]
set_clock_uncertainty -setup 0.15  [get_clocks clk]
set_clock_transition -min -fall 0.12 [get_clocks clk]
set_clock_transition -min -rise 0.12 [get_clocks clk]
set_input_delay -clock clk  -max 0.45  [get_ports {data1[4]}]
set_input_delay -clock clk  -max 0.45  [get_ports {data1[3]}]
set_input_delay -clock clk  -max 0.45  [get_ports {data1[2]}]
set_input_delay -clock clk  -max 0.45  [get_ports {data1[1]}]
set_input_delay -clock clk  -max 0.45  [get_ports {data1[0]}]
set_input_delay -clock clk  -max 0.45  [get_ports {data2[4]}]
set_input_delay -clock clk  -max 0.45  [get_ports {data2[3]}]
set_input_delay -clock clk  -max 0.45  [get_ports {data2[2]}]
set_input_delay -clock clk  -max 0.45  [get_ports {data2[1]}]
set_input_delay -clock clk  -max 0.45  [get_ports {data2[0]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Cin1[4]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Cin1[3]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Cin1[2]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Cin1[1]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Cin1[0]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Cin2[4]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Cin2[3]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Cin2[2]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Cin2[1]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Cin2[0]}]
set_output_delay -clock clk  -max 0.5  [get_ports {out1[4]}]
set_output_delay -clock clk  -max 0.5  [get_ports {out1[3]}]
set_output_delay -clock clk  -max 0.5  [get_ports {out1[2]}]
set_output_delay -clock clk  -max 0.5  [get_ports {out1[1]}]
set_output_delay -clock clk  -max 0.5  [get_ports {out1[0]}]
set_output_delay -clock clk  -max 2.04  [get_ports {out2[4]}]
set_output_delay -clock clk  -max 2.04  [get_ports {out2[3]}]
set_output_delay -clock clk  -max 2.04  [get_ports {out2[2]}]
set_output_delay -clock clk  -max 2.04  [get_ports {out2[1]}]
set_output_delay -clock clk  -max 2.04  [get_ports {out2[0]}]
set_output_delay -clock clk  -max 0.4  [get_ports {out3[4]}]
set_output_delay -clock clk  -max 0.4  [get_ports {out3[3]}]
set_output_delay -clock clk  -max 0.4  [get_ports {out3[2]}]
set_output_delay -clock clk  -max 0.4  [get_ports {out3[1]}]
set_output_delay -clock clk  -max 0.4  [get_ports {out3[0]}]
set_output_delay -clock clk  -max 0.1  [get_ports {Cout[4]}]
set_output_delay -clock clk  -max 0.1  [get_ports {Cout[3]}]
set_output_delay -clock clk  -max 0.1  [get_ports {Cout[2]}]
set_output_delay -clock clk  -max 0.1  [get_ports {Cout[1]}]
set_output_delay -clock clk  -max 0.1  [get_ports {Cout[0]}]
set compile_inbound_cell_optimization false
set compile_inbound_max_cell_percentage 10.0


check_timing
report_clock


write_script -out my_design.wscr

write -format ddc -hier -out unmapped_design.ddc
exit
