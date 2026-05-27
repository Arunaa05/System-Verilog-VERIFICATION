class generator;
  
  transaction t;
  mailbox g2d;
  
  function new(mailbox g2d);
    this.g2d=g2d;
  endfunction
  
  task main();
    repeat(50) begin
      t=new();
      void'(t.randomize());
      g2d.put(t);
      $display("[GENERATOR] w_en=%0d, r_en=%0d,data_in=%0d",t.w_en,t.r_en,t.data_in);
    end
  endtask
endclass
