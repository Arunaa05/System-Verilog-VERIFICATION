class driver;
  mailbox gen2dri;
  virtual fa_if vif;
  
  function new(virtual fa_if vif,mailbox gen2dri);
    this.vif=vif;
    this.gen2dri=gen2dri;
  endfunction
  
  task main();
    transaction t;
    repeat(15)
      begin
      gen2dri.get(t);
      vif.a=t.a;
      vif.b=t.b;
      vif.cin=t.cin;
      #2;
      t.display("Driver");
    end
  endtask
  
endclass
