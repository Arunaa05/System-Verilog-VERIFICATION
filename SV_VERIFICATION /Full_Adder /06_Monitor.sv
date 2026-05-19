class monitor;
  mailbox mon2sb;
  virtual fa_if vif;
  
  function new(virtual fa_if vif,mailbox mon2sb);
    this.vif=vif;
    this.mon2sb=mon2sb;
  endfunction
  
  task main();
    forever begin 
    transaction t;
    #1;
    t=new();
    t.a=vif.a;
    t.b=vif.b;
    t.cin=vif.cin;
    t.sum=vif.sum;
    t.cout=vif.cout;
    mon2sb.put(t);
    t.display("monitor");
    end
  endtask
endclass
