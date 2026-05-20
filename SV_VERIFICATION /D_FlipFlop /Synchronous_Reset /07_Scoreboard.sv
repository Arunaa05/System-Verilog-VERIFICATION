class scoreboard;
  mailbox #(transaction) mon2sb;
   bit prev_d = 0;
  
  function new(mailbox #(transaction) mon2sb);
    this.mon2sb=mon2sb;
  endfunction
  
  task main();
    transaction t_mon;
    bit expected_q;
    
    repeat (20)begin
      
           
      mon2sb.get(t_mon);
       if(t_mon.rst) begin
        expected_q = 0;
        prev_d = 0;
      end
      else begin
        expected_q = prev_d;
        prev_d = t_mon.d;
      end
     
      $display("ACTUAL OUTPUT   : Time = %0t rst=%b d = %0d q = %0d",$time,t_mon.rst,t_mon.d,t_mon.q);
      $display("EXPECTED OUTPUT : Time = %0t d = %0d q = %0d",$time,t_mon.d,expected_q);
 
      
      if(t_mon.q == expected_q)begin
        $display("+------------------+");
        $display("|  TEST CASE PASS  |");
        $display("+------------------+");
      end
      else begin
        $display("+------------------+");
        $display("|  TEST CASE FAIL  |");
        $display("+------------------+");
      end
      $display("-----------------");
    end
  endtask
endclass
      
