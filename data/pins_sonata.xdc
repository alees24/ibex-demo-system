## Copyright lowRISC contributors.
## Licensed under the Apache License, Version 2.0, see LICENSE for details.
## SPDX-License-Identifier: Apache-2.0

## Clocks
create_clock -period 40.000 -name mainclk -waveform {0.000 20.000} [get_ports main_clk]
create_clock -period 100.000 -name tck -waveform {0.000 50.000} [get_ports tck_i]

## Clock Domain Crossings
set clks_sys_unbuf  [get_clocks -of_objects [get_pin clkgen/pll/CLKOUT0]]
set clks_peri_unbuf [get_clocks -of_objects [get_pin clkgen/pll/CLKOUT2]]
set clks_usb_unbuf  [get_clocks -of_objects [get_pin clkgen/pll/CLKOUT1]]

## Set asynchronous clock groups
set_clock_groups -group ${clks_sys_unbuf} -group ${clks_peri_unbuf} -group ${clks_usb_unbuf} -group mainclk -asynchronous

## Reset
# rev 0.3+
set_property PACKAGE_PIN T5 [get_ports {nrst_btn}]
# rev <= 0.2
# set_property PACKAGE_PIN R11 [get_ports {nrst_btn}]
set_property IOSTANDARD LVCMOS33 [get_ports {nrst_btn}]

## General purpose LEDs
set_property -dict { PACKAGE_PIN B13 IOSTANDARD LVCMOS33 } [get_ports {led_user[0]}];
set_property -dict { PACKAGE_PIN B14 IOSTANDARD LVCMOS33 } [get_ports {led_user[1]}];
set_property -dict { PACKAGE_PIN C12 IOSTANDARD LVCMOS33 } [get_ports {led_user[2]}];
set_property -dict { PACKAGE_PIN B12 IOSTANDARD LVCMOS33 } [get_ports {led_user[3]}];
set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS33 } [get_ports {led_user[4]}];
set_property -dict { PACKAGE_PIN A11 IOSTANDARD LVCMOS33 } [get_ports {led_user[5]}];
set_property -dict { PACKAGE_PIN F13 IOSTANDARD LVCMOS33 } [get_ports {led_user[6]}];
set_property -dict { PACKAGE_PIN F14 IOSTANDARD LVCMOS33 } [get_ports {led_user[7]}];

## USR JTAG - rev 0.3+
set_property -dict { PACKAGE_PIN E15 IOSTANDARD LVCMOS33 } [get_ports tck_i];
## USR JTAG - rev <= 0.2
# set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports tck_i];
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports td_i];
set_property -dict { PACKAGE_PIN J14 IOSTANDARD LVCMOS33 } [get_ports td_o];
set_property -dict { PACKAGE_PIN H15 IOSTANDARD LVCMOS33 } [get_ports tms_i];

## Switch and button input
set_property -dict { PACKAGE_PIN D12 IOSTANDARD LVCMOS33 } [get_ports {user_sw[0]}];
set_property -dict { PACKAGE_PIN D13 IOSTANDARD LVCMOS33 } [get_ports {user_sw[1]}];
set_property -dict { PACKAGE_PIN B16 IOSTANDARD LVCMOS33 } [get_ports {user_sw[2]}];
set_property -dict { PACKAGE_PIN B17 IOSTANDARD LVCMOS33 } [get_ports {user_sw[3]}];
set_property -dict { PACKAGE_PIN A15 IOSTANDARD LVCMOS33 } [get_ports {user_sw[4]}];
set_property -dict { PACKAGE_PIN A16 IOSTANDARD LVCMOS33 } [get_ports {user_sw[5]}];
set_property -dict { PACKAGE_PIN A13 IOSTANDARD LVCMOS33 } [get_ports {user_sw[6]}];
set_property -dict { PACKAGE_PIN A14 IOSTANDARD LVCMOS33 } [get_ports {user_sw[7]}];
set_property -dict { PACKAGE_PIN F5  IOSTANDARD LVCMOS18 } [get_ports {nav_sw[0]}];
set_property -dict { PACKAGE_PIN D8  IOSTANDARD LVCMOS18 } [get_ports {nav_sw[1]}];
set_property -dict { PACKAGE_PIN C7  IOSTANDARD LVCMOS18 } [get_ports {nav_sw[2]}];
set_property -dict { PACKAGE_PIN E7  IOSTANDARD LVCMOS18 } [get_ports {nav_sw[3]}];
set_property -dict { PACKAGE_PIN D7  IOSTANDARD LVCMOS18 } [get_ports {nav_sw[4]}];

