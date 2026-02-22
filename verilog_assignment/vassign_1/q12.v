module tb;
reg signed [3:0]a;
reg [3:0]x;
initial
begin
a = 4'd11;
x= (a>>>1);
$display("a=%d,a=%b,x=%d,x=%b",a,a,x,x);
end
endmodule
