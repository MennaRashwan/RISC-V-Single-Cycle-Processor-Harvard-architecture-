module ROM(
    input [5:0] A,
    output [31:0] RD
);
reg [31:0] rom [63:0];
initial begin
    $readmemh("risc.dat", rom);
end
assign RD = rom[A];
endmodule