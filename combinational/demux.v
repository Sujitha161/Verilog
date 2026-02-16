module demux(
    input y,
    input [1:0] sel,
    output reg a,b,c,d);
    always @(*)
    begin 
            a=0;b=0;c=0;d=0;
        if (~sel[1] && ~sel[0])
            a = y;
            else if (~sel[1] && sel[0])
                b=y;
                else if (sel[1] && ~sel[0])
                c=y;
                else 
                d=y;
    end
endmodule
