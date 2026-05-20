class generator;
  
  mailbox #(transaction) gen2drv;

  virtual dff_if vif;
  
  function new(mailbox #(transaction) gen2drv, virtual dff_if vif);
    this.gen2drv=gen2drv;
  
    this.vif=vif;
  endfunction
  
  task main();
    transaction t;
  
    repeat(30)begin
      t=new();
      if (!t.randomize())
        $display("Randomization failed");
      gen2drv.put(t);
     
      @(vif.drv_cb);
      t.display("Generator");
    end
  endtask
  
endclass
        
