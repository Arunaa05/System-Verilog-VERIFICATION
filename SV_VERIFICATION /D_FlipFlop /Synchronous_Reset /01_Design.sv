module dff(
  input logic d,
  input logic clk,
  input logic rst,
  output logic q
);

always@(posedge clk)
  begin
    if(rst)
      q<=1'b0;
    else
      q<=d;
  end

endmodule
