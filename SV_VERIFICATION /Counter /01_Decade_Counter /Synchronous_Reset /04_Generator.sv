class generator;
  
  mailbox #(transaction) gen2drv;

  virtual mod_c mod;
  
  function new(mailbox #(transaction) gen2drv, virtual mod_c mod);
    this.gen2drv=gen2drv;
    this.mod=mod;
  endfunction
  
  task main();
    transaction t;
    
    repeat(20)begin
      t=new();
     
      if (!t.randomize())
        $display("Randomization failed");
      gen2drv.put(t);
      $display("[Generator] rst=%0b",t.rst);
      @(mod.mon_cb);
     
    end
  endtask
  
endclass
        
