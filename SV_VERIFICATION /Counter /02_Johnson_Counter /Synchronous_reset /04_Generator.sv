class generator;
  mailbox #(transaction) g2d;
  virtual john_if vif;
  
  function new(mailbox #(transaction) g2d, virtual john_if vif);
    
    this.g2d=g2d;
    this.vif=vif;
  endfunction
  
  task main();
    transaction t;
    
    repeat(30)begin
      t=new();
      if(!t.randomize())
        $display("Randomization Failed");
      g2d.put(t);
      //$display("[GENERATOR] rst=%b",t.rst);
      @(vif.mon_cb);
    end
  endtask
endclass
  
