module data_sampling #(parameter prescale = 8)(
  
input wire [5:0] edge_cnt,
input wire dat_samp_en,
input wire rx_in,
output reg sampled_bit
);

reg [1:0] bit_under_tst;
reg [1:0] sample_count;

always @ (*)
begin
  if (!dat_samp_en) begin
    bit_under_tst = 2'd0;
    sample_count = 2'd0;
  end  
  
  if (dat_samp_en) begin
    
    if (edge_cnt == ((prescale/2)-1) || edge_cnt == (prescale/2) || edge_cnt == ((prescale/2)+1)) begin
      bit_under_tst = rx_in + bit_under_tst;
      sample_count = sample_count + 1; 
    end 
    
    else if (sample_count == 2'd3) begin 
      if (bit_under_tst <= 1'b1) begin
        sampled_bit = 1'b0;
        bit_under_tst = 2'd0;
        sample_count = 2'd0;
      end else begin
        sampled_bit = 1'b1;
        bit_under_tst = 2'd0;
        sample_count = 2'd0;
               end            
    end  
    
end
end
endmodule