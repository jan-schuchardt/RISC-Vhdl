--*****************************************************************************
-- DISCLAIMER OF LIABILITY
--
-- This file contains proprietary and confidential information of
-- Xilinx, Inc. ("Xilinx"), that is distributed under a license
-- from Xilinx, and may be used, copied and/or disclosed only
-- pursuant to the terms of a valid license agreement with Xilinx.
--
-- XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION
-- ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
-- EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT
-- LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,
-- MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx
-- does not warrant that functions included in the Materials will
-- meet the requirements of Licensee, or that the operation of the
-- Materials will be uninterrupted or error-free, or that defects
-- in the Materials will be corrected. Furthermore, Xilinx does
-- not warrant or make any representations regarding use, or the
-- results of the use, of the Materials in terms of correctness,
-- accuracy, reliability or otherwise.
--
-- Xilinx products are not designed or intended to be fail-safe,
-- or for use in any application requiring fail-safe performance,
-- such as life-support or safety devices or systems, Class III
-- medical devices, nuclear facilities, applications related to
-- the deployment of airbags, or any other applications that could
-- lead to death, personal injury or severe property or
-- environmental damage (individually and collectively, "critical
-- applications"). Customer assumes the sole risk and liability
-- of any use of Xilinx products in critical applications,
-- subject only to applicable laws and regulations governing
-- limitations on product liability.
--
-- Copyright 2007, 2008 Xilinx, Inc.
-- All rights reserved.
--
-- This disclaimer and copyright notice must be retained as part
-- of this file at all times.
--*****************************************************************************
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version            : 3.6.1
--  \   \        Application        : MIG
--  /   /        Filename           : u_ddr.vho
-- /___/   /\    Date Last Modified : $Date: 2010/11/26 18:26:31 $
-- \   \  /  \   Date Created       : Wed May 2 2007
--  \___\/\___\
--
-- Purpose     : Template file containing code that can be used as a model
--               for instantiating a CORE Generator module in a HDL design.
-- Revision History:
--*****************************************************************************

-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component u_ddr
 port(
      cntrl0_ddr2_dq                : inout std_logic_vector(7 downto 0);
      cntrl0_ddr2_a                 : out   std_logic_vector(12 downto 0);
      cntrl0_ddr2_ba                : out   std_logic_vector(1 downto 0);
      cntrl0_ddr2_cke               : out   std_logic;
      cntrl0_ddr2_cs_n              : out   std_logic;
      cntrl0_ddr2_ras_n             : out   std_logic;
      cntrl0_ddr2_cas_n             : out   std_logic;
      cntrl0_ddr2_we_n              : out   std_logic;
      cntrl0_ddr2_odt               : out   std_logic;
      cntrl0_rst_dqs_div_in         : in    std_logic;
      cntrl0_rst_dqs_div_out        : out   std_logic;
      sys_clkb                      : in    std_logic;
      sys_clk                       : in    std_logic;
      reset_in_n                    : in    std_logic;
      cntrl0_burst_done             : in    std_logic;
      cntrl0_init_done              : out   std_logic;
      cntrl0_ar_done                : out   std_logic;
      cntrl0_user_data_valid        : out   std_logic;
      cntrl0_auto_ref_req           : out   std_logic;
      cntrl0_user_cmd_ack           : out   std_logic;
      cntrl0_user_command_register  : in    std_logic_vector(2 downto 0);
      cntrl0_clk_tb                 : out   std_logic;
      cntrl0_clk90_tb               : out   std_logic;
      cntrl0_sys_rst_tb             : out   std_logic;
      cntrl0_sys_rst90_tb           : out   std_logic;
      cntrl0_sys_rst180_tb          : out   std_logic;
      cntrl0_user_output_data       : out   std_logic_vector(15 downto 0);
      cntrl0_user_input_data        : in    std_logic_vector(15 downto 0);
      cntrl0_user_input_address     : in    std_logic_vector(24 downto 0);
      cntrl0_ddr2_dqs               : inout std_logic_vector(0 downto 0);
      cntrl0_ddr2_dqs_n             : inout std_logic_vector(0 downto 0);
      cntrl0_ddr2_ck                : out   std_logic_vector(0 downto 0);
      cntrl0_ddr2_ck_n              : out   std_logic_vector(0 downto 0)

);
end component;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
u_u_ddr :u_ddr
       port map (
      cntrl0_ddr2_dq                => cntrl0_ddr2_dq,
      cntrl0_ddr2_a                 => cntrl0_ddr2_a,
      cntrl0_ddr2_ba                => cntrl0_ddr2_ba,
      cntrl0_ddr2_cke               => cntrl0_ddr2_cke,
      cntrl0_ddr2_cs_n              => cntrl0_ddr2_cs_n,
      cntrl0_ddr2_ras_n             => cntrl0_ddr2_ras_n,
      cntrl0_ddr2_cas_n             => cntrl0_ddr2_cas_n,
      cntrl0_ddr2_we_n              => cntrl0_ddr2_we_n,
      cntrl0_ddr2_odt               => cntrl0_ddr2_odt,
      cntrl0_rst_dqs_div_in         => cntrl0_rst_dqs_div_in,
      cntrl0_rst_dqs_div_out        => cntrl0_rst_dqs_div_out,
      sys_clkb                      => sys_clkb,
      sys_clk                       => sys_clk,
      reset_in_n                    => reset_in_n,
      cntrl0_burst_done             => cntrl0_burst_done,
      cntrl0_init_done              => cntrl0_init_done,
      cntrl0_ar_done                => cntrl0_ar_done,
      cntrl0_user_data_valid        => cntrl0_user_data_valid,
      cntrl0_auto_ref_req           => cntrl0_auto_ref_req,
      cntrl0_user_cmd_ack           => cntrl0_user_cmd_ack,
      cntrl0_user_command_register  => cntrl0_user_command_register,
      cntrl0_clk_tb                 => cntrl0_clk_tb,
      cntrl0_clk90_tb               => cntrl0_clk90_tb,
      cntrl0_sys_rst_tb             => cntrl0_sys_rst_tb,
      cntrl0_sys_rst90_tb           => cntrl0_sys_rst90_tb,
      cntrl0_sys_rst180_tb          => cntrl0_sys_rst180_tb,
      cntrl0_user_output_data       => cntrl0_user_output_data,
      cntrl0_user_input_data        => cntrl0_user_input_data,
      cntrl0_user_input_address     => cntrl0_user_input_address,
      cntrl0_ddr2_dqs               => cntrl0_ddr2_dqs,
      cntrl0_ddr2_dqs_n             => cntrl0_ddr2_dqs_n,
      cntrl0_ddr2_ck                => cntrl0_ddr2_ck,
      cntrl0_ddr2_ck_n              => cntrl0_ddr2_ck_n
);

-- INST_TAG_END ------ End INSTANTIATION Template ------------

-- You must compile the wrapper file u_ddr.vhd when simulating
-- the core, u_ddr. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

