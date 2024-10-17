`timescale 1ns / 1ps

module tb_top;
    reg clk;                 // 100MHz时钟信号
    reg rst;                 // 异步复位信号
    reg button;              // 启停切换按钮
    reg [1:0] freq_set;      // 频率设置
    reg dir_set;             // 方向设置
    wire [7:0] led;          // 输出到LED

    // 实例化顶层模块
    top uut (
        .clk(clk),
        .rst(rst),
        .button(button),
        .freq_set(freq_set),
        .dir_set(dir_set),
        .led(led)
    );

    // 时钟生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz时钟周期
    end

    // 测试流程
    initial begin
        // 初始化信号
        rst = 1;
        button = 0;
        freq_set = 2'b00; // 初始频率设置为100Hz
        dir_set = 0;      // 初始方向设置

        // 复位
        #10 rst = 0;

        // 清晰地展示不同频率的测试
        // 1. 测试100Hz
        #10 freq_set = 2'b00; // 设置频率为100Hz
        #10 button = 1; // 切换到运行状态
        #10 button = 0; // 释放按钮
        #2000; // 观察100Hz输出（2000ns大约为20个周期）

        // 2. 测试10Hz
        #10 freq_set = 2'b01; // 设置频率为10Hz
        #10 button = 1; // 切换到运行状态
        #10 button = 0; // 释放按钮
        #10000; // 观察10Hz输出（10000ns大约为100个周期）

        // 3. 测试4Hz
        #10 freq_set = 2'b10; // 设置频率为4Hz
        #10 button = 1; // 切换到运行状态
        #10 button = 0; // 释放按钮
        #25000; // 观察4Hz输出（25000ns大约为250个周期）

        // 4. 测试2Hz
        #10 freq_set = 2'b11; // 设置频率为2Hz
        #10 button = 1; // 切换到运行状态
        #10 button = 0; // 释放按钮
        #50000; // 观察2Hz输出（50000ns大约为500个周期）

        // 结束仿真
        #10 $finish;
    end

    // 监视LED输出
    initial begin
        $monitor("Time: %0t | LED: %b | freq_set: %b | dir_set: %b", $time, led, freq_set, dir_set);
    end

endmodule
