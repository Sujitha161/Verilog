module slave #(parameter d_width=32,depth=32)
	(input pclk,prst,pwrite,penable,psel,
	 input [d_width-1:0]pw_data,
	 input [$clog2(depth)-1:0]paddr,
	 output reg [d_width-1:0] pr_data,
	 output reg pready);
reg [d_width-1:0] mem [depth-1:0];
always @(posedge pclk or negedge prst)
begin
	if(!prst)
	begin
		pr_data <= 0;
		pready <= 0;
	end
	else 
	begin	
		pready <= 1;

		if (penable && psel)
	begin
		if(pwrite)
			mem[paddr] <= pw_data;
		else
			pr_data <= mem[paddr];
	end
end
end
endmodule


