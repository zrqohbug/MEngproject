transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/quartus/openCL\ project/systolic {D:/quartus/openCL project/systolic/systolicCU.v}
vlog -vlog01compat -work work +incdir+D:/quartus/openCL\ project/systolic {D:/quartus/openCL project/systolic/systolicmemory.v}
vlog -vlog01compat -work work +incdir+D:/quartus/openCL\ project/systolic {D:/quartus/openCL project/systolic/processelement.v}
vlog -vlog01compat -work work +incdir+D:/quartus/openCL\ project/systolic {D:/quartus/openCL project/systolic/systolictop.v}

vlog -vlog01compat -work work +incdir+D:/quartus/openCL\ project/systolic/test {D:/quartus/openCL project/systolic/test/testbench_1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
