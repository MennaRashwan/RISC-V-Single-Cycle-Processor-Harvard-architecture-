module datapath (
    input clk,rst,
    input [31:0] instr,readdata,
    input regwrite,alusrc,pcsrc,resultsrc,
    input [2:0] alucontrol,
    input [1:0] immsrc,
    output [31:0] pc, Aluresult, writedata,
    output zero,sign);
    wire [31:0] next_pc, pc_plus4,pc_target, result, imm_ext, srcb, readdata1;
    assign sign = Aluresult[31];
    pc program_counter (clk, rst, next_pc, pc);
    mux  pc_mux (pc_plus4, pc_target, pcsrc, next_pc);
    adder pc4 (pc, 32'd4, pc_plus4);
    adder pcextend (pc, imm_ext, pc_target);
    extend imm (instr[31:7], immsrc, imm_ext);
    regfile rf (clk,regwrite,instr[19:15], instr[24:20], instr[11:7], result, readdata1, writedata);
    mux alusrc_mux (writedata, imm_ext, alusrc, srcb);
    ALU alu_unit (readdata1, srcb, alucontrol, Aluresult, zero);
    mux result_mux (Aluresult, readdata, resultsrc, result);
    endmodule
 