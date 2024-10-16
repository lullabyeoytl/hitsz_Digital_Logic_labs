// control.v
module control(
    input rst,             // 异步复位
    input button,          // 启停切换
    input dir_set,         // 方向设置，SW23
    input clk_div,         // 分频后的时钟
    output reg [7:0] led   // 输出的LED
);
    reg [7:0] led_pattern; // 当前的LED状态
    reg running;           // 标记是否正在运行
    reg [7:0] next_led;

    // 异步复位
    always @(posedge clk_div or posedge rst) begin
        if (rst) begin
            led_pattern <= 8'b00000001;  // 初始化流水灯状态
            running <= 0;                // 停止流水灯
        end else if (button) begin
            running <= ~running;         // 切换启停状态
        end else if (running) begin
            // 根据dir_set控制方向
            if (dir_set) begin
                led_pattern <= {led_pattern[6:0], led_pattern[7]}; // 向左移
            end else begin
                led_pattern <= {led_pattern[0], led_pattern[7:1]}; // 向右移
            end
        end
    end

    // 将状态输出到LED
    always @(*) begin
        led = led_pattern;
    end
endmodule