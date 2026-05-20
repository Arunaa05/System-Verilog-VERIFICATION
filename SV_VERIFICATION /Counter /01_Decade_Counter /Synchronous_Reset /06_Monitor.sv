class monitor;
  
  mailbox #(transaction) mon2sb;
  virtual mod_c mod;
  
  function new(mailbox #(transaction) mon2sb, virtual mod_c mod);
    this.mon2sb=mon2sb;
    this.mod=mod;
  endfunction
  
  task main();
      transaction t;
    repeat(30) begin
       @(mod.mon_cb);
       t=new();
      t.rst=mod.mon_cb.rst;
      t.q=mod.mon_cb.q;
      mon2sb.put(t);
      $display("time= %0t [Monitor] rst=%0d q=%0d", $time,t.rst, t.q);
    end
  endtask
endclass
  
