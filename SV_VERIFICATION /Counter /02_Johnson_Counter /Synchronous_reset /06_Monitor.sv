class monitor;
  
  mailbox #(transaction) m2s;
  virtual john_if vif;
  
  function new(mailbox #(transaction) m2s, virtual john_if vif);
    this.m2s=m2s;
    this.vif=vif;
  endfunction
  
  task main();
      transaction t;
    repeat(30) begin
      @(vif.mon_cb);
      
       t=new();
      t.rst=vif.mon_cb.rst;
      t.q=vif.mon_cb.q;
      m2s.put(t);
      $display("time= %0t [Monitor] rst=%0d q=%0d", $time,t.rst, t.q);
    end
  endtask
endclass
  
