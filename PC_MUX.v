module  PC_MUX(
    input PCSrcE,  //SELECTOR
    input [31:0]PCTargetE,PCPlus4F,
    output reg[31:0] PC_F
);
always @(*) begin
    if (PCSrcE) begin
        PC_F=PCTargetE;
    end
    else
    begin
      PC_F=PCPlus4F;
    end
end

endmodule
