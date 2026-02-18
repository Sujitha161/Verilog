module pipo (
	input [3:0]in,
	input clk,rst,
	output  reg [3:0]q);
always@(posedge clk or posedge rst)
begin
if (rst)
q<= 4'b0000;
else
q<= in;
end
endmodule

