# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/ksksho/vitis/Ubuntu-Ultra96/vitis/ultra96v2/ultra96v2_fpga/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/ksksho/vitis/Ubuntu-Ultra96/vitis/ultra96v2/ultra96v2_fpga/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {ultra96v2_fpga}\
-hw {/home/ksksho/vitis/Ubuntu-Ultra96/fpga/ultra96v2/ultra96v2_fpga.xsa}\
-arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {/home/ksksho/vitis/Ubuntu-Ultra96/vitis/ultra96v2}

platform write
domain create -name {standalone_psu_cortexa53_0} -display-name {standalone_psu_cortexa53_0} -os {standalone} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {zynqmp_fsbl}
platform generate -domains 
platform active {ultra96v2_fpga}
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {standalone_psu_cortexa53_0}
platform generate -quick
platform active {ultra96v2_fpga}
domain create -name {standalone_psu_pmu_0} -display-name {standalone_psu_pmu_0} -os {standalone} -proc {psu_pmu_0} -runtime {cpp} -arch {32-bit} -support-app {zynqmp_pmufw}
platform generate -domains 
platform write
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {standalone_psu_cortexa53_0}
domain active {standalone_psu_pmu_0}
platform generate -quick
platform generate
