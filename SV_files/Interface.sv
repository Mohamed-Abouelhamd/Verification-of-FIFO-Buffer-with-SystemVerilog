import FIFO_pkg::*;
interface intf
(input logic clk, reset);
logic Wr_enable;
logic [DATA_WIDTH-1:0] data_in;
logic Read_enable;
logic full;
logic empty;
logic[DATA_WIDTH-1:0] data_out;

clocking cb @(posedge clk);
	default input #10 output #2;
	inout Wr_enable, data_in, Read_enable;
	input full, empty, data_out;
endclocking 

modport FIFO (
	input clk,
	input reset,
	input Wr_enable,
	input data_in,
	input Read_enable,
	output full,
	output empty,
	output data_out
);

modport test (clocking cb);

endinterface 
