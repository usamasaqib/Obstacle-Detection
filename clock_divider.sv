`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Bilkent University	
// Engineer: Usama Saqib 
// 
// Create Date: 11/27/2016 03:00:28 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider_motors( input logic clk, output logic clk_en);
    int count;
    logic [19:0]speed = 20'b1100001101010000000;
    
    always@( posedge clk) begin
        count <= count + 1;
        if ( count >= speed)
            count <= 0;
        if ( count == 0)
            clk_en = 1'b1;
        else 
            clk_en = 1'b0;
       end 
      
endmodule
