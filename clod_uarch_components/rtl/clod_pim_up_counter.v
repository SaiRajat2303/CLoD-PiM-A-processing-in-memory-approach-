module clod_pim_up_counter #(
  parameter max_count = 1024,
  parameter num_bits = 10
)
  (
    input i_clk,
    input i_reset,
    input i_enable,
    output logic [num_bits - 1:0] o_count
  );
  
  always_ff@(posedge i_clk or posedge i_reset) begin
    if (i_reset) begin
    	o_count <= '0;
    end
    else if (i_enable) begin
      if (o_count == max_count - 1) begin
      	o_count <= '0;
      end
      else begin
      	o_count <= o_count + 1;
      end
    end
  end
  
endmodule
