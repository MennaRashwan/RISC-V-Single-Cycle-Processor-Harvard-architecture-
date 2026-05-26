vlib work
vlog *.v
vsim -voptargs=+acc top_tb
add wave *
run -all