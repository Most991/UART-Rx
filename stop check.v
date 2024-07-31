module stop_check(
  
input wire stop_bit,
input wire stop_chk_en,
output reg stop_error,
output reg done
);

always @ (*)
  begin
    
    if (!stop_chk_en) begin
      stop_error = 1'b0;
      done = 1'b0;
    end
    
    else  if (stop_bit == 1'b1 && stop_chk_en) begin
      stop_error = 1'b0;
      done = 1'b1;
    end  
      
    else if (stop_bit == 1'b0 && stop_chk_en) begin
      stop_error = 1'b1;
      done = 1'b1;
    end    
  end  
endmodule  
