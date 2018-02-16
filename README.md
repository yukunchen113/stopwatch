# stopwatch
Stopwatch implemented in Verilog HDL

For Mechatronics 3TB4 course, Lab 2 at McMaster University.
##### Description of Lab:
In this lab we built a stopwatch on the DE2 board that displayed the time on the seven
segment display. The stopwatch could be set, reset, and stopped using three separate keys.
We implemented this by creating several modules. These modules were hex_counter,
control_ff, hex_to_BCD_converter and seven_seg_decoder. In the main module we
implemented the clock be connecting these modules. The values of the key presses were
stored in a RS flip-flop. We used the counter to divide the main 50MHz clock to a millisecond
clock. The new clock then went into another counter which created the time to be displayed on
the seven segment display. The time in binary was then converted to BCD through the
hex_to_BCD module. This module output 7 BCD numbers, which each went to a
seven_seg_decoder module, then to the display.   
