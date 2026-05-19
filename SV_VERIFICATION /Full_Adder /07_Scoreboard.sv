	class scoreboard;
  mailbox mon2sb;
  
  function new(mailbox mon2sb);
    this.mon2sb=mon2sb;
  endfunction
  
  task main();
      bit expected_sum;
      bit expected_cout;
    forever begin
      transaction t;
      mon2sb.get(t);
      expected_sum=t.a^t.b^t.cin;
      expected_cout=(t.a&t.b)|(t.b&t.cin)|(t.cin&t.a);
      $display("EXPECTED OUTPUT");
      $display("sum:%b cout=%b",expected_sum,expected_cout);
      $display("ACTUAL OUTPUT");
      $display("sum:%b cout=%b",t.sum,t.cout);
      
      if((t.sum==expected_sum)&&(t.cout==expected_cout))
        begin
         $display("+---------+");
         $display("|   PASS  |");
         $display("+---------+");
        end
      else
        begin
          $display("+---------+");
          $display("| FAILED  |");
          $display("+---------+");
        end
    end
  endtask
endclass
