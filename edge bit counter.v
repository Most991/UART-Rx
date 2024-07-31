module edge_bit_cnt #(parameter prescale = 8)(
input wire cnt_en,
input wire clk,
output reg [3:0] bit_cnt,
output reg [5:0] edge_cnt
);

reg [5:0] edge_cnt_comb;
reg [3:0] bit_cnt_comb;

always @ (posedge clk)
begin
  
  if (!cnt_en) begin
    edge_cnt_comb = 5'd0;
    bit_cnt_comb = 3'd0;
  end
   
  else if (cnt_en) begin
    
    if (edge_cnt_comb == prescale) begin
      bit_cnt_comb = bit_cnt_comb + 1;   
      edge_cnt_comb = 5'd1;
    
    end else 
      edge_cnt_comb = edge_cnt_comb + 1;
    
  end  
  edge_cnt = edge_cnt_comb;
  bit_cnt = bit_cnt_comb;
  
end
endmodule  