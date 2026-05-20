class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sb;
  
  mailbox #(transaction) gen2drv;
  mailbox #(transaction) mon2sb;
  
  
  virtual dff_if vif;
  
  function new(virtual dff_if vif);
    this.vif=vif;
    
    gen2drv=new();
    mon2sb=new();
    
    
    gen=new(gen2drv,vif);
    drv=new(gen2drv,vif);
    mon=new(mon2sb,vif);
    sb=new(mon2sb);
    
    
  endfunction
  
  task run();
    fork
      gen.main();
      drv.main();
      mon.main();
      sb.main();
    
    join_any
  endtask
endclass
  
