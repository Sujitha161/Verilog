module syncounter(
	input clk,rst,direc,
	output reg [3:0]count);
always @(posedge clk )
begin
if (rst)
	count <= 4'b0000;
else if(direc) //up counter
	count <= count + 1;
else // down counter
	count <= count -1;
end
endmodule

