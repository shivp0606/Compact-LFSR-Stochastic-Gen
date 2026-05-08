


module total_scc( 
input clk, rst,en,
input [10:1]X, Y,
output reg [1:0]scc_sx_sy
    );
    
    
        reg d_sx_sy;
        wire [1:0]SCC3,SCC4;
        wire Sx, Sy;
        reg [1:0]SCC;
        
       reg [10:1]X1,Y1;
      
       
       always @ (posedge clk)
               begin
               if(rst)
                   begin
                       X1 <= 0;
                       Y1 <= 0;
                   end
               else
                   begin
                       X1 <= X;
                       Y1 <= Y;
                   end
               end
      //clk gating
                  wire gated_clk;
                  flipflop_based_clk s1( en,clk,gated_clk);
                                    
                
      Ei10tBit e61 (gated_clk, rst, X1, Y1, Sx, Sy);
      
          
        reg P_Sx;
        reg P_Sy;
        reg P_Sx_and_Sy;
        reg p;
        always @(posedge clk or posedge rst) begin
            if (rst) begin
                P_Sx = 0;
                P_Sy = 0;
                P_Sx_and_Sy = 0;
                p = 0;
                d_sx_sy = 0;
                SCC <= 2'b00;
            end else begin
                P_Sx <= Sx;
                P_Sy <= Sy;
                P_Sx_and_Sy <= Sx & Sy;
                p <= P_Sx * P_Sy;
                d_sx_sy = (P_Sx_and_Sy) - p;
            end
         end
         
       scc s11(gated_clk, rst,X, Y,SCC3);
       scc_less_than_zero z11(gated_clk, rst,X, Y,SCC4); 
       
    always @ (posedge clk)
        begin
            if(d_sx_sy >= 0)
                begin
                    scc_sx_sy = SCC3;
                end
             else
                begin
                    scc_sx_sy = SCC4;
                end
        end
  
endmodule
