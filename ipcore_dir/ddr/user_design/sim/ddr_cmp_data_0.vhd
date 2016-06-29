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
-- Copyright 2005, 2006, 2007 Xilinx, Inc.
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
--  /   /        Filename           : ddr_cmp_data_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2010/11/26 18:25:42 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose	: This module compare the read data with compare data and 
--		  generates the error signal in case of data mismatch. 
--*****************************************************************************

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use UNISIM.VCOMPONENTS.all;
use work.ddr_parameters_0.all;

entity ddr_cmp_data_0 is
  port(
    clk90            : in  std_logic;
    data_valid       : in  std_logic;
    cmp_data        : in  std_logic_vector((2*DATA_WIDTH-1) downto 0);
    read_data        : in  std_logic_vector((2*DATA_WIDTH-1) downto 0);
    rst90            : in  std_logic;
    led_error_output : out std_logic;
    data_valid_out   : out std_logic
    );
end ddr_cmp_data_0;

architecture arc of ddr_cmp_data_0 is

  signal led_state     : std_logic;
  signal error         : std_logic;
  signal byte_err_fall : std_logic_vector((DATA_WIDTH/8)-1 downto 0);
  signal byte_err_rise : std_logic_vector((DATA_WIDTH/8)-1 downto 0);
  signal valid         : std_logic;
  signal val_reg       : std_logic;
  signal read_data_reg : std_logic_vector((2*DATA_WIDTH-1) downto 0);
  signal rst90_r       : std_logic;

begin

  data_valid_out <= valid;
  led_error_output <= '1' when led_state = '1' else '0';
  error            <= ((byte_err_fall(0)) or (byte_err_rise(0))) and val_reg;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      rst90_r      <= rst90;
    end if;
  end process;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      read_data_reg <= read_data;
    end if;
  end process;

  process (clk90)
  begin
    if clk90'event and clk90 = '1' then
      if rst90_r = '1' then
        valid <= '0';
      else
        valid <= data_valid;
      end if;
    end if;
  end process;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      if (rst90_r = '1') then
        val_reg <= '0';
      else
        val_reg <= valid;
      end if;
    end if;
  end process;


  gen_err : for err_i in 0 to (DATA_WIDTH/8)-1 generate
    process(clk90)
    begin
      if clk90'event and clk90 = '1' then
        if (read_data_reg((err_i*8-1)+8 downto err_i*8) /= 
			cmp_data((err_i*8-1)+8 downto err_i*8)) then
          byte_err_fall(err_i) <= '1';
        else
          byte_err_fall(err_i) <= '0';
        end if;
        if (read_data_reg(((err_i*8)+DATA_WIDTH-1)+8 downto ((err_i*8)+DATA_WIDTH)) /= 
			cmp_data(((err_i*8)+DATA_WIDTH-1)+8 downto ((err_i*8)+DATA_WIDTH))) then
          byte_err_rise(err_i) <= '1';
        else
          byte_err_rise(err_i) <= '0';
        end if;
      end if;          
    end process;
  end generate gen_err;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      led_state <= (not rst90_r and ( error or led_state));
    end if;
  end process;

-- DATA ERROR
  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      if (rst90_r = '0') then
        --synthesis translate_off
        assert (led_state = '0') report " DATA ERROR at time " & time'image(now);
        --synthesis translate_on
      end if;
    end if;
  end process;


end arc;
