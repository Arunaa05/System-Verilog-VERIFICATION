class monitor;
  
  transaction t;
  mailbox m2sb;
  virtual fifo_if sig;
  
  function new(mailbox m2sb,virtual fifo_if sig);
    this.m2sb=m2sb;
    this.sig=sig;
  endfunction
  
  task main();
    forever begin
      t=new();
      @(posedge sig.clk);
      #1;
      
      t.w_en=sig.w_en;
      t.r_en=sig.r_en;
      t.data_in=sig.data_in;
      t.data_out=sig.data_out;
      m2sb.put(t); 
      $display("[MONITOR]time=%0t w_en=%b r_en=%b data_in=%d data_out=%d",$time,t.w_en,t.r_en,t.data_in,t.data_out);
    end
  endtask
endclass
      
