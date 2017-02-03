# File saved with Nlview version 6.2.4  2012-10-10 bk=1.2632 VDI=32 GEI=33
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 3
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property decorate 1
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instdrag 15
property maxbuttonzoom 3
property maxfontzoom 2
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc000
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 15
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new toplevel work:behaviour:toplevel.vhd -nosplit
load symbol RTL_INV Primitives INV port i input port o output fillcolor 1
load symbol RTL_mux_5 Operators MUX port cond input.bot portBus d0 input.left [4:0] portBus d1 input.left [4:0] portBus o output.right [4:0] fillcolor 1
load symbol RTL_MUX Primitives MUX port a0 input.left port a1 input.left port c input.bot port o output.right fillcolor 1
load symbol Clock_VHDL work:Verhalten:Clock_VHDL.vhd HIERBOX port clk_in_133MHz input.left port clk_out_1Hz output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol clk133m_dcm work:BEHAVIORAL:clk133m_dcm.vhd HIERBOX port CLKIN_IN input.left port CLKFX_OUT output.right port CLKIN_IBUFG_OUT output.right port CLK0_OUT output.right port CLK2X_OUT output.right port LOCKED_OUT output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol OBUF hdi_primitives BUF port O output port I input fillcolor 1
load symbol ASCIIUNIT work:Behavioral:ASCIIUNIT.vhd HIERBOX port clk input.left port pixel_out output.right portBus char_in input.left [7:0] portBus x_in input.left [9:0] portBus y_in input.left [9:0] portBus addr_out output.right [10:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol vga work:behaviour:vga.vhd HIERBOX port clk input.left port rst input.left port offs output.right port h output.right port v output.right port debug_on input.left port pixel input.left portBus rgb input.left [11:0] portBus x output.right [9:0] portBus y output.right [9:0] portBus r output.right [3:0] portBus g output.right [3:0] portBus b output.right [3:0] portBus reg_data_in input.left [31:0] portBus reg_adr_in input.left [5:0] portBus pc_in input.left [31:0] portBus ir_in input.left [31:0] portBus x_out output.right [9:0] portBus y_out output.right [9:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol vga_clk work:BEHAVIORAL:vga_clk.vhd HIERBOX port CLKIN_IN input.left port RST_IN input.left port CLKDV_OUT output.right port CLK0_OUT output.right port LOCKED_OUT output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol CPU work:CPU_1:CPU.vhd HIERBOX port cpu_clk_in input.left port cpu_rst_in input.left port cpu_slow_in input.left port cpu_err_out output.right port cpu_mmu_work_out output.right port cpu_mmu_ack_in input.left portBus cpu_debug_data_out output.right [31:0] portBus cpu_debug_adr_out output.right [5:0] portBus cpu_debug_pc_out output.right [31:0] portBus cpu_debug_ir_out output.right [31:0] portBus cpu_mmu_data_in input.left [31:0] portBus cpu_mmu_data_out output.right [31:0] portBus cpu_mmu_adr_out output.right [31:0] portBus cpu_mmu_com_out output.right [2:0] portBus debug2 output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol uart work:uart_1:uart.vhd HIERBOX port clk input.left port rst input.left port rx input.left port err output.right port valid output.right portBus data output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol MMU work:Behavioral:MMU.vhd HIERBOX port reset_in input.left port clk_in input.left port clk90_in input.left port work_in input.left port ack_out output.right port init_done input.left port cmd_ack input.left port data_valid input.left port burst_done output.right port auto_ref_req input.left portBus data_out output.right [31:0] portBus data_in input.left [31:0] portBus addr_in input.left [31:0] portBus cmd_in input.left [2:0] portBus command_register output.right [2:0] portBus input_adress output.right [24:0] portBus input_data output.right [31:0] portBus output_data input.left [31:0] portBus char_out output.right [7:0] portBus char_addr_in input.left [10:0] portBus pins_in input.left [31:0] portBus pins_out output.right [15:0] portBus mmu_state_out output.right [31:0] portBus ddr2_cntrl_state_out output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol DDR2_Ram_Core work:arc_mem_interface_top:DDR2_Ram_Core.vhd HIERBOX port cntrl0_ddr2_cke output.right port cntrl0_ddr2_cs_n output.right port cntrl0_ddr2_ras_n output.right port cntrl0_ddr2_cas_n output.right port cntrl0_ddr2_we_n output.right port cntrl0_ddr2_odt output.right port cntrl0_rst_dqs_div_in input.left port cntrl0_rst_dqs_div_out output.right port sys_clk_in input.left port reset_in_n input.left port cntrl0_burst_done input.left port cntrl0_init_done output.right port cntrl0_ar_done output.right port cntrl0_user_data_valid output.right port cntrl0_auto_ref_req output.right port cntrl0_user_cmd_ack output.right port cntrl0_clk_tb output.right port cntrl0_clk90_tb output.right port cntrl0_sys_rst_tb output.right port cntrl0_sys_rst90_tb output.right port cntrl0_sys_rst180_tb output.right portBus cntrl0_ddr2_dq inout.left [15:0] portBus cntrl0_ddr2_a output.right [12:0] portBus cntrl0_ddr2_ba output.right [1:0] portBus cntrl0_ddr2_dm output.right [1:0] portBus cntrl0_user_command_register input.left [2:0] portBus cntrl0_user_output_data output.right [31:0] portBus cntrl0_user_input_data input.left [31:0] portBus cntrl0_user_data_mask input.left [3:0] portBus cntrl0_user_input_address input.left [24:0] portBus cntrl0_ddr2_dqs inout.left [1:0] portBus cntrl0_ddr2_dqs_n inout.left [1:0] portBus cntrl0_ddr2_ck output.right [0:0] portBus cntrl0_ddr2_ck_n output.right [0:0] boxcolor 1 fillcolor 2 minwidth 13%
load port vsync output -pg 1 -y 190
load port cntrl0_ddr2_odt output -pg 1 -y 930
load port rx input -pg 1 -y 510
load port cntrl0_ddr2_ras_n output -pg 1 -y 950
load port cntrl0_rst_dqs_div_out output -pg 1 -y 1010
load port clk_50mhz input -pg 1 -y 1130
load port cntrl0_ddr2_we_n output -pg 1 -y 970
load port cntrl0_ddr2_cs_n output -pg 1 -y 890
load port hsync output -pg 1 -y 150
load port cntrl0_rst_dqs_div_in input -pg 1 -y 870
load port cntrl0_ddr2_cke output -pg 1 -y 870
load port cntrl0_ddr2_cas_n output -pg 1 -y 810
load portBus cntrl0_ddr2_ck output [0:0] -attr @name cntrl0_ddr2_ck[0:0] -pg 1 -y 830
load portBus cntrl0_ddr2_ba output [1:0] -attr @name cntrl0_ddr2_ba[1:0] -pg 1 -y 790
load portBus btn input [4:0] -attr @name btn[4:0] -pg 1 -y 470
load portBus cntrl0_ddr2_dqs inout [1:0] -attr @name cntrl0_ddr2_dqs[1:0] -pg 1 -y 630
load portBus leds output [7:0] -attr @name leds[7:0] -pg 1 -y 1200
load portBus cntrl0_ddr2_a output [12:0] -attr @name cntrl0_ddr2_a[12:0] -pg 1 -y 770
load portBus cntrl0_ddr2_dm output [1:0] -attr @name cntrl0_ddr2_dm[1:0] -pg 1 -y 910
load portBus b output [3:0] -attr @name b[3:0] -pg 1 -y 110
load portBus sw input [3:0] -attr @name sw[3:0] -pg 1 -y 490
load portBus r output [3:0] -attr @name r[3:0] -pg 1 -y 170
load portBus cntrl0_ddr2_dq inout [15:0] -attr @name cntrl0_ddr2_dq[15:0] -pg 1 -y 610
load portBus cntrl0_ddr2_ck_n output [0:0] -attr @name cntrl0_ddr2_ck_n[0:0] -pg 1 -y 850
load portBus cntrl0_ddr2_dqs_n inout [1:0] -attr @name cntrl0_ddr2_dqs_n[1:0] -pg 1 -y 650
load portBus g output [3:0] -attr @name g[3:0] -pg 1 -y 130
load inst INST_Clock_VHDL Clock_VHDL work:Verhalten:Clock_VHDL.vhd -autohide -attr @cell(#000000) Clock_VHDL -pg 1 -lvl 6 -y 1200
load inst pins_out[2]_err_out_MUX_6 RTL_MUX Primitives -attr @cell(#000000) RTL_MUX -pg 1 -lvl 7 -y 1320
load inst clk_obuf OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -y 1130
load inst clk133 clk133m_dcm work:BEHAVIORAL:clk133m_dcm.vhd -autohide -attr @cell(#000000) clk133m_dcm -pg 1 -lvl 1 -y 1120
load inst CPU CPU work:CPU_1:CPU.vhd -autohide -attr @cell(#000000) CPU -pinBusAttr cpu_debug_data_out @name cpu_debug_data_out[31:0] -pinBusAttr cpu_debug_adr_out @name cpu_debug_adr_out[5:0] -pinBusAttr cpu_debug_pc_out @name cpu_debug_pc_out[31:0] -pinBusAttr cpu_debug_ir_out @name cpu_debug_ir_out[31:0] -pinBusAttr cpu_mmu_data_in @name cpu_mmu_data_in[31:0] -pinBusAttr cpu_mmu_data_out @name cpu_mmu_data_out[31:0] -pinBusAttr cpu_mmu_adr_out @name cpu_mmu_adr_out[31:0] -pinBusAttr cpu_mmu_com_out @name cpu_mmu_com_out[2:0] -pinBusAttr debug2 @name debug2[7:0] -pg 1 -lvl 4 -y 180
load inst inst_asciiunit ASCIIUNIT work:Behavioral:ASCIIUNIT.vhd -autohide -attr @cell(#000000) ASCIIUNIT -pinBusAttr char_in @name char_in[7:0] -pinBusAttr x_in @name x_in[9:0] -pinBusAttr y_in @name y_in[9:0] -pinBusAttr addr_out @name addr_out[10:0] -pg 1 -lvl 6 -y 240
load inst INST_DDR2_RAM_CORE DDR2_Ram_Core work:arc_mem_interface_top:DDR2_Ram_Core.vhd -autohide -attr @cell(#000000) DDR2_Ram_Core -pinBusAttr cntrl0_ddr2_dq @name cntrl0_ddr2_dq[15:0] -pinBusAttr cntrl0_ddr2_a @name cntrl0_ddr2_a[12:0] -pinBusAttr cntrl0_ddr2_ba @name cntrl0_ddr2_ba[1:0] -pinBusAttr cntrl0_ddr2_dm @name cntrl0_ddr2_dm[1:0] -pinBusAttr cntrl0_user_command_register @name cntrl0_user_command_register[2:0] -pinBusAttr cntrl0_user_output_data @name cntrl0_user_output_data[31:0] -pinBusAttr cntrl0_user_input_data @name cntrl0_user_input_data[31:0] -pinBusAttr cntrl0_user_data_mask @name cntrl0_user_data_mask[3:0] -pinBusAttr cntrl0_user_input_address @name cntrl0_user_input_address[24:0] -pinBusAttr cntrl0_ddr2_dqs @name cntrl0_ddr2_dqs[1:0] -pinBusAttr cntrl0_ddr2_dqs_n @name cntrl0_ddr2_dqs_n[1:0] -pinBusAttr cntrl0_ddr2_ck @name cntrl0_ddr2_ck -pinBusAttr cntrl0_ddr2_ck_n @name cntrl0_ddr2_ck_n -pg 1 -lvl 7 -y 700
load inst Inst_vga_clk vga_clk work:BEHAVIORAL:vga_clk.vhd -autohide -attr @cell(#000000) vga_clk -pg 1 -lvl 2 -y 380
load inst pins_out[0]_ddr2_led_MUX_8 RTL_MUX Primitives -attr @cell(#000000) RTL_MUX -pg 1 -lvl 7 -y 1200
load inst reset_INV_1 RTL_INV Primitives -attr @cell(#000000) RTL_INV -pg 1 -lvl 6 -y 970
load inst INST_MMU MMU work:Behavioral:MMU.vhd -autohide -attr @cell(#000000) MMU -pinBusAttr data_out @name data_out[31:0] -pinBusAttr data_in @name data_in[31:0] -pinBusAttr addr_in @name addr_in[31:0] -pinBusAttr cmd_in @name cmd_in[2:0] -pinBusAttr command_register @name command_register[2:0] -pinBusAttr input_adress @name input_adress[24:0] -pinBusAttr input_data @name input_data[31:0] -pinBusAttr output_data @name output_data[31:0] -pinBusAttr char_out @name char_out[7:0] -pinBusAttr char_addr_in @name char_addr_in[10:0] -pinBusAttr pins_in @name pins_in[31:0] -pinBusAttr pins_out @name pins_out[15:0] -pinBusAttr mmu_state_out @name mmu_state_out[31:0] -pinBusAttr ddr2_cntrl_state_out @name ddr2_cntrl_state_out[31:0] -pg 1 -lvl 5 -y 280
load inst pins_out[1]_slow_MUX_7 RTL_MUX Primitives -attr @cell(#000000) RTL_MUX -pg 1 -lvl 7 -y 1440
load inst pins_out[7]_GND_5_o_mux_0 RTL_mux_5 Operators -attr @cell(#000000) RTL_mux_5 -pinBusAttr d0 @name d0[4:0] -pinBusAttr d1 @name d1[4:0] -pinBusAttr o @name o[4:0] -pg 1 -lvl 7 -y 1560
load inst Inst_vga vga work:behaviour:vga.vhd -autohide -attr @cell(#000000) vga -pinBusAttr rgb @name rgb[11:0] -pinBusAttr x @name x[9:0] -pinBusAttr y @name y[9:0] -pinBusAttr r @name r[3:0] -pinBusAttr g @name g[3:0] -pinBusAttr b @name b[3:0] -pinBusAttr reg_data_in @name reg_data_in[31:0] -pinBusAttr reg_adr_in @name reg_adr_in[5:0] -pinBusAttr pc_in @name pc_in[31:0] -pinBusAttr ir_in @name ir_in[31:0] -pinBusAttr x_out @name x_out[9:0] -pinBusAttr y_out @name y_out[9:0] -pg 1 -lvl 7 -y 80
load inst INST_UART uart work:uart_1:uart.vhd -autohide -attr @cell(#000000) uart -pinBusAttr data @name data[7:0] -pg 1 -lvl 3 -y 460
load net mmu_addr_in[7] -attr @rip cpu_mmu_adr_out[7] -pin CPU cpu_mmu_adr_out[7] -pin INST_MMU addr_in[7]
load net user_input_data[16] -attr @rip input_data[16] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[16] -pin INST_MMU input_data[16]
load net btn[0] -attr @rip btn[0] -pin INST_MMU pins_in[7] -port btn[0]
load net cntrl0_ddr2_a[4] -attr @rip cntrl0_ddr2_a[4] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[4] -port cntrl0_ddr2_a[4]
load net debug_adr[1] -attr @rip cpu_debug_adr_out[1] -pin CPU cpu_debug_adr_out[1] -pin Inst_vga reg_adr_in[1]
load net debug[21] -attr @rip cpu_debug_data_out[21] -pin CPU cpu_debug_data_out[21] -pin Inst_vga reg_data_in[21]
load net CLKB_130M -pin INST_DDR2_RAM_CORE sys_clk_in -pin clk_obuf O
netloc CLKB_130M 1 6 1 2280
load net ir[7] -attr @rip cpu_debug_ir_out[7] -pin CPU cpu_debug_ir_out[7] -pin Inst_vga ir_in[7]
load net pins_in[24] -attr @rip 24 -pin INST_MMU pins_in[24] -pin INST_UART valid
load net mmu_data_out[8] -attr @rip data_out[8] -pin CPU cpu_mmu_data_in[8] -pin INST_MMU data_out[8]
load net pc[6] -attr @rip cpu_debug_pc_out[6] -pin CPU cpu_debug_pc_out[6] -pin Inst_vga pc_in[6]
load net ascii_addr_out[3] -attr @rip addr_out[3] -pin INST_MMU char_addr_in[3] -pin inst_asciiunit addr_out[3]
load net user_input_data[4] -attr @rip input_data[4] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[4] -pin INST_MMU input_data[4]
load net mmu_addr_in[10] -attr @rip cpu_mmu_adr_out[10] -pin CPU cpu_mmu_adr_out[10] -pin INST_MMU addr_in[10]
load net mmu_data_in[30] -attr @rip cpu_mmu_data_out[30] -pin CPU cpu_mmu_data_out[30] -pin INST_MMU data_in[30]
load net user_output_data[8] -attr @rip cntrl0_user_output_data[8] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[8] -pin INST_MMU output_data[8]
load net cntrl0_ddr2_dqs[0] -attr @rip cntrl0_ddr2_dqs[0] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dqs[0] -port cntrl0_ddr2_dqs[0]
load net user_output_data[28] -attr @rip cntrl0_user_output_data[28] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[28] -pin INST_MMU output_data[28]
load net mmu_data_out[30] -attr @rip data_out[30] -pin CPU cpu_mmu_data_in[30] -pin INST_MMU data_out[30]
load net debug[16] -attr @rip cpu_debug_data_out[16] -pin CPU cpu_debug_data_out[16] -pin Inst_vga reg_data_in[16]
load net pins_in[19] -attr @rip data[3] -pin INST_MMU pins_in[19] -pin INST_UART data[3]
load net mmu_data_in[25] -attr @rip cpu_mmu_data_out[25] -pin CPU cpu_mmu_data_out[25] -pin INST_MMU data_in[25]
load net user_input_address[7] -attr @rip input_adress[7] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[7] -pin INST_MMU input_adress[7]
load net debug[3] -attr @rip cpu_debug_data_out[3] -pin CPU cpu_debug_data_out[3] -pin Inst_vga reg_data_in[3]
load net mmu_data_out[25] -attr @rip data_out[25] -pin CPU cpu_mmu_data_in[25] -pin INST_MMU data_out[25]
load net mmu_addr_in[27] -attr @rip cpu_mmu_adr_out[27] -pin CPU cpu_mmu_adr_out[27] -pin INST_MMU addr_in[27]
load net cntrl0_ddr2_dq[3] -attr @rip cntrl0_ddr2_dq[3] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[3] -port cntrl0_ddr2_dq[3]
load net ascii_x_in[8] -attr @rip x_out[8] -pin Inst_vga x_out[8] -pin inst_asciiunit x_in[8]
load net auto_ref_req -pin INST_DDR2_RAM_CORE cntrl0_auto_ref_req -pin INST_MMU auto_ref_req
netloc auto_ref_req 1 4 4 1400 720 1940 550 N 550 2860
load net pc[20] -attr @rip cpu_debug_pc_out[20] -pin CPU cpu_debug_pc_out[20] -pin Inst_vga pc_in[20]
load net ir[31] -attr @rip cpu_debug_ir_out[31] -pin CPU cpu_debug_ir_out[31] -pin Inst_vga ir_in[31]
load net user_input_data[22] -attr @rip input_data[22] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[22] -pin INST_MMU input_data[22]
load net ascii_char_in[0] -attr @rip char_out[0] -pin INST_MMU char_out[0] -pin inst_asciiunit char_in[0]
load net user_output_data[12] -attr @rip cntrl0_user_output_data[12] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[12] -pin INST_MMU output_data[12]
load net mmu_data_in[0] -attr @rip cpu_mmu_data_out[0] -pin CPU cpu_mmu_data_out[0] -pin INST_MMU data_in[0]
load net pc[15] -attr @rip cpu_debug_pc_out[15] -pin CPU cpu_debug_pc_out[15] -pin Inst_vga pc_in[15]
load net ir[26] -attr @rip cpu_debug_ir_out[26] -pin CPU cpu_debug_ir_out[26] -pin Inst_vga ir_in[26]
load net mmu_addr_in[8] -attr @rip cpu_mmu_adr_out[8] -pin CPU cpu_mmu_adr_out[8] -pin INST_MMU addr_in[8]
load net user_input_data[17] -attr @rip input_data[17] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[17] -pin INST_MMU input_data[17]
load net btn[1] -attr @rip btn[1] -pin INST_MMU pins_in[8] -port btn[1]
load net cntrl0_ddr2_a[5] -attr @rip cntrl0_ddr2_a[5] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[5] -port cntrl0_ddr2_a[5]
load net debug_adr[2] -attr @rip cpu_debug_adr_out[2] -pin CPU cpu_debug_adr_out[2] -pin Inst_vga reg_adr_in[2]
load net debug[22] -attr @rip cpu_debug_data_out[22] -pin CPU cpu_debug_data_out[22] -pin Inst_vga reg_data_in[22]
load net ir[8] -attr @rip cpu_debug_ir_out[8] -pin CPU cpu_debug_ir_out[8] -pin Inst_vga ir_in[8]
load net pins_in[25] -attr @rip 25 -pin INST_MMU pins_in[25] -pin INST_UART err
load net cntrl0_ddr2_cs_n -pin INST_DDR2_RAM_CORE cntrl0_ddr2_cs_n -port cntrl0_ddr2_cs_n
netloc cntrl0_ddr2_cs_n 1 7 1 N
load net mmu_data_out[9] -attr @rip data_out[9] -pin CPU cpu_mmu_data_in[9] -pin INST_MMU data_out[9]
load net user_input_data[5] -attr @rip input_data[5] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[5] -pin INST_MMU input_data[5]
load net pc[7] -attr @rip cpu_debug_pc_out[7] -pin CPU cpu_debug_pc_out[7] -pin Inst_vga pc_in[7]
load net ascii_addr_out[4] -attr @rip addr_out[4] -pin INST_MMU char_addr_in[4] -pin inst_asciiunit addr_out[4]
load net mmu_addr_in[11] -attr @rip cpu_mmu_adr_out[11] -pin CPU cpu_mmu_adr_out[11] -pin INST_MMU addr_in[11]
load net cntrl0_ddr2_cke -pin INST_DDR2_RAM_CORE cntrl0_ddr2_cke -port cntrl0_ddr2_cke
netloc cntrl0_ddr2_cke 1 7 1 N
load net user_output_data[9] -attr @rip cntrl0_user_output_data[9] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[9] -pin INST_MMU output_data[9]
load net mmu_data_in[31] -attr @rip cpu_mmu_data_out[31] -pin CPU cpu_mmu_data_out[31] -pin INST_MMU data_in[31]
load net cntrl0_ddr2_dqs[1] -attr @rip cntrl0_ddr2_dqs[1] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dqs[1] -port cntrl0_ddr2_dqs[1]
load net user_output_data[29] -attr @rip cntrl0_user_output_data[29] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[29] -pin INST_MMU output_data[29]
load net mmu_data_out[31] -attr @rip data_out[31] -pin CPU cpu_mmu_data_in[31] -pin INST_MMU data_out[31]
load net debug[17] -attr @rip cpu_debug_data_out[17] -pin CPU cpu_debug_data_out[17] -pin Inst_vga reg_data_in[17]
load net clk90_tb -pin INST_DDR2_RAM_CORE cntrl0_clk90_tb -pin INST_MMU clk90_in
netloc clk90_tb 1 4 4 1420 740 1960 590 N 590 2820
load net mmu_data_in[26] -attr @rip cpu_mmu_data_out[26] -pin CPU cpu_mmu_data_out[26] -pin INST_MMU data_in[26]
load net user_input_address[8] -attr @rip input_adress[8] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[8] -pin INST_MMU input_adress[8]
load net debug[4] -attr @rip cpu_debug_data_out[4] -pin CPU cpu_debug_data_out[4] -pin Inst_vga reg_data_in[4]
load net mmu_data_out[26] -attr @rip data_out[26] -pin CPU cpu_mmu_data_in[26] -pin INST_MMU data_out[26]
load net ir[10] -attr @rip cpu_debug_ir_out[10] -pin CPU cpu_debug_ir_out[10] -pin Inst_vga ir_in[10]
load net mmu_addr_in[28] -attr @rip cpu_mmu_adr_out[28] -pin CPU cpu_mmu_adr_out[28] -pin INST_MMU addr_in[28]
load net cntrl0_ddr2_dq[4] -attr @rip cntrl0_ddr2_dq[4] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[4] -port cntrl0_ddr2_dq[4]
load net ascii_x_in[9] -attr @rip x_out[9] -pin Inst_vga x_out[9] -pin inst_asciiunit x_in[9]
load net leds[0] -attr @rip 0 -port leds[0] -pin pins_out[0]_ddr2_led_MUX_8 o
load net pc[21] -attr @rip cpu_debug_pc_out[21] -pin CPU cpu_debug_pc_out[21] -pin Inst_vga pc_in[21]
load net user_input_data[23] -attr @rip input_data[23] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[23] -pin INST_MMU input_data[23]
load net clk_50mhz -pin clk133 CLKIN_IN -port clk_50mhz
netloc clk_50mhz 1 0 1 N
load net ascii_y_in[0] -attr @rip y_out[0] -pin Inst_vga y_out[0] -pin inst_asciiunit y_in[0]
load net ascii_char_in[1] -attr @rip char_out[1] -pin INST_MMU char_out[1] -pin inst_asciiunit char_in[1]
load net user_input_address[10] -attr @rip input_adress[10] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[10] -pin INST_MMU input_adress[10]
load net pins_in[31] -ground -pin INST_DDR2_RAM_CORE cntrl0_user_data_mask[3] -pin INST_DDR2_RAM_CORE cntrl0_user_data_mask[2] -pin INST_DDR2_RAM_CORE cntrl0_user_data_mask[1] -pin INST_DDR2_RAM_CORE cntrl0_user_data_mask[0] -pin INST_MMU pins_in[31] -pin INST_MMU pins_in[30] -pin INST_MMU pins_in[29] -pin INST_MMU pins_in[28] -pin INST_MMU pins_in[27] -pin INST_MMU pins_in[26] -pin INST_MMU pins_in[6] -pin INST_MMU pins_in[5] -pin INST_MMU pins_in[4] -pin INST_MMU pins_in[3] -pin INST_MMU pins_in[2] -pin INST_MMU pins_in[1] -pin INST_MMU pins_in[0] -pin Inst_vga rgb[11] -pin Inst_vga rgb[10] -pin Inst_vga rgb[9] -pin Inst_vga rgb[8] -pin Inst_vga rgb[7] -pin Inst_vga rgb[6] -pin Inst_vga rgb[5] -pin Inst_vga rgb[4] -pin Inst_vga rgb[3] -pin Inst_vga rgb[2] -pin Inst_vga rgb[1] -pin Inst_vga rgb[0] -pin pins_out[7]_GND_5_o_mux_0 d1[4] -pin pins_out[7]_GND_5_o_mux_0 d1[3] -pin pins_out[7]_GND_5_o_mux_0 d1[2] -pin pins_out[7]_GND_5_o_mux_0 d1[1] -pin pins_out[7]_GND_5_o_mux_0 d1[0]
load net user_output_data[13] -attr @rip cntrl0_user_output_data[13] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[13] -pin INST_MMU output_data[13]
load net mmu_data_in[1] -attr @rip cpu_mmu_data_out[1] -pin CPU cpu_mmu_data_out[1] -pin INST_MMU data_in[1]
load net ir[27] -attr @rip cpu_debug_ir_out[27] -pin CPU cpu_debug_ir_out[27] -pin Inst_vga ir_in[27]
load net pc[16] -attr @rip cpu_debug_pc_out[16] -pin CPU cpu_debug_pc_out[16] -pin Inst_vga pc_in[16]
load net mmu_addr_in[9] -attr @rip cpu_mmu_adr_out[9] -pin CPU cpu_mmu_adr_out[9] -pin INST_MMU addr_in[9]
load net user_input_data[18] -attr @rip input_data[18] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[18] -pin INST_MMU input_data[18]
load net btn[2] -attr @rip btn[2] -pin INST_MMU pins_in[9] -port btn[2]
load net cntrl0_ddr2_a[6] -attr @rip cntrl0_ddr2_a[6] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[6] -port cntrl0_ddr2_a[6]
load net debug_adr[3] -attr @rip cpu_debug_adr_out[3] -pin CPU cpu_debug_adr_out[3] -pin Inst_vga reg_adr_in[3]
load net debug[23] -attr @rip cpu_debug_data_out[23] -pin CPU cpu_debug_data_out[23] -pin Inst_vga reg_data_in[23]
load net ir[9] -attr @rip cpu_debug_ir_out[9] -pin CPU cpu_debug_ir_out[9] -pin Inst_vga ir_in[9]
load net b[0] -attr @rip b[0] -pin Inst_vga b[0] -port b[0]
load net mmu_data_in[10] -attr @rip cpu_mmu_data_out[10] -pin CPU cpu_mmu_data_out[10] -pin INST_MMU data_in[10]
load net pc[8] -attr @rip cpu_debug_pc_out[8] -pin CPU cpu_debug_pc_out[8] -pin Inst_vga pc_in[8]
load net ascii_addr_out[5] -attr @rip addr_out[5] -pin INST_MMU char_addr_in[5] -pin inst_asciiunit addr_out[5]
load net user_input_data[6] -attr @rip input_data[6] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[6] -pin INST_MMU input_data[6]
load net mmu_addr_in[12] -attr @rip cpu_mmu_adr_out[12] -pin CPU cpu_mmu_adr_out[12] -pin INST_MMU addr_in[12]
load net mmu_data_out[10] -attr @rip data_out[10] -pin CPU cpu_mmu_data_in[10] -pin INST_MMU data_out[10]
load net user_command_register[0] -attr @rip command_register[0] -pin INST_DDR2_RAM_CORE cntrl0_user_command_register[0] -pin INST_MMU command_register[0]
load net debug[18] -attr @rip cpu_debug_data_out[18] -pin CPU cpu_debug_data_out[18] -pin Inst_vga reg_data_in[18]
load net cntrl0_ddr2_dqs_n[0] -attr @rip cntrl0_ddr2_dqs_n[0] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dqs_n[0] -port cntrl0_ddr2_dqs_n[0]
load net mmu_data_in[27] -attr @rip cpu_mmu_data_out[27] -pin CPU cpu_mmu_data_out[27] -pin INST_MMU data_in[27]
load net user_input_address[9] -attr @rip input_adress[9] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[9] -pin INST_MMU input_adress[9]
load net debug[5] -attr @rip cpu_debug_data_out[5] -pin CPU cpu_debug_data_out[5] -pin Inst_vga reg_data_in[5]
load net mmu_data_out[27] -attr @rip data_out[27] -pin CPU cpu_mmu_data_in[27] -pin INST_MMU data_out[27]
load net ir[11] -attr @rip cpu_debug_ir_out[11] -pin CPU cpu_debug_ir_out[11] -pin Inst_vga ir_in[11]
load net mmu_addr_in[29] -attr @rip cpu_mmu_adr_out[29] -pin CPU cpu_mmu_adr_out[29] -pin INST_MMU addr_in[29]
load net cntrl0_ddr2_dq[5] -attr @rip cntrl0_ddr2_dq[5] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[5] -port cntrl0_ddr2_dq[5]
load net leds[1] -attr @rip 1 -port leds[1] -pin pins_out[1]_slow_MUX_7 o
load net pc[22] -attr @rip cpu_debug_pc_out[22] -pin CPU cpu_debug_pc_out[22] -pin Inst_vga pc_in[22]
load net user_input_data[24] -attr @rip input_data[24] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[24] -pin INST_MMU input_data[24]
load net ascii_y_in[1] -attr @rip y_out[1] -pin Inst_vga y_out[1] -pin inst_asciiunit y_in[1]
load net ascii_char_in[2] -attr @rip char_out[2] -pin INST_MMU char_out[2] -pin inst_asciiunit char_in[2]
load net cntrl0_rst_dqs_div_out -pin INST_DDR2_RAM_CORE cntrl0_rst_dqs_div_out -port cntrl0_rst_dqs_div_out
netloc cntrl0_rst_dqs_div_out 1 7 1 N
load net user_input_address[11] -attr @rip input_adress[11] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[11] -pin INST_MMU input_adress[11]
load net user_output_data[14] -attr @rip cntrl0_user_output_data[14] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[14] -pin INST_MMU output_data[14]
load net mmu_data_in[2] -attr @rip cpu_mmu_data_out[2] -pin CPU cpu_mmu_data_out[2] -pin INST_MMU data_in[2]
load net ir[28] -attr @rip cpu_debug_ir_out[28] -pin CPU cpu_debug_ir_out[28] -pin Inst_vga ir_in[28]
load net pc[17] -attr @rip cpu_debug_pc_out[17] -pin CPU cpu_debug_pc_out[17] -pin Inst_vga pc_in[17]
load net user_input_data[19] -attr @rip input_data[19] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[19] -pin INST_MMU input_data[19]
load net r[0] -attr @rip r[0] -pin Inst_vga r[0] -port r[0]
load net btn[3] -attr @rip btn[3] -pin INST_MMU pins_in[10] -port btn[3]
load net cntrl0_ddr2_dm[0] -attr @rip cntrl0_ddr2_dm[0] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dm[0] -port cntrl0_ddr2_dm[0]
load net cntrl0_ddr2_a[7] -attr @rip cntrl0_ddr2_a[7] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[7] -port cntrl0_ddr2_a[7]
load net debug_adr[4] -attr @rip cpu_debug_adr_out[4] -pin CPU cpu_debug_adr_out[4] -pin Inst_vga reg_adr_in[4]
load net debug[24] -attr @rip cpu_debug_data_out[24] -pin CPU cpu_debug_data_out[24] -pin Inst_vga reg_data_in[24]
load net burst_done -pin INST_DDR2_RAM_CORE cntrl0_burst_done -pin INST_MMU burst_done
netloc burst_done 1 5 2 N 370 2420
load net pc[9] -attr @rip cpu_debug_pc_out[9] -pin CPU cpu_debug_pc_out[9] -pin Inst_vga pc_in[9]
load net ascii_addr_out[6] -attr @rip addr_out[6] -pin INST_MMU char_addr_in[6] -pin inst_asciiunit addr_out[6]
load net user_input_data[7] -attr @rip input_data[7] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[7] -pin INST_MMU input_data[7]
load net b[1] -attr @rip b[1] -pin Inst_vga b[1] -port b[1]
load net mmu_data_in[11] -attr @rip cpu_mmu_data_out[11] -pin CPU cpu_mmu_data_out[11] -pin INST_MMU data_in[11]
load net mmu_addr_in[13] -attr @rip cpu_mmu_adr_out[13] -pin CPU cpu_mmu_adr_out[13] -pin INST_MMU addr_in[13]
load net mmu_data_out[11] -attr @rip data_out[11] -pin CPU cpu_mmu_data_in[11] -pin INST_MMU data_out[11]
load net cntrl0_ddr2_ck_n[0] -attr @rip cntrl0_ddr2_ck_n[0] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_ck_n[0] -port cntrl0_ddr2_ck_n[0]
netloc cntrl0_ddr2_ck_n[0] 1 7 1 N
load net user_command_register[1] -attr @rip command_register[1] -pin INST_DDR2_RAM_CORE cntrl0_user_command_register[1] -pin INST_MMU command_register[1]
load net cntrl0_ddr2_a[10] -attr @rip cntrl0_ddr2_a[10] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[10] -port cntrl0_ddr2_a[10]
load net user_input_data[30] -attr @rip input_data[30] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[30] -pin INST_MMU input_data[30]
load net debug[19] -attr @rip cpu_debug_data_out[19] -pin CPU cpu_debug_data_out[19] -pin Inst_vga reg_data_in[19]
load net mmu_data_out[0] -attr @rip data_out[0] -pin CPU cpu_mmu_data_in[0] -pin INST_MMU data_out[0]
load net sw[0] -attr @rip sw[0] -pin CPU cpu_rst_in -pin INST_MMU reset_in -pin INST_MMU pins_in[12] -pin INST_UART rst -pin Inst_vga rst -pin Inst_vga_clk RST_IN -pin reset_INV_1 i -port sw[0]
load net cntrl0_ddr2_dqs_n[1] -attr @rip cntrl0_ddr2_dqs_n[1] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dqs_n[1] -port cntrl0_ddr2_dqs_n[1]
load net mmu_data_in[28] -attr @rip cpu_mmu_data_out[28] -pin CPU cpu_mmu_data_out[28] -pin INST_MMU data_in[28]
load net user_output_data[0] -attr @rip cntrl0_user_output_data[0] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[0] -pin INST_MMU output_data[0]
load net debug[6] -attr @rip cpu_debug_data_out[6] -pin CPU cpu_debug_data_out[6] -pin Inst_vga reg_data_in[6]
load net mmu_data_out[28] -attr @rip data_out[28] -pin CPU cpu_mmu_data_in[28] -pin INST_MMU data_out[28]
load net user_output_data[20] -attr @rip cntrl0_user_output_data[20] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[20] -pin INST_MMU output_data[20]
load net ir[12] -attr @rip cpu_debug_ir_out[12] -pin CPU cpu_debug_ir_out[12] -pin Inst_vga ir_in[12]
load net cntrl0_ddr2_dq[6] -attr @rip cntrl0_ddr2_dq[6] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[6] -port cntrl0_ddr2_dq[6]
load net leds[2] -attr @rip 2 -port leds[2] -pin pins_out[2]_err_out_MUX_6 o
load net mmu_cmd_in[0] -attr @rip cpu_mmu_com_out[0] -pin CPU cpu_mmu_com_out[0] -pin INST_MMU cmd_in[0]
load net pc[23] -attr @rip cpu_debug_pc_out[23] -pin CPU cpu_debug_pc_out[23] -pin Inst_vga pc_in[23]
load net user_input_data[25] -attr @rip input_data[25] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[25] -pin INST_MMU input_data[25]
load net ascii_y_in[2] -attr @rip y_out[2] -pin Inst_vga y_out[2] -pin inst_asciiunit y_in[2]
load net ascii_char_in[3] -attr @rip char_out[3] -pin INST_MMU char_out[3] -pin inst_asciiunit char_in[3]
load net debug[30] -attr @rip cpu_debug_data_out[30] -pin CPU cpu_debug_data_out[30] -pin Inst_vga reg_data_in[30]
load net ddr2_led -pin INST_Clock_VHDL clk_out_1Hz -pin pins_out[0]_ddr2_led_MUX_8 a1
netloc ddr2_led 1 6 1 N
load net g[0] -attr @rip g[0] -pin Inst_vga g[0] -port g[0]
load net user_input_address[12] -attr @rip input_adress[12] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[12] -pin INST_MMU input_adress[12]
load net user_output_data[15] -attr @rip cntrl0_user_output_data[15] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[15] -pin INST_MMU output_data[15]
load net mmu_data_in[3] -attr @rip cpu_mmu_data_out[3] -pin CPU cpu_mmu_data_out[3] -pin INST_MMU data_in[3]
load net ascii_x_in[0] -attr @rip x_out[0] -pin Inst_vga x_out[0] -pin inst_asciiunit x_in[0]
load net pc[18] -attr @rip cpu_debug_pc_out[18] -pin CPU cpu_debug_pc_out[18] -pin Inst_vga pc_in[18]
load net ir[29] -attr @rip cpu_debug_ir_out[29] -pin CPU cpu_debug_ir_out[29] -pin Inst_vga ir_in[29]
load net r[1] -attr @rip r[1] -pin Inst_vga r[1] -port r[1]
load net btn[4] -attr @rip btn[4] -pin INST_MMU pins_in[11] -port btn[4]
load net cntrl0_ddr2_dm[1] -attr @rip cntrl0_ddr2_dm[1] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dm[1] -port cntrl0_ddr2_dm[1]
load net cntrl0_ddr2_a[8] -attr @rip cntrl0_ddr2_a[8] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[8] -port cntrl0_ddr2_a[8]
load net debug_adr[5] -attr @rip cpu_debug_adr_out[5] -pin CPU cpu_debug_adr_out[5] -pin Inst_vga reg_adr_in[5]
load net pins_out[0] -attr @rip pins_out[0] -pin INST_MMU pins_out[0] -pin pins_out[0]_ddr2_led_MUX_8 a0
load net debug[25] -attr @rip cpu_debug_data_out[25] -pin CPU cpu_debug_data_out[25] -pin Inst_vga reg_data_in[25]
load net b[2] -attr @rip b[2] -pin Inst_vga b[2] -port b[2]
load net mmu_data_in[12] -attr @rip cpu_mmu_data_out[12] -pin CPU cpu_mmu_data_out[12] -pin INST_MMU data_in[12]
load net ascii_addr_out[7] -attr @rip addr_out[7] -pin INST_MMU char_addr_in[7] -pin inst_asciiunit addr_out[7]
load net user_input_data[8] -attr @rip input_data[8] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[8] -pin INST_MMU input_data[8]
load net mmu_addr_in[14] -attr @rip cpu_mmu_adr_out[14] -pin CPU cpu_mmu_adr_out[14] -pin INST_MMU addr_in[14]
load net mmu_data_out[12] -attr @rip data_out[12] -pin CPU cpu_mmu_data_in[12] -pin INST_MMU data_out[12]
load net mmu_addr_in[0] -attr @rip cpu_mmu_adr_out[0] -pin CPU cpu_mmu_adr_out[0] -pin INST_MMU addr_in[0]
load net user_command_register[2] -attr @rip command_register[2] -pin INST_DDR2_RAM_CORE cntrl0_user_command_register[2] -pin INST_MMU command_register[2]
load net cntrl0_ddr2_a[11] -attr @rip cntrl0_ddr2_a[11] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[11] -port cntrl0_ddr2_a[11]
load net user_input_data[31] -attr @rip input_data[31] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[31] -pin INST_MMU input_data[31]
load net ir[0] -attr @rip cpu_debug_ir_out[0] -pin CPU cpu_debug_ir_out[0] -pin Inst_vga ir_in[0]
load net mmu_data_out[1] -attr @rip data_out[1] -pin CPU cpu_mmu_data_in[1] -pin INST_MMU data_out[1]
load net sw[1] -attr @rip sw[1] -pin CPU cpu_slow_in -pin INST_MMU pins_in[13] -pin pins_out[1]_slow_MUX_7 a1 -port sw[1]
load net user_output_data[1] -attr @rip cntrl0_user_output_data[1] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[1] -pin INST_MMU output_data[1]
load net mmu_data_in[29] -attr @rip cpu_mmu_data_out[29] -pin CPU cpu_mmu_data_out[29] -pin INST_MMU data_in[29]
load net debug[7] -attr @rip cpu_debug_data_out[7] -pin CPU cpu_debug_data_out[7] -pin Inst_vga reg_data_in[7]
load net mmu_data_out[29] -attr @rip data_out[29] -pin CPU cpu_mmu_data_in[29] -pin INST_MMU data_out[29]
load net user_output_data[21] -attr @rip cntrl0_user_output_data[21] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[21] -pin INST_MMU output_data[21]
load net cntrl0_ddr2_dq[7] -attr @rip cntrl0_ddr2_dq[7] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[7] -port cntrl0_ddr2_dq[7]
load net ir[13] -attr @rip cpu_debug_ir_out[13] -pin CPU cpu_debug_ir_out[13] -pin Inst_vga ir_in[13]
load net leds[3] -attr @rip o[0] -port leds[3] -pin pins_out[7]_GND_5_o_mux_0 o[0]
load net mmu_cmd_in[1] -attr @rip cpu_mmu_com_out[1] -pin CPU cpu_mmu_com_out[1] -pin INST_MMU cmd_in[1]
load net pc[24] -attr @rip cpu_debug_pc_out[24] -pin CPU cpu_debug_pc_out[24] -pin Inst_vga pc_in[24]
load net user_input_data[26] -attr @rip input_data[26] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[26] -pin INST_MMU input_data[26]
load net ascii_y_in[3] -attr @rip y_out[3] -pin Inst_vga y_out[3] -pin inst_asciiunit y_in[3]
load net ascii_char_in[4] -attr @rip char_out[4] -pin INST_MMU char_out[4] -pin inst_asciiunit char_in[4]
load net debug[31] -attr @rip cpu_debug_data_out[31] -pin CPU cpu_debug_data_out[31] -pin Inst_vga reg_data_in[31]
load net clk_tb -pin INST_Clock_VHDL clk_in_133MHz -pin INST_DDR2_RAM_CORE cntrl0_clk_tb -pin INST_MMU clk_in
netloc clk_tb 1 4 4 1480 620 1980 570 N 570 2840
load net g[1] -attr @rip g[1] -pin Inst_vga g[1] -port g[1]
load net user_input_address[13] -attr @rip input_adress[13] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[13] -pin INST_MMU input_adress[13]
load net user_input_address[0] -attr @rip input_adress[0] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[0] -pin INST_MMU input_adress[0]
load net user_output_data[16] -attr @rip cntrl0_user_output_data[16] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[16] -pin INST_MMU output_data[16]
load net mmu_data_in[4] -attr @rip cpu_mmu_data_out[4] -pin CPU cpu_mmu_data_out[4] -pin INST_MMU data_in[4]
load net mmu_addr_in[20] -attr @rip cpu_mmu_adr_out[20] -pin CPU cpu_mmu_adr_out[20] -pin INST_MMU addr_in[20]
load net ascii_x_in[1] -attr @rip x_out[1] -pin Inst_vga x_out[1] -pin inst_asciiunit x_in[1]
load net pc[19] -attr @rip cpu_debug_pc_out[19] -pin CPU cpu_debug_pc_out[19] -pin Inst_vga pc_in[19]
load net r[2] -attr @rip r[2] -pin Inst_vga r[2] -port r[2]
load net cntrl0_ddr2_a[9] -attr @rip cntrl0_ddr2_a[9] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[9] -port cntrl0_ddr2_a[9]
load net pins_out[1] -attr @rip pins_out[1] -pin INST_MMU pins_out[1] -pin pins_out[1]_slow_MUX_7 a0
load net debug[26] -attr @rip cpu_debug_data_out[26] -pin CPU cpu_debug_data_out[26] -pin Inst_vga reg_data_in[26]
load net b[3] -attr @rip b[3] -pin Inst_vga b[3] -port b[3]
load net mmu_data_in[13] -attr @rip cpu_mmu_data_out[13] -pin CPU cpu_mmu_data_out[13] -pin INST_MMU data_in[13]
load net ascii_addr_out[8] -attr @rip addr_out[8] -pin INST_MMU char_addr_in[8] -pin inst_asciiunit addr_out[8]
load net user_input_data[9] -attr @rip input_data[9] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[9] -pin INST_MMU input_data[9]
load net mmu_addr_in[15] -attr @rip cpu_mmu_adr_out[15] -pin CPU cpu_mmu_adr_out[15] -pin INST_MMU addr_in[15]
load net mmu_data_out[13] -attr @rip data_out[13] -pin CPU cpu_mmu_data_in[13] -pin INST_MMU data_out[13]
load net mmu_addr_in[1] -attr @rip cpu_mmu_adr_out[1] -pin CPU cpu_mmu_adr_out[1] -pin INST_MMU addr_in[1]
load net user_input_data[10] -attr @rip input_data[10] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[10] -pin INST_MMU input_data[10]
load net pc[30] -attr @rip cpu_debug_pc_out[30] -pin CPU cpu_debug_pc_out[30] -pin Inst_vga pc_in[30]
load net cntrl0_ddr2_a[12] -attr @rip cntrl0_ddr2_a[12] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[12] -port cntrl0_ddr2_a[12]
load net ir[1] -attr @rip cpu_debug_ir_out[1] -pin CPU cpu_debug_ir_out[1] -pin Inst_vga ir_in[1]
load net mmu_data_out[2] -attr @rip data_out[2] -pin CPU cpu_mmu_data_in[2] -pin INST_MMU data_out[2]
load net pc[0] -attr @rip cpu_debug_pc_out[0] -pin CPU cpu_debug_pc_out[0] -pin Inst_vga pc_in[0]
load net sw[2] -attr @rip sw[2] -pin INST_MMU pins_in[14] -pin Inst_vga debug_on -port sw[2]
load net user_output_data[2] -attr @rip cntrl0_user_output_data[2] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[2] -pin INST_MMU output_data[2]
load net debug[8] -attr @rip cpu_debug_data_out[8] -pin CPU cpu_debug_data_out[8] -pin Inst_vga reg_data_in[8]
load net user_output_data[22] -attr @rip cntrl0_user_output_data[22] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[22] -pin INST_MMU output_data[22]
load net ascii_pixel_out -pin Inst_vga pixel -pin inst_asciiunit pixel_out
netloc ascii_pixel_out 1 6 1 2320
load net ir[14] -attr @rip cpu_debug_ir_out[14] -pin CPU cpu_debug_ir_out[14] -pin Inst_vga ir_in[14]
load net cntrl0_ddr2_dq[8] -attr @rip cntrl0_ddr2_dq[8] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[8] -port cntrl0_ddr2_dq[8]
load net leds[4] -attr @rip o[1] -port leds[4] -pin pins_out[7]_GND_5_o_mux_0 o[1]
load net mmu_work_in -pin CPU cpu_mmu_work_out -pin INST_MMU work_in
netloc mmu_work_in 1 4 1 1300
load net pc[25] -attr @rip cpu_debug_pc_out[25] -pin CPU cpu_debug_pc_out[25] -pin Inst_vga pc_in[25]
load net mmu_cmd_in[2] -attr @rip cpu_mmu_com_out[2] -pin CPU cpu_mmu_com_out[2] -pin INST_MMU cmd_in[2]
load net cntrl0_ddr2_dq[10] -attr @rip cntrl0_ddr2_dq[10] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[10] -port cntrl0_ddr2_dq[10]
load net user_input_data[27] -attr @rip input_data[27] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[27] -pin INST_MMU input_data[27]
load net debug[10] -attr @rip cpu_debug_data_out[10] -pin CPU cpu_debug_data_out[10] -pin Inst_vga reg_data_in[10]
load net ascii_y_in[4] -attr @rip y_out[4] -pin Inst_vga y_out[4] -pin inst_asciiunit y_in[4]
load net ascii_char_in[5] -attr @rip char_out[5] -pin INST_MMU char_out[5] -pin inst_asciiunit char_in[5]
load net g[2] -attr @rip g[2] -pin Inst_vga g[2] -port g[2]
load net user_input_address[14] -attr @rip input_adress[14] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[14] -pin INST_MMU input_adress[14]
load net user_input_address[1] -attr @rip input_adress[1] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[1] -pin INST_MMU input_adress[1]
load net user_output_data[17] -attr @rip cntrl0_user_output_data[17] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[17] -pin INST_MMU output_data[17]
load net mmu_data_in[5] -attr @rip cpu_mmu_data_out[5] -pin CPU cpu_mmu_data_out[5] -pin INST_MMU data_in[5]
load net mmu_addr_in[21] -attr @rip cpu_mmu_adr_out[21] -pin CPU cpu_mmu_adr_out[21] -pin INST_MMU addr_in[21]
load net ascii_x_in[2] -attr @rip x_out[2] -pin Inst_vga x_out[2] -pin inst_asciiunit x_in[2]
load net r[3] -attr @rip r[3] -pin Inst_vga r[3] -port r[3]
load net pins_out[2] -attr @rip pins_out[2] -pin INST_MMU pins_out[2] -pin pins_out[2]_err_out_MUX_6 a0
load net debug[27] -attr @rip cpu_debug_data_out[27] -pin CPU cpu_debug_data_out[27] -pin Inst_vga reg_data_in[27]
load net ascii_addr_out[9] -attr @rip addr_out[9] -pin INST_MMU char_addr_in[9] -pin inst_asciiunit addr_out[9]
load net mmu_data_in[14] -attr @rip cpu_mmu_data_out[14] -pin CPU cpu_mmu_data_out[14] -pin INST_MMU data_in[14]
load net cntrl0_ddr2_odt -pin INST_DDR2_RAM_CORE cntrl0_ddr2_odt -port cntrl0_ddr2_odt
netloc cntrl0_ddr2_odt 1 7 1 N
load net mmu_data_out[14] -attr @rip data_out[14] -pin CPU cpu_mmu_data_in[14] -pin INST_MMU data_out[14]
load net mmu_addr_in[16] -attr @rip cpu_mmu_adr_out[16] -pin CPU cpu_mmu_adr_out[16] -pin INST_MMU addr_in[16]
load net cntrl0_ddr2_ba[0] -attr @rip cntrl0_ddr2_ba[0] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_ba[0] -port cntrl0_ddr2_ba[0]
load net ir[20] -attr @rip cpu_debug_ir_out[20] -pin CPU cpu_debug_ir_out[20] -pin Inst_vga ir_in[20]
load net mmu_addr_in[2] -attr @rip cpu_mmu_adr_out[2] -pin CPU cpu_mmu_adr_out[2] -pin INST_MMU addr_in[2]
load net user_input_data[11] -attr @rip input_data[11] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[11] -pin INST_MMU input_data[11]
load net pc[31] -attr @rip cpu_debug_pc_out[31] -pin CPU cpu_debug_pc_out[31] -pin Inst_vga pc_in[31]
load net ir[2] -attr @rip cpu_debug_ir_out[2] -pin CPU cpu_debug_ir_out[2] -pin Inst_vga ir_in[2]
load net mmu_data_out[3] -attr @rip data_out[3] -pin CPU cpu_mmu_data_in[3] -pin INST_MMU data_out[3]
load net pc[1] -attr @rip cpu_debug_pc_out[1] -pin CPU cpu_debug_pc_out[1] -pin Inst_vga pc_in[1]
load net user_input_address[20] -attr @rip input_adress[20] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[20] -pin INST_MMU input_adress[20]
load net user_output_data[3] -attr @rip cntrl0_user_output_data[3] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[3] -pin INST_MMU output_data[3]
load net sw[3] -attr @rip sw[3] -pin INST_MMU pins_in[15] -pin pins_out[0]_ddr2_led_MUX_8 c -pin pins_out[1]_slow_MUX_7 c -pin pins_out[2]_err_out_MUX_6 c -pin pins_out[7]_GND_5_o_mux_0 cond -port sw[3]
load net debug[9] -attr @rip cpu_debug_data_out[9] -pin CPU cpu_debug_data_out[9] -pin Inst_vga reg_data_in[9]
load net user_output_data[23] -attr @rip cntrl0_user_output_data[23] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[23] -pin INST_MMU output_data[23]
load net ir[15] -attr @rip cpu_debug_ir_out[15] -pin CPU cpu_debug_ir_out[15] -pin Inst_vga ir_in[15]
load net cntrl0_ddr2_dq[9] -attr @rip cntrl0_ddr2_dq[9] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[9] -port cntrl0_ddr2_dq[9]
load net leds[5] -attr @rip o[2] -port leds[5] -pin pins_out[7]_GND_5_o_mux_0 o[2]
load net pc[26] -attr @rip cpu_debug_pc_out[26] -pin CPU cpu_debug_pc_out[26] -pin Inst_vga pc_in[26]
load net cntrl0_ddr2_dq[11] -attr @rip cntrl0_ddr2_dq[11] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[11] -port cntrl0_ddr2_dq[11]
load net user_input_data[28] -attr @rip input_data[28] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[28] -pin INST_MMU input_data[28]
load net debug[11] -attr @rip cpu_debug_data_out[11] -pin CPU cpu_debug_data_out[11] -pin Inst_vga reg_data_in[11]
load net ascii_y_in[5] -attr @rip y_out[5] -pin Inst_vga y_out[5] -pin inst_asciiunit y_in[5]
load net ascii_char_in[6] -attr @rip char_out[6] -pin INST_MMU char_out[6] -pin inst_asciiunit char_in[6]
load net g[3] -attr @rip g[3] -pin Inst_vga g[3] -port g[3]
load net user_input_address[15] -attr @rip input_adress[15] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[15] -pin INST_MMU input_adress[15]
load net mmu_data_in[20] -attr @rip cpu_mmu_data_out[20] -pin CPU cpu_mmu_data_out[20] -pin INST_MMU data_in[20]
load net user_input_address[2] -attr @rip input_adress[2] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[2] -pin INST_MMU input_adress[2]
load net user_output_data[18] -attr @rip cntrl0_user_output_data[18] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[18] -pin INST_MMU output_data[18]
load net mmu_data_in[6] -attr @rip cpu_mmu_data_out[6] -pin CPU cpu_mmu_data_out[6] -pin INST_MMU data_in[6]
load net mmu_data_out[20] -attr @rip data_out[20] -pin CPU cpu_mmu_data_in[20] -pin INST_MMU data_out[20]
load net mmu_addr_in[22] -attr @rip cpu_mmu_adr_out[22] -pin CPU cpu_mmu_adr_out[22] -pin INST_MMU addr_in[22]
load net ascii_x_in[3] -attr @rip x_out[3] -pin Inst_vga x_out[3] -pin inst_asciiunit x_in[3]
load net pins_out[3] -attr @rip pins_out[3] -pin INST_MMU pins_out[3] -pin pins_out[7]_GND_5_o_mux_0 d0[0]
load net debug[28] -attr @rip cpu_debug_data_out[28] -pin CPU cpu_debug_data_out[28] -pin Inst_vga reg_data_in[28]
load net err_out -pin CPU cpu_err_out -pin pins_out[2]_err_out_MUX_6 a1
netloc err_out 1 4 3 1320 1330 N 1330 N
load net mmu_data_in[15] -attr @rip cpu_mmu_data_out[15] -pin CPU cpu_mmu_data_out[15] -pin INST_MMU data_in[15]
load net mmu_data_out[15] -attr @rip data_out[15] -pin CPU cpu_mmu_data_in[15] -pin INST_MMU data_out[15]
load net mmu_addr_in[17] -attr @rip cpu_mmu_adr_out[17] -pin CPU cpu_mmu_adr_out[17] -pin INST_MMU addr_in[17]
load net cntrl0_ddr2_ba[1] -attr @rip cntrl0_ddr2_ba[1] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_ba[1] -port cntrl0_ddr2_ba[1]
load net pc[10] -attr @rip cpu_debug_pc_out[10] -pin CPU cpu_debug_pc_out[10] -pin Inst_vga pc_in[10]
load net ir[21] -attr @rip cpu_debug_ir_out[21] -pin CPU cpu_debug_ir_out[21] -pin Inst_vga ir_in[21]
load net mmu_addr_in[3] -attr @rip cpu_mmu_adr_out[3] -pin CPU cpu_mmu_adr_out[3] -pin INST_MMU addr_in[3]
load net mmu_ack_out -pin CPU cpu_mmu_ack_in -pin INST_MMU ack_out
netloc mmu_ack_out 1 3 3 940 600 N 600 1880
load net user_input_data[12] -attr @rip input_data[12] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[12] -pin INST_MMU input_data[12]
load net clk_cpu -pin CPU cpu_clk_in -pin INST_UART clk -pin Inst_vga_clk CLK0_OUT
netloc clk_cpu 1 2 2 700 410 900
load net cntrl0_ddr2_a[0] -attr @rip cntrl0_ddr2_a[0] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[0] -port cntrl0_ddr2_a[0]
load net ir[3] -attr @rip cpu_debug_ir_out[3] -pin CPU cpu_debug_ir_out[3] -pin Inst_vga ir_in[3]
load net pins_in[20] -attr @rip data[4] -pin INST_MMU pins_in[20] -pin INST_UART data[4]
load net mmu_data_out[4] -attr @rip data_out[4] -pin CPU cpu_mmu_data_in[4] -pin INST_MMU data_out[4]
load net pc[2] -attr @rip cpu_debug_pc_out[2] -pin CPU cpu_debug_pc_out[2] -pin Inst_vga pc_in[2]
load net user_input_data[0] -attr @rip input_data[0] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[0] -pin INST_MMU input_data[0]
load net user_input_address[21] -attr @rip input_adress[21] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[21] -pin INST_MMU input_adress[21]
load net CLK50M -pin Inst_vga_clk CLKIN_IN -pin clk133 CLK0_OUT
netloc CLK50M 1 1 1 450
load net user_output_data[4] -attr @rip cntrl0_user_output_data[4] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[4] -pin INST_MMU output_data[4]
load net user_output_data[24] -attr @rip cntrl0_user_output_data[24] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[24] -pin INST_MMU output_data[24]
load net ir[16] -attr @rip cpu_debug_ir_out[16] -pin CPU cpu_debug_ir_out[16] -pin Inst_vga ir_in[16]
load net leds[6] -attr @rip o[3] -port leds[6] -pin pins_out[7]_GND_5_o_mux_0 o[3]
load net pc[27] -attr @rip cpu_debug_pc_out[27] -pin CPU cpu_debug_pc_out[27] -pin Inst_vga pc_in[27]
load net cntrl0_ddr2_dq[12] -attr @rip cntrl0_ddr2_dq[12] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[12] -port cntrl0_ddr2_dq[12]
load net user_input_data[29] -attr @rip input_data[29] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[29] -pin INST_MMU input_data[29]
load net debug[12] -attr @rip cpu_debug_data_out[12] -pin CPU cpu_debug_data_out[12] -pin Inst_vga reg_data_in[12]
load net ascii_y_in[6] -attr @rip y_out[6] -pin Inst_vga y_out[6] -pin inst_asciiunit y_in[6]
load net ascii_char_in[7] -attr @rip char_out[7] -pin INST_MMU char_out[7] -pin inst_asciiunit char_in[7]
load net user_input_address[16] -attr @rip input_adress[16] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[16] -pin INST_MMU input_adress[16]
load net mmu_data_in[21] -attr @rip cpu_mmu_data_out[21] -pin CPU cpu_mmu_data_out[21] -pin INST_MMU data_in[21]
load net user_input_address[3] -attr @rip input_adress[3] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[3] -pin INST_MMU input_adress[3]
load net user_output_data[19] -attr @rip cntrl0_user_output_data[19] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[19] -pin INST_MMU output_data[19]
load net mmu_data_in[7] -attr @rip cpu_mmu_data_out[7] -pin CPU cpu_mmu_data_out[7] -pin INST_MMU data_in[7]
load net mmu_data_out[21] -attr @rip data_out[21] -pin CPU cpu_mmu_data_in[21] -pin INST_MMU data_out[21]
load net mmu_addr_in[23] -attr @rip cpu_mmu_adr_out[23] -pin CPU cpu_mmu_adr_out[23] -pin INST_MMU addr_in[23]
load net ascii_x_in[4] -attr @rip x_out[4] -pin Inst_vga x_out[4] -pin inst_asciiunit x_in[4]
load net user_cmd_ack -pin INST_DDR2_RAM_CORE cntrl0_user_cmd_ack -pin INST_MMU cmd_ack
netloc user_cmd_ack 1 4 4 1440 1070 N 1070 2340 1120 2860
load net pins_out[4] -attr @rip pins_out[4] -pin INST_MMU pins_out[4] -pin pins_out[7]_GND_5_o_mux_0 d0[1]
load net debug[29] -attr @rip cpu_debug_data_out[29] -pin CPU cpu_debug_data_out[29] -pin Inst_vga reg_data_in[29]
load net CLK_130M -pin clk133 CLKFX_OUT -pin clk_obuf I
netloc CLK_130M 1 1 5 N 1130 N 1130 N 1130 N 1130 N
load net mmu_data_in[16] -attr @rip cpu_mmu_data_out[16] -pin CPU cpu_mmu_data_out[16] -pin INST_MMU data_in[16]
load net user_data_valid -pin INST_DDR2_RAM_CORE cntrl0_user_data_valid -pin INST_MMU data_valid
netloc user_data_valid 1 4 4 1500 660 1900 510 N 510 2900
load net mmu_addr_in[18] -attr @rip cpu_mmu_adr_out[18] -pin CPU cpu_mmu_adr_out[18] -pin INST_MMU addr_in[18]
load net mmu_data_out[16] -attr @rip data_out[16] -pin CPU cpu_mmu_data_in[16] -pin INST_MMU data_out[16]
load net clk25 -pin Inst_vga clk -pin Inst_vga_clk CLKDV_OUT -pin inst_asciiunit clk
netloc clk25 1 2 5 N 390 N 390 1380 230 1940 90 N
load net user_output_data[30] -attr @rip cntrl0_user_output_data[30] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[30] -pin INST_MMU output_data[30]
load net ir[22] -attr @rip cpu_debug_ir_out[22] -pin CPU cpu_debug_ir_out[22] -pin Inst_vga ir_in[22]
load net pc[11] -attr @rip cpu_debug_pc_out[11] -pin CPU cpu_debug_pc_out[11] -pin Inst_vga pc_in[11]
load net mmu_addr_in[4] -attr @rip cpu_mmu_adr_out[4] -pin CPU cpu_mmu_adr_out[4] -pin INST_MMU addr_in[4]
load net user_input_data[13] -attr @rip input_data[13] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[13] -pin INST_MMU input_data[13]
load net cntrl0_ddr2_a[1] -attr @rip cntrl0_ddr2_a[1] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[1] -port cntrl0_ddr2_a[1]
load net rx -pin INST_UART rx -port rx
netloc rx 1 0 3 N 510 N 510 N
load net ir[4] -attr @rip cpu_debug_ir_out[4] -pin CPU cpu_debug_ir_out[4] -pin Inst_vga ir_in[4]
load net ascii_addr_out[10] -attr @rip addr_out[10] -pin INST_MMU char_addr_in[10] -pin inst_asciiunit addr_out[10]
load net pins_in[21] -attr @rip data[5] -pin INST_MMU pins_in[21] -pin INST_UART data[5]
load net mmu_data_out[5] -attr @rip data_out[5] -pin CPU cpu_mmu_data_in[5] -pin INST_MMU data_out[5]
load net pc[3] -attr @rip cpu_debug_pc_out[3] -pin CPU cpu_debug_pc_out[3] -pin Inst_vga pc_in[3]
load net ascii_addr_out[0] -attr @rip addr_out[0] -pin INST_MMU char_addr_in[0] -pin inst_asciiunit addr_out[0]
load net user_input_data[1] -attr @rip input_data[1] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[1] -pin INST_MMU input_data[1]
load net user_input_address[22] -attr @rip input_adress[22] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[22] -pin INST_MMU input_adress[22]
load net user_output_data[5] -attr @rip cntrl0_user_output_data[5] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[5] -pin INST_MMU output_data[5]
load net v_init_done -pin INST_DDR2_RAM_CORE cntrl0_init_done -pin INST_MMU init_done
netloc v_init_done 1 4 4 1520 680 1920 530 N 530 2880
load net user_output_data[25] -attr @rip cntrl0_user_output_data[25] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[25] -pin INST_MMU output_data[25]
load net ir[17] -attr @rip cpu_debug_ir_out[17] -pin CPU cpu_debug_ir_out[17] -pin Inst_vga ir_in[17]
load net leds[7] -attr @rip o[4] -port leds[7] -pin pins_out[7]_GND_5_o_mux_0 o[4]
load net pc[28] -attr @rip cpu_debug_pc_out[28] -pin CPU cpu_debug_pc_out[28] -pin Inst_vga pc_in[28]
load net cntrl0_ddr2_dq[13] -attr @rip cntrl0_ddr2_dq[13] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[13] -port cntrl0_ddr2_dq[13]
load net debug[13] -attr @rip cpu_debug_data_out[13] -pin CPU cpu_debug_data_out[13] -pin Inst_vga reg_data_in[13]
load net ascii_y_in[7] -attr @rip y_out[7] -pin Inst_vga y_out[7] -pin inst_asciiunit y_in[7]
load net pins_in[16] -attr @rip data[0] -pin INST_MMU pins_in[16] -pin INST_UART data[0]
load net user_input_address[17] -attr @rip input_adress[17] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[17] -pin INST_MMU input_adress[17]
load net mmu_data_in[22] -attr @rip cpu_mmu_data_out[22] -pin CPU cpu_mmu_data_out[22] -pin INST_MMU data_in[22]
load net user_input_address[4] -attr @rip input_adress[4] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[4] -pin INST_MMU input_adress[4]
load net mmu_data_in[8] -attr @rip cpu_mmu_data_out[8] -pin CPU cpu_mmu_data_out[8] -pin INST_MMU data_in[8]
load net debug[0] -attr @rip cpu_debug_data_out[0] -pin CPU cpu_debug_data_out[0] -pin Inst_vga reg_data_in[0]
load net mmu_data_out[22] -attr @rip data_out[22] -pin CPU cpu_mmu_data_in[22] -pin INST_MMU data_out[22]
load net mmu_addr_in[24] -attr @rip cpu_mmu_adr_out[24] -pin CPU cpu_mmu_adr_out[24] -pin INST_MMU addr_in[24]
load net cntrl0_ddr2_dq[0] -attr @rip cntrl0_ddr2_dq[0] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[0] -port cntrl0_ddr2_dq[0]
load net ascii_x_in[5] -attr @rip x_out[5] -pin Inst_vga x_out[5] -pin inst_asciiunit x_in[5]
load net pins_out[5] -attr @rip pins_out[5] -pin INST_MMU pins_out[5] -pin pins_out[7]_GND_5_o_mux_0 d0[2]
load net mmu_data_in[17] -attr @rip cpu_mmu_data_out[17] -pin CPU cpu_mmu_data_out[17] -pin INST_MMU data_in[17]
load net mmu_data_out[17] -attr @rip data_out[17] -pin CPU cpu_mmu_data_in[17] -pin INST_MMU data_out[17]
load net mmu_addr_in[19] -attr @rip cpu_mmu_adr_out[19] -pin CPU cpu_mmu_adr_out[19] -pin INST_MMU addr_in[19]
load net user_output_data[31] -attr @rip cntrl0_user_output_data[31] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[31] -pin INST_MMU output_data[31]
load net ir[23] -attr @rip cpu_debug_ir_out[23] -pin CPU cpu_debug_ir_out[23] -pin Inst_vga ir_in[23]
load net pc[12] -attr @rip cpu_debug_pc_out[12] -pin CPU cpu_debug_pc_out[12] -pin Inst_vga pc_in[12]
load net mmu_addr_in[5] -attr @rip cpu_mmu_adr_out[5] -pin CPU cpu_mmu_adr_out[5] -pin INST_MMU addr_in[5]
load net cntrl0_ddr2_cas_n -pin INST_DDR2_RAM_CORE cntrl0_ddr2_cas_n -port cntrl0_ddr2_cas_n
netloc cntrl0_ddr2_cas_n 1 7 1 N
load net user_input_data[14] -attr @rip input_data[14] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[14] -pin INST_MMU input_data[14]
load net cntrl0_ddr2_a[2] -attr @rip cntrl0_ddr2_a[2] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[2] -port cntrl0_ddr2_a[2]
load net ir[5] -attr @rip cpu_debug_ir_out[5] -pin CPU cpu_debug_ir_out[5] -pin Inst_vga ir_in[5]
load net pins_in[22] -attr @rip data[6] -pin INST_MMU pins_in[22] -pin INST_UART data[6]
load net mmu_data_out[6] -attr @rip data_out[6] -pin CPU cpu_mmu_data_in[6] -pin INST_MMU data_out[6]
load net ascii_addr_out[1] -attr @rip addr_out[1] -pin INST_MMU char_addr_in[1] -pin inst_asciiunit addr_out[1]
load net user_input_data[2] -attr @rip input_data[2] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[2] -pin INST_MMU input_data[2]
load net pc[4] -attr @rip cpu_debug_pc_out[4] -pin CPU cpu_debug_pc_out[4] -pin Inst_vga pc_in[4]
load net user_input_address[23] -attr @rip input_adress[23] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[23] -pin INST_MMU input_adress[23]
load net user_output_data[6] -attr @rip cntrl0_user_output_data[6] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[6] -pin INST_MMU output_data[6]
load net user_output_data[26] -attr @rip cntrl0_user_output_data[26] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[26] -pin INST_MMU output_data[26]
load net ir[18] -attr @rip cpu_debug_ir_out[18] -pin CPU cpu_debug_ir_out[18] -pin Inst_vga ir_in[18]
load net mmu_addr_in[30] -attr @rip cpu_mmu_adr_out[30] -pin CPU cpu_mmu_adr_out[30] -pin INST_MMU addr_in[30]
load net pc[29] -attr @rip cpu_debug_pc_out[29] -pin CPU cpu_debug_pc_out[29] -pin Inst_vga pc_in[29]
load net cntrl0_ddr2_dq[14] -attr @rip cntrl0_ddr2_dq[14] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[14] -port cntrl0_ddr2_dq[14]
load net debug[14] -attr @rip cpu_debug_data_out[14] -pin CPU cpu_debug_data_out[14] -pin Inst_vga reg_data_in[14]
load net ascii_y_in[8] -attr @rip y_out[8] -pin Inst_vga y_out[8] -pin inst_asciiunit y_in[8]
load net pins_in[17] -attr @rip data[1] -pin INST_MMU pins_in[17] -pin INST_UART data[1]
load net user_input_address[18] -attr @rip input_adress[18] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[18] -pin INST_MMU input_adress[18]
load net mmu_data_in[23] -attr @rip cpu_mmu_data_out[23] -pin CPU cpu_mmu_data_out[23] -pin INST_MMU data_in[23]
load net user_input_address[5] -attr @rip input_adress[5] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[5] -pin INST_MMU input_adress[5]
load net mmu_data_in[9] -attr @rip cpu_mmu_data_out[9] -pin CPU cpu_mmu_data_out[9] -pin INST_MMU data_in[9]
load net debug[1] -attr @rip cpu_debug_data_out[1] -pin CPU cpu_debug_data_out[1] -pin Inst_vga reg_data_in[1]
load net mmu_data_out[23] -attr @rip data_out[23] -pin CPU cpu_mmu_data_in[23] -pin INST_MMU data_out[23]
load net mmu_addr_in[25] -attr @rip cpu_mmu_adr_out[25] -pin CPU cpu_mmu_adr_out[25] -pin INST_MMU addr_in[25]
load net cntrl0_ddr2_dq[1] -attr @rip cntrl0_ddr2_dq[1] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[1] -port cntrl0_ddr2_dq[1]
load net ascii_x_in[6] -attr @rip x_out[6] -pin Inst_vga x_out[6] -pin inst_asciiunit x_in[6]
load net user_input_data[20] -attr @rip input_data[20] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[20] -pin INST_MMU input_data[20]
load net hsync -pin Inst_vga h -port hsync
netloc hsync 1 7 1 N
load net pins_out[6] -attr @rip pins_out[6] -pin INST_MMU pins_out[6] -pin pins_out[7]_GND_5_o_mux_0 d0[3]
load net cntrl0_rst_dqs_div_in -pin INST_DDR2_RAM_CORE cntrl0_rst_dqs_div_in -port cntrl0_rst_dqs_div_in
netloc cntrl0_rst_dqs_div_in 1 0 7 N 870 N 870 N 870 N 870 N 870 N 870 N
load net mmu_data_in[18] -attr @rip cpu_mmu_data_out[18] -pin CPU cpu_mmu_data_out[18] -pin INST_MMU data_in[18]
load net cntrl0_ddr2_we_n -pin INST_DDR2_RAM_CORE cntrl0_ddr2_we_n -port cntrl0_ddr2_we_n
netloc cntrl0_ddr2_we_n 1 7 1 N
load net reset_n -pin INST_DDR2_RAM_CORE reset_in_n -pin reset_INV_1 o
netloc reset_n 1 6 1 N
load net mmu_data_out[18] -attr @rip data_out[18] -pin CPU cpu_mmu_data_in[18] -pin INST_MMU data_out[18]
load net user_output_data[10] -attr @rip cntrl0_user_output_data[10] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[10] -pin INST_MMU output_data[10]
load net ir[24] -attr @rip cpu_debug_ir_out[24] -pin CPU cpu_debug_ir_out[24] -pin Inst_vga ir_in[24]
load net pc[13] -attr @rip cpu_debug_pc_out[13] -pin CPU cpu_debug_pc_out[13] -pin Inst_vga pc_in[13]
load net mmu_addr_in[6] -attr @rip cpu_mmu_adr_out[6] -pin CPU cpu_mmu_adr_out[6] -pin INST_MMU addr_in[6]
load net user_input_data[15] -attr @rip input_data[15] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[15] -pin INST_MMU input_data[15]
load net cntrl0_ddr2_a[3] -attr @rip cntrl0_ddr2_a[3] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_a[3] -port cntrl0_ddr2_a[3]
load net debug_adr[0] -attr @rip cpu_debug_adr_out[0] -pin CPU cpu_debug_adr_out[0] -pin Inst_vga reg_adr_in[0]
load net debug[20] -attr @rip cpu_debug_data_out[20] -pin CPU cpu_debug_data_out[20] -pin Inst_vga reg_data_in[20]
load net ir[6] -attr @rip cpu_debug_ir_out[6] -pin CPU cpu_debug_ir_out[6] -pin Inst_vga ir_in[6]
load net pins_in[23] -attr @rip data[7] -pin INST_MMU pins_in[23] -pin INST_UART data[7]
load net mmu_data_out[7] -attr @rip data_out[7] -pin CPU cpu_mmu_data_in[7] -pin INST_MMU data_out[7]
load net pc[5] -attr @rip cpu_debug_pc_out[5] -pin CPU cpu_debug_pc_out[5] -pin Inst_vga pc_in[5]
load net ascii_addr_out[2] -attr @rip addr_out[2] -pin INST_MMU char_addr_in[2] -pin inst_asciiunit addr_out[2]
load net user_input_data[3] -attr @rip input_data[3] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[3] -pin INST_MMU input_data[3]
load net user_input_address[24] -attr @rip input_adress[24] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[24] -pin INST_MMU input_adress[24]
load net cntrl0_ddr2_ck[0] -attr @rip cntrl0_ddr2_ck[0] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_ck[0] -port cntrl0_ddr2_ck[0]
netloc cntrl0_ddr2_ck[0] 1 7 1 N
load net user_output_data[7] -attr @rip cntrl0_user_output_data[7] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[7] -pin INST_MMU output_data[7]
load net user_output_data[27] -attr @rip cntrl0_user_output_data[27] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[27] -pin INST_MMU output_data[27]
load net ir[19] -attr @rip cpu_debug_ir_out[19] -pin CPU cpu_debug_ir_out[19] -pin Inst_vga ir_in[19]
load net mmu_addr_in[31] -attr @rip cpu_mmu_adr_out[31] -pin CPU cpu_mmu_adr_out[31] -pin INST_MMU addr_in[31]
load net cntrl0_ddr2_dq[15] -attr @rip cntrl0_ddr2_dq[15] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[15] -port cntrl0_ddr2_dq[15]
load net debug[15] -attr @rip cpu_debug_data_out[15] -pin CPU cpu_debug_data_out[15] -pin Inst_vga reg_data_in[15]
load net ascii_y_in[9] -attr @rip y_out[9] -pin Inst_vga y_out[9] -pin inst_asciiunit y_in[9]
load net pins_in[18] -attr @rip data[2] -pin INST_MMU pins_in[18] -pin INST_UART data[2]
load net user_input_address[19] -attr @rip input_adress[19] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[19] -pin INST_MMU input_adress[19]
load net mmu_data_in[24] -attr @rip cpu_mmu_data_out[24] -pin CPU cpu_mmu_data_out[24] -pin INST_MMU data_in[24]
load net user_input_address[6] -attr @rip input_adress[6] -pin INST_DDR2_RAM_CORE cntrl0_user_input_address[6] -pin INST_MMU input_adress[6]
load net debug[2] -attr @rip cpu_debug_data_out[2] -pin CPU cpu_debug_data_out[2] -pin Inst_vga reg_data_in[2]
load net mmu_data_out[24] -attr @rip data_out[24] -pin CPU cpu_mmu_data_in[24] -pin INST_MMU data_out[24]
load net mmu_addr_in[26] -attr @rip cpu_mmu_adr_out[26] -pin CPU cpu_mmu_adr_out[26] -pin INST_MMU addr_in[26]
load net cntrl0_ddr2_dq[2] -attr @rip cntrl0_ddr2_dq[2] -pin INST_DDR2_RAM_CORE cntrl0_ddr2_dq[2] -port cntrl0_ddr2_dq[2]
load net ascii_x_in[7] -attr @rip x_out[7] -pin Inst_vga x_out[7] -pin inst_asciiunit x_in[7]
load net vsync -pin Inst_vga v -port vsync
netloc vsync 1 7 1 N
load net ir[30] -attr @rip cpu_debug_ir_out[30] -pin CPU cpu_debug_ir_out[30] -pin Inst_vga ir_in[30]
load net user_input_data[21] -attr @rip input_data[21] -pin INST_DDR2_RAM_CORE cntrl0_user_input_data[21] -pin INST_MMU input_data[21]
load net pins_out[7] -attr @rip pins_out[7] -pin INST_MMU pins_out[7] -pin pins_out[7]_GND_5_o_mux_0 d0[4]
load net cntrl0_ddr2_ras_n -pin INST_DDR2_RAM_CORE cntrl0_ddr2_ras_n -port cntrl0_ddr2_ras_n
netloc cntrl0_ddr2_ras_n 1 7 1 N
load net mmu_data_in[19] -attr @rip cpu_mmu_data_out[19] -pin CPU cpu_mmu_data_out[19] -pin INST_MMU data_in[19]
load net mmu_data_out[19] -attr @rip data_out[19] -pin CPU cpu_mmu_data_in[19] -pin INST_MMU data_out[19]
load net user_output_data[11] -attr @rip cntrl0_user_output_data[11] -pin INST_DDR2_RAM_CORE cntrl0_user_output_data[11] -pin INST_MMU output_data[11]
load net ir[25] -attr @rip cpu_debug_ir_out[25] -pin CPU cpu_debug_ir_out[25] -pin Inst_vga ir_in[25]
load net pc[14] -attr @rip cpu_debug_pc_out[14] -pin CPU cpu_debug_pc_out[14] -pin Inst_vga pc_in[14]
load netBundle @cntrl0_ddr2_ba 2 cntrl0_ddr2_ba[1] cntrl0_ddr2_ba[0] -autobundled
netbloc @cntrl0_ddr2_ba 1 7 1 N
load netBundle @ascii_addr_out 11 ascii_addr_out[10] ascii_addr_out[9] ascii_addr_out[8] ascii_addr_out[7] ascii_addr_out[6] ascii_addr_out[5] ascii_addr_out[4] ascii_addr_out[3] ascii_addr_out[2] ascii_addr_out[1] ascii_addr_out[0] -autobundled
netbloc @ascii_addr_out 1 4 3 1480 210 1920 350 2280
load netBundle @ascii_char_in 8 ascii_char_in[7] ascii_char_in[6] ascii_char_in[5] ascii_char_in[4] ascii_char_in[3] ascii_char_in[2] ascii_char_in[1] ascii_char_in[0] -autobundled
netbloc @ascii_char_in 1 5 1 1900
load netBundle @ascii_x_in 10 ascii_x_in[9] ascii_x_in[8] ascii_x_in[7] ascii_x_in[6] ascii_x_in[5] ascii_x_in[4] ascii_x_in[3] ascii_x_in[2] ascii_x_in[1] ascii_x_in[0] -autobundled
netbloc @ascii_x_in 1 5 3 1960 10 N 10 2900
load netBundle @mmu_data_in 32 mmu_data_in[31] mmu_data_in[30] mmu_data_in[29] mmu_data_in[28] mmu_data_in[27] mmu_data_in[26] mmu_data_in[25] mmu_data_in[24] mmu_data_in[23] mmu_data_in[22] mmu_data_in[21] mmu_data_in[20] mmu_data_in[19] mmu_data_in[18] mmu_data_in[17] mmu_data_in[16] mmu_data_in[15] mmu_data_in[14] mmu_data_in[13] mmu_data_in[12] mmu_data_in[11] mmu_data_in[10] mmu_data_in[9] mmu_data_in[8] mmu_data_in[7] mmu_data_in[6] mmu_data_in[5] mmu_data_in[4] mmu_data_in[3] mmu_data_in[2] mmu_data_in[1] mmu_data_in[0] -autobundled
netbloc @mmu_data_in 1 4 1 1340
load netBundle @ascii_y_in 10 ascii_y_in[9] ascii_y_in[8] ascii_y_in[7] ascii_y_in[6] ascii_y_in[5] ascii_y_in[4] ascii_y_in[3] ascii_y_in[2] ascii_y_in[1] ascii_y_in[0] -autobundled
netbloc @ascii_y_in 1 5 3 1980 30 N 30 2820
load netBundle @user_command_register 3 user_command_register[2] user_command_register[1] user_command_register[0] -autobundled
netbloc @user_command_register 1 5 2 N 410 2400
load netBundle @pins_out 8 pins_out[7] pins_out[6] pins_out[5] pins_out[4] pins_out[3] pins_out[2] pins_out[1] pins_out[0] -autobundled
netbloc @pins_out 1 5 2 N 490 2320
load netBundle @user_output_data 32 user_output_data[31] user_output_data[30] user_output_data[29] user_output_data[28] user_output_data[27] user_output_data[26] user_output_data[25] user_output_data[24] user_output_data[23] user_output_data[22] user_output_data[21] user_output_data[20] user_output_data[19] user_output_data[18] user_output_data[17] user_output_data[16] user_output_data[15] user_output_data[14] user_output_data[13] user_output_data[12] user_output_data[11] user_output_data[10] user_output_data[9] user_output_data[8] user_output_data[7] user_output_data[6] user_output_data[5] user_output_data[4] user_output_data[3] user_output_data[2] user_output_data[1] user_output_data[0] -autobundled
netbloc @user_output_data 1 4 4 1460 1090 N 1090 2300 1140 2820
load netBundle @b 4 b[3] b[2] b[1] b[0] -autobundled
netbloc @b 1 7 1 N
load netBundle @ir 32 ir[31] ir[30] ir[29] ir[28] ir[27] ir[26] ir[25] ir[24] ir[23] ir[22] ir[21] ir[20] ir[19] ir[18] ir[17] ir[16] ir[15] ir[14] ir[13] ir[12] ir[11] ir[10] ir[9] ir[8] ir[7] ir[6] ir[5] ir[4] ir[3] ir[2] ir[1] ir[0] -autobundled
netbloc @ir 1 4 3 1280 130 N 130 N
load netBundle @cntrl0_ddr2_dm 2 cntrl0_ddr2_dm[1] cntrl0_ddr2_dm[0] -autobundled
netbloc @cntrl0_ddr2_dm 1 7 1 N
load netBundle @user_input_data 32 user_input_data[31] user_input_data[30] user_input_data[29] user_input_data[28] user_input_data[27] user_input_data[26] user_input_data[25] user_input_data[24] user_input_data[23] user_input_data[22] user_input_data[21] user_input_data[20] user_input_data[19] user_input_data[18] user_input_data[17] user_input_data[16] user_input_data[15] user_input_data[14] user_input_data[13] user_input_data[12] user_input_data[11] user_input_data[10] user_input_data[9] user_input_data[8] user_input_data[7] user_input_data[6] user_input_data[5] user_input_data[4] user_input_data[3] user_input_data[2] user_input_data[1] user_input_data[0] -autobundled
netbloc @user_input_data 1 5 2 N 470 2340
load netBundle @user_input_address 25 user_input_address[24] user_input_address[23] user_input_address[22] user_input_address[21] user_input_address[20] user_input_address[19] user_input_address[18] user_input_address[17] user_input_address[16] user_input_address[15] user_input_address[14] user_input_address[13] user_input_address[12] user_input_address[11] user_input_address[10] user_input_address[9] user_input_address[8] user_input_address[7] user_input_address[6] user_input_address[5] user_input_address[4] user_input_address[3] user_input_address[2] user_input_address[1] user_input_address[0] -autobundled
netbloc @user_input_address 1 5 2 N 450 2360
load netBundle @cntrl0_ddr2_dqs_n 2 cntrl0_ddr2_dqs_n[1] cntrl0_ddr2_dqs_n[0] -autobundled
netbloc @cntrl0_ddr2_dqs_n 1 6 2 2480 650 N
load netBundle @cntrl0_ddr2_dqs 2 cntrl0_ddr2_dqs[1] cntrl0_ddr2_dqs[0] -autobundled
netbloc @cntrl0_ddr2_dqs 1 6 2 2460 630 N
load netBundle @mmu_addr_in 32 mmu_addr_in[31] mmu_addr_in[30] mmu_addr_in[29] mmu_addr_in[28] mmu_addr_in[27] mmu_addr_in[26] mmu_addr_in[25] mmu_addr_in[24] mmu_addr_in[23] mmu_addr_in[22] mmu_addr_in[21] mmu_addr_in[20] mmu_addr_in[19] mmu_addr_in[18] mmu_addr_in[17] mmu_addr_in[16] mmu_addr_in[15] mmu_addr_in[14] mmu_addr_in[13] mmu_addr_in[12] mmu_addr_in[11] mmu_addr_in[10] mmu_addr_in[9] mmu_addr_in[8] mmu_addr_in[7] mmu_addr_in[6] mmu_addr_in[5] mmu_addr_in[4] mmu_addr_in[3] mmu_addr_in[2] mmu_addr_in[1] mmu_addr_in[0] -autobundled
netbloc @mmu_addr_in 1 4 1 N
load netBundle @r 4 r[3] r[2] r[1] r[0] -autobundled
netbloc @r 1 7 1 N
load netBundle @cntrl0_ddr2_dq 16 cntrl0_ddr2_dq[15] cntrl0_ddr2_dq[14] cntrl0_ddr2_dq[13] cntrl0_ddr2_dq[12] cntrl0_ddr2_dq[11] cntrl0_ddr2_dq[10] cntrl0_ddr2_dq[9] cntrl0_ddr2_dq[8] cntrl0_ddr2_dq[7] cntrl0_ddr2_dq[6] cntrl0_ddr2_dq[5] cntrl0_ddr2_dq[4] cntrl0_ddr2_dq[3] cntrl0_ddr2_dq[2] cntrl0_ddr2_dq[1] cntrl0_ddr2_dq[0] -autobundled
netbloc @cntrl0_ddr2_dq 1 6 2 2440 610 N
load netBundle @g 4 g[3] g[2] g[1] g[0] -autobundled
netbloc @g 1 7 1 N
load netBundle @mmu_cmd_in 3 mmu_cmd_in[2] mmu_cmd_in[1] mmu_cmd_in[0] -autobundled
netbloc @mmu_cmd_in 1 4 1 1360
load netBundle @debug_adr 6 debug_adr[5] debug_adr[4] debug_adr[3] debug_adr[2] debug_adr[1] debug_adr[0] -autobundled
netbloc @debug_adr 1 4 3 1300 170 N 170 2300
load netBundle @pins_in,btn,sw 19 pins_in[25] pins_in[24] pins_in[23] pins_in[22] pins_in[21] pins_in[20] pins_in[19] pins_in[18] pins_in[17] pins_in[16] sw[3] sw[2] sw[1] sw[0] btn[4] btn[3] btn[2] btn[1] btn[0] -autobundled
netbloc @pins_in,btn,sw 1 0 7 220 490 470 490 700 550 920 550 1280 700 1880 1250 2380
load netBundle @pc 32 pc[31] pc[30] pc[29] pc[28] pc[27] pc[26] pc[25] pc[24] pc[23] pc[22] pc[21] pc[20] pc[19] pc[18] pc[17] pc[16] pc[15] pc[14] pc[13] pc[12] pc[11] pc[10] pc[9] pc[8] pc[7] pc[6] pc[5] pc[4] pc[3] pc[2] pc[1] pc[0] -autobundled
netbloc @pc 1 4 3 1320 150 N 150 N
load netBundle @cntrl0_ddr2_a 13 cntrl0_ddr2_a[12] cntrl0_ddr2_a[11] cntrl0_ddr2_a[10] cntrl0_ddr2_a[9] cntrl0_ddr2_a[8] cntrl0_ddr2_a[7] cntrl0_ddr2_a[6] cntrl0_ddr2_a[5] cntrl0_ddr2_a[4] cntrl0_ddr2_a[3] cntrl0_ddr2_a[2] cntrl0_ddr2_a[1] cntrl0_ddr2_a[0] -autobundled
netbloc @cntrl0_ddr2_a 1 7 1 N
load netBundle @leds 8 leds[7] leds[6] leds[5] leds[4] leds[3] leds[2] leds[1] leds[0] -autobundled
netbloc @leds 1 7 1 2860
load netBundle @debug 32 debug[31] debug[30] debug[29] debug[28] debug[27] debug[26] debug[25] debug[24] debug[23] debug[22] debug[21] debug[20] debug[19] debug[18] debug[17] debug[16] debug[15] debug[14] debug[13] debug[12] debug[11] debug[10] debug[9] debug[8] debug[7] debug[6] debug[5] debug[4] debug[3] debug[2] debug[1] debug[0] -autobundled
netbloc @debug 1 4 3 1380 190 N 190 2280
load netBundle @mmu_data_out 32 mmu_data_out[31] mmu_data_out[30] mmu_data_out[29] mmu_data_out[28] mmu_data_out[27] mmu_data_out[26] mmu_data_out[25] mmu_data_out[24] mmu_data_out[23] mmu_data_out[22] mmu_data_out[21] mmu_data_out[20] mmu_data_out[19] mmu_data_out[18] mmu_data_out[17] mmu_data_out[16] mmu_data_out[15] mmu_data_out[14] mmu_data_out[13] mmu_data_out[12] mmu_data_out[11] mmu_data_out[10] mmu_data_out[9] mmu_data_out[8] mmu_data_out[7] mmu_data_out[6] mmu_data_out[5] mmu_data_out[4] mmu_data_out[3] mmu_data_out[2] mmu_data_out[1] mmu_data_out[0] -autobundled
netbloc @mmu_data_out 1 3 3 960 640 N 640 1860
show
fullfit
#
# initialize ictrl to current module toplevel work:behaviour:toplevel.vhd
ictrl init topinfo |
