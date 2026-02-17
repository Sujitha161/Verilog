module mealy_seq 
#(parameter STATE_WIDTH = 2)
(
	input clk,
	input rst,
	input d,
	output reg q);

 localparam[STATE_WIDTH-1:0]
	S0 = 2'b00,
	S1 = 2'b01,
	S2 = 2'b10;

reg[STATE_WIDTH-1:0] state,next_state;

always@(posedge clk or negedge rst)begin
	if (!rst)
		state <= S0;
	else
		state <= next_state;
	end

always@(*)begin
		next_state = state;
		q = 0;

		case (state)
			S0:begin
				if (d)
			      next_state = S1;
	      		end
			S1:begin
			       	if(!d)
				next_state = S2;
			end
			S2:begin
				if(d)
				begin
				next_state = S1;
				q = 1;
			end
		  		else 
				next_state = S0;
			end
		endcase
end
endmodule



