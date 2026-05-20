module decade_counter(
  input clk,rst,
  output reg [3:0]q
);
  always@(posedge clk)
  begin 
    if(rst)
      q<=4'b0000;
    else begin
      if(q>=4'd9)
        q<=4'b0000;
      else
        q<=q+1'b1;
    end
  end
endmodule
