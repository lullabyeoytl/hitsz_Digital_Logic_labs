// top.v
module top(
    input clk,             // 100MHz时钟
    input rst,             // 异步复位按钮S1
    input button,          // 启停切换按钮S2
    input [1:0] freq_set,  // 频率设置拨码开关SW1-SW0
    input dir_set,         // 方向设置拨码开关SW23
    output [7:0] led       // 输出到LED GLD7~GLD0
);
    wire clk_div;

    // 实例化时钟分频模块
    clock_divider clock_div_inst (
        .clk(clk),
        .freq_set(freq_set),
        .clk_out(clk_div)
    );

    // 实例化控制模块
    control control_inst (
        .rst(rst),
        .button(button),
        .dir_set(dir_set),
        .clk_div(clk_div),
        .led(led)
    );
endmodule