class driver;
  mailbox #(transaction) gen2drv;
  virtual dff_if vif;A
  
  function new(mailbox #(transaction) gen2drv, virtual dff_if vif);
    this.gen2drv=gen2drv;
    this.vif=vif;
  endfunction
  
  task main();
    transaction t;
    repeat(30)begin
      gen2drv.get(t);
      @(vif.drv_cb);
      vif.drv_cb.d<=t.d;
      vif.drv_cb.rst<=t.rst;
     
      $display("time= %0t [driver] rst=%0d d=%0d q=%0d", $time,t.rst, t.d, t.q);
    end
  endtask
endclass
  
