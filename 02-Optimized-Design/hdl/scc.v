

module scc(input clk, rst,
    input [10:1]X, Y,
    output [1:0]SCC1
);
    wire Sx, Sy;
    reg [1:0]SCC;
    Ei10tBit e61 (clk, rst, X, Y, Sx, Sy);

    reg P_Sx;
    reg P_Sy;
    reg P_Sx_and_Sy;
    reg min,p, p1,p2;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            P_Sx = 0;
            P_Sy = 0;
            P_Sx_and_Sy = 0;
            p = 0;
            p1 = 0;
            SCC <= 2'b00;
        end else begin
            P_Sx <= Sx;
            P_Sy <= Sy;
            P_Sx_and_Sy <= Sx & Sy;
            p <= P_Sx * P_Sy;
            p1 = (P_Sx_and_Sy) - p;
            if(Sx >= Sy) begin
                min = Sy;
            end
            else begin
                min = Sx;
            end 
            p2 = min - p; 
            if ( (p1 == 1) / (p2 == 1) ) begin
                 SCC <= 2'b01;
             end    
             else if (((p1 == 1) / (p2 == 0)) || ((p1 == 0) / (p2 == 0))) begin
                    SCC <= 2'b11;
            end 
            else begin
                SCC <= 2'b00;
            end
        end
    end
    assign SCC1 = SCC;
endmodule


