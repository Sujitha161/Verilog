module clkdiv(
	input clk,rst,
	output reg clk_out,
    output  reg [1:0]count);
always @(posedge clk)
begin
	if (rst)begin
		count <= 0;
		clk_out <= 0;
	end
	else if(count == 2'b10  && ~rst)
			begin
				count <=0;
				clk_out <= ~clk_out;
			end
	else
			begin
				count <= count + 1;
				clk_out <= clk_out;
			end
end
endmodule


			

