/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = 5
     DIV = 27
     TOP = 9
     UP = 1
*/
module custom_counter_24 (
    input clk,
    input rst,
    input manual_reset,
    output reg [4:0] value
  );
  
  localparam SIZE = 3'h5;
  localparam DIV = 5'h1b;
  localparam TOP = 4'h9;
  localparam UP = 1'h1;
  
  
  reg [31:0] M_ctr_d, M_ctr_q = 1'h0;
  
  localparam MAX_VALUE = 31'h4fffffff;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    value = M_ctr_q[27+4-:5];
    if (manual_reset == 1'h1) begin
      M_ctr_d = 1'h0;
    end
    if (1'h1) begin
      M_ctr_d = M_ctr_q + 1'h1;
      if (1'h1 && M_ctr_q == 31'h4fffffff) begin
        M_ctr_d = 1'h0;
      end
    end else begin
      M_ctr_d = M_ctr_q - 1'h1;
      if (1'h1 && M_ctr_q == 1'h0) begin
        M_ctr_d = 31'h4fffffff;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule
