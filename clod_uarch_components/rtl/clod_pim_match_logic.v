//==============================================================================
// clod_pim_match_logic.v
// 
// Combinational logic module that compares two arrays and outputs bitwise match
// results. For each element position, outputs '1' if the elements match, '0' otherwise.
//
// Parameters:
//   DATA_WIDTH: Width of each array element in bits
//   ARRAY_SIZE: Number of elements in each array
//
// Ports:
//   array_a: First input array [ARRAY_SIZE-1:0][DATA_WIDTH-1:0]
//   array_b: Second input array [ARRAY_SIZE-1:0][DATA_WIDTH-1:0]
//   match_out: Bitwise match output [ARRAY_SIZE-1:0]
//              match_out[i] = 1 if array_a[i] == array_b[i], else 0
//==============================================================================

module clod_pim_match_logic #(
    parameter DATA_WIDTH = 8,    // Width of each array element
    parameter ARRAY_SIZE = 256   // Number of elements in each array - number of elements in a row
) (
    input  wire [ARRAY_SIZE-1:0][DATA_WIDTH-1:0] array_a,  // First input array
    input  wire [ARRAY_SIZE-1:0][DATA_WIDTH-1:0] array_b,  // Second input array
    output wire [ARRAY_SIZE-1:0]                  match_out // Bitwise match output
);

    // Generate match logic for each array element
    genvar i;
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : gen_match_logic
            // Compare each element and output 1 if equal, 0 if not equal
            assign match_out[i] = (array_a[i] == array_b[i]) ? 1'b1 : 1'b0;
        end
    endgenerate

endmodule
