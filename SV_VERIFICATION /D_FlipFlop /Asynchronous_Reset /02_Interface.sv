interface dff_if;
  
  logic d;
  logic clk;
  logic rst;
  logic q;
  
  clocking drv_cb@(posedge clk);
    
    default input #1 output #0;
    output d;
    output rst;
    input q;
   
    
  endclocking
  
  clocking mon_cb@(posedge clk or posedge rst);
    
    default input #1step output #0;
    input d;
    input rst;
    input q;
    
  endclocking
    
  
endinterface
  
