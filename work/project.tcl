set projDir "A:/FPGA/demo-checkoff1-FPGA/work/vivado"
set projName "alu_withbugfixes233AM13_3"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "A:/FPGA/demo-checkoff1-FPGA/work/verilog/au_top_0.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/alu_manual_tester_1.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/auto_tester_2.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/multi_seven_seg_3.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/button_conditioner_4.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/edge_detector_5.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/reset_conditioner_6.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/alu_7.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/adder_autotester_8.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/compare_autotester_9.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/boolean_autotester_10.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/shifter_autotester_11.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/multiplier_autotester_12.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/counter_13.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/seven_seg_14.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/decoder_15.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/pipeline_16.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/adder_17.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/multiply_18.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/boolean_19.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/shifter_20.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/compare_21.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/custom_counter_22.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/custom_counter_23.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/custom_counter_24.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/custom_counter_25.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/custom_counter_26.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/counter_27.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/counter_28.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/counter_29.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/counter_30.v" "A:/FPGA/demo-checkoff1-FPGA/work/verilog/counter_31.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "A:/FPGA/demo-checkoff1-FPGA/work/constraint/alchitry.xdc" "A:/FPGA/demo-checkoff1-FPGA/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
