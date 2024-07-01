module WRITE_BACK_STAGE(
    input clk, rst, ResultSrcW,
input [31:0] PCPlus4W, ALU_ResultW, ReadDataW,

output [31:0] ResultW
);
// Declaration of Module
assign ResultW=(ResultSrcW)?ReadDataW:ALU_ResultW;

endmodule
