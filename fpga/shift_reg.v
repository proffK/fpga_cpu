module shift_reg(
        input clk,
        input in,
        output reg [WIDTH-1:0] out = 0
        );

parameter WIDTH = 8;

always @(posedge clk)
begin
        out = (out << 1) + in;
end

endmodule
