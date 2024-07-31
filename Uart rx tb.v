`timescale 1us/1ns

module uart_rx_tb #(parameter clk_period = 10)();
    
reg clk_tb;
reg rst_tb;  
reg rx_in_tb;
reg par_en_tb;
reg par_type_tb;
wire data_valid_tb;
wire [7:0] p_data_tb;

always #(clk_period/2) clk_tb = ~clk_tb;


initial
begin
  $display(".................");
  $display("Test case 2, parity is enabled, odd parity");
  initialize(1,1);
  #(clk_period)
  rst_tb = 1'b1;
  #(clk_period)
  get_input(0); // start bit
  #(8*clk_period)
  get_input(1); // data1
  #(8*clk_period)
  get_input(1); // data2
  #(8*clk_period)
  get_input(1); // data3
  #(8*clk_period)
  get_input(0); // data4
  #(8*clk_period)
  get_input(1); // data5
  #(8*clk_period)
  get_input(0); // data6
  #(8*clk_period)
  get_input(1); // data7
  #(8*clk_period)
  get_input(1); // data8
  #(8*clk_period)
  get_input(1); // parity
  #(8*clk_period)
  get_input(1); // stop bit 
  #(8*clk_period)
  $display("Estimated_data is 11101011");
  $display("Parallel data is %b",p_data_tb);
  Errors_check();
  $display(".................");
  $display("Test case 2, parity is enabled, even parity");
  initialize(1,0);
  #(clk_period)
  rst_tb = 1'b1;
  #(clk_period)
  get_input(0); // start bit
  #(8*clk_period)
  get_input(1); // data1
  #(8*clk_period)
  get_input(0); // data2
  #(8*clk_period)
  get_input(1); // data3
  #(8*clk_period)
  get_input(0); // data4
  #(8*clk_period)
  get_input(1); // data5
  #(8*clk_period)
  get_input(1); // data6
  #(8*clk_period)
  get_input(1); // data7
  #(8*clk_period)
  get_input(1); // data8
  #(8*clk_period)
  get_input(0); // parity
  #(8*clk_period)
  get_input(1); // stop bit 
  #(9*clk_period)
  $display("Estimated_data is 10101111");
  $display("Parallel data is %b",p_data_tb);
  Errors_check();
  $stop;
end  

task initialize;
  input parity_enable;
  input parity_type;
  begin
    clk_tb = 1'b0;
    rx_in_tb = 1'b1; 
    rst_tb = 1'b0;
    par_en_tb = parity_enable;
    par_type_tb = parity_type;
  end  
endtask

task get_input;
  input data_in;
  begin
    rx_in_tb = data_in;
  end
endtask

task Errors_check;
  begin
    $display(".................");
    if (!DUT.par_err && !DUT.stp_err  && !DUT.strt_glitch) begin 
      if (data_valid_tb)
        $display("Data is Valid :)");   
    end else begin    
      if (!data_valid_tb)  
        $display("Data is Invalid :(");
    end   
  end  
endtask   
  
uart_rx DUT(
.clk(clk_tb),
.rst(rst_tb),  
.rx_in(rx_in_tb),
.par_en(par_en_tb),
.par_type(par_type_tb),
.data_valid(data_valid_tb),
.p_data(p_data_tb)
);
endmodule
