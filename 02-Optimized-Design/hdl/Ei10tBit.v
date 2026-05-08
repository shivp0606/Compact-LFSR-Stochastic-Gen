
module Ei10tBit(clk,rst,X,Y,Sx,Sy);

	input clk,rst;
	input [10:1]X,Y;
	output Sx,Sy;
	
	wire [10:1]out,out1;  //out=q, out1-~q
	wire en;
	
	LFSR D1(clk,rst,out[10:1],out1[10:1]);
	CMP D2(out[10:1],X[10:1],Sx);
	CMP D3({out1[1],out[2],out1[3],out[4],out[5],out1[6],out1[7],out[8],out1[9],out1[10]},Y[10:1],Sy);

endmodule
