/*
`timescale 1ns/1ps
module ex2_tb ();

    reg clk;
    reg A;
    always #5 clk = ~clk;

    initial begin
        A = 1'b0;
        clk = 0;
        #10;       
        A = 1'b1;
        #10
        A = 1'b0;
        #10
        $finish;
    end

   ex2_nonblock u_ex2_nonblock(   // 注意与RTL代码一致
         .clk(clk),
         .A(A),
         .F(F)
   );
endmodule
*/
`timescale 1ns/1ps
module ex2_tb ();

    reg clk;
    reg A;
    always #5 clk = ~clk;

    initial begin
        A = 1'b0;
        clk = 0;
        #10;       
        A = 1'b1;
        #10
        A = 1'b0;
        #10
        $finish;
    end

   ex2_nonblock u_ex2_block(   // 注意与RTL代码一致
         .clk(clk),
         .A(A),
         .F(F)
   );
endmodule
