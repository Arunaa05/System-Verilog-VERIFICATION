// Code your testbench here
// or browse Examples
`include "Transaction.sv"
`include "Interface.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"
`include "Environment.sv"

module tb_top;
  logic clk;
  always #5 clk=~clk;
  fifo_if sig(clk);
  environment env;
  syn_fifo dut(.clk(clk),
               .rst(sig.rst),
               .w_en(sig.w_en),
               .r_en(sig.r_en),
               .data_in(sig.data_in),
               .data_out(sig.data_out));
  initial begin
    clk=0;
    sig.rst=1;
    #20;
    sig.rst=0;
  end
  
  initial begin
    env=new(sig);
    env.run();
  end
  initial begin
    $dumpfile("v.vcd");
    $dumpvars;
    #500;
    $finish;
  end
endmodule
