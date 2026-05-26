class scoreboard;
  
  transaction t;
  mailbox m2sb;
  bit [7:0]ref_q[$];
  bit [7:0]prev_expected;
  bit [7:0]expected;
  
  function new(mailbox m2sb);
    this.m2sb=m2sb;
  endfunction
  
  task main();
    forever begin
      m2sb.get(t);
      
      expected=prev_expected;
      if(t.w_en && ref_q.size()<8)
        begin
          ref_q.push_back(t.data_in);
          $display("[SCOREBOARD] data_in=%d",t.data_in);
        end
      if(t.r_en && ref_q.size()>0)
        begin
          prev_expected = ref_q.pop_front();
          $display("[SCOREBOARD] expected=%d actual=%d",expected,t.data_out);
          if(expected == t.data_out)
            begin
              $display("-----------------");
              $display("      PASS       ");
              $display("-----------------");
            end
          else
            begin
              $display("-----------------");
              $display("      FAIL       ");
              $display("-----------------");
            end
        end
    end
  endtask
endclass
              
              
      
      
