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
     
      t.d=vif.d;
      t.rst=vif.rst;
      
      t.q=vif.q;
      mon2sb.put(t);
      $display("time= %0t [Monitor] rst=%0d d=%0d q=%0d", $time,t.rst, t.d, t.q);
    end
  endtask
endclass
  
