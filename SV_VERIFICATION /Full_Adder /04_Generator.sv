class generator;
  mailbox gen2dri;
  
  function new(mailbox gen2dri);
    this.gen2dri=gen2dri;
  endfunction
  
  task main();
    transaction t;
    repeat(15)begin
      t=new();
      if (!t.randomize())
        $display("Randomization failed");
      gen2dri.put(t);
    end
  endtask
  
endclass
