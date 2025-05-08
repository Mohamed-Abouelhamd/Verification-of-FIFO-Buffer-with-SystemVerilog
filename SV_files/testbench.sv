import FIFO_pkg::*;

module test(intf.test _if1);

covergroup cg;
  option.per_instance = 1;
  Full_Flag: coverpoint _if1.cb.full;
  Empty_Flag: coverpoint _if1.cb.empty;
endgroup
  cg cg_inst = new();
  mycons cls = new();

always @( _if1.cb)
  begin
          cls.randomize();
          _if1.cb.data_in <= cls.data_in_r;
          _if1.cb.Read_enable <= cls.Read_enable_r;
          _if1.cb.Wr_enable <= cls.Wr_enable_r;
$display("Data_in= %0d, Read_en= %0d, Wr_en= %0d", _if1.cb.data_in, _if1.cb.Read_enable, _if1.cb.Wr_enable);
$display("Data_out= %0d, Full= %0d, Empty= %0d\n", _if1.cb.data_out, _if1.cb.full, _if1.cb.empty);
    cg_inst.sample();
  end 
endmodule 