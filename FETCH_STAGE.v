module FETCH_STAGE(
    input clk,rst,PCSrcE,
    input [31:0]PCTargetE,
    output reg [31:0]PCD,InstrD,PCPlus4
);

wire [31:0] PC_F,PCPlus4F,PCF,INSTRF;

PC_MUX mux(
    .PCSrcE(PCSrcE),  //SELECTOR
    .PCTargetE(PCTargetE),
    .PCPlus4F(PCPlus4F),
    .PC_F(PC_F)
);

ADDER adder_pc(
    .A(PCF),
    .B(32'd4),
    .y(PCPlus4F)
);

INSTRUCTION_MEMORY IMEM(
    .address(PCF),
    .RD(INSTRF),
    .clk(clk),
    .rst(rst)
);

PROGRAM_COUNTER program_counter(
    .PC_NEXT(PC_F),
    .PC(PCF),
    .clk(clk),
    .rst(rst)
);

always @(posedge clk,negedge rst) begin
    if (!rst) begin
        InstrD<=32'b0;
        PCD<=32'b0;
        PCPlus4<=32'b0;
    end
    else
    begin
      InstrD<=INSTRF;
      PCD<=PCF;
      PCPlus4<=PCPlus4F;
    end
end
endmodule
