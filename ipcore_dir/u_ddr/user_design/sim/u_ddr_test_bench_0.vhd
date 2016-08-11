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
--  /   /        Filename           : u_ddr_test_bench_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2010/11/26 18:25:42 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose	: This module generate the commands, address and data associated
--                with a write and a read command. This module consists of 
--                addr_gen, data_gen, cmd_fsm and cmp_data modules. 
--*****************************************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.u_ddr_parameters_0.all;

entity u_ddr_test_bench_0 is
  port(
    fpga_clk         : in  std_logic;
    fpga_rst90       : in  std_logic;
    fpga_rst180      : in  std_logic;
    clk90            : in  std_logic;
    burst_done       : out std_logic;
    init_done        : in  std_logic;
    auto_ref_req     : in  std_logic;
    ar_done          : in  std_logic;
    u_ack            : in  std_logic;
    u_data_val       : in  std_logic;
    u_data_o         : in  std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
    u_addr           : out std_logic_vector(((ROW_ADDRESS + COLUMN_ADDRESS +
                                              BANK_ADDRESS)- 1) downto 0);
    u_cmd            : out std_logic_vector(2 downto 0);
    u_data_m         : out std_logic_vector(((2*DATA_MASK_WIDTH)-1) downto 0);
    u_data_i         : out std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
    led_error_output : out std_logic;
    data_valid_out   : out std_logic
    );
end u_ddr_test_bench_0;

architecture arc of u_ddr_test_bench_0 is

  component u_ddr_addr_gen_0
    port(
      clk          : in  std_logic;
      rst180       : in  std_logic;
      addr_rst     : in  std_logic;
      addr_inc     : in  std_logic;
      r_w          : in  std_logic;
      addr_out     : out std_logic_vector(((ROW_ADDRESS + COLUMN_ADDRESS +
                                            BANK_ADDRESS)- 1) downto 0);
      burst_done   : out std_logic;
      cnt_roll     : out std_logic
      );
  end component;

  component u_ddr_cmd_fsm_0
    port (
      clk          : in  std_logic;
      clk90        : in  std_logic;
      cmd_ack      : in  std_logic;
      cnt_roll     : in  std_logic;
      r_w          : out std_logic;
      refresh_done : in  std_logic;
      rst90        : in  std_logic;
      rst180       : in  std_logic;
      init_val     : in  std_logic;
      addr_inc     : out std_logic;
      addr_rst     : out std_logic;
      u_cmd        : out std_logic_vector(2 downto 0);
      data_rst     : out std_logic
      );
  end component;

  component u_ddr_cmp_data_0
    port(
      clk90            : in  std_logic;
      data_valid       : in  std_logic;
      cmp_data         : in  std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
      read_data        : in  std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
      rst90            : in  std_logic;
      led_error_output : out std_logic;
      data_valid_out   : out std_logic
      );
  end component;

  component u_ddr_data_gen_0
    port (
      clk90         : in  std_logic;
      rst90         : in  std_logic;
      data_rst      : in  std_logic;
      data_ena      : in  std_logic;
      mask_data     : out std_logic_vector(((2*DATA_MASK_WIDTH)-1) downto 0);
      data_out      : out std_logic_vector(((2*DATA_WIDTH)-1) downto 0)
      );
  end component;

  signal clk            : std_logic;
  signal rst90_r        : std_logic;
  signal addr_inc       : std_logic;
  signal addr_rst       : std_logic;
  signal cmd_ack        : std_logic;
  signal cnt_roll       : std_logic;
  signal data_valid     : std_logic;
  signal data_ena_r     : std_logic;
  signal data_ena_w     : std_logic;
  signal data_rst_r     : std_logic;
  signal data_rst_r1    : std_logic;
  signal data_rst_w     : std_logic;
  signal r_w            : std_logic;
  signal cmp_data_r    : std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
  signal cmp_data_m_r  : std_logic_vector(((2*DATA_MASK_WIDTH)-1) downto 0);
  signal app_data_w0   : std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
  signal app_data_w1   : std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
  signal app_data_w2   : std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
  signal app_data_w3   : std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
  signal app_data_w4   : std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
  signal app_data_m_w0 : std_logic_vector(((2*DATA_MASK_WIDTH)-1) downto 0);
  signal app_data_m_w1 : std_logic_vector(((2*DATA_MASK_WIDTH)-1) downto 0);
  signal app_data_m_w2 : std_logic_vector(((2*DATA_MASK_WIDTH)-1) downto 0);
  signal app_data_m_w3 : std_logic_vector(((2*DATA_MASK_WIDTH)-1) downto 0);
  signal app_data_m_w4 : std_logic_vector(((2*DATA_MASK_WIDTH)-1) downto 0);
  signal addr_out       : std_logic_vector(((ROW_ADDRESS + COLUMN_ADDRESS + BANK_ADDRESS)- 1) downto 0);
  signal u_dat_flag     : std_logic;
  signal u_dat_fl       : std_logic;

