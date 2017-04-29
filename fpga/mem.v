`timescale 1ns/100ps
module memory (
               input oe_c,
               input oe_d,
               input clk,
               input we,
               input [0:ADDR_WIDTH-1] com_addr,
               input [0:ADDR_WIDTH-1] data_addr,
               output [0:DATA_WIDTH-1] com_data = 0,
               output [0:DATA_WIDTH-1] data_read = 0, 
               input [0:DATA_WIDTH-1] data_write
       );

parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 10;
parameter MEM_SIZE = 1 << ADDR_WIDTH; // 1024x8

reg [0:DATA_WIDTH-1] mem [0:MEM_SIZE-1];

always @ (posedge clk & oe_c)
begin
        if (!we) 
        begin
#5                com_data <= mem[com_addr];
        end
end

always @ (posedge clk & oe_d)
begin
        if (we) 
        begin
#5                mem[data_addr] <= data_write;
$display("data write\n");
        end
        if (!we) 
        begin
#5                data_read <= mem[data_addr];
$display("data read\n");
        end
end

endmodule
