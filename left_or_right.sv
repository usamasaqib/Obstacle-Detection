`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2016 01:43:16 AM
// Design Name: 
// Module Name: left_or_right
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


module leftOrRight( input int disR, input int disL, input logic detected, output logic turnRight, output logic turnLeft);
    int right;
    int left;
    
    always_comb begin 
        if ( (disR != 0) & (disL != 0) & (detected == 1'b1)) begin
            if ((disR >= disL)) begin turnRight = 1'b1; turnLeft = 1'b0;  end
            else if ( disL > disR) begin turnLeft = 1'b1; turnRight = 1'b0; end
            else if ( ( disL > 290000) & ( disR > 290000)) begin turnRight = 1'b1; turnLeft = 1'b0; end
            else begin turnRight = 1'b1; turnLeft = 1'b0; end
        end
        else begin 
                turnRight = 1'b0;
                turnLeft = 1'b0;
        end
    end
endmodule
