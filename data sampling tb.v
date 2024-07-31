`timescale 1ns/1ps

module data_sampling_tb();
  
reg clk;  
reg [5:0] edge_cnt_tb;
reg dat_samp_en_tb;
reg rx_in_tb;
wire sampled_bit_tb;

always #(5) clk = ~clk; 


initial
begin
  clk = 1'b0;
  dat_samp_en_tb = 1'b0;
  edge_cnt_tb = 5'd0;
  rx_in_tb = 1'b1;
  
  #10
  dat_samp_en_tb = 1'b1;
  edge_cnt_tb = 5'd1;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd2;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd3;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd4;
  rx_in_tb = 1'b0;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd5;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd6;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd7;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd8;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------"); 
  #10
  edge_cnt_tb = 5'd0;
  rx_in_tb = 1'b1;
  
  #10
  dat_samp_en_tb = 1'b1;
  edge_cnt_tb = 5'd1;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd2;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd3;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd4;
  rx_in_tb = 1'b0;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd5;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd6;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd7;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");
  #10
  edge_cnt_tb = 5'd8;
  $display("edge_cnt is %d ",edge_cnt_tb);
  $display("bit under test ",DUT.bit_under_tst);
  $display("sample count is ",DUT.sample_count);
  $display("sampled bit is ",sampled_bit_tb);
  $display("---------------------");         
  $stop;  
end


data_sampling DUT(
.edge_cnt(edge_cnt_tb),
.dat_samp_en(dat_samp_en_tb),
.rx_in(rx_in_tb),
.sampled_bit(sampled_bit_tb)
);  

endmodule






