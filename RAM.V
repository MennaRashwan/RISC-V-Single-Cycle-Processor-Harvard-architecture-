module RAM(
    input clk, WE,
    input [31:0] A, WD,
    output [31:0] RD
);
reg [31:0] ram [0:63];
assign RD = ram[A[7:2]];
always @(posedge clk  ) begin
    if (WE) begin
        ram[A[7:2]] <= WD;
    end
end
endmodule