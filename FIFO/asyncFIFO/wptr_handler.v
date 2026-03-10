module wptr_handler # (parameter ptr_width = 4,depth = 8)
	(input wclk,wrst,we,
	 input [ptr_width-1:0] sync_grptr,
	 output reg [ptr_width-1:0] b_wptr,
	 output [ptr_width-1:0] g_wptr,
	 output full);
 wire [ptr_width-1:0] nxtb_wptr,nxtg_wptr;
 assign  nxtb_wptr = b_wptr + (we & !full);
assign  nxtg_wptr = (nxtb_wptr >> 1)^nxtb_wptr;
always @(posedge wclk or negedge wrst)
begin
if(!wrst)
	b_wptr <= 0;
else if ( we && !full) 
	b_wptr <= nxtb_wptr;
end
assign g_wptr = (b_wptr >> 1)^b_wptr;
assign full = (g_wptr == {~sync_grptr[ptr_width-1:ptr_width-2],sync_grptr[ptr_width-3:0]});
endmodule

