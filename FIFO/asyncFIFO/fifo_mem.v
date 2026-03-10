module fifo_mem #(parameter d_width=8,depth=8,ptr_width=4)
(input wclk,rclk,we,re,full,empty,
input [ptr_width-1:0]b_wptr,b_rptr,
input [d_width-1:0]w_data,
output reg [d_width-1:0]r_dout);
reg [d_width-1:0]fifo_mem[depth-1:0];
always @(posedge wclk)
begin
	if( we && !full)
	begin
		fifo_mem[b_wptr] <= w_data;
	end
end
always @(posedge rclk)
begin
	if(re && !empty)
	begin
		r_dout <= fifo_mem[b_rptr];
	end
end
endmodule
		

