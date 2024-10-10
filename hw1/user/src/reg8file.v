module reg8file(
    input wire clk,
    input wire clr,
    input wire en,
    input wire [7:0] d ,
    input wire [2:0] wsel,
    input wire [2:0] rsel, 
    output reg[7:0] q
    );

    reg [7:0] register [7:0];

    integer i;

    always @(posedge clr or posedge clk) begin
        if (clr) begin
            for (i=0;i<8;i=i+1) begin
                register[i] <= 8'b0;
            end
        end
        else if (clk&&en) begin
            register[wsel] <= d;
        end
    end

    always @(*) begin
        q = register[rsel];
    end
endmodule
