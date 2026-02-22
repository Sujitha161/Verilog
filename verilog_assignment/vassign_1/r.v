module tb;
    reg [3:0] a = 4'b110x;
    wire y1;
    wire  y3;
    reg y2;
    
    // Method 1: Ternary (continuous)
    assign y1 = (a == 4'b1100) ? 1'b1 : 1'b0;
    
    // Method 2: If-else (procedural)
    always @(*) begin
        if (a == 4'b1100)
            y2 = 1'b1;
        else
            y2 = 1'b0;
    end
    
    // Method 3: Case equality ===
    assign y3 = (a === 4'b110x) ? 1'b1 : 1'b0;
    
    initial begin
        #1;
        $display("a=%b, y1=%b, y2=%b, y3=%b", a, y1, y2, y3);
    end
endmodule


