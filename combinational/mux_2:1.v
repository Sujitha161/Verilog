module mux (input a,b,sel,
		output c
);

	assign c = sel ?a:b;
endmodule


