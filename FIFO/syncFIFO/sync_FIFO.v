module sync_fifo
      # ( parameter d_width= 16 ,depth = 8)
	(input w,r,clk,rst,             // w - write , r - read
	input [d_width-1:0] din,
  	output full,empty,	
	output reg [d_width-1:0] dout,
output reg [$clog2(depth)-1:0] wptr,rptr);                          // wptr - write pointer, rptr - read pointe$r
reg [d_width-1:0] fifo_mem [depth-1:0];
integer i;

always @(posedge clk)       // write operation
begin
	if(rst)
	begin
		for ( i=0;i<depth;i++)
		begin
		fifo_mem[i] <= 0;
		wptr <= 0;
	end
	end
	else if ( w && !full)
	begin
		if (wptr == depth-1)
			wptr <= 0;
		else begin
		fifo_mem[wptr[3:0]] <= din;
		wptr <= wptr + 1'b1;
	end
end
end
always @(posedge clk)     // read operation
begin
	if(rst)
	begin
		dout <= 0;
		rptr <= 0;
	end
	else if ( r && !empty)
	begin
		if (rptr == depth-1)
			rptr <= 0;
		else begin
		dout <= fifo_mem[rptr[3:0]];
		rptr <= rptr + 1'b1;
	end
end
end
//assign full = ((wptr[3] != rptr[3]) && (wptr[2:0] == rptr[2:0]));
//assign full = (wptr == 4'b1000 && rptr == 4'b0000);
assign full = (wptr + 1'b1) == rptr;
assign empty = (wptr[3:0] == rptr[3:0]) ;
endmodule
	 
