

module CMP(
input [10:1]l,x,
output s
    );
    wire [8:0]w;
    wire [10:1]z;
    
    assign w[0] = ~(l[10] ^ x[10]);
    assign w[1] = ~(l[9] ^ x[9]);
    assign w[2] = ~(l[8] ^ x[8]);
    assign w[3] = ~(l[7] ^ x[7]);
    assign w[4] = ~(l[6] ^ x[6]);
    assign w[5] = ~(l[5] ^ x[5]);
    assign w[6] = ~(l[4] ^ x[4]);
    assign w[7] = ~(l[3] ^ x[3]);
    assign w[8] = ~(l[2] ^ x[2]);
    
    
    
    assign z[1] = l[10] & (~x[10]);
    assign z[2] = l[9] & (~x[9]) & w[0];
    assign z[3] = l[8] & (~x[8]) & w[0] & w[1];
    assign z[4] = l[7] & (~x[7]) & w[0] & w[1] & w[2];
    assign z[5] = l[6] & (~x[6]) & w[0] & w[1] & w[2] & w[3];
    assign z[6] = l[5] & (~x[5]) & w[0] & w[1] & w[2] & w[3] & w[4];
    assign z[7] = l[4] & (~x[4]) & w[0] & w[1] & w[2] & w[3] & w[4] & w[5];
    assign z[8] = l[3] & (~x[3]) & w[0] & w[1] & w[2] & w[3] & w[4] & w[5] & w[6];
    assign z[9] = l[2] & (~x[2]) & w[0] & w[1] & w[2] & w[3] & w[4] & w[5] & w[6] & w[7];  
    assign z[10]= l[1] & (~x[1]) & w[0] & w[1] & w[2] & w[3] & w[4] & w[5] & w[6] & w[7] & w[8];  
    
    assign s = ~(z[1] | z[2] | z[3] | z[4] | z[5] | z[6] | z[7] | z[8] | z[9] | z[10]);
endmodule
