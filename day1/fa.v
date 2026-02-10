module half_adder(
	input a,b,
	output sum,carry);
assign sum = a^b;
assign carry = a&b;
endmodule

module fa(input a,b,cin,
            output sum, cout);
	wire sum1;
	wire[1:0]carry;

   half_adder ha1 ( .a(a),.b(b),.sum(sum1),.carry(carry[0]) );
   half_adder ha2 ( .a(sum1),.b(cin),.sum(sum),.carry(carry[1]));
   assign cout=carry[0]|carry[1];

   endmodule



	
