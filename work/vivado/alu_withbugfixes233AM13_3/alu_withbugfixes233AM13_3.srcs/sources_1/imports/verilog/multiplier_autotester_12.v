/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module multiplier_autotester_12 (
    input clk,
    input rst,
    input [0:0] button_next_test_case,
    input [0:0] button_speed_through,
    input [0:0] button_reset,
    input [0:0] inv,
    output reg [4:0] current_test_case,
    output reg [1:0] current_statusPF,
    output reg [15:0] out
  );
  
  
  
  reg [4:0] M_current_test_case_register_d, M_current_test_case_register_q = 5'h00;
  
  reg [15:0] M_reg_current_out_d, M_reg_current_out_q = 1'h0;
  
  reg [1:0] M_reg_current_statusPF_d, M_reg_current_statusPF_q = 2'h0;
  
  reg [0:0] M_speed_through_d, M_speed_through_q = 1'h0;
  
  
  localparam IDLE_state = 2'd0;
  localparam TESTING_state = 2'd1;
  localparam PASS_state = 2'd2;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  
  
  localparam NULL_track_failure = 1'd0;
  localparam FAIL_BEFORE_track_failure = 1'd1;
  
  reg M_track_failure_d, M_track_failure_q = NULL_track_failure;
  
  wire [16-1:0] M_alu_unit_out;
  wire [3-1:0] M_alu_unit_zvn;
  reg [16-1:0] M_alu_unit_a;
  reg [16-1:0] M_alu_unit_b;
  reg [1-1:0] M_alu_unit_inv;
  reg [6-1:0] M_alu_unit_alufn_signal;
  alu_7 alu_unit (
    .a(M_alu_unit_a),
    .b(M_alu_unit_b),
    .inv(M_alu_unit_inv),
    .alufn_signal(M_alu_unit_alufn_signal),
    .out(M_alu_unit_out),
    .zvn(M_alu_unit_zvn)
  );
  
  localparam TEST_CASE_ROM = 896'h020f00f0f01000020002fff8fff002ff00f0f0100002fffefff80010020f0000f010000200020008001002fffff0001000020001f000f000020000ffff000002ffff00ffff0102000100ff00ff02000000ff000002ffffffff0001020001000100010200000000000000000000000000;
  
  always @* begin
    M_track_failure_d = M_track_failure_q;
    M_state_d = M_state_q;
    M_speed_through_d = M_speed_through_q;
    M_current_test_case_register_d = M_current_test_case_register_q;
    M_reg_current_out_d = M_reg_current_out_q;
    M_reg_current_statusPF_d = M_reg_current_statusPF_q;
    
    M_alu_unit_a = 16'h0000;
    M_alu_unit_b = 16'h0000;
    M_alu_unit_inv = inv;
    M_alu_unit_alufn_signal = 6'h00;
    M_state_d = IDLE_state;
    if (button_speed_through) begin
      M_speed_through_d = 1'h1;
    end
    
    case (M_state_q)
      IDLE_state: begin
        if (M_speed_through_q) begin
          if (M_current_test_case_register_q < 5'h10) begin
            M_state_d = TESTING_state;
            M_current_test_case_register_d = M_current_test_case_register_q + 5'h01;
          end
        end
        if (button_next_test_case) begin
          if (M_current_test_case_register_q < 5'h10) begin
            M_state_d = TESTING_state;
            M_current_test_case_register_d = M_current_test_case_register_q + 5'h01;
          end
        end
        if (button_reset) begin
          M_state_d = IDLE_state;
          M_current_test_case_register_d = 5'h00;
          M_reg_current_out_d = 16'h0000;
          M_reg_current_statusPF_d = 2'h0;
          M_speed_through_d = 1'h0;
        end
      end
      TESTING_state: begin
        
        case (M_current_test_case_register_q)
          M_current_test_case_register_q: begin
            if (M_current_test_case_register_q == 5'h10) begin
              M_state_d = PASS_state;
            end else begin
              M_alu_unit_a = TEST_CASE_ROM[(M_current_test_case_register_q)*56+32+15-:16];
              M_alu_unit_b = TEST_CASE_ROM[(M_current_test_case_register_q)*56+16+15-:16];
              M_alu_unit_alufn_signal = TEST_CASE_ROM[(M_current_test_case_register_q)*56+48+5-:6];
              M_reg_current_statusPF_d = 2'h1;
              current_test_case = M_current_test_case_register_q;
              M_reg_current_out_d = M_alu_unit_out;
              if (M_alu_unit_out != TEST_CASE_ROM[(M_current_test_case_register_q)*56+0+15-:16]) begin
                M_track_failure_d = FAIL_BEFORE_track_failure;
                M_reg_current_statusPF_d = 2'h2;
              end
              M_state_d = IDLE_state;
            end
          end
        endcase
      end
      PASS_state: begin
        if (M_track_failure_q == FAIL_BEFORE_track_failure) begin
          M_reg_current_statusPF_d = 2'h2;
        end else begin
          M_reg_current_statusPF_d = 2'h3;
        end
        if (button_reset) begin
          M_state_d = IDLE_state;
          M_current_test_case_register_d = 5'h00;
          M_reg_current_out_d = 16'h0000;
          M_reg_current_statusPF_d = 2'h0;
          M_speed_through_d = 1'h0;
        end
      end
    endcase
    out = M_reg_current_out_q;
    current_test_case = M_current_test_case_register_q;
    current_statusPF = M_reg_current_statusPF_q;
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
      M_track_failure_q <= 1'h0;
    end else begin
      M_track_failure_q <= M_track_failure_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_current_test_case_register_q <= 5'h00;
    end else begin
      M_current_test_case_register_q <= M_current_test_case_register_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_reg_current_out_q <= 1'h0;
    end else begin
      M_reg_current_out_q <= M_reg_current_out_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_speed_through_q <= 1'h0;
    end else begin
      M_speed_through_q <= M_speed_through_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_reg_current_statusPF_q <= 2'h0;
    end else begin
      M_reg_current_statusPF_q <= M_reg_current_statusPF_d;
    end
  end
  
endmodule
