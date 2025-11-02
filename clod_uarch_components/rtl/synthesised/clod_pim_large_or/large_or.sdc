# ============================================================
# Simple SDC for large_or module
# ============================================================

# Assume an external clock drives the input logic
# Define a virtual clock for timing reference (10 ns period = 100 MHz)
create_clock -name virtual_clk -period 10

# Define input delay — assume inputs arrive 2 ns after clock edge
set_input_delay 2 -clock virtual_clk [get_ports match_bits[*]]

# Define output delay — assume the output must be ready 2 ns before next clock edge
set_output_delay 2 -clock virtual_clk [get_ports out]

# Optional: set input transition time to model driving strength
set_input_transition 0.1 [get_ports match_bits[*]]

# Optional: set output load capacitance to model receiver load
set_load 0.05 [get_ports out]
