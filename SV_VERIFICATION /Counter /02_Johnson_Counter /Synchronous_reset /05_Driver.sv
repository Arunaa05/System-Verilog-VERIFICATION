class driver;
  mailbox #(transaction) g2d;
  virtual john_if vif;
  
  function new(mailbox #(transaction) g2d, virtual john_if vif);
    this.g2d=g2d;
    this.vif=vif;
  endfunction  
  task main();
    transaction t;
    repeat(30)begin
      g2d.get(t);
      @(vif.drv_cb);
      vif.drv_cb.rst<=t.rst;
      $display("time= %0t [driver] rst=%0d ", $time,t.rst);
    end 
  endtask
endclass
      
      
    