## CHERI error LEDs
set_property -dict { PACKAGE_PIN K6  IOSTANDARD LVCMOS33 } [get_ports {led_cherierr[0]}];
set_property -dict { PACKAGE_PIN L1  IOSTANDARD LVCMOS33 } [get_ports {led_cherierr[1]}];
set_property -dict { PACKAGE_PIN M1  IOSTANDARD LVCMOS33 } [get_ports {led_cherierr[2]}];
set_property -dict { PACKAGE_PIN K3  IOSTANDARD LVCMOS33 } [get_ports {led_cherierr[3]}];
set_property -dict { PACKAGE_PIN L3  IOSTANDARD LVCMOS33 } [get_ports {led_cherierr[4]}];
set_property -dict { PACKAGE_PIN N2  IOSTANDARD LVCMOS33 } [get_ports {led_cherierr[5]}];
set_property -dict { PACKAGE_PIN N1  IOSTANDARD LVCMOS33 } [get_ports {led_cherierr[6]}];
set_property -dict { PACKAGE_PIN M3  IOSTANDARD LVCMOS33 } [get_ports {led_cherierr[7]}];
set_property -dict { PACKAGE_PIN M2  IOSTANDARD LVCMOS33 } [get_ports {led_cherierr[8]}];

## Status LEDs
set_property -dict { PACKAGE_PIN K5  IOSTANDARD LVCMOS33 } [get_ports led_legacy];
set_property -dict { PACKAGE_PIN L4  IOSTANDARD LVCMOS33 } [get_ports led_cheri];
set_property -dict { PACKAGE_PIN L6  IOSTANDARD LVCMOS33 } [get_ports led_halted];
set_property -dict { PACKAGE_PIN L5  IOSTANDARD LVCMOS33 } [get_ports led_bootok];

## LCD display
set_property -dict { PACKAGE_PIN R6  IOSTANDARD LVCMOS33 } [get_ports lcd_rst];
set_property -dict { PACKAGE_PIN U4  IOSTANDARD LVCMOS33 } [get_ports lcd_dc];
set_property -dict { PACKAGE_PIN R3  IOSTANDARD LVCMOS33 } [get_ports lcd_copi];
set_property -dict { PACKAGE_PIN R5  IOSTANDARD LVCMOS33 } [get_ports lcd_clk];
set_property -dict { PACKAGE_PIN P5  IOSTANDARD LVCMOS33 } [get_ports lcd_cs];

## UART
set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 } [get_ports ser0_tx];
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports ser0_rx];

## Switches
set_property PULLTYPE PULLUP [get_ports user_sw[*]]
set_property PULLTYPE PULLUP [get_ports nav_sw[*]]


set_output_delay -clock main_clk 0.000 [get_ports led_user]


# QWIIC and Arduino Shield
set_property PACKAGE_PIN U7 [get_ports SDA0]
set_property IOSTANDARD LVCMOS33 [get_ports SDA0]
set_property PACKAGE_PIN V9 [get_ports SCL0]
set_property IOSTANDARD LVCMOS33 [get_ports SCL0]

# QWIIC
set_property PACKAGE_PIN V7 [get_ports SDA1]
set_property IOSTANDARD LVCMOS33 [get_ports SDA1]
set_property PACKAGE_PIN U9 [get_ports SCL1]
set_property IOSTANDARD LVCMOS33 [get_ports SCL1]

# mikroBUS Click
set_property PACKAGE_PIN V1 [get_ports MB5]
set_property IOSTANDARD LVCMOS33 [get_ports MB5]
set_property PACKAGE_PIN U2 [get_ports MB6]
set_property IOSTANDARD LVCMOS33 [get_ports MB6]

# R-Pi Header

# GPIO/I2C bus
set_property PACKAGE_PIN L13 [get_ports RPH_G2_SDA]
set_property IOSTANDARD LVCMOS33 [get_ports RPH_G2_SDA]
set_property PACKAGE_PIN M16 [get_ports RPH_G3_SCL]
# set_property PACKAGE_PIN K18 [get_ports RPH_G3_SCL]
set_property IOSTANDARD LVCMOS33 [get_ports RPH_G3_SCL]

# I2C - Enable the internal pull-up resistors, if there are no external resistors on the PCB.
# for the rev <= 0.2 boards
# set_property PULLUP true [get_ports RPH_G2_SDA]
# set_property PULLUP true [get_ports RPH_G3_SCL]
# rev 0.5+ have on-board pull ups

# ID_SC/SD - I2C bus for HAT ID EEPROM; pull-ups are on the HAT itself
set_property PACKAGE_PIN T15 [get_ports RPH_G1]
set_property IOSTANDARD LVCMOS33 [get_ports RPH_G1]
set_property PACKAGE_PIN U17 [get_ports RPH_G0]
set_property IOSTANDARD LVCMOS33 [get_ports RPH_G0]
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports main_clk];

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets tck_i]
