`include "Interface.sv"
`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv" 
`include "Monitor.sv"
`include "Scoreboard.sv"
`include "Environment.sv"

module tb_top;
    logic clk;
  initial clk=0;
    always #10 clk = ~clk;
    
    john_if intf(clk);
    
    johnson_counter dut (
        .clk(intf.clk),
        .rst(intf.rst),
        .q(intf.q)
    );
    
    environment env;
    
    initial begin
      intf.rst=1;
      #20;
        env = new(intf);
        env.run();
        
        #100; 
        $finish;
    end
endmodule
