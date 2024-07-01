module DATA_MEMORY(
    input [31:0]A,WD,
    input WE,clk,rst,
    output reg [31:0]RD
);

reg [31:0]data_memory_register[0:1023];

always @(posedge clk,negedge rst) begin
    if (WE) begin
        data_memory_register[A]<=WD;
    end
    RD=(!rst)?32'b0:data_memory_register[A];
end
endmodule
