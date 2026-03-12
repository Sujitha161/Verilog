module master #(parameter d_width=32,depth=32,slave=4)
(	input pclk,prst,transfer,pready,apb_wr,
	input [d_width-1:0] apb_pwdata,
	input [d_width-1:0] pr_data,
	input [$clog2(depth)-1:0]apb_addr,
	input [$clog2(slave)-1:0]apb_saddr,
	output reg [$clog2(slave)-1:0]s_addr, 
        output reg [$clog2(depth)-1:0]paddr,
	output reg [d_width-1:0] pw_data,
//	output reg  [d_width-1:0] apb_rout,
	output   [d_width-1:0] apb_rout,	
        output  reg penable,psel,pwrite);
reg [1:0]state,next_state;
localparam [1:0] 
	   idle = 2'b00,
	   setup = 2'b01,
	   access = 2'b10;
always @(posedge pclk or negedge prst)
begin
if(!prst)
	state <= idle;
else
	state <= next_state;
end
always @(*)
begin
	case (state)
		idle:
			if(transfer)
				next_state <= setup;
			else
				next_state <= idle;
		setup:
			next_state <= access;
		access:
			if(pready)
			begin
				if (transfer)
			   		next_state <= setup;
				else
					next_state <= idle;
			end
			else
				next_state <= access;
		endcase
	end
always @(posedge pclk or negedge prst)
begin
	if (!prst)
	begin
		penable <= 0;
	//	apb_rout <= 0;
	end
else
begin	
if (next_state == idle) 
begin
       penable <= 0;
       psel <= 0;
 end
else if(next_state == setup)
begin
 	penable <=0;
	psel <= 1;
	paddr <= apb_addr;
	pw_data <= apb_pwdata;
	pwrite <= apb_wr;
	s_addr <= apb_saddr;
end
else if (next_state == access)
begin
	penable <= 1;
	psel <= 1;
//    if (pready && !pwrite)
//	apb_rout <= pr_data;
end
end
end
/*always @(posedge pclk or negedge prst)
begin
	if(!prst)
		apb_rout <= 0;
	else if (pready && !pwrite)
		apb_rout <= pr_data;
end */
assign apb_rout = (pready && !pwrite) ? pr_data : 1'b0;
endmodule




