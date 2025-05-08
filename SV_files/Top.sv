module top;
logic clk,reset;
  
always #20 clk=~clk;
  
intf i(clk,reset);
FIFO DUT (i.FIFO);
test m2 (i.test);
  
initial
  begin 
      clk=0;
      reset=1;
      #2;
      reset=0;
      #8000;
      $finish;
  end
 /* initial  begin 
      $dumpfile("dump.vcd");
      $dumpvars;
  end*/

property p1;  
  @(posedge clk)
  disable iff(reset)
  (DUT._if2.Wr_enable==1) & (DUT._if2.full==0) |=> (DUT.write_ptr==$past(DUT.write_ptr)+1);
endproperty
assert property(p1);

property p2;
  @(posedge clk)
  disable iff(reset)
  (DUT._if2.Read_enable==1) & (DUT._if2.empty==0) |=> (DUT.read_ptr==$past(DUT.read_ptr)+1);
endproperty
assert property(p2);

endmodule
