module clod_pim_large_mux #(
  parameter num_row_elements = 256,
  parameter element_width = 8
)(
  input [element_width - 1:0] row_buffer [num_row_elements-1:0], // 256 input lines, each 1 byte (256 bytes)
  input [element_width - 1:0] sel_op,             // 8-bit selection line from instruction opcode
  output [element_width - 1:0] lut_result        // 8-bit output (1 byte)
);

    // Use an assign statement with indexed selection
  assign lut_result = row_buffer[sel_op];

endmodule
