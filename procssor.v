module processor (
    input clk, rst,
    input [31:0] instruction, readdata,
    output [31:0] pc, Aluresult, writedata,
    output memwrite
);
wire regwrite, alusrc, resultsrc, pcsrc,zero, sign  ;
wire [2:0] alucontrol;
wire [1:0] immsrc;
controller ctrl (
    instruction,
    zero, sign,
    memwrite, regwrite, alusrc, resultsrc,
    pcsrc,
    immsrc,
    alucontrol
);
datapath dp (
    clk, rst,
    instruction, readdata,
    regwrite, alusrc, pcsrc, resultsrc,
    alucontrol,
    immsrc,
    pc, Aluresult, writedata,
    zero, sign
);

endmodule