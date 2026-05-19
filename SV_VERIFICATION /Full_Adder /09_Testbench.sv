`include "interface.sv"
`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"
`include "Environment.sv"

module tb_top;
    fa_if intf();
    full_adder dut (
        .a(intf.a),
        .b(intf.b),
        .cin(intf.cin),
        .sum(intf.sum),
        .cout(intf.cout)
    );
    environment env;
    initial begin
        env = new(intf);
        env.test();
        #10;
        $finish;
    end
endmodule
