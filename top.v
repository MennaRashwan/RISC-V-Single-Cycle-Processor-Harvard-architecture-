module top (
    input clk ,rst,
    output [31:0] Aluresult, writedata,
    output memwrite
);
wire [31:0] instruction, readdata, pc;
processor proc (
    clk, rst,
    instruction, readdata,
    pc, Aluresult, writedata,
    memwrite
);
ROM instr_mem (pc[7:2], instruction);
RAM data_mem (
    clk, memwrite,
    Aluresult, writedata,
    readdata
);
endmodule