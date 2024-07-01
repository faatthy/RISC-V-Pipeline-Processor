module INSTRUCTION_MEMORY(
    input [31:0]address,
    output reg[31:0] RD,
    input clk ,rst
);
reg [31:0] instruction_memory_registers[0:1024];
always @(*) begin
    if (!rst) begin
        RD<=32'b0;
    end
    else
    begin
      RD=instruction_memory_registers[address>>2];
    end
end

endmodule
