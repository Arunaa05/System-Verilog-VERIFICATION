class transaction;
  
  rand bit d;
  rand bit rst;
  bit q;
  bit expected_q;
  
  function void display(string name);
    $display("time=%0t [%s] rst=%b d=%b q=%b",$time,name,rst,d,q);
  endfunction
  
endclass
