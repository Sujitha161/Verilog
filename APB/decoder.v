module decoder #(parameter slave=4 )
	(input [$clog2(slave)-1:0]s_addr,
	 input psel,	
	 output reg psel1,psel2,psel3,psel4);
 always @(*)
 begin
	 psel1=0;psel2=0;psel3=0;psel4=0;
	 if (psel)
	 begin
	 case (s_addr)
		 2'b00: psel1=1;
		 2'b01: psel2=1;
		 2'b10: psel3=1;
		 2'b11: psel4=1;
		 default : psel1=1;
	 endcase
 end
 end
 endmodule


