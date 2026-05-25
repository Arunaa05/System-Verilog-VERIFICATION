class generator;
  
  transaction t;
  mailbox #(transaction) g2d;
  virtual signals sig;
  
  function new(mailbox #(transaction) g2d,virtual signals sig);
    this.g2d=g2d;
    this.sig=sig;
  endfunction
  
  task main();
    forever begin
    t=new();
    @(posedge sig.clk);
    if(!t.randomize())
  $display("Randomization failed");
    g2d.put(t);
    $display("[GENERATOR] time=0t",$time);
    end
  endtask
  
endclass
