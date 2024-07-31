module start_check(
  
input wire start_bit,
input wire start_chk_en,
output reg start_glitch
);

always @ (*)
  begin
    
    if(!start_chk_en || (start_bit == 1'b0 && start_chk_en))
      start_glitch = 1'b0;
      
    else if (start_bit == 1'b1 && start_chk_en)
      start_glitch = 1'b1;
      
        
  end  
endmodule  
