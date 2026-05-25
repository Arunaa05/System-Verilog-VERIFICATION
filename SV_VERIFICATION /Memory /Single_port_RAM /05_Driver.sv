class driver;
  
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
      @(negedge sig.clk);
      g2d.get(t);
      sig.rst = t.rst;
      sig.en = t.en;
      sig.we = t.we;
      sig.data = t.data;
      sig.addr = t.addr;
      $display("[DRIVER] time =%0t sig.rst =%b.sig.en=%b ,sig.data =%b , sig.addr =%b", $time,t.rst,t.en, t.data,t.addr);
      
    end
  endtask
endclass
      
