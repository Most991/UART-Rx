module FSM(
input wire rx_in,
input wire par_en,
input wire par_err,
input wire strt_glitch,
input wire stp_err,
input wire [3:0] bit_cnt,
input wire [5:0] edge_cnt,
input wire clk,
input wire rst,
input wire p_data_ready,
input wire done,
/////////////////////////////////////////
output reg par_chk_en,
output reg strt_chk_en,
output reg stp_chk_en,
output reg data_valid,
output reg deser_en,
output reg cnt_en,
output reg dat_samp_en
);

/////////////////////////////////////////
localparam idle = 3'd0,
           data_samp_strt_chk = 3'd1,
           deserializer = 3'd2,
           parity_chk = 3'd3,
           stop_chk = 3'd4;
/////////////////////////////////////////
reg [2:0] current_state, next_state;
/////////////////////////////////////////

/////////////////////////////////////////
always @ (posedge clk or negedge rst)
begin
  if (!rst)
    current_state <= idle;
  else 
    current_state <= next_state;
end  
//////////////////////////////////////////

//////////////////////////////////////////

always @ (*)
begin
 case(current_state)
//////////////////////////////////////////   
   idle: begin
     data_valid = 1'b0;
     cnt_en = 1'b0;
     strt_chk_en = 1'b0;
     dat_samp_en = 1'b0;
     stp_chk_en = 1'b0;
     if (rx_in == 1'b0) begin
       next_state = data_samp_strt_chk;
       cnt_en = 1'b1;
       dat_samp_en = 1'b1;
     end else
       next_state = idle;        
         end
//////////////////////////////////////////       
   data_samp_strt_chk: begin 
     if (edge_cnt == 6'd6)           
       strt_chk_en = 1'b1; 
     if (strt_glitch == 1'b0 && bit_cnt == 4'd1)
       next_state = deserializer;
     else
       next_state = data_samp_strt_chk;       
                       end   
//////////////////////////////////////////
    deserializer: begin
      strt_chk_en = 1'b0;
      deser_en = 1'b1;
      
      if(bit_cnt == 4'd9 && p_data_ready == 1'b1 && par_en)
        next_state = parity_chk;
        
      else if (bit_cnt == 4'd9 && p_data_ready == 1'b1 && !par_en)
        next_state = stop_chk;
        
      else
        next_state = deserializer;      
                 end                     
//////////////////////////////////////////
    parity_chk: begin
      if (edge_cnt == 6'd6) 
        par_chk_en = 1'b1;
      deser_en = 1'b0;
      if (bit_cnt == 4'd10)
        next_state = stop_chk;
      else
        next_state = parity_chk;        
                end                       
//////////////////////////////////////////
    stop_chk: begin
      par_chk_en = 1'b0;
      if (edge_cnt == 6'd6) 
        stp_chk_en = 1'b1;
      if (done && edge_cnt == 6'd8) begin
        next_state = idle;
        if (!par_err && !stp_err) 
          data_valid = 1'b1;
        else 
          data_valid = 1'b0; 
      end else
        next_state = stop_chk;        
              end                       
 endcase 
end  


endmodule