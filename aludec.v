module aludec(
    input op5,func7,
    input [1:0] ALUOP,
    input [2:0] func3,
    output reg [2:0] ALUcontrol
);
wire funcop;
assign funcop=op5&func7;//op and func7 = 11 for sub, otherwise add
always @(*) begin
    case(ALUOP)
        2'b00: ALUcontrol=3'b000; // add for lw sw
        2'b01: begin 
            case(func3)
                3'b000: ALUcontrol=3'b010;// sub for beq
                3'b001: ALUcontrol=3'b010;// sub for bne
                3'b100: ALUcontrol=3'b010; // sub for blt
                default: ALUcontrol=3'b010;
            endcase
        end
        2'b10: begin
            case(func3)
                3'b000: begin 
                    if (funcop)
                    ALUcontrol=3'b010; // sub
                    else ALUcontrol=3'b000; // add
                end
                3'b001: ALUcontrol=3'b001; // sll
                3'b100: ALUcontrol=3'b100; // xor
                3'b101: ALUcontrol=3'b101; // srl
                3'b110: ALUcontrol=3'b110; // or
                3'b111: ALUcontrol=3'b111; // and
                default: ALUcontrol=3'b000;
            endcase
        end
        default: ALUcontrol=3'b000;
    endcase
end
endmodule