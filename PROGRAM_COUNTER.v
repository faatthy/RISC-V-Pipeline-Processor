module PROGRAM_COUNTER(
    input clk,rst,
    input[31:0]PC_NEXT,
    output reg[31:0] PC
);

always @(posedge clk,negedge rst) begin
    if (!rst) begin
        PC<=32'b0;
    end
    else
    begin
      PC<=PC_NEXT;
    end
end
endmodule
