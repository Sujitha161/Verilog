module sequence_detector(
	input clk,
	input rst,
	input d,
	output reg Q
);
	reg [2:0] state,next_state;

always @(posedge clk or  negedge rst)begin
	if (!rst)
                state <= 3'b000;	
	else   
		state <= next_state;
       	end
always @(*)begin
	case (state)
		3'b000:begin
			if (d)
				next_state = 3'b001;
			else 
				next_state = 3'b000;
		end
		3'b001:begin
                        if (d)
                                next_state = 3'b001;
                        else
                                next_state = 3'b010;
                end
	        3'b010:begin
                        if (d)
                                next_state = 3'b011;
                        else
                                next_state = 3'b000;
                end
		  3'b011:begin
                        if (d)
                                next_state = 3'b001;
                        else
                                next_state = 3'b000;
                end
	endcase
end

	always @(*) begin
		if (state == 3'b011)
			Q = 1'b1;
		else
			Q = 1'b0;
	end
endmodule
