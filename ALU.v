module ALU(
    input [31:0] SrcA,SrcB,
    output reg [31:0] ALUResult,
    output zero_flag, 
    input[2:0]ALUControl
);

always @(*) begin
    case (ALUControl)
        3'b000: ALUResult=SrcA+SrcB;
        3'b001: ALUResult=SrcA-SrcB;
        3'b010: ALUResult=SrcA&SrcB;
        3'b011: ALUResult=SrcA|SrcB;
        3'b101: ALUResult=(SrcA<SrcB);
        default: ALUResult=32'b0;
    endcase
end
assign zero_flag=(ALUResult==32'b0)?1'b1:1'b0;
endmodule
