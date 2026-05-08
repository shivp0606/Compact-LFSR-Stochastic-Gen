
module DFF_SRFF(
    input clk,
    input d,
    output reg q,
    output qbar
);
    reg s;
    wire r;
    always @(posedge clk) begin
        if(d == 1)
        s <= d;
        else
            s <= 0;
    end

    assign r = ~s;
    always @(negedge clk) begin
        if (s == 1)
            q <= 1;
        else
            q <= 0;
    end

    assign qbar = ~q;

endmodule









