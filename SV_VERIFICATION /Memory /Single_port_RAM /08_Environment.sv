class environment;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sb;
  
  mailbox #(transaction) g2d;
  mailbox #(transaction) m2sb;
  
  virtual signals sig;
  
  function new(virtual signals sig);
    this.sig=sig;
    
    g2d=new();
    m2sb=new();
    
    gen=new(g2d,sig);
    drv=new(g2d,sig);
    mon=new(m2sb,sig);
    sb=new(m2sb);
    
  endfunction
  
  task run();
    fork
      gen.main();
      drv.main();
      mon.main();
      sb.main();
    join_none
  endtask
endclass
  
  
  
  
