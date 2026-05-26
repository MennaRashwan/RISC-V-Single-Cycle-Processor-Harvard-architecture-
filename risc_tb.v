`timescale 10ns/1ns

module top_tb;

  reg clk;
  reg rst;
  wire [31:0] WriteData;
  wire [31:0] ALUResult;
  wire MemWrite;

  // Instantiate DUT
  top dut (clk, rst,  ALUResult,WriteData, MemWrite);
  // Clock generation: 100 MHz (10 ns period)
  always #5 clk = ~clk;

  // Expected Fibonacci values
  reg [31:0] expected [0:9];
  integer store_count;

  initial begin
    expected[0] = 32'd1;
    expected[1] = 32'd2;
    expected[2] = 32'd3;
    expected[3] = 32'd5;
    expected[4] = 32'd8;
    expected[5] = 32'd13;
    expected[6] = 32'd21;
    expected[7] = 32'd34;
    expected[8] = 32'd55;
    expected[9] = 32'd89;
  end

  // Reset + init
  initial begin
    clk = 0;
    rst = 1;
    store_count = 0;
    #20 rst = 0;
  end

  // Monitor memory writes
  always @(posedge clk) begin
    if (MemWrite) begin
      $display("STORE %0d: addr=%0d data=%0d time=%0t",
               store_count, ALUResult, WriteData, $time);

      // Address check
      if (ALUResult !== (store_count << 2)) begin
        $display("=================================");
        $display(" SIMULATION FAILED ");
        $display(" Wrong address: expected %0d got %0d",
                 (store_count << 2), ALUResult);
        $display("=================================");
        $stop;
      end

      // Data check
      if (WriteData !== expected[store_count]) begin
        $display("=================================");
        $display(" SIMULATION FAILED ");
        $display(" Wrong data at index %0d", store_count);
        $display(" Expected %0d got %0d",
                 expected[store_count], WriteData);
        $display("=================================");
        $stop;
      end

      store_count = store_count + 1;

      // PASS condition
      if (store_count == 10) begin
        $display("=================================");
        $display(" SIMULATION SUCCEEDED ");
        $display(" Fibonacci sequence correct ");
        $display("=================================");
        $stop;
      end
    end
  end

  // Timeout safeguard
  initial begin
    #5000;
    $display("=================================");
    $display(" SIMULATION TIMEOUT ");
    $display("=================================");
    $stop;
  end

endmodule
