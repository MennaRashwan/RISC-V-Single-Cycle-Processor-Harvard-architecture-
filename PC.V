module pc ( input clk, rst,
    input [31:0] next_pc, 
    output reg [31:0] pc_out );
    always @(posedge clk) begin
        if (rst) begin
            pc_out <= 0;
        end else begin
            pc_out <= next_pc;
        end
    end
    endmodule