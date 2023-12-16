module ULAControl(
    input            clk,
    input      [1:0] OpALU,
    input      [5:0] funct,
    output reg [3:0] inputALU
);

always @(negedge clk) begin
    if (OpALU == 2'b00) begin
        inputALU = 4'b0010; // LW e SW
    end
    else if (OpALU == 2'b01) begin
        inputALU = 4'b0110; // Branch Equal
    end
    else if (OpALU == 2'b10) begin
        case (funct)
            6'b100000: inputALU = 4'b0010; // add
            6'b100010: inputALU = 4'b0110; // subtract
            6'b100100: inputALU = 4'b0000; // AND
            6'b100101: inputALU = 4'b0001; // OR
            6'b101010: inputALU = 4'b0111; // set on less than
            default: inputALU = 4'b0000;
        endcase
    end
    else begin
        inputALU = 4'b0000;
    end
end
endmodule
