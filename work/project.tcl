set projDir "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/vivado"
set projName "alu_withbugfixes233AM13_3"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/au_top_0.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/alu_manual_tester_1.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/auto_tester_2.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/multi_seven_seg_3.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/button_conditioner_4.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/edge_detector_5.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/reset_conditioner_6.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/alu_7.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/adder_autotester_8.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/compare_autotester_9.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/boolean_autotester_10.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/shifter_autotester_11.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/multiplier_autotester_12.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/counter_13.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/seven_seg_14.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/decoder_15.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/pipeline_16.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/adder_17.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/multiply_18.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/boolean_19.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/shifter_20.v" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/verilog/compare_21.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/constraint/alchitry.xdc" "C:/Users/ansar/Desktop/Alchitry\ Projects/alu_withbugfixes233AM13_3/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
