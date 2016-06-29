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
--  /   /        Filename           : ddr_addr_gen_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2010/11/26 18:25:42 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
--
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose	: This module generates address and burst done signals to the 
--		  controller. Address consists of bank address at the lsb followed
--		  by column and row address. This module generates address depending 
--                on the addr_rst,addr_inc and r_w signals from the cmd_fsm module. 
--*****************************************************************************

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use UNISIM.VCOMPONENTS.all;
use work.ddr_parameters_0.all;

entity ddr_addr_gen_0 is
  port(
    clk        : in  std_logic;
    rst180     : in  std_logic;
    addr_rst   : in  std_logic;
    addr_inc   : in  std_logic;
    r_w        : in  std_logic;
    addr_out   : out std_logic_vector(((ROW_ADDRESS + COLUMN_ADDRESS
                                        + BANK_ADDRESS)- 1) downto 0);
    burst_done : out std_logic;
    cnt_roll   : out std_logic);
end ddr_addr_gen_0;

architecture arc of ddr_addr_gen_0 is

  signal column_counter   : std_logic_vector(7 downto 0);
  signal cnt              : std_logic_vector(1 downto 0);
  signal cnt1             : std_logic_vector(1 downto 0);
  signal burst_cnt        : std_logic_vector(2 downto 0);
  signal ba_count         : std_logic_vector((BANK_ADDRESS-1) downto 0);
  signal row_address1     : std_logic_vector(ROW_ADDRESS-1 downto 0);
  signal burst_done_r1    : std_logic;
  signal burst_done_r2    : std_logic;
  signal burst_done_r3    : std_logic;
  signal burst_done_r4    : std_logic;
  signal burst_done_r5    : std_logic;
  signal low              : std_logic_vector(13 downto 0);
  signal rst180_r         : std_logic;
  signal burst_len        : std_logic_vector(2 downto 0);
  signal col_incr         : std_logic_vector(3 downto 0);
  signal col_val          : std_logic_vector(1 downto 0);
  signal lmr              : std_logic_vector((ROW_ADDRESS - 1) downto 0);

  attribute syn_keep        : boolean;
  attribute syn_keep of low : signal is true;

begin
  lmr        <= LOAD_MODE_REGISTER;
  low        <= "00000000000000";
  burst_len  <= lmr(2 downto 0);
  burst_done <= burst_done_r4 when (burst_len = "011") else
                burst_done_r2;
  cnt_roll   <= burst_done_r3 when (burst_len = "011") else
                burst_done_r1;

  col_incr   <= "1000" when (burst_len = "011") else
                "0100" when (burst_len = "010") else
                "0000";
  col_val    <= "11" when (burst_len = "011") else
                "01" when (burst_len = "010") else
                "00";
  addr_out   <= (row_address1 & (low(COLUMN_ADDRESS -9 downto 0))
                 & column_counter & ba_count);

  process(clk)
  begin
    if clk'event and clk = '0' then
      rst180_r <= rst180;
    end if;
  end process;

--row address counter increments after every five writes and five reads
  process ( clk )
  begin
    if falling_edge(clk) then
      if(rst180_r = '1' or row_address1(5) = '1') then
        row_address1 <= low(ROW_ADDRESS-3 downto 0) & "10";
      elsif( r_w = '1' and burst_done_r4 = '0' and burst_done_r5 = '1') then
        row_address1 <= row_address1 + "10";
      else
        row_address1 <= row_address1;
      end if;
    end if;
  end process;

-- bank address counter increments after every five writes and five reads 
-- commands
  process ( clk )
  begin
    if falling_edge(clk) then
      if(rst180_r = '1') then
        ba_count <= (others => '0');
      elsif( r_w = '1' and burst_done_r4 = '0' and burst_done_r5 = '1') then
        ba_count <= ba_count + '1';
      else
        ba_count <= ba_count;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if clk'event and clk = '0' then
      if (rst180_r = '1' or addr_rst = '1') then
        cnt   <= "00";
      elsif (addr_inc = '1' and cnt1 = "01") then
        if (cnt = col_val ) then
          cnt <= "00";
        else
          cnt <= cnt + '1';
        end if;
      end if;
    end if;
  end process;

-- burst cnt to count number of the writes/reads ccommands
  process(clk)
  begin
    if clk'event and clk = '0' then
      if (rst180_r = '1' or addr_rst = '1') then
        burst_cnt <= "000";
      elsif (addr_inc = '1' and cnt = "00") then
        burst_cnt <= burst_cnt + '1';
      else
        burst_cnt <= burst_cnt;
      end if;
    end if;
  end process;

-- column address counter increments in multilple of 4,8 depending 
-- on the burst length 4 and 8 respectively 
  process(clk)
  begin
    if clk'event and clk = '0' then
      if (rst180_r = '1' or addr_rst = '1') then
        column_counter   <= "00000000";
        cnt1             <= "00";
      elsif(addr_inc = '1') then
        if(cnt1 = "00") then
          cnt1           <= cnt1 + '1';
        elsif(cnt1 = "01" and cnt = "00" and burst_cnt < "101") then
          column_counter <= column_counter + col_incr;
        else
          column_counter <= column_counter;
        end if;
      elsif(burst_done_r4 = '0' and burst_done_r5 = '1') then
        column_counter   <= "00000000";
      end if;
    end if;
  end process;

-- burst done is generated  after five writes/reads
  process(clk)
  begin
    if(clk'event and clk = '0') then
      if (rst180_r = '1' ) then
        burst_done_r1 <= '0';
      elsif(burst_cnt = "101") then
        burst_done_r1 <= '1';
      else
        burst_done_r1 <= '0';
      end if;
    end if;
  end process;

  process(clk)
  begin
    if(clk'event and clk = '0') then
      burst_done_r2 <= burst_done_r1;
      burst_done_r3 <= burst_done_r2;
      burst_done_r4 <= burst_done_r3;
      burst_done_r5 <=  burst_done_r4;
    end if;
  end process;

end arc;
