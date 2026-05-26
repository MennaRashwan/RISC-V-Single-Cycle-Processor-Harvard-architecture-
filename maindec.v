module maindec(
    input [6:0] op,
    output Branch , resultsrc ,Regwrite  , MemWrite ,alusrc,
output [1:0] immsrc , ALUop
);
    reg [8:0] control;
    assign {Regwrite,immsrc,alusrc,MemWrite,resultsrc,Branch,ALUop} = control;
    always @(*) begin
        casez(op)
            7'b0000011: control <= 9'b1_00_1_0_1_0_00; //lw
            7'b0100011: control <= 9'b0_01_1_1_x_0_00; //SW
            7'b0110011: control <= 9'b1_xx_0_0_0_0_10; //R-type
            7'b1100011: control <= 9'b0_10_0_0_X_1_01; //Branch
            7'b0010011: control <= 9'b1_00_1_0_0_0_10; //addi
            default:    control <= 9'bx; 
        endcase
    end
    endmodule