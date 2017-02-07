
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name RISCV -dir "D:/RISC-Vhdl/planAhead_run_2" -part xc3s700afg484-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/RISC-Vhdl/toplevel.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/RISC-Vhdl} {ipcore_dir} }
set_property target_constrs_file "D:/RISC-Vhdl/ddr2_pinning.ucf" [current_fileset -constrset]
add_files [list {ddr2_pinning.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {pinning.ucf}] -fileset [get_property constrset [current_run]]
link_design
