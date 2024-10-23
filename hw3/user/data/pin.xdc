# 设置时钟约束
set_property PACKAGE_PIN Y18 [get_ports clk]      
set_property IOSTANDARD LVCMOS33 [get_ports clk]  

# 设置复位信号约束
set_property PACKAGE_PIN R1 [get_ports rst_n]      
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]  

# 设置开关输入信号约束
set_property PACKAGE_PIN W4 [get_ports {SW[0]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {SW[0]}]
set_property PACKAGE_PIN R4 [get_ports {SW[1]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {SW[1]}]
set_property PACKAGE_PIN T4 [get_ports {SW[2]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {SW[2]}]
set_property PACKAGE_PIN T5 [get_ports {SW[3]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {SW[3]}]
set_property PACKAGE_PIN U5 [get_ports {SW[4]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {SW[4]}]
set_property PACKAGE_PIN W6 [get_ports {SW[5]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {SW[5]}]
set_property PACKAGE_PIN W5 [get_ports {SW[6]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {SW[6]}]
set_property PACKAGE_PIN U6 [get_ports {SW[7]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {SW[7]}]

# 设置按键信号约束
set_property PACKAGE_PIN P1 [get_ports S2]         
set_property IOSTANDARD LVCMOS33 [get_ports S2]
set_property PACKAGE_PIN P5 [get_ports S3]         
set_property IOSTANDARD LVCMOS33 [get_ports S3]

# 设置段信号约束 (CA...CG)
set_property PACKAGE_PIN E13 [get_ports {seg[0]}]   
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN C15 [get_ports {seg[1]}]   
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN C14 [get_ports {seg[2]}]   
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN E17 [get_ports {seg[3]}]   
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN F16 [get_ports {seg[4]}]   
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN F14 [get_ports {seg[5]}]   
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN F13 [get_ports {seg[6]}]   
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN F15 [get_ports {seg[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[7]}]

# 设置使能信号约束 (A0...A7)
set_property PACKAGE_PIN C19 [get_ports {an[0]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN E19 [get_ports {an[1]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN D19 [get_ports {an[2]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN F18 [get_ports {an[3]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
set_property PACKAGE_PIN E18 [get_ports {an[4]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {an[4]}]
set_property PACKAGE_PIN B20 [get_ports {an[5]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {an[5]}]
set_property PACKAGE_PIN A20 [get_ports {an[6]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {an[6]}]
set_property PACKAGE_PIN A18 [get_ports {an[7]}]    
set_property IOSTANDARD LVCMOS33 [get_ports {an[7]}]
