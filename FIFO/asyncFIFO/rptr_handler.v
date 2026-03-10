module rptr_handler # (parameter ptr_width = 4,depth = 8)
        (input rclk,rrst,re,
         input [ptr_width-1:0] sync_gwptr,
         output reg [ptr_width-1:0] b_rptr,
	 output [ptr_width-1:0]g_rptr,
         output empty);
wire [ptr_width-1:0] nxtb_rptr,nxtg_rptr;
assign nxtb_rptr = b_rptr + (re & !empty);
assign nxtg_rptr = (nxtb_rptr >> 1)^nxtb_rptr;
always @(posedge rclk or negedge rrst)
begin
if(!rrst)
        b_rptr <= 0;
else if (re && !empty)
        b_rptr <= nxtb_rptr;
end
assign g_rptr = (b_rptr >> 1)^b_rptr;
assign empty = (sync_gwptr == g_rptr);
endmodule
