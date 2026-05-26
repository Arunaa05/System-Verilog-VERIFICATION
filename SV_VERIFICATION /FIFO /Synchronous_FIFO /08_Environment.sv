class environment;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sb;
  
  mailbox g2d;
  mailbox m2sb;
  virtual fifo_if sig;
  function new(virtual fifo_if sig);
    this.sig=sig;
    g2d=new();
    m2sb=new();
    gen=new(g2d);
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
    join
  endtask
endclass
