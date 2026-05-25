class scoreboard#(parameter addr_w=4,data_w=8);
  
  transaction t;
  mailbox #(transaction) m2sb;
  bit [data_w-1:0] ref_mem[2**addr_w-1:0];
  bit [data_w-1:0] expected;
  
  function new(mailbox #(transaction) m2sb);
    this.m2sb=m2sb;
  endfunction
  
  task main();
    forever begin
      t=new();
      m2sb.get(t);
      
      if(t.rst)begin
        expected=0;
        $display("[SCOREBOARD] Reset:expected=%b actual=%b",expected,t.dout);
      end
      else if(t.en)
        begin
          if(t.we)
            begin
              ref_mem[t.addr]=t.data;
              $display("[SCOREBOARD] Write:addr=%b data=%b",t.addr,t.data);
            end
          else
            begin
              expected =  ref_mem[t.addr];
              $display("[SCOREBOARD] Read:addr=%b expected=%b actual=%b",t.addr,expected,t.dout);
            end
          if(expected == t.dout)begin
            $display("-------------------------------");
            $display("          READ PASS            ");
            $display("-------------------------------");
          end
          else begin
             $display("-------------------------------");
             $display("          READ FAIL            ");
             $display("-------------------------------");
          end
        end
      else
        begin
          $display("-------------------------------");
          $display("   [SCOREBOARD]RAM DISABLED"    );
          $display("-------------------------------");
        end
    end
  endtask
endclass
              
