module tb;
reg [3:0] x;
initial begin
x = 4'b0011;
fork
#5; x = x + 1;

#10; x = x + 2;
join
$display("x=%b",x);
end
endmodule

