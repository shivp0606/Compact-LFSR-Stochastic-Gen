module LFSR(
    input clk, 
    input rst, 
    output [10:1] out, 
    output [10:1] o2
);
    reg [10:1] out1;  
    reg g;  
    wire [10:1] qbar; //dff_srff ~q(temp)assume
    wire [10:1] out2; //dff_srff q(temp)assume

    always @(posedge clk or posedge rst) begin
        if (rst)
            g <= 1'b1;  
        else
            g <= out1[1] ^ out1[3] ^ out1[4] ^ out1[5] ^ out1[9];  
    end

    DFF_SRFF d1 (clk, g, out2[1], qbar[1]);
    DFF_SRFF d2 (clk, out2[1], out2[2], qbar[2]);
    DFF_SRFF d3 (clk, out2[2], out2[3], qbar[3]);
    DFF_SRFF d4 (clk, out2[3], out2[4], qbar[4]);
    DFF_SRFF d5 (clk, out2[4], out2[5], qbar[5]);
    DFF_SRFF d6 (clk, out2[5], out2[6], qbar[6]);
    DFF_SRFF d7 (clk, out2[6], out2[7], qbar[7]);
    DFF_SRFF d8 (clk, out2[7], out2[8], qbar[8]);
    DFF_SRFF d9 (clk, out2[8], out2[9], qbar[9]);
    DFF_SRFF d10(clk, out2[9], out2[10], qbar[10]);

    

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out1 <= 10'b11111111;  
        end else begin
            out1[1] <= g;  
            out1[2] <= out1[1];  
            out1[3] <= out1[2];  
            out1[4] <= out1[3];  
            out1[5] <= out1[4];  
            out1[6] <= out1[5];  
            out1[7] <= out1[6];  
            out1[8] <= out1[7];  
            out1[9] <= out1[8];
            out1[10] <= out1[9];
        end
    end

    assign o2 = qbar;
    assign out = out1;

endmodule



