transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {X:/Documents/VHDL-kurs/Project/Project/Calculator/memory.vhd}
vcom -93 -work work {X:/Documents/VHDL-kurs/Project/Project/Calculator/freqdiv.vhd}
vcom -93 -work work {X:/Documents/VHDL-kurs/Project/Project/Calculator/debounce.vhd}
vcom -93 -work work {X:/Documents/VHDL-kurs/Project/Project/Calculator/rotator.vhd}
vcom -93 -work work {X:/Documents/VHDL-kurs/Project/Project/Calculator/decoder.vhd}

