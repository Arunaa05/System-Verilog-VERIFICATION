class environment;
    generator gen;
    driver dri;
    monitor mon;
    scoreboard sb;
    
    mailbox gen2dri;
    mailbox mon2sb;
    
    virtual fa_if vif;
    
    function new(virtual fa_if vif);
        this.vif = vif;
        
        gen2dri = new();
        mon2sb = new();
      
        gen = new(gen2dri);
        dri = new(vif, gen2dri);
        mon = new(vif, mon2sb);
        sb = new(mon2sb);
    endfunction
    
    task test();
        fork
            gen.main();
            dri.main();
            mon.main();
            sb.main();
        join_any
    endtask
endclass
