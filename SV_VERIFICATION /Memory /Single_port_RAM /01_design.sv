// Code your design here
module single_port_ram #(parameter addr_w=4,data_w=8)(
  input logic clk,rst,
  input logic we,
  input logic en,
  input logic [data_w-1:0]data,
  input logic [addr_w-1:0]addr,
  output reg [data_w-1:0]dout
);
  reg [data_w-1:0] mem[2**addr_w-1:0];
  
  always@(posedge clk)
    begin
      if(rst)
        dout<=0;
      else if(en)
        begin
          if(we)
            mem[addr]<=data;
          else
            dout<=mem[addr];
        end
    end
endmodule
    
