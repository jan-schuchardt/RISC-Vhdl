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
--  /   /        Filename           : u_ddr_cmd_fsm_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2010/11/26 18:25:42 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose	: This module consists of s/m which will generate user commands 
--                like initialization, write and read.It also generates control 
--                signals addr_inc,addr_rst,data_rst for addr_gen and data_gen 
--                modules.This control signals are used to generate address 
--                during write and read commands and data for write command. 
--*****************************************************************************

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use UNISIM.VCOMPONENTS.all;

entity u_ddr_cmd_fsm_0 is
  port (
    clk          : in  std_logic;
    clk90        : in  std_logic;
    cmd_ack      : in  std_logic;
    cnt_roll     : in  std_logic;
    r_w          : out std_logic;
    refresh_done : in  std_logic;
    rst180       : in  std_logic;
    rst90        : in  std_logic;
    init_val     : in  std_logic;
    addr_inc     : out std_logic;
    addr_rst     : out std_logic;
    u_cmd        : out std_logic_vector(2 downto 0);
    data_rst     : out std_logic
    );

end u_ddr_cmd_fsm_0;

architecture arc of u_ddr_cmd_fsm_0 is

  type s_m is (rst_state, init_start, init, wr, rd, dly);

  signal next_state, next_state1 : s_m;

  signal init_dly     : std_logic_vector(5 downto 0);
  signal init_dly_p   : std_logic_vector(5 downto 0);
  signal u_cmd_p      : std_logic_vector(2 downto 0);
  signal addr_inc_p   : std_logic;
  signal data_rst_p   : std_logic;
  signal data_rst_180 : std_logic;
  signal data_rst_90  : std_logic;
  signal init_done    : std_logic;
  signal next_cmd     : std_logic;
  signal r_w1         : std_logic;
  signal r_w2         : std_logic;
  signal rst_flag     : std_logic;
  signal temp         : std_logic;
  signal rst180_r     : std_logic;
  signal rst90_r      : std_logic;

begin

  data_rst   <= data_rst_90;
  u_cmd_p    <= "110" when (next_state = rd) else "100"
                when (next_state = wr) else "010"
                when (next_state = init_start) else "000";
  addr_inc_p <= '1' when ((cmd_ack = '1') and (next_state = WR or
                                               next_state = RD)) else '0';
  addr_rst   <= rst_flag;

  process(clk)
  begin
    if(clk'event and clk = '0') then
      rst180_r <= rst180;
    end if;
  end process;

  process(clk90)
  begin
    if(clk90'event and clk90 = '1') then
      rst90_r <= rst90;
    end if;
  end process;

  process(clk)
  begin
    if(clk'event and clk = '0') then
      rst_flag <= (not(rst180_r) and not(cmd_ack) and not(temp));
      temp     <= (not(rst180_r) and not(cmd_ack));
    end if;
  end process;

  data_rst_p   <= '1' when (r_w2 = '1') else '0';
  init_dly_p   <= "111111" when (next_state = init_start) else
                  init_dly - "000001" when init_dly /= "000000" else
                  "000000";
  next_cmd     <= '1' when (cmd_ack = '0' and next_state = dly) else '0';
  
  process(clk)
  begin
    if(clk'event and clk = '0') then
      if(rst180_r = '1') then
        r_w1   <= '0';
      else
        if(cmd_ack = '0' and next_state = rd) then
          r_w1 <= '1';
        elsif(cmd_ack = '0' and next_state = wr) then
          r_w1 <= '0';
        else
          r_w1 <= r_w1;
        end if;
      end if;
    end if;
  end process;

  r_w2 <= r_w1;
  r_w  <= r_w1;

  process(clk)
  begin
    if clk'event and clk = '0' then
      if rst180_r = '1' then
        data_rst_180 <= '0';
      else
        data_rst_180 <= data_rst_p;
      end if;
    end if;
  end process;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      if rst90_r = '1' then
        data_rst_90 <= '0';
      else
        data_rst_90 <= data_rst_180;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if clk'event and clk = '0' then
      if rst180_r = '1' then
        u_cmd <= "000";
      else
        u_cmd <= u_cmd_p;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if clk'event and clk = '0' then
      if rst180_r = '1' then
        addr_inc <= '0';
        init_dly <= "000000";
      else
        addr_inc <= addr_inc_p;
        init_dly <= init_dly_p;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if clk'event and clk = '0' then
      if rst180_r = '1' then
        init_done <= '0';
      else
        init_done <= init_val;
      end if;
    end if;
  end process;

-- state machine to generate user commands 
  process(rst180_r, cnt_roll, r_w2, refresh_done, init_done, next_cmd, next_state)
  begin
    if rst180_r = '1' then
      next_state1   <= rst_state;
    else
      case(next_state) is        
        when rst_state =>
          next_state1   <= init_start;      
        when init_start =>
          next_state1   <= init;      
        when init        =>      
          if init_done = '1' then
            next_state1 <= wr;
          else
            next_state1 <= init;
          end if;
        when wr =>
          if cnt_roll = '0' then
            next_state1 <= wr;
          else
            next_state1 <= dly;
          end if;
        when dly =>
          if(next_cmd = '1' and r_w2 = '0') then
            next_state1 <= rd;
          elsif(next_cmd = '1' and r_w2 = '1') then
            next_state1 <= wr;
          else
            next_state1 <= dly;
          end if;
        when rd =>
          if cnt_roll = '0' then
            next_state1 <= rd;
          else
            next_state1 <= dly;
          end if;
      end case;
    end if;
  end process;

  process(clk)
  begin
    if clk'event and clk = '0' then
      if rst180_r = '1' then
        next_state <= rst_state;
      else
        next_state <= next_state1;
      end if;
    end if;
  end process;

end arc;
