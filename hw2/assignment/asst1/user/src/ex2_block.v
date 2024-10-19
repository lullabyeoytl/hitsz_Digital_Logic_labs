module ex1_block(
    input  clk,
    output [3:0] data
);
    reg [3:0] cnt = 4'h0;   // 按规范是要在复位时给初值，这里做了简化
    assign data = cnt;
    always @(posedge clk)
    begin
        cnt = 5;
        cnt = cnt + 1'b1;
    end

endmodule