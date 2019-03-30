`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2016 08:07:48 PM
// Design Name: 
// Module Name: distance_counterR
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


module distance_counterR( input logic clk, input logic detect, input logic disStart, output int distance);
    int count;
    int dis;
    logic true;
    
    always@( posedge clk) begin
        if ( (disStart == 1'b1) & (detect == 1'b1) ) begin
            count <= count + 1;
            true <= 1'b0;
        end
        else if ( (disStart != 1'b1) & count > 0)begin
            dis = count;
            count <= 0;
            true <= 1'b1;
        end
    end 
       
    always_comb begin
        if ( (disStart != 1'b1) & (true == 1'b1) ) begin
            distance = dis;
        end
        else distance = 0;
    end
      
endmodule