begin

-- Current test bench generates consecutive five write bursts followed by five 
-- read burst commands. For every consecutive of five write/read commands, 
-- controller issues active command followed by five write/read commands 
-- and then a precharge command to the memory. For all five burst commands
-- it takes maximum of 20 clock cycles. So within 20 clocks,test bench will 
-- issue burst_done signal to stop write of read commands to the controller.
-- After every precharge command controller s/m will go to idle state and looks 
-- for auto_ref_req. When auto_ref_req is asserted controller will issue an auto 
-- refresh command to the memory if it is in idle state. Worst case the controller 
-- will take 20 clocks from burst_done to auto refresh command to the memory. 
-- So total number of clocks from auto_ref_req to auto refresh command to memmory 
-- is 40.The test bench is not required to use the auto_ref_req and ar_done signals 
-- inorder to terminate the read or write transactions since it takes maximum of 20 
-- clock cycles for any transaction.

-- Example:
-- At 125Mhz the auto_ref_req will be generated for every 7.492us and for 166Mhz it 
-- will be generated for every 7.572us which will take care of 40 clocks as shown 
-- in the below expression
--
-- Average periodic refresh = 7.8125us
-- MAX_REF_CNT = (7812.5ns - 40*clk_period)/clk_period
-- At 125Mhz(8ns) MAX_REF_CNT = (7812.5ns - 40*8)/8 = 7492.5/8 = 937
-- At 166Mhz(6ns) MAX_REF_CNT = (7812.5ns - 40*6)/6 = 7572.5/6  = 1262

-- User need to use the auto_ref_req and ar_done input signals in their 
-- application in order to terminate the ongoing transaction by asserting 
-- a burst_done signal, when the nunber of clocks is more then 20 between 
-- auto_ref_req and burst_done signal. The ar_done signal is asserted for 
-- one clock period by the controller on completion of auto refresh 
-- command(i.e after tRFC time). User can issue normal read/write commands 
-- to the controller any time after ar_done is asserted.


--  Test_bench uses two clock phases clk180 and clk90. User write 
--  data is generated with clk90 phase, for memory write command 
--  data and strobe are center aligned. Write data to the memory 
--  is clk90 phase w.r.t strobe. So user write data is generated 
--  with clk90 phase.Address and commands are generated w.r.t 
--  clk180. To meet the setup/hold time for memory, memory clk is 
--  clk0 and all the commands and address are generated with 
--  clk180 phase.


-- Output : COMMAND REGISTER FORMAT
--          000  - NOP
--          010  - Initialize memory
--          100  - Write Request
--          110  - Read request

