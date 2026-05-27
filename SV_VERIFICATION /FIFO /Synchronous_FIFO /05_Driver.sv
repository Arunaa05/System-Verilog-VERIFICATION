class driver;
  
  transaction t;
  mailbox g2d;
  virtual fifo_if sig;
  
  function new(mailbox g2d,virtual fifo_if sig);
    this.g2d=g2d;
    this.sig=sig;
  endfunction
  
  task main();
    forever begin
      g2d.get(t);
      @(posedge sig.clk);
      sig.w_en=t.w_en;
      sig.r_en=t.r_en;
      sig.data_in=t.data_in;
      
     
      $display("[Driver] time=%0t w_en=%b r_en=%b data_in=%d",$time,t.w_en,t.r_en,t.data_in);
      
    end
  endtask
endclass
