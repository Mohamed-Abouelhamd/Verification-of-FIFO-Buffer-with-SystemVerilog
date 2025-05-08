package FIFO_pkg ;

parameter ADDR_WIDTH = 5;
parameter DATA_WIDTH = 32;
parameter fifo_size =2**ADDR_WIDTH;

class mycons;
rand logic [31:0] data_in_r;
rand logic Read_enable_r, Wr_enable_r;

constraint range_constraint {
  data_in_r[7:0] inside {[100:230]};
  data_in_r[15:8] inside {[200:255]};
  
  data_in_r[23:16] dist {
    [0:100]   := 30,
    [100:200] := 60,
    [200:255] := 10
  };
  
  if (data_in_r[7:0] > 150)
    data_in_r[31:24] inside {[0:50]};
  else
    data_in_r[31:24] inside {[0:255]};
}

constraint enable_constraint {
  Read_enable_r dist {
    1:= 60,
    0:= 40
  };
  
  Wr_enable_r dist {
    1:= 80,
    0:= 20
  };
}

endclass 

endpackage
