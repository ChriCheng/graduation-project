onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib CGRA_bram_opt

do {wave.do}

view wave
view structure
view signals

do {CGRA_bram.udo}

run -all

quit -force
