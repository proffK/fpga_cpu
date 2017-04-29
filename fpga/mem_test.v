`timescale 100ns/1ns

module mem_test();
wire [0:7] data_read;
wire [0:7] com_read;

reg [0:7] data_write = 8'h00;
reg [0:9] com_addr = 10'b00_0000_0000;
reg [0:9] data_addr = 10'b00_0000_0000;
reg clk = 0;
reg oe_d = 0;
reg oe_c = 0;
reg we = 0;


always #10 clk=~clk;

initial begin
        $dumpfile("mem_test.vcd");
        $dumpvars(0, mem_test);
        oe_d = 1;
        we = 1;
        data_write = 8'h11;
#15     data_write = 8'h33;
        data_addr = 10'd1;
#20     we = 0;
#10     data_addr = 10'd0;
#10     oe_d = 0;
        $finish;
end

memory mem     (.oe_c(oe_c),
                .oe_d(oe_d), 
                .clk(clk),
                .we(we),
                .com_addr(com_addr),
                .data_addr(data_addr),
                .com_data(com_read),
                .data_read(data_read),
                .data_write(data_write));

initial begin
        $monitor("At time %t, value = %h (%0d)",
                              $time, data_read, data_read);
end
              
endmodule
