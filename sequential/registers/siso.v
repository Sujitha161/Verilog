module siso(
	input clk,rst,in,direc,
	output reg [3:0]d_out); // bidirectional
always@(posedge clk or posedge rst)
begin 
    if (rst)
	    d_out <= 4'b0000;
    else if(direc)
	    d_out <= {d_out[2:0],in};
    else
	    d_out <= {in,d_out[3:1]};
    end
    endmodule

