`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2016 10:07:48 PM
// Design Name: 
// Module Name: trigger_right
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


module trigger_right( input logic clk, input logic detected, output logic sigR);
    int count;
    int trigEnd = 6501200;
    int trigStart = 6500000;

    always@( posedge clk) begin
            if ( ((count <= trigEnd) & ( count >= trigStart )) && (detected == 1'b1) ) sigR = 1'b1;
            else sigR = 1'b0;
            
            if ( count <= trigEnd) count <= count + 1;
            else count <= 0;
    end
endmodule
