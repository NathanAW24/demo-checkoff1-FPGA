/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_autotester_11 (
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
  
  
  
  wire [5-1:0] M_ctr_sel;
  custom_counter_25 ctr (
    .clk(clk),
    .rst(button_reset),
    .sel(M_ctr_sel)
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
  
  localparam TEST_CASE_ROM = 784'h2312340004012323f00f000fffff23f0f00004ff0f23ffff0000ffff23ffff0008ffff21f00f000f000121f0f000040f0f21ffff0000ffff21ffff000800ff20f00f000f800020f0f000040f0020ffff0000ffff20ffff0008ff0000000000000000;
  
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
    if (button_reset) begin
      M_state_d = IDLE_state;
      M_current_test_case_register_d = 5'h00;
      M_reg_current_out_d = 16'h0000;
      M_reg_current_statusPF_d = 2'h0;
      M_speed_through_d = 1'h0;
      M_track_failure_d = NULL_track_failure;
    end
    if (button_speed_through) begin
      M_speed_through_d = 1'h1;
      M_current_test_case_register_d = 5'h00;
      M_reg_current_out_d = 16'h0000;
      M_reg_current_statusPF_d = 2'h0;
      M_track_failure_d = NULL_track_failure;
    end
    
    case (M_state_q)
      IDLE_state: begin
        if (M_speed_through_q) begin
          if (M_current_test_case_register_q < 5'h0e) begin
            M_state_d = TESTING_state;
            M_current_test_case_register_d = M_ctr_sel;
          end
        end
        if (button_next_test_case) begin
          if (M_current_test_case_register_q < 5'h0e) begin
            M_state_d = TESTING_state;
            M_current_test_case_register_d = M_current_test_case_register_q + 5'h01;
          end
        end
      end
      TESTING_state: begin
        
        case (M_current_test_case_register_q)
          M_current_test_case_register_q: begin
            if (M_current_test_case_register_q == 5'h0e) begin
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
      end
    endcase
    out = M_reg_current_out_q;
    current_test_case = M_current_test_case_register_q;
    current_statusPF = M_reg_current_statusPF_q;
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
      M_current_test_case_register_q <= 5'h00;
    end else begin
      M_current_test_case_register_q <= M_current_test_case_register_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_reg_current_statusPF_q <= 2'h0;
    end else begin
      M_reg_current_statusPF_q <= M_reg_current_statusPF_d;
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
      M_reg_current_out_q <= 1'h0;
    end else begin
      M_reg_current_out_q <= M_reg_current_out_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
