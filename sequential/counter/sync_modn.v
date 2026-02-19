module modncount
	#(parameter n = 10)

        (input clk,rst,
	output reg [3:0]count);
always@(posedge clk)
begin
if (rst)
	count <= 4'b0000;
else if (count == n-1)
	count <= 4'b0000;
else 
	count <= count+1;
   end
   endmodule

