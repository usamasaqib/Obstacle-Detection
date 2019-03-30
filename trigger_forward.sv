`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2016 10:07:24 PM
// Design Name: 
// Module Name: trigger_forward
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

module trigger_forward( input logic clk, output logic sigF);
    int count;
    int trigEnd = 6501200;
    int trigStart = 6500000;

    always@( posedge clk) begin
            if ( (count <= trigEnd) & ( count >= trigStart )) begin 
            sigF = 1'b1;
            end
            else sigF = 1'b0;
            
            if ( count <= trigEnd) count <= count + 1;
            else count <= 0;
    end
    
    
endmodule
