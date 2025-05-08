import FIFO_pkg::*;
module FIFO (intf.FIFO _if2); 
    reg  [DATA_WIDTH-1:0] FIFO  [fifo_size-1:0] ;
    reg [ADDR_WIDTH-1:0] write_ptr,read_ptr;

    assign _if2.empty   = ( write_ptr == read_ptr ) ? 1'b1 : 1'b0;
    assign _if2.full    = ( read_ptr == (write_ptr+1) ) ? 1'b1 : 1'b0;
integer i;
    always @ (posedge _if2.clk , posedge _if2.reset) begin
        if(_if2.reset) begin
         for(i=0;i<fifo_size;i=i+1) begin
            FIFO[i]<=0;
         end
         write_ptr <=0;
        end
  else if( _if2.Wr_enable && ~_if2.full) begin
            FIFO[write_ptr] <= _if2.data_in;
              write_ptr <= write_ptr + 1;
        end
    end

    always @ (posedge _if2.clk, posedge _if2.reset) begin

        if(_if2.reset) begin
            _if2.data_out <= 0;
            read_ptr <= 0;
        end

        else if( _if2.Read_enable && ~_if2.empty) begin
            _if2.data_out <= FIFO[read_ptr];
            read_ptr <= read_ptr + 1;
        end
    end
endmodule


