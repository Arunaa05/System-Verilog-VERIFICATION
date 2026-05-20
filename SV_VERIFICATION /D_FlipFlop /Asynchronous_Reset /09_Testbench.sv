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
  dff_if intf();
  dff dut(
    .d(intf.d),
    .clk(intf.clk),
    .rst(intf.rst),
    .q(intf.q)
  );
  environment env;
  initial begin
    intf.clk = 1'b0;
    forever #10 intf.clk = ~intf.clk;
  end
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
    env=new(intf);
    env.run();
    #800;
    $finish;
  end
endmodule
