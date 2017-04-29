module test();
wire [7:0] value;
reg but1 = 0;
reg but2 = 0;

initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, test);
#17     but1 = 1;
#11     but2 = 1;
#29     but2 = 0;
#5      but1 = 0;
#6      but2 = 1;
#5      but2 = 0;
#5      but2 = 1;
#5      but1 = 1;
#5      but2 = 0;
#5      but2 = 1;
#5      but2 = 0;
#5      but2 = 1;
#513    $finish;
end

top tp (but1, but2, value);

initial begin
        $monitor("At time %t, value = %h (%0d)",
                              $time, value, value);
end
              
endmodule
