module REGISTER_FILE(
    input clk,rst,WE3,
    input [4:0] A1,A2,A3,
    input [31:0]WD3,
    output [31:0] RD1,RD2
);
reg [31:0] reg_file_registers[0:31];

always @(posedge clk) begin
    if (WE3) begin
        reg_file_registers[A3]<=WD3;
    end
end
assign RD1=(rst==1'b0)?32'b0:reg_file_registers[A1];
assign RD2=(rst==1'b0)?32'b0:reg_file_registers[A2];

endmodule
