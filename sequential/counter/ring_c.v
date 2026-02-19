module ringcount(
	input clk,rst,ori,
	output reg [3:0]count);

always@(posedge clk)
begin
if(rst)
	count <= 4'b0000;
else if(ori)
	count <= 4'b1010;
else
	count <= { count[0],count[3:1]};
end
endmodule

	
