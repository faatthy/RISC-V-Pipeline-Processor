module MUX3X1(
    input [31:0] a,b,c,
    input [1:0] sel,
    output reg [31:0] out_mux3
);
always @(*) begin
    case (sel)
        2'b00:out_mux3=a; 
        2'b01:out_mux3=b;
        2'b10:out_mux3=c; 

        default: out_mux3=32'b0;
    endcase
end
endmodule
