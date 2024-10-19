`timescale 1ns / 1ps
/*
module ex1_tb;
  reg clk = 0;
  wire [3:0] data;

  ex1_block  u_ex1_block (  // 注意与RTL代码一致
    .clk(clk),
    .data(data)
  );

always #5  clk = ! clk ;
endmodule
*/

module ex1_tb;
  reg clk = 0;
  wire [3:0] data;

  ex1_nonblock  u_ex1_nonblock (  // 注意与RTL代码一致
    .clk(clk),
    .data(data)
  );

always #5  clk = ! clk ;
endmodule
