`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2023 20:26:25
// Design Name: 
// Module Name: tls_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tls_tb;
    reg clk,rst,C,TS,TL;
    wire ST;
    
    tls dut(clk,rst,C,TS,TL,ST);
    always #5 clk=~clk;
    initial begin
        #0 rst=1; C=0; clk=0; #5 rst=0;
        #20 TL=1; C=1; TS=0;  #40 TL=0; C=0; TS=0;
        #60 TL=0; C=1; TS=1;  #80 TL=1; C=0; TS=0;  
        #100 TL=0; C=0; TS=1; #120 $finish;   
    end
    initial begin
        $monitor("t=%t,TL=%b,TS=%b,C=%b,ST=%b",$time,TL,TS,C,ST);
        $dumpfile("tls.vcd");
        $dumpvars(0);
    end
endmodule
