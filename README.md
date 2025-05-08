# Verification-of-FIFO-Buffer-with-SystemVerilog

This project of verifying a FIFO design using system Verilog includes:

  1) Interface Creation: Develop an interface that uses a clocking block to handle the clock signal for synchronous operations, ensuring proper sampling of input signals and driving of output signals.
  
  2) Input Randomization: Randomize the input data for the FIFO according to the following constraints:
        - The first 8 bits of the input data, **data_in**, should fall within [100:230].
        - The second 8 bits of the input data should fall within [200:255].
        - The third 8 bits of the input data should be generated with the following probabilities:
            a. Range [0:100] with a probability of 30%.
            b. Range [100:200] with a probability of 60%.
            c. Range [200:255] with a probability of 10%.
        - The last 8 bits of the input data should fall within [0:50] if the first 8 bits are greater than 150; otherwise, they should fall within [0:255].
        - Randomize the Read_enable and Write_enable signals with appropriate weights of your choice.
  3) Coverage Points: Implement cover points to ensure 100% coverage of the Full Flag and Empty Flag signals.
  4) Assertions1: Write an assertion to verify the following condition: When the **Write_enable** signal is asserted and the FIFO is not full, the write pointer **write_ptr** should increment.
  5)  Assertion 2: Write any additional assertion that you consider important for verifying the correctness or functionality of the FIFO design.
