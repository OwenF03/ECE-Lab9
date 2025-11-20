`timescale 1ns / 1ps

module combo_mult(input wire [7:0] a, input wire [7:0] b, output wire [15:0] res);

    
    
    wire [15:0] m [7:0];
    wire [15:0] sums [7:0];
     
    genvar i; 
    generate 
        for(i = 0; i < 8; i = i + 1) begin
            assign m[i] = (a[i] != 0) ? ({{8'b0}, b} << i) : 16'b0;
        end
    endgenerate
    
    assign res = m[0] + m[1] + m[2] + m[3] + m[4] + m[5] + m[6] + m[7];
    
endmodule
