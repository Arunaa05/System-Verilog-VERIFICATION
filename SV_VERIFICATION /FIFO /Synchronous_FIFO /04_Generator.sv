class generator;
  
  transaction t;
  mailbox g2d;
  
  function new(mailbox g2d);
    this.g2d=g2d;
  endfunction
  
  task main();
    repeat(20) begin
      t=new();
      void'(t.randomize());
      g2d.put(t);
      //$display("[GENERATOR] time=%0t",$time);
    end
  endtask
endclass
