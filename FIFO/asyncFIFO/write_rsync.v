module w_rsync  #(parameter ptr_width = 4)
        (input [ptr_width-1:0] g_wptr,
        input rclk,rrst,
        output reg [ptr_width-1:0] sync_gwptr);
reg [ptr_width-1:0] din;
always@(posedge rclk or negedge rrst)
begin
if (!rrst)
 begin
        sync_gwptr <= 0;
        din <= 0;
end
else
begin
        din <= g_wptr;
        sync_gwptr <= din;
end
end
endmodule 
