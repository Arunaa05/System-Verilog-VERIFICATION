class transaction;
  rand bit rst;
  bit [3:0]q;
  
  /*function void display(string name);
    $display("time=%0t [%s] rst=%b q=%b",$time,name,rst,q);
  endfunction*/
  constraint rst_c {rst dist {1:=20,0:=80};}
  
endclass
