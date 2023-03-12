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
  wire [16-1:0] M_manual_segment_display;
  reg [2-1:0] M_manual_button;
  reg [16-1:0] M_manual_dip_switch;
  reg [6-1:0] M_manual_alufn_sig;
  reg [1-1:0] M_manual_inv;
  alu_tester_1 manual (
    .clk(clk),
    .rst(rst),
    .button(M_manual_button),
    .dip_switch(M_manual_dip_switch),
    .alufn_sig(M_manual_alufn_sig),
    .inv(M_manual_inv),
    .out(M_manual_out),
    .segment_display(M_manual_segment_display)
  );
  
  wire [(3'h4+0)-1:0] M_buttoncond_out;
  reg [(3'h4+0)-1:0] M_buttoncond_in;
  
  genvar GEN_buttoncond0;
  generate
  for (GEN_buttoncond0=0;GEN_buttoncond0<3'h4;GEN_buttoncond0=GEN_buttoncond0+1) begin: buttoncond_gen_0
    button_conditioner_2 buttoncond (
      .clk(clk),
      .in(M_buttoncond_in[GEN_buttoncond0*(1)+(1)-1-:(1)]),
      .out(M_buttoncond_out[GEN_buttoncond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [(3'h4+0)-1:0] M_buttondetector_out;
  reg [(3'h4+0)-1:0] M_buttondetector_in;
  
  genvar GEN_buttondetector0;
  generate
  for (GEN_buttondetector0=0;GEN_buttondetector0<3'h4;GEN_buttondetector0=GEN_buttondetector0+1) begin: buttondetector_gen_0
    edge_detector_3 buttondetector (
      .clk(clk),
      .in(M_buttondetector_in[GEN_buttondetector0*(1)+(1)-1-:(1)]),
      .out(M_buttondetector_out[GEN_buttondetector0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [7-1:0] M_segset_seg;
  wire [4-1:0] M_segset_sel;
  reg [16-1:0] M_segset_values;
  multi_seven_seg_4 segset (
    .clk(clk),
    .rst(rst),
    .values(M_segset_values),
    .seg(M_segset_seg),
    .sel(M_segset_sel)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_5 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_buttoncond_in = io_button[1+3-:4];
    M_buttondetector_in = M_buttoncond_out;
    M_segset_values = 16'hffff;
    M_manual_button = M_buttondetector_out[0+1-:2];
    M_manual_inv = io_dip[0+7+0-:1];
    M_manual_alufn_sig = io_dip[0+0+5-:6];
    M_manual_dip_switch[8+7-:8] = io_dip[8+7-:8];
    M_manual_dip_switch[0+7-:8] = io_dip[0+7-:8];
    io_led[16+7+0-:1] = io_dip[0+7+0-:1];
    io_led[0+7-:8] = M_manual_out[0+7-:8];
    io_led[8+7-:8] = M_manual_out[8+7-:8];
    M_segset_values = M_manual_segment_display;
    io_seg = ~M_segset_seg;
    io_sel = ~M_segset_sel;
  end
endmodule