module tb_h_b;
	 reg[5:0] y;
	

	initial begin 
		y='Ox2;

		$monitor("time=%0t,y=%b",$time,y);
	end
	endmodule

	 
