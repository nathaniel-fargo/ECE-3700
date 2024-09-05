transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Doxlet/Desktop/ECE-3700/Lab-1/Files {C:/Users/Doxlet/Desktop/ECE-3700/Lab-1/Files/Structural.v}
vlog -vlog01compat -work work +incdir+C:/Users/Doxlet/Desktop/ECE-3700/Lab-1/Files {C:/Users/Doxlet/Desktop/ECE-3700/Lab-1/Files/Top.v}

vlog -vlog01compat -work work +incdir+C:/Users/Doxlet/Desktop/ECE-3700/Lab-1/Files {C:/Users/Doxlet/Desktop/ECE-3700/Lab-1/Files/tb_Structural.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_Structural

add wave *
view structure
view signals
run -all
