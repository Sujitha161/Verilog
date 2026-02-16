
module decoder(
    input [1:0] sel,
    output reg a,b,c,d);
    always @(*)
    begin
            a=0;b=0;c=0;d=0;
        if (~sel[1] && ~sel[0])
            a = 1;
            else if (~sel[1] && sel[0])
                b=1;
                else if (sel[1] && ~sel[0])
                c=1;
                else
                d=1;
    end
endmodule
