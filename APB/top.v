`include "apb_master.v"
`include "apb_slave.v"
`include "decoder.v"
module top #(parameter depth = 32 ,d_width = 32,slave=4)
	(input pclk,prst,apb_wr,transfer,
	input [$clog2(depth)-1:0]apb_addr,
	input [d_width-1:0] apb_pwdata,
        input [$clog2(slave)-1:0]apb_saddr,
	output [d_width-1:0] apb_rout);
wire pready,penable,pwrite,psel;
wire [d_width-1:0] pw_data,pr_data;
wire [$clog2(depth)-1:0] paddr;
wire [$clog2(slave)-1:0] s_addr;
wire psel1,psel2,psel3,psel4;
wire [d_width-1:0] pr_data1,pr_data2,pr_data3,pr_data4;
wire pready1,pready2,pready3,pready4;

master m (.pclk(pclk),.prst(prst),.transfer(transfer),.pready(pready),.apb_wr(apb_wr),.apb_saddr(apb_saddr),.s_addr(s_addr),.apb_pwdata(apb_pwdata),.pr_data(pr_data),.apb_addr(apb_addr),.paddr(paddr),.pw_data(pw_data),.apb_rout(apb_rout),.penable(penable),.psel(psel),.pwrite(pwrite));

slave s1 (.pclk(pclk),.prst(prst),.pwrite(pwrite),.penable(penable),.psel(psel1),.paddr(paddr),.pw_data(pw_data),.pr_data(pr_data1),.pready(pready1));

slave s2 (.pclk(pclk),.prst(prst),.pwrite(pwrite),.penable(penable),.psel(psel2),.paddr(paddr),.pw_data(pw_data),.pr_data(pr_data2),.pready(pready2));

slave s3 (.pclk(pclk),.prst(prst),.pwrite(pwrite),.penable(penable),.psel(psel3),.paddr(paddr),.pw_data(pw_data),.pr_data(pr_data3),.pready(pready3));

slave s4 (.pclk(pclk),.prst(prst),.pwrite(pwrite),.penable(penable),.psel(psel4),.paddr(paddr),.pw_data(pw_data),.pr_data(pr_data4),.pready(pready4));

decoder d (.s_addr(s_addr),.psel(psel),.psel1(psel1),.psel2(psel2),.psel3(psel3),.psel4(psel4));

assign pr_data = (~s_addr[1]?(~s_addr[0]?pr_data1:pr_data2):(~s_addr[0]?pr_data3:pr_data4));
assign pready = (~s_addr[1]?(~s_addr[0]?pready1:pready2):(~s_addr[0]?pready3:pready4));
endmodule
