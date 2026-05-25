class monitor;
   
  transaction t;
  mailbox #(transaction) m2sb;
  virtual signals sig;
  
  function new(mailbox #(transaction) m2sb,virtual signals sig);
    this.m2sb=m2sb;
    this.sig=sig;
  endfunction
  
  task main();
    forever begin
      t=new();
      @(posedge sig.clk);
      #1;
      t.rst=sig.rst;
      t.we=sig.we;
      t.en=sig.en;
      t.data=sig.data;
      t.addr=sig.addr;
      t.dout=sig.dout;
      m2sb.put(t);
      $display("[MONITOR] time=%0t rst=%0b en=%0b we=%0b addr=%0d data=%0d dout=%0d",
                $time,
                t.rst,
                t.en,
                t.we,
                t.addr,
                t.data,
                t.dout);
    end
  endtask
endclass
