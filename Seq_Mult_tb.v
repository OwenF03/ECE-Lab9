`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 03:05:02 PM
// Design Name: 
// Module Name: Seq_Mult_tb
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


module Seq_Mult_tb;

    reg [7:0] A;
    reg [7:0] B;
    reg clk;
    reg rst;
    reg enable;
    
    wire [15:0] res;
    wire ready;
    
    Seq_Mult dut(.A(A), .B(B), .clk(clk), .rst(rst), .enable(enable), .res(res), .ready(ready));
    
    always begin
        #1 clk = ~clk;
    end
    
    initial begin
        A <= 0;
        B <= 0;
        enable <= 1;
        rst <= 1;
        clk <= 0;
        #1 rst <= 0;
        
        #2 enable = 0; 
        #20 enable = 1;  A = 5; B = 1; 
        #2 enable = 0; 
        #20 enable = 1; A = 5; B = 5;
        #2 enable = 0;
        #20 enable = 1; A = 16; B = 5;
        #2 enable = 0;
        #20 enable = 1; A = 5; B = 16; 
        #2 enable = 0;  
        #20 enable = 1; A = 39; B = 255;
        #2 enable = 0;
        #20 enable = 1; A = 8'b11111111; B = 8'b11111111;
        #2 enable = 0;
        #20 enable = 1; A = 5; B = 5;
        #2 enable = 0;
        #8 rst = 1;
        
        
        #8 $finish;
    end
    
    

endmodule
