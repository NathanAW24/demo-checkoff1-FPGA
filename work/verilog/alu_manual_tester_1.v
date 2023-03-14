/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_manual_tester_1 (
    input clk,
    input rst,
    input [1:0] button,
    input [21:0] dip,
    input [0:0] inv,
    output reg [15:0] out,
    output reg [15:0] out_segs,
    output reg [2:0] out_zvn
  );
  
  
  
  reg [15:0] M_inputA_d, M_inputA_q = 1'h0;
  
  reg [15:0] M_inputB_d, M_inputB_q = 1'h0;
  
  reg [5:0] M_alufn_d, M_alufn_q = 1'h0;
  
  reg [0:0] M_inputInv_d, M_inputInv_q = 1'h0;
  
  reg [15:0] M_result_d, M_result_q = 1'h0;
  
  reg [15:0] M_segs_d, M_segs_q = 1'h0;
  
  
  localparam WAITA_state = 2'd0;
  localparam WAITB_state = 2'd1;
  localparam WAITALUFN_state = 2'd2;
  localparam GETRESULT_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = WAITA_state;
  
  wire [16-1:0] M_aluUnit_out;
  wire [3-1:0] M_aluUnit_zvn;
  reg [16-1:0] M_aluUnit_a;
  reg [16-1:0] M_aluUnit_b;
  reg [1-1:0] M_aluUnit_inv;
  reg [6-1:0] M_aluUnit_alufn_signal;
  alu_7 aluUnit (
    .a(M_aluUnit_a),
    .b(M_aluUnit_b),
    .inv(M_aluUnit_inv),
    .alufn_signal(M_aluUnit_alufn_signal),
    .out(M_aluUnit_out),
    .zvn(M_aluUnit_zvn)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_result_d = M_result_q;
    M_inputB_d = M_inputB_q;
    M_inputA_d = M_inputA_q;
    M_inputInv_d = M_inputInv_q;
    M_segs_d = M_segs_q;
    M_alufn_d = M_alufn_q;
    
    M_aluUnit_a = M_inputA_q;
    M_aluUnit_b = M_inputB_q;
    M_aluUnit_alufn_signal = M_alufn_q;
    M_aluUnit_inv = M_inputInv_q;
    
    case (M_state_q)
      WAITA_state: begin
        M_result_d = dip[0+15-:16];
        M_segs_d = 16'ha000;
        if (button[1+0-:1]) begin
          M_inputA_d = dip[0+15-:16];
          M_state_d = WAITB_state;
        end else begin
          M_state_d = WAITA_state;
        end
      end
      WAITB_state: begin
        M_result_d = dip[0+15-:16];
        M_segs_d = 16'h0b00;
        if (button[1+0-:1]) begin
          M_inputB_d = dip[0+15-:16];
          M_state_d = WAITALUFN_state;
        end else begin
          M_state_d = WAITB_state;
        end
      end
      WAITALUFN_state: begin
        M_result_d[6+9-:10] = 1'h0;
        M_result_d[0+5-:6] = dip[16+5-:6];
        M_segs_d = 16'h00f0;
        if (button[1+0-:1]) begin
          M_alufn_d = dip[16+5-:6];
          M_state_d = GETRESULT_state;
          M_inputInv_d = inv;
        end else begin
          M_state_d = WAITALUFN_state;
        end
      end
      GETRESULT_state: begin
        M_result_d = M_aluUnit_out;
        M_segs_d = {M_aluUnit_out[12+3-:4], M_aluUnit_out[8+3-:4], M_aluUnit_out[4+3-:4], M_aluUnit_out[0+3-:4]};
        if (button[1+0-:1]) begin
          M_inputA_d = 1'h0;
          M_inputB_d = 1'h0;
          M_alufn_d = 1'h0;
          M_result_d = 1'h0;
          M_state_d = WAITA_state;
        end else begin
          M_state_d = GETRESULT_state;
        end
      end
    endcase
    if (button[0+0-:1]) begin
      M_inputA_d = 1'h0;
      M_inputB_d = 1'h0;
      M_alufn_d = 1'h0;
      M_result_d = 1'h0;
      M_state_d = WAITA_state;
    end
    out = M_result_q;
    out_zvn = M_aluUnit_zvn;
    out_segs = M_segs_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_inputB_q <= 1'h0;
    end else begin
      M_inputB_q <= M_inputB_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_alufn_q <= 1'h0;
    end else begin
      M_alufn_q <= M_alufn_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_inputInv_q <= 1'h0;
    end else begin
      M_inputInv_q <= M_inputInv_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_result_q <= 1'h0;
    end else begin
      M_result_q <= M_result_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_segs_q <= 1'h0;
    end else begin
      M_segs_q <= M_segs_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_inputA_q <= 1'h0;
    end else begin
      M_inputA_q <= M_inputA_d;
    end
  end
  
endmodule
