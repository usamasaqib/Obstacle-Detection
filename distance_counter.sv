`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2016 03:29:36 PM
// Design Name: 
// Module Name: distance_counter
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


module distance_counter( input logic clk, input logic disStart, output logic detected, output logic run);
    int count;
    int dis;
    logic true;
    
    always@( posedge clk) begin
        if ( disStart) begin
            count <= count + 1;
            detected <= 1'b0;
            run <= 1'b0;
            true <= 1'b0;
        end
        else if ( (disStart != 1'b1) & count > 0)begin
            dis = count;
            if (dis < 116000 )
                if (dis > 17400) begin
                    detected <= 1'b1;
                    run <= 1'b1;
                end
                else begin
                    detected <= 1'b0;
                    run <= 1'b0;
                end
            else begin detected <= 1'b0; run <= 1'b0; end
            count <= 0;
            true <= 1'b1;
        end
    end 
       
    /*always_comb begin
        if ( (disStart != 1'b1) && (true == 1'b1) ) begin
            distance = dis;
        end
        else distance = 16'b0;
    end*/
      
endmodule
