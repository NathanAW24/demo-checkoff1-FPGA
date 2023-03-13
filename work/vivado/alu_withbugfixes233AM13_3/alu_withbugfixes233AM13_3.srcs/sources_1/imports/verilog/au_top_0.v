/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [16-1:0] M_manual_out;
  wire [16-1:0] M_manual_out_segs;
  wire [3-1:0] M_manual_out_zvn;
  reg [2-1:0] M_manual_button;
  reg [22-1:0] M_manual_dip;
  reg [1-1:0] M_manual_inv;
  alu_manual_tester_1 manual (
    .clk(clk),
    .rst(rst),
    .button(M_manual_button),
    .dip(M_manual_dip),
    .inv(M_manual_inv),
    .out(M_manual_out),
    .out_segs(M_manual_out_segs),
    .out_zvn(M_manual_out_zvn)
  );
  
  wire [16-1:0] M_auto_out;
  wire [5-1:0] M_auto_out_current_test_case;
  wire [3-1:0] M_auto_out_current_alu_function;
  wire [2-1:0] M_auto_out_test_statusPF;
  reg [5-1:0] M_auto_button;
  reg [1-1:0] M_auto_inv;
  auto_tester_2 auto (
    .clk(clk),
    .rst(rst),
    .button(M_auto_button),
    .inv(M_auto_inv),
    .out(M_auto_out),
    .out_current_test_case(M_auto_out_current_test_case),
    .out_current_alu_function(M_auto_out_current_alu_function),
    .out_test_statusPF(M_auto_out_test_statusPF)
  );
  
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_3 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  wire [(3'h5+0)-1:0] M_buttoncond_out;
  reg [(3'h5+0)-1:0] M_buttoncond_in;
  
  genvar GEN_buttoncond0;
  generate
  for (GEN_buttoncond0=0;GEN_buttoncond0<3'h5;GEN_buttoncond0=GEN_buttoncond0+1) begin: buttoncond_gen_0
    button_conditioner_4 buttoncond (
      .clk(clk),
      .in(M_buttoncond_in[GEN_buttoncond0*(1)+(1)-1-:(1)]),
      .out(M_buttoncond_out[GEN_buttoncond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [(3'h5+0)-1:0] M_buttondetector_out;
  reg [(3'h5+0)-1:0] M_buttondetector_in;
  
  genvar GEN_buttondetector0;
  generate
  for (GEN_buttondetector0=0;GEN_buttondetector0<3'h5;GEN_buttondetector0=GEN_buttondetector0+1) begin: buttondetector_gen_0
    edge_detector_5 buttondetector (
      .clk(clk),
      .in(M_buttondetector_in[GEN_buttondetector0*(1)+(1)-1-:(1)]),
      .out(M_buttondetector_out[GEN_buttondetector0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  reg M_auto_mode_register_d, M_auto_mode_register_q = 1'h0;
  
  
  localparam MANUAL_mode = 1'd0;
  localparam AUTO_mode = 1'd1;
  
  reg M_mode_d, M_mode_q = MANUAL_mode;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_6 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    M_mode_d = M_mode_q;
    M_auto_mode_register_d = M_auto_mode_register_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    io_led[16+6+0-:1] = io_dip[16+6+0-:1];
    M_auto_mode_register_d = io_dip[16+7+0-:1];
    io_led[16+7+0-:1] = io_dip[16+7+0-:1];
    M_seg_values = 16'hffff;
    M_buttoncond_in = io_button;
    M_buttondetector_in = M_buttoncond_out;
    M_manual_button = M_buttondetector_out[1+1-:2];
    M_manual_inv = io_dip[16+6+0-:1];
    M_manual_dip[0+7-:8] = io_dip[0+7-:8];
    M_manual_dip[8+7-:8] = io_dip[8+7-:8];
    M_manual_dip[16+5-:6] = io_dip[16+0+5-:6];
    M_auto_button = M_buttondetector_out;
    M_auto_inv = io_dip[0+0+0-:1];
    
    case (M_mode_q)
      MANUAL_mode: begin
        M_seg_values = M_manual_out_segs;
        io_led[16+0+2-:3] = M_manual_out_zvn;
        io_led[0+7-:8] = M_manual_out[0+7-:8];
        io_led[8+7-:8] = M_manual_out[8+7-:8];
        M_auto_mode_register_d = io_dip[16+7+0-:1];
        if (M_auto_mode_register_q == 1'h1) begin
          M_mode_d = AUTO_mode;
        end
      end
      AUTO_mode: begin
        if (M_auto_out_current_alu_function == 1'h0) begin
          io_led[8+3+4-:5] = M_auto_out_current_alu_function;
          io_led[8+0+1-:2] = 2'h0;
        end else begin
          io_led[0+0+4-:5] = M_auto_out_current_test_case;
          io_led[8+0+1-:2] = M_auto_out_test_statusPF;
          M_seg_values = {M_auto_out[12+3-:4], M_auto_out[8+3-:4], M_auto_out[4+3-:4], M_auto_out[0+3-:4]};
          
          case (M_auto_out_current_alu_function)
            1'h1: begin
              io_led[8+7+0-:1] = 1'h1;
            end
            2'h2: begin
              io_led[8+6+0-:1] = 1'h1;
            end
            2'h3: begin
              io_led[8+5+0-:1] = 1'h1;
            end
            3'h4: begin
              io_led[8+4+0-:1] = 1'h1;
            end
            3'h5: begin
              io_led[8+3+0-:1] = 1'h1;
            end
          endcase
          if (M_auto_mode_register_q == 1'h0) begin
            M_mode_d = MANUAL_mode;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_auto_mode_register_q <= 1'h0;
    end else begin
      M_auto_mode_register_q <= M_auto_mode_register_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_mode_q <= 1'h0;
    end else begin
      M_mode_q <= M_mode_d;
    end
  end
  
endmodule
