interface mod_c(input logic clk);
  logic rst;
  logic [3:0]q;
  
  clocking drv_cb @(negedge clk);
    
    default input #1step output #0;
    output rst;
    
  endclocking
  
  clocking mon_cb @(posedge clk);
    
    default input #1step output #0;
    input rst;
    input q;
    
  endclocking
endinterface
