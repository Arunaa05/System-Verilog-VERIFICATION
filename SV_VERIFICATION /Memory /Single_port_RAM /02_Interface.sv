interface signals #(parameter addr_w=4,data_w=8);
  logic clk;
  logic rst;
  logic we;
  logic en;
  logic [data_w-1:0]data;
  logic [addr_w-1:0]addr;
  logic [data_w-1:0]dout;
endinterface