-- Output : Address format
-- row address  = address(ROW_ADDRESS + COLUMN_ADDRESS + BANK_ADDRESS -1 downto  COLUMN_ADDRESS)  
--                (COLUMN_ADDRESS + BANK_ADDRESS))
-- column address = address(COLUMN_ADDRESS + BANK_ADDRESS-1 downto BANK_ADDRESS)

  clk        <= fpga_clk;
  cmd_ack    <= u_ack;
  data_valid <= u_data_val;
  u_addr     <= addr_out;

  u_data_i   <= app_data_w0;
  u_data_m   <= app_data_m_w0;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      rst90_r <= fpga_rst90;
    end if;
  end process;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      if rst90_r = '1' then
        app_data_w1   <= (others => '0');
        app_data_w2   <= (others => '0');
        app_data_w3   <= (others => '0');
        app_data_w4   <= (others => '0');
        app_data_m_w1 <= (others => '0');
        app_data_m_w2 <= (others => '0');
        app_data_m_w3 <= (others => '0');
        app_data_m_w4 <= (others => '0');
      else
        app_data_w1   <= app_data_w0;
        app_data_w2   <= app_data_w1;
        app_data_w3   <= app_data_w2;
        app_data_w4   <= app_data_w3;
        app_data_m_w1 <= app_data_m_w0;
        app_data_m_w2 <= app_data_m_w1;
        app_data_m_w3 <= app_data_m_w2;
        app_data_m_w4 <= app_data_m_w3;
      end if;
    end if;
  end process;

--*********************************************************
  
  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      if rst90_r = '1' then
        data_ena_r <= '0';
      else
        if (u_data_val = '1') then
          data_ena_r <= '1';
        else
          data_ena_r <= '0';
        end if;        
      end if;
    end if;
  end process;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      if rst90_r = '1' then
        data_ena_w <= '0';
      else
        if ((r_w = '0') and (u_ack = '1')) then
          data_ena_w <= '1';
        else
          data_ena_w <= '0';
        end if;
      end if;
    end if;
  end process;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      if(rst90_r = '1') then
        u_dat_flag <= '0';
      else
        u_dat_flag <= cmd_ack;
      end if;
    end if;
  end process;

  u_dat_fl    <= cmd_ack and (not u_dat_flag) and r_w;
  data_rst_r1 <= u_dat_fl;

  process(clk90)
  begin
    if clk90'event and clk90 = '1' then
      if(rst90_r = '1') then
        data_rst_r <= '0';
      else
        data_rst_r <= data_rst_r1;
      end if;
    end if;
  end process;

--*************************************************************************
  INST1 : u_ddr_addr_gen_0
    port map (
      clk        => clk,
      rst180     => fpga_rst180,
      addr_rst   => addr_rst,
      addr_inc   => addr_inc,
      addr_out   => addr_out,
      burst_done => burst_done,
      r_w        => r_w,
      cnt_roll   => cnt_roll
      );

  INST_2 : u_ddr_cmd_fsm_0
    port map (
      clk          => clk,
      clk90        => clk90,
      cmd_ack      => cmd_ack,
      cnt_roll     => cnt_roll,
      r_w          => r_w,
      refresh_done => ar_done,
      rst90        => fpga_rst90,
      rst180       => fpga_rst180,
      init_val     => init_done,
      addr_inc     => addr_inc,
      addr_rst     => addr_rst,
      u_cmd        => u_cmd,
      data_rst     => data_rst_w
      );

  INST3 : u_ddr_cmp_data_0
    port map (
      clk90            => clk90,
      data_valid       => data_valid,
      cmp_data         => cmp_data_r,
      read_data        => u_data_o,
      rst90            => fpga_rst90,
      led_error_output => led_error_output,
      data_valid_out   => data_valid_out
      );

  INST5 : u_ddr_data_gen_0
    port map (
      clk90       => clk90,
      rst90       => fpga_rst90,
      data_rst    => data_rst_r,
      data_ena    => data_ena_r,
      mask_data   => cmp_data_m_r,
      data_out    => cmp_data_r
      );

  INST7 : u_ddr_data_gen_0
    port map (
      clk90       => clk90,
      rst90       => fpga_rst90,
      data_rst    => data_rst_w,
      data_ena    => data_ena_w,
      mask_data   => app_data_m_w0,
      data_out    => app_data_w0
      );

end arc;
