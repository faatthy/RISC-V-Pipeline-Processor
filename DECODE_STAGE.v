module DECODE_STAGE(
    input clk, rst, RegWriteW,
    input [4:0] RDW,
    input [31:0] InstrD, PCD, PCPlus4D, ResultW,

    output reg RegWriteE,ALUSrcE,MemWriteE,ResultSrcE,BranchE,
    output reg [2:0] ALUControlE,
    output reg[31:0] RD1_E, RD2_E, Imm_Ext_E,
    output reg[4:0] RS1_E, RS2_E, RD_E,
    output reg[31:0] PCE, PCPlus4E
);
    wire RegWriteD,ALUSrcD,MemWriteD,ResultSrcD,BranchD;
    wire [1:0] ImmSrcD;
    wire [2:0] ALUControlD;
    wire [31:0] RD1_D, RD2_D, Imm_Ext_D;
    


    CONTROL_UNIT control_unit (
                            .Op(InstrD[6:0]),
                            .RegWrite(RegWriteD),
                            .ImmSrc(ImmSrcD),
                            .ALUSrc(ALUSrcD),
                            .MemWrite(MemWriteD),
                            .ResultSrc(ResultSrcD),
                            .Branch(BranchD),
                            .funct3(InstrD[14:12]),
                            .funct7(InstrD[31:25]),
                            .ALUControl(ALUControlD)
                            );

    REGISTER_FILE reg_file (
                        .clk(clk),
                        .rst(rst),
                        .WE3(RegWriteW),
                        .WD3(ResultW),
                        .A1(InstrD[19:15]),
                        .A2(InstrD[24:20]),
                        .A3(RDW),
                        .RD1(RD1_D),
                        .RD2(RD2_D)
                        );

    SIGN_EXTEND sign_extend (
                        .In(InstrD[31:0]),
                        .Imm_Ext(Imm_Ext_D),
                        .ImmSrc(ImmSrcD)
                        );

    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            RegWriteE <= 1'b0;
            ALUSrcE <= 1'b0;
            MemWriteE <= 1'b0;
            ResultSrcE <= 1'b0;
            BranchE <= 1'b0;
            ALUControlE <= 3'b000;
            RD1_E <= 32'h00000000; 
            RD2_E <= 32'h00000000; 
            Imm_Ext_E <= 32'h00000000;
            RD_E <= 5'h00;
            PCE <= 32'h00000000; 
            PCPlus4E <= 32'h00000000;
            RS1_E <= 5'h00;
            RS2_E <= 5'h00;
        end
        else begin
            RegWriteE <= RegWriteD;
            ALUSrcE <= ALUSrcD;
            MemWriteE <= MemWriteD;
            ResultSrcE <= ResultSrcD;
            BranchE <= BranchD;
            ALUControlE <= ALUControlD;
            RD1_E <= RD1_D; 
            RD2_E <= RD2_D; 
            Imm_Ext_E <= Imm_Ext_D;
            RD_E <= InstrD[11:7];
            PCE <= PCD; 
            PCPlus4E <= PCPlus4D;
            RS1_E <= InstrD[19:15];
            RS2_E <= InstrD[24:20];
        end
    end

    
endmodule
