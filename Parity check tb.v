module parity_check_tb();
  
`timescale 1ns/1ps

reg clk;
reg par_type_tb;
reg par_chk_en_tb;
reg parity_bit_tb;
reg [7:0] data_bits_tb;
wire parity_error_tb;

always #(5) clk = ~clk; 

initial
begin
  
  clk = 1'b0;
  par_type_tb = 1'b1;
  par_chk_en_tb = 1'b1;
  data_bits_tb = 8'b10001010;
  parity_bit_tb = 1'b1;
  
  #10
  
  $display("parity error bit = ",parity_error_tb);
  $display("sent parity  bit = ",parity_bit_tb);
  $display("calc parity bit = ",DUT.parity_bit_from_sent_data);
  
  $stop;  
end  

parity_check DUT(

.par_type(par_type_tb),
.par_chk_en(par_chk_en_tb),
.parity_bit(parity_bit_tb),
.data_bits(data_bits_tb),
.parity_error(parity_error_tb)
);
endmodule