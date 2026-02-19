module d_ff(
        input clk,rst,d,
        output reg q);
always@(posedge clk or negedge rst)
begin
        if(rst)
                q<=0;
        else
                q<=d;
end
endmodule
module piso(input clk,rst,load,
        input [3:0]in,
        output out);
  wire [3:0]q;
  wire d0,d1,d2,d3;
  assign d0 = (load ? in[0]:1'b0);
  assign d1 = (load ? in[1] :q[0]);
  assign d2 = (load ? in [2]:q[1]);
  assign d3 = (load ? in[3] :q[2]); 

  d_ff f1(.d(d0),.clk(clk),.rst(rst),.q(q[0]));
  d_ff f2(.d(d1),.clk(clk),.rst(rst),.q(q[1]));
  d_ff f3(.d(d2),.clk(clk),.rst(rst),.q(q[2]));
  d_ff f4(.d(d3),.clk(clk),.rst(rst),.q(q[3]));

  assign out = q[3];
  endmodule
