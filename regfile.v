module regfile ( 
    input clk,WE3,
    input [4:0]A1, A2,A3,
    input [31:0]WD3,
    output[31:0] RD1,RD2
    );
    reg [31:0] regf [0:31];
    assign RD1 = (A1==5'b0)?32'd0:regf[A1];
    assign RD2 = (A2==5'b0)?32'd0:regf[A2];
    always @(posedge clk) begin
        if (WE3&&A3!=5'b0) begin
            regf[A3] <= WD3;
        end
    end 
    endmodule