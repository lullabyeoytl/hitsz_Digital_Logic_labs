`timescale 1ns / 100ps


module tb_top;
    reg clk;                 // 100MHz时钟信号
    reg rst;                 // 异步复位信号
    reg button;              // 启停切换按钮
    reg [1:0] freq_set;      // 频率设置
    reg dir_set;             // 方向设置
    wire [7:0] led;          // 输出到LED

    task set_clk_freq(input integer freq);
    begin
        clk=0;
        forever #freq clk=~clk;
    end
    endtask
     
    task set_led_pattern(input integer num);
        begin
            #1000000 
            rst = 0; // 
            button = 1; 
            #1000000000 freq_set = num; // 10Hz
            #1000000 
            button = 0; // 启动
            rst = 1; // 复位
        end
    endtask
    // 实例化顶层模�??
    top uut (
        .clk(clk),
        .rst(rst),
        .button(button),
        .freq_set(freq_set),
        .dir_set(dir_set),
        .led(led)
    );
    
    initial begin
        set_clk_freq(10); // 设置时钟频率为100MHz
    end

    // 测试流程
    initial begin
        // 初始化信�???
        rst = 1;          // 复位信号
        button = 0;       // 启停按钮初始�???0
        freq_set = 2'b00; // 初始频率设置�???100Hz
        dir_set = 0;      // 初始方向设置为右
        
        set_led_pattern(2'b00); // 设置LED输出模式为10Hz
        set_led_pattern(2'b01); // 设置LED输出模式为100Hz
        set_led_pattern(2'b10); // 设置LED输出模式为4Hz
        set_led_pattern(2'b11); // 设置LED输出模式为2Hz

        #10
        button = 1; // 启动
        #1000000000 dir_set = 1; // 方向设置为左
        
        #1000 $stop;
    end

    // 监视LED输出
    initial begin
        $monitor("Time: %0t | LED: %b | freq_set: %b | dir_set: %b", $time, led, freq_set, dir_set);
    end

    // 计数器最大值计算
    initial begin
        // 计算不同频率下的计数器最大值
        $display("频率设置  |  计数器最大�??  |  计算过程");
        $display("100Hz     |   999999       |  100MHz/100Hz - 1 = 1000000 - 1");
        $display("10Hz      |   9999999      |  100MHz/10Hz - 1 = 10000000 - 1");
        $display("4Hz       |   24999999     |  100MHz/4Hz - 1 = 25000000 - 1");
        $display("2Hz       |   49999999     |  100MHz/2Hz - 1 = 50000000 - 1");
    end
endmodule
