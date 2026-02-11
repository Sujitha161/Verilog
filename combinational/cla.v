module cla_4bit(
input [3:0]a,b,
input cin,
output cout,
output [3:0]sum);

wire [3:0] p,g;
wire c1,c2,c3;

assign p=a^b;
assign g=a&b;

assign c1=g[0]|(p[0]&cin);
assign c2=g[1]|(p[1]&g[0])|(p[1]&p[0]&cin);
assign c3=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);
assign cout=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);

assign sum[0]=p[0]^cin;
assign sum[1]=p[1]^cin;
assign sum[2]=p[2]^cin;
assign sum[3]=p[3]^cin;

endmodule



	
