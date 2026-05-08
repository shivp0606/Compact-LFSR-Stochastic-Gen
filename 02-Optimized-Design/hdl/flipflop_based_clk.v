`timescale 1ns / 1ps

module flipflop_based_clk(q_out,clk,gated_clk);
inout q_out;
input clk;
output gated_clk;
wire reset,enable;
dff d0(clk,1'b0,enable,q_out);
and (gated_clk,q_out,clk);
endmodule
