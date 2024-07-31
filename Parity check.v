module parity_check(
input wire par_type,
input wire par_chk_en,
input wire parity_bit,
input wire [7:0] data_bits,
output reg parity_error
);

reg parity_bit_from_sent_data;

always @ (*)
begin
  if (par_type == 1'b1 && par_chk_en)
    begin
// odd parity
// calculate parity bit 
      parity_bit_from_sent_data <= ~ (^data_bits);
//comapre with sent parity bit      
      if (parity_bit_from_sent_data == parity_bit)
        parity_error = 1'b0;
      else
        parity_error = 1'b1;
    end 
    
  else if (par_type == 1'b0 && par_chk_en)
    begin
// even parity
// calculate parity bit 
      parity_bit_from_sent_data <=  ^data_bits;
//comapre with sent parity bit        
      if (parity_bit_from_sent_data == parity_bit)
        parity_error = 1'b0;
      else
        parity_error = 1'b1;
     end          
end
endmodule   