`include "read_wsync.v" 
`include "rptr_handler.v"
`include "wptr_handler.v"
`include "write_rsync.v"
`include "fifo_mem.v"

module top #(parameter d_width = 8 , ptr_width = 4 )
	(input wclk,rclk,wrst,rrst,we,re,
	input [d_width-1:0] w_data,
	output [d_width-1:0] r_dout,
	output full ,empty);
wire [ptr_width-1:0] g_wptr,g_rptr,b_wptr,b_rptr;
wire [ptr_width-1:0] sync_gwptr,sync_grptr;

w_rsync b1 (.rclk(rclk),
	.rrst(rrst),
	.g_wptr(g_wptr),
	.sync_gwptr(sync_gwptr));

r_wsync b2 (.wclk(wclk),
	.wrst(wrst),
	.g_rptr(g_rptr),
	.sync_grptr(sync_grptr));

wptr_handler b3 (.wclk(wclk),
	.wrst(wrst),
	.we(we),
	.sync_grptr(sync_grptr),
	.b_wptr(b_wptr),
	.g_wptr(g_wptr),
	.full(full));

rptr_handler b4 (.rclk(rclk),
	.rrst(rrst),
	.re(re),
	.sync_gwptr(sync_gwptr),
	.b_rptr(b_rptr),
	.g_rptr(g_rptr),
	.empty(empty));

fifo_mem b5 (.wclk(wclk),
	.rclk(rclk),
	.we(we),
	.re(re),
	.full(full),
	.empty(empty),
	.b_wptr(b_wptr),
	.b_rptr(b_rptr),
	.w_data(w_data),
	.r_dout(r_dout));

endmodule

