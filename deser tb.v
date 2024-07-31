`timescale 1ns/1ps

module deser_tb ();
  
reg sampled_bit_tb;
reg deser_en_tb;
reg clk_tb;
wire [7:0] p_data_tb;
wire p_data_ready_tb;

always #5 clk_tb = ~clk_tb;


initial
begin
  clk_tb = 1'b0;
  deser_en_tb = 1'b0;
  
  #10
  deser_en_tb = 1'b1;
  sampled_bit_tb = 1'b1;
  $display ("bit count is",DUT.bit_count);
  $display ("Shift reg value is %b",DUT.shift_reg); 
  $display ("______________________");
 
  #10
  sampled_bit_tb = 1'b0;
  $display ("bit count is",DUT.bit_count);
  $display ("Shift reg value is %b",DUT.shift_reg); 
  $display ("______________________");

  #10
  sampled_bit_tb = 1'b0;
  $display ("bit count is",DUT.bit_count);
  $display ("Shift reg value is %b",DUT.shift_reg); 
  $display ("______________________");
  
  #10
  sampled_bit_tb = 1'b1;
  $display ("bit count is",DUT.bit_count);
  $display ("Shift reg value is %b",DUT.shift_reg); 
  $display ("______________________");

  #10
  sampled_bit_tb = 1'b1;
  $display ("bit count is",DUT.bit_count);
  $display ("Shift reg value is %b",DUT.shift_reg); 
  $display ("______________________"); 
  
  #10
  sampled_bit_tb = 1'b1;
  $display ("bit count is",DUT.bit_count);
  $display ("Shift reg value is %b",DUT.shift_reg); 
  $display ("______________________");

  #10
  sampled_bit_tb = 1'b0;
  $display ("bit count is",DUT.bit_count);
  $display ("Shift reg value is %b",DUT.shift_reg); 
  $display ("______________________");
  
  #10
  sampled_bit_tb = 1'b0;
  $display ("bit count is",DUT.bit_count);
  $display ("Shift reg value is %b",DUT.shift_reg); 
  $display ("______________________");  

  #10
  $display ("parallel data is %b",p_data_tb);
  $display ("bit count is ",DUT.bit_count);
  $display ("Shift reg value is %b",DUT.shift_reg); 
  $display ("______________________");    
  
  #10
  $display ("parallel data is %b",p_data_tb);
  $display ("bit count is ",DUT.bit_count);
             
  $stop;     
end

deser DUT(
.sampled_bit(sampled_bit_tb),
.deser_en(deser_en_tb),
.clk(clk_tb),
.p_data(p_data_tb),
.p_data_ready(p_data_ready_tb)
);

endmodule