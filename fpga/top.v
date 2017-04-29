module top (
        input but1,
        input but2,
        output [0:7] leds
);

shift_reg sreg (.clk(~but2 | ~but1), .out(leds), .in(~but1));
endmodule
