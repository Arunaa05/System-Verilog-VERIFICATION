interface fifo_if(input logic clk);
  logic rst;
  logic w_en;
  logic r_en;
  logic [7:0]data_in;
  logic [7:0]data_out;
endinterface
