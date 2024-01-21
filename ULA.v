module ULA (input         clk,
			input  [0:3]  inputULA, 
			input  [0:31] a,
			input  [0:31] b,
			output reg [0:31] outputULA);

    always @(posedge clk) begin
        if (inputULA == 4'b0010) begin
            // ADD
            outputULA <= a + b;
        end else if (inputULA == 4'b0110) begin
            // SUB
            outputULA <= a - b;
        end else if (inputULA == 4'b0000) begin
            // AND
            outputULA <= a & b;
        end else if (inputULA == 4'b0001) begin
            // OR
            outputULA <= a | b;
        end else if (inputULA == 4'b0111) begin
            // SLT
            outputULA <= (a < b) ? 1 : 0;
        end else begin
            outputULA <= 0;
        end
    end
endmodule
