// clock_divider.v
module clock_divider(
    input clk,             // 100MHz板载时钟
    input [1:0] freq_set,  // 频率设置，SW1-SW0
    output reg clk_out     // 输出分频时钟
);
    reg [31:0] counter;
    reg [31:0] count_max;

    always @(*) begin
        case(freq_set)
            2'b00: count_max = 1000000 - 1;  // 0.01s -> 100Hz
            2'b01: count_max = 10000000 - 1; // 0.1s -> 10Hz
            2'b10: count_max = 25000000 - 1; // 0.25s -> 4Hz
            2'b11: count_max = 50000000 - 1; // 0.5s -> 2Hz
            default: count_max = 1000000 - 1;
        endcase
    end

    always @(posedge clk) begin
        if (counter >= count_max) begin
            counter <= 0;
            clk_out <= ~clk_out;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule
