`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 02:55:29 PM
// Design Name: 
// Module Name: combo_mult_tb
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


module combo_mult_tb();

    reg [7:0] a; 
    reg [7:0] b; 
    wire [15:0] res; 
    
    combo_mult DUT(.a(a), .b(b), .res(res));
     
    initial begin
        a = 0; b = 0; 
    end
    
    initial begin
        #2 a = 0; b = 0; 
        #2 a = 5; b = 1;
        #2 a = 5; b = 5;
        #2 a = 16; b = 5; 
        #2 a = 5; b = 16; 
        #2 a = 39; b = 255; 
        #2 a = 8'hFF; b = 8'hFF; 
        #2 $finish; 
    end
endmodule
