module deser(
input wire sampled_bit,
input wire deser_en,
input wire clk,
input wire rst,
input wire [5:0] edge_cnt,
input wire [3:0] bit_cnt,
output reg [7:0] p_data,
output reg p_data_ready
);

reg [7:0] shift_reg;

always @ (posedge clk or negedge  rst)
begin
  
    if (!rst) begin    
      p_data <= 8'd0;
      p_data_ready <= 1'b0;
      shift_reg <= 8'd0;        
    end 
    
    else if (deser_en && edge_cnt == 6'd6) 
      shift_reg <= {shift_reg[6:0],sampled_bit};

    
    else  if (bit_cnt == 4'd8) 
    begin 
        p_data <= shift_reg;
        p_data_ready <= 1'b1;
      end  
      
end    
endmodule  