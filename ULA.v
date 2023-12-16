module ULA (
    input         clk,
    input  [0:3]  inputULA,
    input  [0:31] a,
    input  [0:31] b,
    output reg [0:31] outputULA
);

    always @(posedge clk) begin
        if (inputULA == 4'b0000) begin
            // AND
            outputULA <= a & b;
        end else if (inputULA == 4'b0001) begin
            // OR
            outputULA <= a | b;
        end else if (inputULA == 4'b0010) begin
            // add
            outputULA <= a + b;
        end else if (inputULA == 4'b0110) begin
            // subtract
            outputULA <= a - b;
        end else if (inputULA == 4'b0111) begin
            // set on less than
            outputULA <= (a < b) ? 1 : 0;
        end else begin
            // default case
            outputULA <= 0;
        end
    end

endmodule
