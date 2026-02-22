module tb;
reg [2:0]a;
reg [2:0]x;
initial
begin
a = 3'd4;
x = 2^a;
$display("a=%d,x=%d,x=%b",a,x,x);
end
endmodule

