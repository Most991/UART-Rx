`timescale 1ns/1ps

module edge_bit_cnt_tb();

reg enable_tb;
reg clk_tb;
wire [3:0] bit_cnt_tb;
wire [5:0] edge_cnt_tb;
  
always #5 clk_tb = ~clk_tb;  


initial
begin
  clk_tb = 1'b0;
  enable_tb = 1'b0;
  #10
  enable_tb = 1'b1;
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
  
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
   
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------");  
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------");  
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
  
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb); 
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------");
  
      
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
  
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb); 
  $display("---------------------------"); 
    
  #10
  $display("bit count %d ",bit_cnt_tb);
  $display("edge count %d ",edge_cnt_tb);
  $display("---------------------------");                
  $stop;
end  

edge_bit_cnt DUT(
.enable(enable_tb),
.clk(clk_tb),
.bit_cnt(bit_cnt_tb),
.edge_cnt(edge_cnt_tb)
);

endmodule