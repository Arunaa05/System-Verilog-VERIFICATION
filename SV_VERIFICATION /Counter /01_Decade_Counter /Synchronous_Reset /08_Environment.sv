class environment;
    generator   gen;
    driver      drv;
    monitor     mon;
    scoreboard  sb;
    
    mailbox #(transaction) gen2drv;
    mailbox #(transaction) mon2sb;
    
    virtual mod_c mod;
    
  function new(virtual mod_c mod);
        this.mod = mod;
        
        gen2drv = new();
        mon2sb  = new();
        
    gen = new(gen2drv, mod);
    drv = new(gen2drv, mod);
    mon = new(mon2sb, mod);
    sb  = new(mon2sb);
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
