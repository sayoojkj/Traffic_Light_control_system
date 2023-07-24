`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2023 19:40:52
// Design Name: 
// Module Name: tls
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


module tls(input clk,
           input rst,
           input C,
           input TS,
           input TL,
           output reg ST);
  reg[1:0] cstate,nstate;
  parameter S0=2'b00 ,S1=2'b01 ,S2=2'b10 ,S3=2'b11;
  always @(posedge clk or posedge rst)
    begin
      if(rst)
        cstate<=S0;
      else
        cstate<=nstate;
    end
  always@ (cstate,C,TS,TL)
    case(cstate)
      S0:begin
        nstate<=((~TL)|(~C))?S0:S1;
        ST<=(TL&C)?1:0;
      end
      S1:begin
        nstate<=(TS)?S2:S1;
        ST<=(TS)?1:0;
      end
      S2:begin
        nstate<=(TL+(~C))?S3:S2;
        ST<=(TL+(~C))?1:0;
      end
      S3:begin
        nstate<=(TS)?S0:S3;
        ST<=(TS)?1:0;
      end
      default:begin
        nstate<=S0;
        ST<=0;
      end
    endcase
endmodule

