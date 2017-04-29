all: mem
	vvp mem_test

mem: mem.v mem_test.v
	iverilog -o mem_test mem.v mem_test.v
