`timescale 1ns / 1ps

module RISC_V_PIPELINE_tb;

  // Inputs
  reg clk;
  reg rst;

  // Instantiate the Pipeline Top Module
  Pipeline_top uut (
    .clk(clk), 
    .rst(rst)
  );

  // Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100 MHz clock
  end

  // Initializing Register File and Instruction Memory
  integer i;
  initial begin
    // Initialize Inputs
    rst = 1;

    // Initialize register file
    for (i = 0; i < 32; i = i + 1) begin
      uut.Decode.reg_file.reg_file_registers[i] = 0;
    end

    // Initialize instruction memory
    for (i = 0; i < 1024; i = i + 1) begin
      uut.Fetch.IMEM.instruction_memory_registers[i] = 32'h00000000;
    end

    // Example instructions for testing (you can add more test cases here)
    // ADDI x1, x0, 10  => 0x00A00093
    uut.Fetch.IMEM.instruction_memory_registers[0] = 32'h00A00093;
    // ADD x2, x1, x1   => 0x002080B3
  //  uut.Fetch.IMEM.instruction_memory_registers[1] = 32'h01400093;
    // BEQ x1, x2, 4    => 0x00210063
  //  uut.Fetch.IMEM.instruction_memory_registers[2] = 32'h00210063;
    // ADDI x3, x0, 5   => 0x00500113
  //  uut.Fetch.IMEM.instruction_memory_registers[3] = 32'h00500113;

    // Release reset after some delay
    #10;
    rst = 0;
    #10;
    rst = 1;
    #10;

    // Initial delay to allow pipeline to fill
    #500;  

    // Run the test cases with 1 clock cycle delay between checks
    verify_output(10, 1);  // Check if x1 contains 10
    #10;

    //verify_output(20, 2);  // Check if x2 contains 20
    #10;

    // Ensure the BEQ branch is handled correctly
    // Note: If branching, you'll need additional handling to verify post-branch execution
    // verify_output(0, 0); // Check if branch taken or not
    #10;

   // verify_output(5, 3);   // Check if x3 contains 5
    #10;

    $stop; // End the simulation
  end

  // Task to verify the pipeline output
  task verify_output(input [31:0] expected_value, input [31:0] register);
    begin
      // Check the value in the specified register
      if (uut.Decode.reg_file.reg_file_registers[register] !== expected_value) begin
        $display("Test failed at time %d: Expected %h but got %h", $time, expected_value, uut.Decode.reg_file.reg_file_registers[register]);
      end else begin
        $display("Test passed at time %d: Expected %h and got %h", $time, expected_value, uut.Decode.reg_file.reg_file_registers[register]);
      end
    end
  endtask

endmodule

