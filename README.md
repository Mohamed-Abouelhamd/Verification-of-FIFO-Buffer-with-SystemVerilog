# Verification of FIFO Buffer with SystemVerilog

This project of verifying a FIFO design using system Verilog includes:

  1) Interface Creation: Develop an interface that uses a clocking block to handle the clock signal for synchronous operations, ensuring proper sampling of input signals and driving of output signals.

  2) Input Randomization: Randomize the input data for the FIFO according to the following constraints:
    
| **Signal**                                      | **Range**                     | **Probability**          | **Condition**                                                        |
|----------------------------------------------------|-------------------------------|--------------------------|------------------------------------------------------------------|
| **First 8 bits of `data_in`**                      | [100:230]                     | -                        | Must fall within this range.  |
| **Second 8 bits of `data_in`**                     | [200:255]                     | -                        | Must fall within this range. |
| **Third 8 bits of `data_in`**                      | [0:100]                       | 30%                      | Probability distribution: |
|                                                    | [100:200]                     | 60%                      | - |
|                                                    | [200:255]                     | 10%                      | - |
| **Last 8 bits of `data_in`**                       | [0:50]                        | -                        |  Within [0:50] if the first 8 bits are >150.    |
|                                                    | [0:255]                       | -                        |  Within [0:255] if the first 8 bits ≤150.       |
| **Read_enable**                             | Randomized                    | Weighted Random          | -                                  |
| **Write_enable**                            | Randomized                    | Weighted Random          | -                                  |

  3) Coverage Points: Implement cover points to ensure 100% coverage of the Full Flag and Empty Flag signals.
  4) Assertions1: Write an assertion to verify the following condition: When the **Write_enable** signal is asserted and the FIFO is not full, the write pointer **write_ptr** should increment.
  5)  Assertion 2: Write any additional assertion that you consider important for verifying the correctness or functionality of the FIFO design.
  6)  Code Coverage: Perform code coverage analysis to assess the effectiveness of the testbench in exercising the RTL code.

#### Note on the Design after verifying it:
The design is correctly well except for when the full signal is asserted, the FIFO is not totally full. The last address does not contain data.