class driver;
  mailbox #(transaction) gen2drv;
  virtual mod_c mod;
  
  function new(mailbox #(transaction) gen2drv, virtual mod_c mod);
    this.gen2drv=gen2drv;
    this.mod=mod;
  endfunction
  
  task main();
    transaction t;
    repeat(20)begin
      gen2drv.get(t);
      @(mod.drv_cb);
      mod.drv_cb.rst<=t.rst;
     
      $display("time= %0t [driver] rst=%0d ", $time,t.rst);
    end
  endtask
endclass
  
