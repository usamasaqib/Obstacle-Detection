`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Bilkent University	
// Engineer: Usama Saqib
// 
// Create Date: 11/26/2016 08:25:27 PM
// Design Name: 
// Module Name: motors
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

module motors(  input logic clk, input logic start,
                    input logic distanceF, distanceR, distanceL, 
                    output logic sigF, sigR, sigL,
                    output logic [3:0] signalL,
                    output logic obstacle, turnRight, turnLeft,
                    output logic a, b, c, d, e, h, g, dp,
                    output logic [3:0]an);
                    
    typedef enum logic [3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8} statetype;
    statetype state, nextstate;
    logic clk_en;
    int disR;
    int disL;
    logic detected;
    int countRight;
    int countLeft;
    logic right;
    
    
    trigger_forward t_f( clk, sigF);
    distance_counter dCount( clk, distanceF, detected, obstacle);
    
    trigger_right t_r( clk, detected, sigR);
    trigger_left t_l( clk, detected, sigL);
    distance_counterR dcR( clk, detected, distanceR, disR);
    distance_counterL dcL( clk, detected, distanceL, disL);
    
    clock_divider_motors instanceClock( clk, clk_en);
    SevSeg_4digit disp1( clk, 2'd0, 2'd0, 2'd0, ~detected, a, b, c, d, e, h, g, dp, an);
    leftOrRight lor( disR, disL, detected, turnRight, turnLeft);
    
    //state register
    always_ff@(posedge clk_en, posedge start)
        if ( !start) state <= S0;//start != 1'b1) state <= S0;
        else state <= nextstate;
        
    //nextstate logic
            always_comb begin 
                    case( state)
                                S0: if (turnRight) begin nextstate = S1;  end
                                    else if ( turnLeft) begin nextstate = S5; end
                                                
                                S1: if ( turnRight ) begin nextstate = S2; end
                                    else if ( turnLeft) begin nextstate = S5; end
                                                        
                                S2: if ( turnRight) begin nextstate = S3; end
                                    else if ( turnLeft) begin nextstate = S5; end
                                                        
                                S3: if ( turnRight ) begin nextstate = S4; end
                                    else if ( turnLeft) begin nextstate = S5; end
                                                        
                                S4: if ( turnRight) begin nextstate = S1; end
                                    else if ( turnLeft) begin nextstate = S5; end
                                                        
                                S5: if ( turnLeft) begin nextstate = S6; end
                                    else if ( turnRight) begin nextstate = S1; end
                                                        
                                S6: if ( turnLeft) begin nextstate = S7; end
                                    else if ( turnRight) begin nextstate = S1; end
                                                        
                                S7: if ( turnLeft) begin nextstate = S8; end
                                    else if ( turnRight) begin nextstate = S1; end
                                    
                                S8: if ( turnLeft) begin nextstate = S5; end
                                    else if ( turnRight) begin nextstate = S1; end
                                    
                    endcase
                    end
      
      //output logic          
            always_comb 
              case( state)
                  4'b0000: signalL = 4'b0000;
                  4'b0001: signalL = 4'b1100;
                  4'b0010: signalL = 4'b0110;
                  4'b0011: signalL = 4'b0011;
                  4'b0100: signalL = 4'b1001;
                  
                  //reverse
                  4'b0101: signalL = 4'b1001;
                  4'b0110: signalL = 4'b0011;
                  4'b0111: signalL = 4'b0110;
                  4'b1000: signalL = 4'b1100;
                  
            endcase
endmodule
