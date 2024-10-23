`define student_id  12
module led_display_ctrl (
    input wire clk,           
    input wire rst_n,         
    input wire [7:0] SW,      
    input wire S2,            
    input wire S3,            
    output wire [7:0] seg,    
    output wire [7:0] an      
);
    
    // DK5-DK4: 
    reg [3:0] sw_count;
    always @(*) begin
        sw_count = SW[0] + SW[1] + SW[2] + SW[3] + SW[4] + SW[5] + SW[6] + SW[7];
    end

    // DK3-DK2: 
    reg [3:0] press_count;
    reg S3_prev;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            press_count <= 0;
            S3_prev <= 0;
        end else if (S3 && !S3_prev) begin
            press_count <= press_count + 1;
        end
        S3_prev <= S3;
    end

    // DK1-DK0: 
    reg [4:0] counter;
    reg [23:0] cnt_100ms;
    reg counting;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            cnt_100ms <= 0;
            counting <= 1;
        end else if (S2 && counter == 20) begin
            counter <= 0;
            counting <= 1;
        end else if (counting && cnt_100ms == 24'd10_000_000) begin  // 0.1秒计数
            cnt_100ms <= 0;
            if (counter < 20)
                counter <= counter + 1;
            else
                counting <= 0;  // 计数到20后停止
        end else begin
            cnt_100ms <= cnt_100ms + 1;
        end
    end

    // 数码管显示模块
    seg_display display (
        .clk(clk),
        .rst_n(rst_n),
        .sw_count(sw_count),         // DK5-DK4
        .press_count(press_count),   // DK3-DK2
        .counter(counter),           // DK1-DK0
        .seg(seg),
        .an(an)
    );
endmodule

module seg_display (
        input wire clk,
        input wire rst_n,
        input wire [3:0] sw_count,
        input wire [3:0] press_count,
        input wire [4:0] counter,
        output reg [7:0] seg,   // 数码管7段显示输出
        output reg [7:0] an     // 数码管位选输出
    );

    reg [2:0] current_digit; // 当前显示的数码管编号
    reg [23:0] refresh_counter; // 刷新计数器
    reg [7:0] segment_data [0:7]; // 存储每个数码管的段信号


    // 生成每个数码管对应的段信号
    always @(*) begin
        // 数字的段信号定义
        segment_data[0] = 8'h03; // 0
        segment_data[1] = 8'h9F; // 1
        segment_data[2] = 8'b00100101; // 2 
        segment_data[3] = 8'b00001101; // 3
        segment_data[4] = 8'b10011001; // 4
        segment_data[5] = 8'b01001001; // 5
        segment_data[6] = 8'b01000001; // 6
        segment_data[7] = 8'b00011111; // 7
        segment_data[8] = 8'b00000001; // 8
        segment_data[9] = 8'b00011001; // 9
    end

    // 每2ms更新显示
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_digit <= 0;
            refresh_counter <= 0;
            an <= 8'hFF; // 默认关闭所有数码管
            seg <= 8'hFF; // 默认关闭所有段
        end
        else begin
            // 刷新计数器，每2ms更新一次
            if (refresh_counter < 24'd10_000_000) begin
                refresh_counter <= refresh_counter + 1;
            end
            else begin
                refresh_counter <= 0;
                // 轮询显示每个数码管
                if (current_digit < 8) begin
                    an <= 8'b11111111; // 关闭所有数码管
                    an[current_digit] <= 0; // 使能当前数码管
                   
                    case (current_digit)
                        0:seg<= segment_data[counter%10];
                        1:seg<= segment_data[counter/10];
                        2:seg<= segment_data[press_count%10];
                        3:seg<= segment_data[press_count/10];
                        4:seg<= segment_data[sw_count%10];
                        5:seg<= segment_data[sw_count/10];
                        6:seg<= segment_data[`student_id%10];
                        7:seg<= segment_data[`student_id/10];
                        default : seg<= 8'hFF; // 关闭所有段
                    endcase                 
                    current_digit <= current_digit + 1;
                end
                else begin
                    current_digit <= 0; // 重置
                end
            end
        end
    end


endmodule
