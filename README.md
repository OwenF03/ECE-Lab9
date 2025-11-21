# ECE128-Lab9
# Owen Funk and David Riley

## Description

Design and test a combinational and sequential multiplyer, outputting to the four seven segment displays on the Basys 3 FPGA. The design was implemented and tested using AMD Vivado 2023.1.

## Instructions to run

Download all of the provided files and create a new project using AMD Vivado 2023.1, and select the Xilinx Artic-7 FPGA (XC7A35T-ICPG236C) as the board. Add the module files (all .v files that don't end in tb) as design sources, the .xdc file as constratint sources, and the .v files that end with tb as simulation sources. The specific sources for each problem are listed below. 

# Which Files Correspond to Each Part
## Problem 1 
Sequential Multiplier

Design sources : BCD_SEG.v (Binary converted decimal to seven segment display), COUNT_BCD (Binary to BCD converter), Multi_Driver (Driver for seven segment display) MultTop_Seq.v (top module for sequential multiplier), Seq_Mult.v (sequential multiplier)

Simulation sources : Seq_Mult_tb.v (sequential multiplier testbench)

Constraints : Basys-3-Master.xdc

## Problem 2 
Combinational Multiplier

Design sources :  BCD_SEG.v (Binary converted decimal to seven segment display), COUNT_BCD (Binary to BCD converter), Multi_Driver (Driver for seven segment display) MultTop.v (top module for combinational multiplier), combo_mult.v (sequential multiplier)

Simulation sources : combo_mult_tb (combinational multiplier testbench)

Constraints : Basys-3-Master.xdc
