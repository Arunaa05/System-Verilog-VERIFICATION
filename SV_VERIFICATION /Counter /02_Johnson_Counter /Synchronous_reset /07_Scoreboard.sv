class scoreboard;
  mailbox #(transaction) m2s;
    reg prev_rst=1;
  bit [3:0]expected_q=4'd0; 
    
    function new(mailbox #(transaction) m2s);
        this.m2s = m2s;
    endfunction
    
    task main();
        transaction t_mon;
        forever begin
          
            m2s.get(t_mon);
          $display("[time=%0t] Actual_q =%b     Expected_q=%b",$time,t_mon.q,expected_q);
           
          
            
          if (t_mon.q == expected_q)
             begin
                $display("+------------------+");
               $display("|         PASS       |");
                $display("+------------------+");
            end
           else begin
                $display("+------------------+");
                $display("|        Fail       |");
                $display("+------------------+");
            end
           
              if(t_mon.rst)
               expected_q=4'd0;
            else begin
               expected_q={expected_q[2:0],~expected_q[3]};
            end 
          prev_rst=t_mon.rst;
           
        end
    endtask
endclass
