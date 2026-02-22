module sequence_detector(
	input clk,
	input rst,
	input d,
	output reg Q
);
	reg [1:0] state,next_state;

always @(posedge clk or  negedge rst)begin
	if (!rst)
                state <= 2'b00;	
	else   
		state <= next_state;
       	end
always @(*)begin
	case (state)
		2'b00:begin
			if (d)
				next_state = 2'b01;
			else 
				next_state = 2'b00;
		end
		2'b01:begin
                        if (d)
                                next_state = 2'b01;
                        else
                                next_state = 2'b10;
                end
	        2'b10:begin
                        if (d)
                                next_state = 2'b11;
                        else
                                next_state = 2'b00;
                end
		  2'b11:begin
                        if (d)
                                next_state = 2'b01;
                        else
                                next_state = 2'b00;
                end
	endcase
end

	always @(*) begin
		if (state == 2'b11)
			Q = 1'b1;
		else
			Q = 1'b0;
	end
endmodule
