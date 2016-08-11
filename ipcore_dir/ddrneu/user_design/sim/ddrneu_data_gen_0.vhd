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
-- Copyright 2005, 2006, 2007, 2008 Xilinx, Inc.
-- All rights reserved.
--
-- This disclaimer and copyright notice must be retained as part
-- of this file at all times.
--*****************************************************************************
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version	    : 3.6.1
--  \   \        Application	    : MIG
--  /   /        Filename           : ddrneu_data_gen_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2010/11/26 18:25:42 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose	: This module generate write data during the write command 
--                and compare data during read command. For write command,
--                mask data is also generated. Mask data is tied to low. 
--*****************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.ddrneu_parameters_0.all;

entity ddrneu_data_gen_0 is
  port (
    clk90       : in  std_logic;
    rst90       : in  std_logic;
    data_rst    : in  std_logic;
    data_ena    : in  std_logic;
    mask_data : out std_logic_vector((2*DATA_MASK_WIDTH-1) downto 0);
    data_out    : out std_logic_vector((2*DATA_WIDTH-1) downto 0));
end ddrneu_data_gen_0;

architecture arc of ddrneu_data_gen_0 is

  signal rise_data   : std_logic_vector(7 downto 0);
  signal fall_data   : std_logic_vector(7 downto 0);
  signal rst90_r  : std_logic;

  signal rise_data_xnor  : std_logic;
  signal rise_data1  : std_logic_vector(7 downto 0);
  constant PATTERN   : std_logic_vector(7 downto 0)  := "10010110"; -- 96
  attribute syn_preserve : boolean;

  attribute syn_preserve of rise_data : signal is true;
  attribute syn_preserve of fall_data : signal is true;

begin

  process(clk90)
  begin
    if rising_edge(clk90) then
      rst90_r <= rst90;
    end if;
  end process;

   rise_data_xnor <= rise_data(7) xnor rise_data(5);
   rise_data1 <= (rise_data(6 downto 0) & rise_data_xnor); 

  process(clk90)
  begin
    if rising_edge(clk90) then
      if (rst90_r = '1') then
        rise_data   <= PATTERN;
        fall_data   <= not PATTERN;
      else
        if data_rst = '1' then
          rise_data   <= PATTERN;
          fall_data   <= not PATTERN;
        elsif data_ena = '1' then
          rise_data <= rise_data1;
          fall_data <= not rise_data1;
        else
          rise_data <= rise_data;
          fall_data <= fall_data;
        end if;
      end if;
    end if;
  end process;

  data_out <=     rise_data  &     fall_data ;

  mask_data <= (others => '0');

end arc;
