module half_sub(
        input a,b,
        output diff,borrow);
assign diff = a^b;
assign borrow = (~a)&b;
endmodule

module fb(input a,b,bin,
            output diff, bout);
        wire diff1;
        wire[1:0]borrow;

   half_sub hb1 ( .a(a),.b(b),.diff(diff1),.borrow(borrow[0]) );
   half_sub hb2 ( .a(diff1),.b(bin),.diff(diff),.borrow(borrow[1]));
   assign bout=borrow[0]|borrow[1];

endmodule
