module controller (
    input [31:0] instruction,
    input zero,sign,
    output  MemWrite, Regwrite,alusrc, resultsrc,
    output reg pcsrc,
    output [1:0] immsrc,
    output [2:0] ALUControl
);
    wire [6:0] op;
    wire [2:0] funct3;
    wire funct7;
    wire [1:0] ALUop;
    wire Branch;
    assign op = instruction[6:0];
    assign funct3 = instruction[14:12];
    assign funct7 = instruction[30];
    maindec md (op, Branch ,  resultsrc ,Regwrite  , MemWrite ,alusrc,immsrc , ALUop);
aludec al (
    op[5],
    funct7,
    ALUop,
    funct3,
    ALUControl
);
 
 //to calculate pcsrc
    always @(*) begin
        if (Branch) begin
            case (funct3)
                3'b000: pcsrc = zero; // beq
                3'b001: pcsrc = ~zero; // bne
                3'b100: pcsrc = sign; // blt
                default: pcsrc = 1'b0;
            endcase
                    end 
        else begin
            pcsrc = 1'b0;
        end
    end
    endmodule