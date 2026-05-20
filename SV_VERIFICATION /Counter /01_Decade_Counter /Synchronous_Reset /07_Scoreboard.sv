class scoreboard;
    mailbox #(transaction) mon2sb;
    
    bit [3:0]expected_q ; 
    
    function new(mailbox #(transaction) mon2sb);
        this.mon2sb = mon2sb;
    endfunction
    
    task main();
        transaction t_mon;
        forever begin
            mon2sb.get(t_mon);
            
          $display("[Scoreboard] Time=%0t rst=%0b expected_q=%0d", 
                     $time, t_mon.rst,expected_q);
            
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
           
            
            if (t_mon.rst) begin
                expected_q = 4'd0;
            end 
           else if (expected_q == 4'd9)
                expected_q = 4'b0000; 
            else
                 expected_q = expected_q + 1'b1;
            
            
        end
    endtask
endclass
