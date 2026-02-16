module decoder(
	input en,
	input [1:0] a,
	output [3:0] out);
assign out = en? 1 << a:0;
endmodule

