`timescale 1ns/1ps

module stop_check_tb();

reg clk;
reg stop_bit_tb;
reg stop_chk_en_tb;
wire stop_error_tb;  

always #(5) clk = ~clk; 

initial
begin
  
  clk = 1'b0;
  stop_bit_tb = 1'b1;
  stop_chk_en_tb = 1'b0;
  
  #10 
  if (stop_error_tb == 1'b0)
  $display("Passed");
  else
  $display("Failed");
  
  #10
  stop_bit_tb = 1'b1;
  stop_chk_en_tb = 1'b1;
  #10 
  if (stop_error_tb == 1'b0)
  $display("Passed");
  else
  $display("Failed");
  
  #10
  stop_bit_tb = 1'b0;
  stop_chk_en_tb = 1'b1;
  #10 
  if (stop_error_tb == 1'b1)
  $display("Passed");
  else
  $display("Failed");
  
  $stop;  
end  


stop_check DUT(
.stop_bit(stop_bit_tb),
.stop_chk_en(stop_chk_en_tb),
.stop_error(stop_error_tb)
);
  
endmodule  
