module tb;
reg [3:0] sum;
integer i;
initial begin
sum = 4'b0000;
for (i = 0; i < 4; i = i + 1) begin
#10;sum = sum + i;
$display("time=%0t,i = %0d, sum = %b",$time,i, sum);
end
end
endmodule
