module ALU(
    input [31:0] srcA,srcB,
    input [2:0] ALUcontrol,
    output reg [31:0] Aluresult,
    output Zero
);
always @(*) begin
    case(ALUcontrol)
        3'b000: Aluresult = srcA + srcB; // add
        3'b001: Aluresult = srcA << srcB[4:0]; // sll
        3'b010: Aluresult = srcA -srcB; // sub
        3'b100: Aluresult = srcA ^ srcB; // xor
        3'b101: Aluresult = srcA >> srcB[4:0]; // sr
        3'b110: Aluresult = srcA | srcB; // or
        3'b111: Aluresult = srcA & srcB ; // and
        default: Aluresult = 0;
endcase
end
assign Zero = (Aluresult == 0) ;
endmodule