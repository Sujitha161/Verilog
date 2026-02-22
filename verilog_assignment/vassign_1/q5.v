module tb_q;
	reg [7:0]loc[9:0];
	integer i;
	initial begin
		for(i=0;i<10;i++)
			loc[i]=0;
	end
	initial begin 
		for(i=0;i<10;i++)
		$display("loc[%0d]=%b",i, loc[i]);
	end
	endmodule

