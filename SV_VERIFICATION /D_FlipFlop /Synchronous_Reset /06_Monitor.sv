class monitor;
  
  mailbox #(transaction) mon2sb;
  virtual dff_if vif;
  
  function new(mailbox #(transaction) mon2sb, virtual dff_if vif);
    this.mon2sb=mon2sb;
    this.vif=vif;
  endfunction
  
  task main();
      transaction t;
    repeat(30) begin
    
       t=new();
      @(vif.mon_cb);
     
      t.d=vif.mon_cb.d;
      t.rst=vif.mon_cb.rst;
      t.q=vif.mon_cb.q;
      mon2sb.put(t);
      $display("time= %0t [Monitor] rst=%0d d=%0d q=%0d", $time,t.rst, t.d, t.q);
    end
  endtask
endclass
  
