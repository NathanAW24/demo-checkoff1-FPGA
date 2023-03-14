/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module auto_tester_2 (
    input clk,
    input rst,
    input [4:0] button,
    input [0:0] inv,
    output reg [15:0] out,
    output reg [4:0] out_current_test_case,
    output reg [2:0] out_current_alu_function,
    output reg [1:0] out_test_statusPF
  );
  
  
  
  wire [5-1:0] M_test_adder_current_test_case;
  wire [2-1:0] M_test_adder_current_statusPF;
  wire [16-1:0] M_test_adder_out;
  reg [1-1:0] M_test_adder_button_next_test_case;
  reg [1-1:0] M_test_adder_button_speed_through;
  reg [1-1:0] M_test_adder_button_reset;
  reg [1-1:0] M_test_adder_inv;
  adder_autotester_8 test_adder (
    .clk(clk),
    .rst(rst),
    .button_next_test_case(M_test_adder_button_next_test_case),
    .button_speed_through(M_test_adder_button_speed_through),
    .button_reset(M_test_adder_button_reset),
    .inv(M_test_adder_inv),
    .current_test_case(M_test_adder_current_test_case),
    .current_statusPF(M_test_adder_current_statusPF),
    .out(M_test_adder_out)
  );
  
  wire [5-1:0] M_test_compare_current_test_case;
  wire [2-1:0] M_test_compare_current_statusPF;
  wire [16-1:0] M_test_compare_out;
  reg [1-1:0] M_test_compare_button_next_test_case;
  reg [1-1:0] M_test_compare_button_speed_through;
  reg [1-1:0] M_test_compare_button_reset;
  reg [1-1:0] M_test_compare_inv;
  compare_autotester_9 test_compare (
    .clk(clk),
    .rst(rst),
    .button_next_test_case(M_test_compare_button_next_test_case),
    .button_speed_through(M_test_compare_button_speed_through),
    .button_reset(M_test_compare_button_reset),
    .inv(M_test_compare_inv),
    .current_test_case(M_test_compare_current_test_case),
    .current_statusPF(M_test_compare_current_statusPF),
    .out(M_test_compare_out)
  );
  
  wire [5-1:0] M_test_boolean_current_test_case;
  wire [2-1:0] M_test_boolean_current_statusPF;
  wire [16-1:0] M_test_boolean_out;
  reg [1-1:0] M_test_boolean_button_next_test_case;
  reg [1-1:0] M_test_boolean_button_speed_through;
  reg [1-1:0] M_test_boolean_button_reset;
  reg [1-1:0] M_test_boolean_inv;
  boolean_autotester_10 test_boolean (
    .clk(clk),
    .rst(rst),
    .button_next_test_case(M_test_boolean_button_next_test_case),
    .button_speed_through(M_test_boolean_button_speed_through),
    .button_reset(M_test_boolean_button_reset),
    .inv(M_test_boolean_inv),
    .current_test_case(M_test_boolean_current_test_case),
    .current_statusPF(M_test_boolean_current_statusPF),
    .out(M_test_boolean_out)
  );
  
  wire [5-1:0] M_test_shifter_current_test_case;
  wire [2-1:0] M_test_shifter_current_statusPF;
  wire [16-1:0] M_test_shifter_out;
  reg [1-1:0] M_test_shifter_button_next_test_case;
  reg [1-1:0] M_test_shifter_button_speed_through;
  reg [1-1:0] M_test_shifter_button_reset;
  reg [1-1:0] M_test_shifter_inv;
  shifter_autotester_11 test_shifter (
    .clk(clk),
    .rst(rst),
    .button_next_test_case(M_test_shifter_button_next_test_case),
    .button_speed_through(M_test_shifter_button_speed_through),
    .button_reset(M_test_shifter_button_reset),
    .inv(M_test_shifter_inv),
    .current_test_case(M_test_shifter_current_test_case),
    .current_statusPF(M_test_shifter_current_statusPF),
    .out(M_test_shifter_out)
  );
  
  wire [5-1:0] M_test_multiply_current_test_case;
  wire [2-1:0] M_test_multiply_current_statusPF;
  wire [16-1:0] M_test_multiply_out;
  reg [1-1:0] M_test_multiply_button_next_test_case;
  reg [1-1:0] M_test_multiply_button_speed_through;
  reg [1-1:0] M_test_multiply_button_reset;
  reg [1-1:0] M_test_multiply_inv;
  multiplier_autotester_12 test_multiply (
    .clk(clk),
    .rst(rst),
    .button_next_test_case(M_test_multiply_button_next_test_case),
    .button_speed_through(M_test_multiply_button_speed_through),
    .button_reset(M_test_multiply_button_reset),
    .inv(M_test_multiply_inv),
    .current_test_case(M_test_multiply_current_test_case),
    .current_statusPF(M_test_multiply_current_statusPF),
    .out(M_test_multiply_out)
  );
  
  
  localparam IDLE_tester_function_state = 3'd0;
  localparam ADDER_tester_function_state = 3'd1;
  localparam COMPARATOR_tester_function_state = 3'd2;
  localparam BOOLEAN_tester_function_state = 3'd3;
  localparam SHIFTER_tester_function_state = 3'd4;
  localparam MULTIPLIER_tester_function_state = 3'd5;
  localparam ERROR_tester_function_state = 3'd6;
  
  reg [2:0] M_tester_function_state_d, M_tester_function_state_q = IDLE_tester_function_state;
  
  always @* begin
    M_tester_function_state_d = M_tester_function_state_q;
    
    M_test_adder_inv = inv;
    M_test_adder_button_reset = button[1+0-:1];
    M_test_adder_button_next_test_case = button[2+0-:1];
    M_test_adder_button_speed_through = button[0+0-:1];
    M_test_compare_inv = inv;
    M_test_compare_button_reset = button[1+0-:1];
    M_test_compare_button_next_test_case = button[2+0-:1];
    M_test_compare_button_speed_through = button[0+0-:1];
    M_test_boolean_inv = inv;
    M_test_boolean_button_reset = button[1+0-:1];
    M_test_boolean_button_next_test_case = button[2+0-:1];
    M_test_boolean_button_speed_through = button[0+0-:1];
    M_test_shifter_inv = inv;
    M_test_shifter_button_reset = button[1+0-:1];
    M_test_shifter_button_next_test_case = button[2+0-:1];
    M_test_shifter_button_speed_through = button[0+0-:1];
    M_test_multiply_inv = inv;
    M_test_multiply_button_reset = button[1+0-:1];
    M_test_multiply_button_next_test_case = button[2+0-:1];
    M_test_multiply_button_speed_through = button[0+0-:1];
    out_test_statusPF = 2'h0;
    out_current_alu_function = M_tester_function_state_q;
    out = 16'h0000;
    out_current_test_case = 5'h00;
    
    case (M_tester_function_state_q)
      IDLE_tester_function_state: begin
        out_test_statusPF = 2'h0;
        if (button[3+0-:1]) begin
          M_tester_function_state_d = MULTIPLIER_tester_function_state;
          M_test_multiply_button_reset = 1'h1;
        end else begin
          if (button[4+0-:1]) begin
            M_tester_function_state_d = M_tester_function_state_q + 1'h1;
            M_test_adder_button_reset = 1'h1;
            M_test_boolean_button_reset = 1'h1;
            M_test_compare_button_reset = 1'h1;
            M_test_multiply_button_reset = 1'h1;
            M_test_shifter_button_reset = 1'h1;
          end
        end
      end
      ADDER_tester_function_state: begin
        out_test_statusPF = M_test_adder_current_statusPF;
        out_current_test_case = M_test_adder_current_test_case;
        out = M_test_adder_out;
        if (button[3+0-:1]) begin
          M_tester_function_state_d = M_tester_function_state_q - 1'h1;
          M_test_multiply_button_reset = 1'h1;
        end else begin
          if (button[4+0-:1]) begin
            M_tester_function_state_d = M_tester_function_state_q + 1'h1;
            M_test_compare_button_reset = 1'h1;
          end
        end
      end
      COMPARATOR_tester_function_state: begin
        M_test_compare_inv = inv;
        out = M_test_compare_out;
        out_test_statusPF = M_test_compare_current_statusPF;
        out_current_test_case = M_test_compare_current_test_case;
        if (button[3+0-:1]) begin
          M_tester_function_state_d = M_tester_function_state_q - 1'h1;
          M_test_adder_button_reset = 1'h1;
        end else begin
          if (button[4+0-:1]) begin
            M_tester_function_state_d = M_tester_function_state_q + 1'h1;
            M_test_boolean_button_reset = 1'h1;
          end
        end
      end
      BOOLEAN_tester_function_state: begin
        M_test_boolean_inv = inv;
        out_test_statusPF = M_test_boolean_current_statusPF;
        out_current_test_case = M_test_boolean_current_test_case;
        out = M_test_boolean_out;
        if (button[3+0-:1]) begin
          M_tester_function_state_d = M_tester_function_state_q - 1'h1;
          M_test_compare_button_reset = 1'h1;
        end else begin
          if (button[4+0-:1]) begin
            M_tester_function_state_d = M_tester_function_state_q + 1'h1;
            M_test_shifter_button_reset = 1'h1;
          end
        end
      end
      SHIFTER_tester_function_state: begin
        M_test_shifter_inv = inv;
        out_test_statusPF = M_test_shifter_current_statusPF;
        out_current_test_case = M_test_shifter_current_test_case;
        out = M_test_shifter_out;
        if (button[3+0-:1]) begin
          M_tester_function_state_d = M_tester_function_state_q - 1'h1;
          M_test_boolean_button_reset = 1'h1;
        end else begin
          if (button[4+0-:1]) begin
            M_tester_function_state_d = M_tester_function_state_q + 1'h1;
            M_test_multiply_button_reset = 1'h1;
          end
        end
      end
      MULTIPLIER_tester_function_state: begin
        M_test_multiply_inv = inv;
        out_test_statusPF = M_test_multiply_current_statusPF;
        out_current_test_case = M_test_multiply_current_test_case;
        out = M_test_multiply_out;
        if (button[3+0-:1]) begin
          M_tester_function_state_d = M_tester_function_state_q - 1'h1;
          M_test_shifter_button_reset = 1'h1;
        end else begin
          if (button[4+0-:1]) begin
            M_tester_function_state_d = IDLE_tester_function_state;
            M_test_adder_button_reset = 1'h1;
          end
        end
      end
    endcase
    if (button[1+0-:1]) begin
      M_tester_function_state_d = IDLE_tester_function_state;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_tester_function_state_q <= 1'h0;
    end else begin
      M_tester_function_state_q <= M_tester_function_state_d;
    end
  end
  
endmodule
