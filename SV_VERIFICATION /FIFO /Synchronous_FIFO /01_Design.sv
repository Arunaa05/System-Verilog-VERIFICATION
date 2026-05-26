// Code your design here
module syn_fifo(
  input clk,rst,
  input w_en,r_en,
  input [7:0]data_in,
  output reg [7:0]data_out
);
  reg [7:0]mem[0:7];
  reg [2:0]wptr,rptr;
  
  wire full,empty;
  
  always@(posedge clk) begin
    if(rst)
      begin
        wptr<=3'd0;
        data_out<=8'd0;
      end
    else
      begin
        if(w_en && !full)
          begin
            mem[wptr]<=data_in;
            wptr<=wptr+1;
          end
      end
  end
  
  always@(posedge clk) begin
    if(rst)
      begin
        rptr<=3'd0;
        data_out<=8'd0;
      end
    else
      begin
        if(r_en && !empty)
          begin
            data_out<=mem[rptr];
            rptr<=rptr+1;
          end
      end
  end
  
  assign full = (rptr==wptr+1);
  assign empty = (wptr == rptr);
  
endmodule
  
  
