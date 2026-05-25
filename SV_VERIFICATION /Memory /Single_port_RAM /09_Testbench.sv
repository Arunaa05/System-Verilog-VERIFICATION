// Code your testbench here
// or browse Examples
`include "Interface.sv"
`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"
`include "Environment.sv"

module tb;
  signals intf();
  environment env;
  
  single_port_ram dut ( 
    .clk(intf.clk),
    .rst(intf.rst),
    .we(intf.we),
    .en(intf.en),
    .data(intf.data),
    .addr(intf.addr),
    .dout(intf.dout)
  );
  always #5 intf.clk = ~intf.clk;
  
  initial begin
    intf.clk =0;
    intf.rst =1;
    env = new(intf);
    env.run();
    
    #15 intf.rst =0;

    #15 intf.rst =1;
    #10 intf.rst =0;
    #1000;
    $finish;
  end
  
endmodule
