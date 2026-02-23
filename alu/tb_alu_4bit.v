module tb_alu_4bit;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] ALU_Sel;

    // Outputs
    wire [3:0] ALU_Out;
    wire Carry_Out;

    // Instantiate the ALU
    alu_4bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .Carry_Out(Carry_Out)
    );

    initial begin
    $dumpfile("alu_4bit.vcd");
    $dumpvars(0,tb_alu_4bit);
    A=4'b0011;B=4'b0001;ALU_Sel=3'b000;#200;
    A=4'b0011;B=4'b0001;ALU_Sel=3'b001;#200;
    A=4'b0011;B=4'b0001;ALU_Sel=3'b010;#200;
    A=4'b0011;B=4'b0001;ALU_Sel=3'b011;#200;
    A=4'b0011;B=4'b0001;ALU_Sel=3'b100;#200;
    A=4'b0011;B=4'b0001;ALU_Sel=3'b101;#200;
    A=4'b0011;B=4'b0001;ALU_Sel=3'b110;#200;
    A=4'b0011;B=4'b0001;ALU_Sel=3'b111;#200;
    $finish;
    end
   
    initial begin
        $monitor("Time = %0d | A = %b | B = %b | ALU_Sel = %b | ALU_Out = %b | Carry_Out = %b",
                 $time, A, B, ALU_Sel, ALU_Out, Carry_Out);
    end

    
 
endmodule

