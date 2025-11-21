`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 02:12:39 PM
// Design Name: 
// Module Name: Seq_Mult
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



module Seq_Mult(
        input wire [7:0] A,
        input wire [7:0] B,
        input wire clk,
        input wire rst,
        input wire enable,
        output reg [15:0] res,
        output reg ready
    );
    
    
    parameter idle = 2'b00;
    parameter multiplying = 2'b01;
    parameter done = 2'b10;
    
    
    reg [1:0] state;
    reg [2:0] ns;
    reg [2:0] count;
    
    
    
    

    
    reg [15:0] temp_output;
    reg [15:0] Multiplier;
    reg [7:0] Multiplicand;
    
    
    
    
    always@(posedge clk) begin
        if(rst == 1) begin
            count <= 0;
            temp_output <= 0;
            res <= 0;
            ready <= 0;
            ns <= 0;
            Multiplier <= 0;
            Multiplicand <= 0;
        end
        else begin
       
        case(state)
            idle: begin
                count <= 0;
                temp_output <= 0;
                
                if(!enable)
                    ns <= idle;
                else 
                    ns <= multiplying;
                    

                Multiplier[7:0] <= A;
                Multiplicand <= B;
                res <= res; 
                
                end
            
            multiplying: begin
                ready <= 0;
                if(Multiplicand[0])
                    temp_output = temp_output + Multiplier;
                
                Multiplier <= Multiplier << 1;
                Multiplicand <= {1'b0, Multiplicand[7:1]};
                
                if(count == 3'b111)
                    ns<=done;
                else begin
                    count <= count + 1;
                    ns <= multiplying;
                end
                
                end
            done: begin
                res <= temp_output;
                ready <= 1;
                count <= 0;
                temp_output <= 0;
                ns <= idle;
                Multiplier <= 0;
                Multiplicand <= 0;
                
                
                end
            
            default begin
                count <= 0;
                temp_output <= 0;
                res <= 0;
                ready <= 0;
                ns <= 0;
                Multiplier <= 0;
                Multiplicand <= 0;
            end
            
     
        endcase
        end
    end
    
    always@(negedge clk) begin
        if(rst) state <= 0; 
        else state <= ns;
    end
    
    
    
    
    
endmodule
