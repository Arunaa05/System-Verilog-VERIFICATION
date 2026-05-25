class transaction #(parameter addr_w=4,data_w=8);
  bit rst;
  rand bit we;
  rand bit [data_w-1:0]data;
  rand bit [addr_w-1:0]addr;
  bit [data_w-1:0]dout;
  rand bit en;
 constraint c1 {
   if(!en)
      we == 0;
 }
endclass
  
