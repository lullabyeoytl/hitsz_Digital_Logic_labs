## 时钟信号
set_property PACKAGE_PIN Y18 [get_ports clk]   
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## 复位信号 (按键S1)
set_property PACKAGE_PIN R1 [get_ports rst]    
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## 启停切换按键 (按键S2)
set_property PACKAGE_PIN P1 [get_ports button] 
set_property IOSTANDARD LVCMOS33 [get_ports button]

## 频率设置 (拨码开关SW1-SW0)
set_property PACKAGE_PIN W4 [get_ports {freq_set[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {freq_set[0]}]

set_property PACKAGE_PIN R4 [get_ports {freq_set[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {freq_set[1]}]

## 方向设置 (拨码开关SW23)
set_property PACKAGE_PIN Y9 [get_ports dir_set] 
set_property IOSTANDARD LVCMOS33 [get_ports dir_set]

## LED信号 (连接到LED灯GLD7~GLD0)
set_property PACKAGE_PIN N19 [get_ports {led[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN N20 [get_ports {led[1]}]  
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property PACKAGE_PIN M20 [get_ports {led[2]}]  
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property PACKAGE_PIN K13 [get_ports {led[3]}]  
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

set_property PACKAGE_PIN K14 [get_ports {led[4]}]  
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]

set_property PACKAGE_PIN M13 [get_ports {led[5]}]  
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]

set_property PACKAGE_PIN L13 [get_ports {led[6]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]

set_property PACKAGE_PIN K17 [get_ports {led[7]}]  
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
