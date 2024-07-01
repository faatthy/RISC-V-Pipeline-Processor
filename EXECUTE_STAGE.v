module EXECUTE_STAGE(
    input clk,rst,
    input ALUSrcE,
    input[31:0]PCE,Imm_Ext_E,RD1_E,RD2_E,PCPlus4E,
    input [4:0] RD_E,
    input [2:0] ALUControlE,
    input [1:0] ForwardA_E,ForwardB_E,
    input [31:0] ResultW,
    input BranchE ,MemWriteE,ResultSrcE,RegWriteE,

    output reg [31:0]ALU_Result_M,WriteDataM,PCPlus4M,
    output reg [4:0] RD_M,
    output  [31:0] PCTargetE,
    output reg  RegWriteM, MemWriteM, ResultSrcM,
    output PCSrcE
);

wire [31:0] Src_A,Src_B,Src_B_MUX,ResultE;
wire zero_E;

MUX3X1 mux1(
    .a(RD1_E),
    .b(ResultW),
    .c(ALU_Result_M),
    .sel(ForwardA_E),
    .out_mux3(Src_A)
);

MUX3X1 mux2(
    .a(RD2_E),
    .b(ResultW),
    .c(ALU_Result_M),
    .sel(ForwardB_E),
    .out_mux3(Src_B_MUX)
);

ADDER adder_exexute(
    .A(PCE),
    .B(Imm_Ext_E),
    .y(PCTargetE)
);

assign Src_B=(ALUSrcE)?Imm_Ext_E:Src_B_MUX;

ALU alu(
    .SrcA(Src_A),
    .SrcB(Src_B),
    .ALUResult(ResultE),
    .zero_flag(zero_E), 
    .ALUControl(ALUControlE)
);

always @(posedge clk,negedge rst) begin
    if (!rst) begin
        ALU_Result_M<=32'b0;
        WriteDataM<=32'b0;
        PCPlus4M<=32'b0;
        RD_M<=5'b0;
        RegWriteM<=1'b0;
        MemWriteM<=1'b0; 
        ResultSrcM<=1'b0;
    end
    else
    begin
        ALU_Result_M<=ResultE;
        WriteDataM<=Src_B_MUX;
        PCPlus4M<=PCPlus4E;
        RD_M<=RD_E;
        RegWriteM<=RegWriteE;
        MemWriteM<=MemWriteE; 
        ResultSrcM<=ResultSrcE;
    end
end
assign PCSrcE=zero_E&BranchE;
endmodule
