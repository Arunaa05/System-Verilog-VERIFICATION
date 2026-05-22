class environment;
  generator   gen;
    driver      drv;
    monitor     mon;
    scoreboard  sb;
    
    mailbox #(transaction) g2d;
    mailbox #(transaction) m2s;
    
    virtual john_if vif;
    
  function new(virtual john_if vif);
        this.vif= vif;
        
        g2d = new();
        m2s  = new();
        
    gen = new(g2d, vif);
    drv = new(g2d, vif);
    mon = new(m2s, vif);
    sb  = new(m2s);
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
