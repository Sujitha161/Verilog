module single_port_ram
	#(parameter d_width=8,depth=8)
	(input en,we, clk,
	input [$clog2(depth)-1:0]addr,	
	input [d_width-1:0]din,
	output reg [d_width-1:0]dout);
reg [d_width-1:0]mem_ram[depth-1:0];
always @ (posedge clk)
begin 
       if(en && we) begin      // write
		mem_ram[addr]<=din;
		dout <= 0;
	end
	else if (en && !we)  //read
		dout <= mem_ram[addr];
	else 
		dout <= 0; 
/*	       if (en)
	       begin
		       if(we)
			       mem_ram[addr] = din;
		       else
			       dout = mem_ram[addr];
	       end
	       else
		       dout = 0; */
end
endmodule


