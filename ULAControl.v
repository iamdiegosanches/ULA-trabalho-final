module ULAControl(
    input           clk,
    input      [0:1] OpALU,
    input      [0:5] funct,
    output reg [0:3] inputALU
);

always @(negedge clk) begin
    if (OpALU == 2'b00) begin
        inputALU = 4'b0010; // LW e SW
    end
    else if (OpALU == 2'b01) begin
        inputALU = 4'b0110; // BEQ
    end
    else if (OpALU == 2'b10) begin
        if (funct == 6'b100000) begin
            inputALU = 4'b0010; // ADD
        end
        else if (funct == 6'b100010) begin
            inputALU = 4'b0110; // SUB
        end
        else if (funct == 6'b100100) begin
            inputALU = 4'b0000; // AND
        end
        else if (funct == 6'b100101) begin
            inputALU = 4'b0001; // OR
        end
        else if (funct == 6'b101010) begin
            inputALU = 4'b0111; // SLT
        end
        else begin
            inputALU = 4'b0000;
        end
    end
    else begin
        inputALU = 4'b0000;
    end
end

endmodule
