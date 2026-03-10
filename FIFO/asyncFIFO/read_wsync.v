module r_wsync # (parameter ptr_width = 4)
	(input [ptr_width-1:0] g_rptr,
	input wclk,wrst,
	output reg [ptr_width-1:0] sync_grptr);
reg [ptr_width-1:0] din;  
always@(posedge wclk or negedge wrst)
begin
if (!wrst)
 begin
	sync_grptr <= 0;
	din <= 0;
end
else
begin 
	din <= g_rptr;
	sync_grptr <= din; 
end
end
endmodule
	
