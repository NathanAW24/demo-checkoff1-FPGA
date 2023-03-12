set projDir "C:/Users/ansar/Desktop/Demo/work/vivado"
set projName "Demo"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/ansar/Desktop/Demo/work/verilog/au_top_0.v" "C:/Users/ansar/Desktop/Demo/work/verilog/alu_tester_1.v" "C:/Users/ansar/Desktop/Demo/work/verilog/button_conditioner_2.v" "C:/Users/ansar/Desktop/Demo/work/verilog/edge_detector_3.v" "C:/Users/ansar/Desktop/Demo/work/verilog/multi_seven_seg_4.v" "C:/Users/ansar/Desktop/Demo/work/verilog/reset_conditioner_5.v" "C:/Users/ansar/Desktop/Demo/work/verilog/alu_6.v" "C:/Users/ansar/Desktop/Demo/work/verilog/pipeline_7.v" "C:/Users/ansar/Desktop/Demo/work/verilog/counter_8.v" "C:/Users/ansar/Desktop/Demo/work/verilog/seven_seg_9.v" "C:/Users/ansar/Desktop/Demo/work/verilog/decoder_10.v" "C:/Users/ansar/Desktop/Demo/work/verilog/adder_11.v" "C:/Users/ansar/Desktop/Demo/work/verilog/multiply_12.v" "C:/Users/ansar/Desktop/Demo/work/verilog/boolean_13.v" "C:/Users/ansar/Desktop/Demo/work/verilog/shifter_14.v" "C:/Users/ansar/Desktop/Demo/work/verilog/compare_15.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/ansar/Desktop/Demo/work/constraint/alchitry.xdc" "C:/Users/ansar/Desktop/Demo/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
