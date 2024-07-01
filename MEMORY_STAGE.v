module MEMORY_STAGE(
    input clk, rst, RegWriteM, MemWriteM, ResultSrcM,
    input [4:0] RD_M,
    input [31:0] PCPlus4M, WriteDataM, ALU_Result_M,

    output reg RegWriteW, ResultSrcW,
    output reg[4:0] RD_W,
    output reg[31:0] PCPlus4W, ALU_ResultW, ReadDataW
);
wire [31:0] ReadDataM;
DATA_MEMORY data_memory(
    .clk(clk),
    .rst(rst),
    .A(ALU_Result_M),
    .WE(MemWriteM),
    .WD(WriteDataM),
    .RD(ReadDataM)
);

always @(posedge clk,negedge rst) begin
    if (!rst) begin
        RegWriteW<=1'b0;
        ResultSrcW<=1'b0;
        RD_W<=5'b0;
        PCPlus4W<=32'b0; 
        ALU_ResultW<=32'b0; 
        ReadDataW<=32'b0;
    end
    else
    begin
        RegWriteW<=RegWriteM;
        ResultSrcW<=ResultSrcM;
        RD_W<=RD_M;
        PCPlus4W<=PCPlus4M; 
        ALU_ResultW<=ALU_Result_M; 
        ReadDataW<=ReadDataM;
    end
end


endmodule
