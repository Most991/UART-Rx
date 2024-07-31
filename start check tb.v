`timescale 1ns/1ps

module start_check_tb();

reg clk;
reg start_bit_tb;
reg start_chk_en_tb;
wire start_glitch_tb;  

always #(5) clk = ~clk; 

initial
begin
  
  clk = 1'b0;
  start_bit_tb = 1'b1;
  start_chk_en_tb = 1'b0;
  
  #10 
  if (start_glitch_tb == 1'b0)
  $display("Passed");
  else
  $display("Failed");
  
  #10
  start_bit_tb = 1'b1;
  start_chk_en_tb = 1'b1;
  #10 
  if (start_glitch_tb == 1'b1)
  $display("Passed");
  else
  $display("Failed");
  
  #10
  start_bit_tb = 1'b0;
  start_chk_en_tb = 1'b1;
  #10 
  if (start_glitch_tb == 1'b0)
  $display("Passed");
  else
  $display("Failed");
  
  $stop;  
end  


start_check DUT(
.start_bit(start_bit_tb),
.start_chk_en(start_chk_en_tb),
.start_glitch(start_glitch_tb)
);
  
endmodule  