transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/mux2_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/fulladder.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/mux1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/RCA_16.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/subtractor.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/mux2_1_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/mux4_2_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/bitwiseand.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/bitwiseor.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/leftshifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/mux16_4_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/islessthan.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/isne.v}
vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/rightshifter.v}

vlog -vlog01compat -work work +incdir+C:/Users/ka266/Documents/Project1 {C:/Users/ka266/Documents/Project1/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
