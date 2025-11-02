//==============================================================================
// clod_pim_large_or.v
// 
// A large OR gate with [Num_rows_in_DRAM - 1:0] bit array as an input
// Returns 1 if any of the bits in the array is set to logic high
//
// Parameters:
//   num_row_elements: Number of elements in a DRAM Sub-array's row
//
// Ports:
//   match_bits : Output from CLoD PiM Match logic 
//   out : Single bit wire output
// out == 1 if match_bits != '0 (can implement like this instead of a bitwise or)
//==============================================================================
module clod_pim_large_or#(
    parameter num_row_elements = 256
)(
  input wire [num_row_elements-1:0] match_bits,
  output wire out
);
  
  assign out = |match_bits;
  
endmodule
