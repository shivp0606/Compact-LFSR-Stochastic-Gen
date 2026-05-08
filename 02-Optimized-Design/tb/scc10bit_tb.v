
module scc10bit_tb( );
    reg gated_clk,rst;
    reg en;
	reg [10:1]X,Y;
	wire [1:0]scc_sx_sy;
	
	total_scc dut (.clk(gated_clk),.en(en),.rst(rst),.X(X),.Y(Y),.scc_sx_sy(scc_sx_sy));
	
	initial begin
	gated_clk=1'b0;
	end
	
	always #10 gated_clk = ~gated_clk;
	
initial
    begin
        
        rst = 1'b1;
        en=1'b0;
        X = 10'haa;
        Y =10'haa;
        #10; 
        rst = 1'b0;
        en=1'b1;
        X = 10'hfa;
        Y = 10'h8e;
        #10; 
        X = 10'h19;
        Y = 10'h41;
        #10; 
         X = 8'h69;
         Y = 8'h16;
       #20;
        X = 8'h41;
        Y = 8'h20;
        #10 $finish();
    end
    
endmodule
