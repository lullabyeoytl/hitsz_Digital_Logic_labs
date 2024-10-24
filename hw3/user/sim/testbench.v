`timescale 1ns / 1ps
module testbench();
    reg clk;
    reg rst;
    reg hex0;
    reg hex1;
    reg [7:0] en;
    wire [7:0] seg;
    wire [7:0] an;
    //在clk_new.v中修改A=20,B=16,C=100作为仿真时的参数
    led_display_ctrl lc(.clk(clk),.SW(en),.rst_n(rst),.S2(hex0),.S3(hex1),.seg(seg),.an(an));
    always #5 clk=~clk;
    initial begin
        #5 begin en=8'b00000000; hex0=0; hex1=0; end 
        #30 begin en=8'b00000001;hex0=0; hex1=1; end
       #300 begin en=8'b00000010;hex0=0; hex1=0; end
        #300 begin en=8'b00000100;hex0=0; hex1=1; end
        #300 begin en=8'b00001000;hex0=1; hex1=0; end
        #300 begin en=8'b00010000;hex0=1; hex1=1; end
        #300 begin en=8'b00100000;hex0=1; hex1=0; end
        #300 begin en=8'b01000000;hex0=1; hex1=1; end
        #300 begin en=8'b10000000;hex0=1; hex1=0; end
        #300 $finish;
        #3000
        $finish;
    end
endmodule