module tb_async_fifo;

parameter d_width = 8;
parameter ptr_width = 4;

reg wclk, rclk;
reg wrst, rrst;
reg we, re;
reg [d_width-1:0] w_data;

wire [d_width-1:0] r_dout;
wire full, empty;

// DUT
top #(.d_width(d_width), .ptr_width(ptr_width)) uut (
    .wclk(wclk),
    .rclk(rclk),
    .wrst(wrst),
    .rrst(rrst),
    .we(we),
    .re(re),
    .w_data(w_data),
    .r_dout(r_dout),
    .full(full),
    .empty(empty)
);


// Write clock (faster)
always #5 wclk = ~wclk;

// Read clock (slower)
always #8 rclk = ~rclk;


initial begin
    // Initialize signals
    wclk = 0;
    rclk = 0;
    wrst = 0;
    rrst = 0;
    we = 0;
    re = 0;
    w_data = 0;

    // Reset
    #10;
    wrst = 1;
    rrst = 1;

    // Write operation
    we = 1;
    repeat(8) begin
        #10 w_data = $random;
    end

    // Stop write
    #10 we = 0;

    // Read operation
    re = 1;
    repeat(8) #10;

    // Finish simulation
    #50 $finish;
end


// Dump waveform
initial begin
    $dumpfile("async_fifo.vcd");
    $dumpvars(0, tb_async_fifo);
end


// Monitor signals
initial begin
$monitor("time=%0t | wclk=%b | rclk=%b | we=%b | re=%b | w_data=%d | r_dout=%d | full=%b | empty=%b",
        $time, wclk, rclk, we, re, w_data, r_dout, full, empty);
end

endmodule
