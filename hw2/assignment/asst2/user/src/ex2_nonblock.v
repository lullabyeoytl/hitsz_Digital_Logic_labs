module ex2_nonblock(
    input      clk,
    input      A,
    output reg F
);

    reg B;
    always @ (posedge clk) begin
        B <= A;
        F <= B;
    end

endmodule