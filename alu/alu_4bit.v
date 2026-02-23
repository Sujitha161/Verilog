module alu_4bit(
    input  [3:0] A, B,     // 4-bit inputs
    input  [2:0] ALU_Sel,  // 3-bit control signal
    output reg [3:0] ALU_Out,
    output reg Carry_Out
);

    reg [4:0] tmp;  // 5-bit to hold carry for add/sub

    always @(*) begin
        case (ALU_Sel)
            3'b000: begin // Addition
                tmp = A + B;
                ALU_Out = tmp[3:0];
                Carry_Out = tmp[4];
            end

            3'b001: begin // Subtraction
                tmp = A - B;
                ALU_Out = tmp[3:0];
                Carry_Out = tmp[4];
            end

            3'b010: begin // AND
                ALU_Out = A & B;
                Carry_Out = 0;
            end

            3'b011: begin // OR
                ALU_Out = A | B;
                Carry_Out = 0;
            end

            3'b100: begin // XOR
                ALU_Out = A ^ B;
                Carry_Out = 0;
            end

            3'b101: begin // NOT A
                ALU_Out = ~A;
                Carry_Out = 0;
            end

            3'b110: begin // Shift Left
                ALU_Out = A << 1;
                Carry_Out = 0;
            end

            3'b111: begin // Shift Right
                ALU_Out = A >> 1;
                Carry_Out = 0;
            end

            default: begin
                ALU_Out = 4'b0000;
                Carry_Out = 0;
            end
        endcase
    end

endmodule

