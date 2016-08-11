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
-- \   \   \/    Version	    : 3.6.1
--  \   \        Application        : MIG
--  /   /        Filename           : sim_tb_top.vhd
-- /___/   /\    Date Last Modified : $Date: 2010/11/26 18:25:41 $
-- \   \  /  \   Date Created       : Mon May 14 2007
--  \___\/\___\
--
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This is the simulation testbench which is used to verify the
--               design. The basic clocks and resets to the interface are
--               generated here. This also connects the memory interface to the
--               memory model.
--*****************************************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ddrneu_parameters_0.all;

library unisim;
use unisim.vcomponents.all;

entity sim_tb_top is

end entity sim_tb_top;

architecture arch of sim_tb_top is

  constant DEVICE_WIDTH    : integer := 16;          -- Memory device data width
  constant REG_ENABLE      : integer := REGISTERED; -- registered addr/ctrl

  constant TEMP1              : real := 7519.0 / 1000.0;
  constant TCYC_SYS           : real := TEMP1/2.0;
  constant TCYC_SYS_0         : time := TEMP1 * 1 ns;
  constant TCYC_SYS_DIV2      : time := TCYC_SYS * 1 ns;
  constant TEMP2              : real := 5.0/2.0;
  constant TPROP_DQS          : time := 0.00 ns;       -- Delay for DQS signal during Write Operation
  constant TPROP_DQS_RD       : time := 0.00 ns;       -- Delay for DQS signal during Read Operation
  constant TPROP_PCB_CTRL     : time := 0.00 ns;       -- Delay for Address and Ctrl signals
  constant TPROP_PCB_DATA     : time := 0.00 ns;       -- Delay for data signal during Write operation
  constant TPROP_PCB_DATA_RD  : time := 0.00 ns;       -- Delay for data signal during Read operation

  component ddrneu
    port (
      reset_in_n                   : in    std_logic;
      sys_clk                      : in    std_logic;
      sys_clkb                     : in    std_logic;
      cntrl0_ddr2_a                : out   std_logic_vector((ROW_ADDRESS-1) downto 0);
      cntrl0_ddr2_ba               : out   std_logic_vector((BANK_ADDRESS-1) downto 0);
      cntrl0_ddr2_ras_n            : out   std_logic;
      cntrl0_ddr2_cas_n            : out   std_logic;
      cntrl0_ddr2_we_n             : out   std_logic;
      cntrl0_ddr2_cs_n             : out   std_logic;
      cntrl0_ddr2_odt              : out   std_logic;
      cntrl0_ddr2_cke              : out   std_logic;
      cntrl0_ddr2_ck               : out   std_logic_vector((CLK_WIDTH-1) downto 0);
      cntrl0_ddr2_ck_n             : out   std_logic_vector((CLK_WIDTH-1) downto 0);
      cntrl0_ddr2_dq               : inout std_logic_vector((DATA_WIDTH-1) downto 0);
      cntrl0_ddr2_dqs              : inout std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      cntrl0_ddr2_dqs_n            : inout std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
            cntrl0_ddr2_dm               : out   std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      
      cntrl0_led_error_output1     : out   std_logic;
	  cntrl0_data_valid_out        : out   std_logic;
	  cntrl0_init_done             : out   std_logic;
      
      cntrl0_rst_dqs_div_in        : in    std_logic;
      cntrl0_rst_dqs_div_out       : out   std_logic
      );
  end component;

  component ddr2_model
    port (
      ck      : in    std_logic;
      ck_n    : in    std_logic;
      cke     : in    std_logic;
      cs_n    : in    std_logic;
      ras_n   : in    std_logic;
      cas_n   : in    std_logic;
      we_n    : in    std_logic;
      dm_rdqs : inout std_logic_vector((DEVICE_WIDTH/16) downto 0);
      ba      : in    std_logic_vector((BANK_ADDRESS - 1) downto 0);
      addr    : in    std_logic_vector((ROW_ADDRESS - 1) downto 0);
      dq      : inout std_logic_vector((DEVICE_WIDTH - 1) downto 0);
      dqs     : inout std_logic_vector((DEVICE_WIDTH/16) downto 0);
      dqs_n   : inout std_logic_vector((DEVICE_WIDTH/16) downto 0);
      rdqs_n  : out   std_logic_vector((DEVICE_WIDTH/16) downto 0);
      odt     : in    std_logic
      );
  end component;

  component WireDelay
    generic (
      Delay_g : time;
      Delay_rd : time);
    port (
      A : inout Std_Logic;
      B : inout Std_Logic;
     reset : in Std_Logic);
  end component;


  signal sys_clk               : std_logic := '0';
  signal sys_clk_n             : std_logic;
  signal sys_clk_p             : std_logic;
  signal sys_rst_n             : std_logic := '0';
  signal sys_rst_out           : std_logic;
  signal ddr2_dq_sdram         : std_logic_vector((DATA_WIDTH - 1) downto 0);
  signal ddr2_dqs_sdram        : std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
  signal ddr2_dqs_n_sdram      : std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);-- this
  signal ddr2_dm_sdram         : std_logic_vector((DATA_MASK_WIDTH - 1) downto 0);
  signal ddr2_clk_sdram        : std_logic_vector((CLK_WIDTH - 1) downto 0);
  signal ddr2_clk_n_sdram      : std_logic_vector((CLK_WIDTH - 1) downto 0);
  signal ddr2_address_sdram    : std_logic_vector((ROW_ADDRESS - 1) downto 0);
  signal ddr2_ba_sdram         : std_logic_vector((BANK_ADDRESS - 1) downto 0);
  signal ddr2_ras_n_sdram      : std_logic;
  signal ddr2_cas_n_sdram      : std_logic;
  signal ddr2_we_n_sdram       : std_logic;
  signal ddr2_cs_n_sdram       : std_logic;
  signal ddr2_cke_sdram        : std_logic;
  signal ddr2_odt_sdram        : std_logic;
  signal error                 : std_logic;
  signal init_done             : std_logic;

  -- Only RDIMM memory parts support the reset signal,
  -- hence the ddr2_reset_n_sdram and ddr2_reset_n_fpga signals can be
  -- ignored for other memory parts
  signal ddr2_reset_n_sdram    : std_logic;
  signal ddr2_reset_n_fpga     : std_logic;

  signal ddr2_address_reg      : std_logic_vector((ROW_ADDRESS - 1) downto 0);
  signal ddr2_ba_reg           : std_logic_vector((BANK_ADDRESS - 1) downto 0);
  signal ddr2_cke_reg          : std_logic;
  signal ddr2_ras_n_reg        : std_logic;
  signal ddr2_cas_n_reg        : std_logic;
  signal ddr2_we_n_reg         : std_logic;
  signal ddr2_cs_n_reg         : std_logic;
  signal ddr2_odt_reg          : std_logic;

--below signals will be driven only in case of component or unbuffered
--and data_width not multiple of 16 and selected component width is x16
  signal dq_vector             : std_logic_vector(15 downto 0);
  signal dqs_vector            : std_logic_vector(1 downto 0);
  signal dqs_n_vector          : std_logic_vector(1 downto 0);
  signal dm_vector             : std_logic_vector(1 downto 0);
  signal command               : std_logic_vector(2 downto 0);
  signal enable                : std_logic;
  signal enable_o              : std_logic;

  signal command1              : std_logic_vector(2 downto 0);
  signal enable1               : std_logic;
  signal enable2               : std_logic;
  signal ddr2_dq_fpga          : std_logic_vector((DATA_WIDTH - 1) downto 0);
  signal ddr2_dqs_fpga         : std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
  signal ddr2_dqs_n_fpga       : std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
  signal ddr2_dm_fpga          : std_logic_vector((DATA_MASK_WIDTH - 1) downto 0);
  signal ddr2_clk_fpga         : std_logic_vector((CLK_WIDTH - 1) downto 0);
  signal ddr2_clk_n_fpga       : std_logic_vector((CLK_WIDTH - 1) downto 0);
  signal ddr2_address_fpga     : std_logic_vector((ROW_ADDRESS - 1) downto 0);
  signal ddr2_ba_fpga          : std_logic_vector((BANK_ADDRESS - 1) downto 0);
  signal ddr2_ras_n_fpga       : std_logic;
  signal ddr2_cas_n_fpga       : std_logic;
  signal ddr2_we_n_fpga        : std_logic;
  signal ddr2_cs_n_fpga        : std_logic;
  signal ddr2_cke_fpga         : std_logic;
  signal ddr2_odt_fpga         : std_logic;
  signal data_valid_out        : std_logic;
  signal ddr2_dm_8_16          : std_logic_vector(1 downto 0);-- this signal will be driven only for x16 components
  signal rst_dqs_div_loop      : std_logic;

begin


-----------------------------------------------------------------------------
-- Clock generation and reset
-----------------------------------------------------------------------------

  process
  begin
    sys_clk <= not sys_clk;
    wait for (TCYC_SYS_DIV2);
  end process;

  sys_clk_p <= sys_clk;
  sys_clk_n <= not sys_clk;

  process
  begin
    sys_rst_n <= '0';
    wait for 200 ns;
    sys_rst_n <= '1';
    wait;
  end process;

    sys_rst_out <= (sys_rst_n) when (RESET_ACTIVE_LOW = '1') else (not sys_rst_n);

  

  

-----------------------------------------------------------------------------
-- FPGA memory controller
-----------------------------------------------------------------------------

  u_mem_controller : ddrneu
    port map (
      sys_clk                      => sys_clk_p,
      sys_clkb                     => sys_clk_n,
      reset_in_n                   => sys_rst_out,
      cntrl0_ddr2_ras_n            => ddr2_ras_n_fpga,
      cntrl0_ddr2_cas_n            => ddr2_cas_n_fpga,
      cntrl0_ddr2_we_n             => ddr2_we_n_fpga,
      cntrl0_ddr2_cs_n             => ddr2_cs_n_fpga,
      cntrl0_ddr2_cke              => ddr2_cke_fpga,
      cntrl0_ddr2_odt              => ddr2_odt_fpga,
      cntrl0_ddr2_dm               => ddr2_dm_fpga,
      cntrl0_ddr2_dq               => ddr2_dq_fpga,
      cntrl0_ddr2_dqs              => ddr2_dqs_fpga,
      cntrl0_ddr2_dqs_n            => ddr2_dqs_n_fpga,
      cntrl0_ddr2_ck               => ddr2_clk_fpga,
      cntrl0_ddr2_ck_n             => ddr2_clk_n_fpga,
      cntrl0_ddr2_ba               => ddr2_ba_fpga,
      cntrl0_ddr2_a                => ddr2_address_fpga,
    cntrl0_led_error_output1       => error,
    cntrl0_data_valid_out          => data_valid_out,
    cntrl0_init_done               => init_done,
      cntrl0_rst_dqs_div_in        => rst_dqs_div_loop,
      cntrl0_rst_dqs_div_out       => rst_dqs_div_loop
      );

-----------------------------------------------------------------------------
-- Delay insertion modules for each signal
-- Use standard non-inertial (transport) delay mechanism for unidirectional
-- signals from FPGA to SDRAM
-----------------------------------------------------------------------------
  ddr2_address_sdram  <= TRANSPORT ddr2_address_fpga after TPROP_PCB_CTRL;
  ddr2_ba_sdram       <= TRANSPORT ddr2_ba_fpga      after TPROP_PCB_CTRL;
  ddr2_ras_n_sdram    <= TRANSPORT ddr2_ras_n_fpga   after TPROP_PCB_CTRL;
  ddr2_cas_n_sdram    <= TRANSPORT ddr2_cas_n_fpga   after TPROP_PCB_CTRL;
  ddr2_we_n_sdram     <= TRANSPORT ddr2_we_n_fpga    after TPROP_PCB_CTRL;
  ddr2_cs_n_sdram     <= TRANSPORT ddr2_cs_n_fpga    after TPROP_PCB_CTRL;
  ddr2_cke_sdram      <= TRANSPORT ddr2_cke_fpga     after TPROP_PCB_CTRL;
  ddr2_odt_sdram      <= TRANSPORT ddr2_odt_fpga     after TPROP_PCB_CTRL;
  ddr2_clk_sdram      <= TRANSPORT ddr2_clk_fpga     after TPROP_PCB_CTRL;
  ddr2_clk_n_sdram    <= TRANSPORT ddr2_clk_n_fpga   after TPROP_PCB_CTRL;
  ddr2_reset_n_sdram  <= TRANSPORT ddr2_reset_n_fpga after TPROP_PCB_CTRL;
  ddr2_dm_sdram       <= TRANSPORT ddr2_dm_fpga      after TPROP_PCB_DATA;

  dq_delay: for i in 0 to DATA_WIDTH - 1 generate
    u_delay_dq: WireDelay
      generic map (
        Delay_g => TPROP_PCB_DATA,
        Delay_rd => TPROP_PCB_DATA_RD)
      port map(
        A => ddr2_dq_fpga(i),
        B => ddr2_dq_sdram(i),
	reset => sys_rst_n);
  end generate;

  dqs_delay: for i in 0 to DATA_STROBE_WIDTH - 1 generate
    u_delay_dqs: WireDelay
      generic map (
        Delay_g => TPROP_DQS,
        Delay_rd => TPROP_DQS_RD)
      port map(
        A => ddr2_dqs_fpga(i),
        B => ddr2_dqs_sdram(i),
	reset => sys_rst_n);
  end generate;

  dqs_n_delay: for i in 0 to DATA_STROBE_WIDTH - 1 generate
    u_delay_dqs: WireDelay
      generic map (
        Delay_g => TPROP_DQS,
        Delay_rd => TPROP_DQS_RD)
      port map(
        A => ddr2_dqs_n_fpga(i),
        B => ddr2_dqs_n_sdram(i),
	reset => sys_rst_n);
  end generate;


  -----------------------------------------------------------------------------
  -- Extra one clock pipelining for RDIMM address and
  -- control signals is implemented here (Implemented external to memory model)
  -----------------------------------------------------------------------------

  process (ddr2_clk_sdram)
  begin
    if (rising_edge(ddr2_clk_sdram(0))) then
      if ( ddr2_reset_n_sdram = '0' ) then
        ddr2_ras_n_reg <= '1';
        ddr2_cas_n_reg <= '1';
        ddr2_we_n_reg  <= '1';
        ddr2_cs_n_reg  <= '1';
        ddr2_odt_reg   <= '0';
      else
        ddr2_address_reg <= TRANSPORT ddr2_address_sdram after TCYC_SYS_DIV2;
        ddr2_ba_reg      <= TRANSPORT ddr2_ba_sdram      after TCYC_SYS_DIV2;
        ddr2_ras_n_reg   <= TRANSPORT ddr2_ras_n_sdram   after TCYC_SYS_DIV2;
        ddr2_cas_n_reg   <= TRANSPORT ddr2_cas_n_sdram   after TCYC_SYS_DIV2;
        ddr2_we_n_reg    <= TRANSPORT ddr2_we_n_sdram    after TCYC_SYS_DIV2;
        ddr2_cs_n_reg    <= TRANSPORT ddr2_cs_n_sdram    after TCYC_SYS_DIV2;
        ddr2_odt_reg     <= TRANSPORT ddr2_odt_sdram     after TCYC_SYS_DIV2;
      end if;
    end if;
  end process;

-----------------------------------------------------------------------------
-- To avoid tIS violations on CKE when reset is deasserted
-----------------------------------------------------------------------------

  process (ddr2_clk_n_sdram)
  begin
    if (rising_edge(ddr2_clk_n_sdram(0))) then
      if ( ddr2_reset_n_sdram = '0' ) then
        ddr2_cke_reg <= '0';
      else
        ddr2_cke_reg <= TRANSPORT ddr2_cke_sdram after TCYC_SYS_0;
      end if;
    end if;
  end process;

-----------------------------------------------------------------------------
-- Memory model instances
-----------------------------------------------------------------------------
  comp_16 : if (DEVICE_WIDTH = 16) generate
-----------------------------------------------------------------------------
-- if memory part is x16
-----------------------------------------------------------------------------
    registered_dimm : if (REG_ENABLE = 1) generate
-----------------------------------------------------------------------------
-- if the memory part is Registered DIMM
-----------------------------------------------------------------------------
      gen_bytes : for i in 0 to (DATA_STROBE_WIDTH/2 - 1) generate
        
        u_mem0 : ddr2_model
          port map (
            ck      => ddr2_clk_sdram(CLK_WIDTH*i/DATA_STROBE_WIDTH),
            ck_n    => ddr2_clk_n_sdram(CLK_WIDTH*i/DATA_STROBE_WIDTH),
            cke     => ddr2_cke_reg,
            cs_n    => ddr2_cs_n_reg,
            ras_n   => ddr2_ras_n_reg,
            cas_n   => ddr2_cas_n_reg,
            we_n    => ddr2_we_n_reg,
            dm_rdqs => ddr2_dm_sdram((2*(i+1))-1 downto i*2),
            ba      => ddr2_ba_reg,
            addr    => ddr2_address_reg,
            dq      => ddr2_dq_sdram((16*(i+1))-1 downto i*16),
            dqs     => ddr2_dqs_sdram((2*(i+1))-1 downto i*2),
            dqs_n   => ddr2_dqs_n_sdram((2*(i+1))-1 downto i*2),
            rdqs_n  => open,
            odt     => ddr2_odt_reg
            );
      end generate gen_bytes;
    end generate registered_dimm;
-----------------------------------------------------------------------------
-- if the memory part is component or unbuffered DIMM
-----------------------------------------------------------------------------
  comp16_mul8 : if (((DATA_WIDTH mod 16) /= 0) and (REG_ENABLE = 0)) generate
-----------------------------------------------------------------------------
-- for the memory part x16, if the data width is not multiple
-- of 16, memory models are instantiated for all data with x16
-- memory model and except for MSB data. For the MSB data
-- of 8 bits, all memory data, strobe and mask data signals are
-- replicated to make it as x16 part. For example if the design
-- is generated for data width of 72, memory model x16 parts
-- instantiated for 4 times with data ranging from 0 to 63.
-- For MSB data ranging from 64 to 71, one x16 memory model
-- by replicating the 8-bit data twice and similarly
-- the case with data mask and strobe.
-----------------------------------------------------------------------------
    gen_bytes : for i in 0 to (DATA_WIDTH/16 - 1) generate
      
      u_mem0 : ddr2_model
        port map (
                      ck      => ddr2_clk_sdram(i),
            ck_n    => ddr2_clk_n_sdram(i),
          cke     => ddr2_cke_sdram,
          cs_n    => ddr2_cs_n_sdram,
          ras_n   => ddr2_ras_n_sdram,
          cas_n   => ddr2_cas_n_sdram,
          we_n    => ddr2_we_n_sdram,
          dm_rdqs => ddr2_dm_sdram((2*(i+1))-1 downto i*2),
          ba      => ddr2_ba_sdram,
          addr    => ddr2_address_sdram,
          dq      => ddr2_dq_sdram((16*(i+1))-1 downto i*16),
          dqs     => ddr2_dqs_sdram((2*(i+1))-1 downto i*2),
          dqs_n   => ddr2_dqs_n_sdram((2*(i+1))-1 downto i*2),
          rdqs_n  => open,
          odt     => ddr2_odt_sdram
          );
    end generate gen_bytes;
-----------------------------------------------------------------------------
--Logic to assign the remaining bits of DQ and DQS
-----------------------------------------------------------------------------
    command <= (ddr2_ras_n_fpga & ddr2_cas_n_fpga & ddr2_we_n_fpga);

    process(ddr2_clk_fpga)
    begin
      if (rising_edge(ddr2_clk_fpga(0))) then
        if (sys_rst_n = '0') then
          enable   <= '0';
          enable_o <= '0';
        elsif (command = "100") then
          enable_o <= '0';
        elsif (command = "101") then
          enable_o <= '1';
        else
          enable_o <= enable_o;
        end if;
        enable     <= enable_o;
      end if;
    end process;

-----------------------------------------------------------------------------
--read
-----------------------------------------------------------------------------

    ddr2_dq_sdram(DATA_WIDTH - 1 downto DATA_WIDTH - 8) <= dq_vector(7 downto 0)
                                                           when enable = '1'
							   else "ZZZZZZZZ";
    ddr2_dqs_sdram(DATA_STROBE_WIDTH - 1)               <= dqs_vector(0)
                                                           when enable = '1'
							   else 'Z';
    ddr2_dqs_n_sdram(DATA_STROBE_WIDTH - 1)             <= dqs_n_vector(0)
                                                           when enable = '1'
							   else 'Z';
    ddr2_dm_sdram(DATA_MASK_WIDTH - 1)                  <= dm_vector(0)
                                                           when enable = '1'
							   else 'Z';
-----------------------------------------------------------------------------
--write
-----------------------------------------------------------------------------

    dq_vector(7 downto 0)  <= ddr2_dq_sdram(DATA_WIDTH - 1 downto DATA_WIDTH - 8)
                              when (enable_o = '0' and enable = '0')
                              else "ZZZZZZZZ";
    dqs_vector(0)          <= ddr2_dqs_sdram(DATA_STROBE_WIDTH - 1)
                              when (enable_o = '0' and enable = '0') else 'Z';
    dqs_n_vector(0)        <= ddr2_dqs_n_sdram(DATA_STROBE_WIDTH - 1)
                              when (enable_o = '0' and enable = '0') else 'Z';
    dm_vector(0)           <= ddr2_dm_sdram(DATA_MASK_WIDTH - 1)
                              when enable_o = '0'                    else 'Z';

    dq_vector(15 downto 8) <= dq_vector(7 downto 0);
    dqs_vector(1)          <= dqs_vector(0);
    dqs_n_vector(1)        <= dqs_n_vector(0);
    ddr2_dm_8_16 <= ddr2_dm_sdram(DATA_MASK_WIDTH - 1) & ddr2_dm_sdram(DATA_MASK_WIDTH - 1);
    

    u_mem1     : ddr2_model
      port map (
        ck      => ddr2_clk_sdram(CLK_WIDTH-1),
        ck_n    => ddr2_clk_n_sdram(CLK_WIDTH-1),
        cke     => ddr2_cke_sdram,
        cs_n    => ddr2_cs_n_sdram,
        ras_n   => ddr2_ras_n_sdram,
        cas_n   => ddr2_cas_n_sdram,
        we_n    => ddr2_we_n_sdram,
        dm_rdqs => ddr2_dm_8_16,
        ba      => ddr2_ba_sdram,
        addr    => ddr2_address_sdram,
        dq      => dq_vector,
        dqs     => dqs_vector,
        dqs_n   => dqs_n_vector,
        rdqs_n  => open,
        odt     => ddr2_odt_sdram
        );
    end generate comp16_mul8;

    comp16_mul16 : if (((DATA_WIDTH mod 16) = 0) and (REG_ENABLE = 0)) generate
-----------------------------------------------------------------------------
-- if the data width is multiple of 16
-----------------------------------------------------------------------------
      gen_bytes : for i in 0 to ((DATA_STROBE_WIDTH/2) - 1) generate
        
        u_mem0 : ddr2_model
          port map (
                        ck      => ddr2_clk_sdram(i),
            ck_n    => ddr2_clk_n_sdram(i),
            cke     => ddr2_cke_sdram,
            cs_n    => ddr2_cs_n_sdram,
            ras_n   => ddr2_ras_n_sdram,
            cas_n   => ddr2_cas_n_sdram,
            we_n    => ddr2_we_n_sdram,
            dm_rdqs => ddr2_dm_sdram((2*(i+1))-1 downto i*2),
            ba      => ddr2_ba_sdram,
            addr    => ddr2_address_sdram,
            dq      => ddr2_dq_sdram((16*(i+1))-1 downto i*16),
            dqs     => ddr2_dqs_sdram((2*(i+1))-1 downto i*2),
            dqs_n   => ddr2_dqs_n_sdram((2*(i+1))-1 downto i*2),
            rdqs_n  => open,
            odt     => ddr2_odt_sdram
            );
      end generate gen_bytes;
    end generate comp16_mul16;
  end generate comp_16;

  comp_8 : if (DEVICE_WIDTH = 8) generate
-----------------------------------------------------------------------------
-- if the memory part is x8
-----------------------------------------------------------------------------
    registered_dimm : if (REG_ENABLE = 1) generate
-----------------------------------------------------------------------------
-- if the memory part is Registered DIMM
-----------------------------------------------------------------------------
      gen_bytes : for i in 0 to (DATA_STROBE_WIDTH - 1) generate
        
        u_mem0 : ddr2_model
          port map (
            ck      => ddr2_clk_sdram(CLK_WIDTH*i/DATA_STROBE_WIDTH),
            ck_n    => ddr2_clk_n_sdram(CLK_WIDTH*i/DATA_STROBE_WIDTH),
            cke     => ddr2_cke_reg,
            cs_n    => ddr2_cs_n_reg,
            ras_n   => ddr2_ras_n_reg,
            cas_n   => ddr2_cas_n_reg,
            we_n    => ddr2_we_n_reg,
            dm_rdqs => ddr2_dm_sdram(i downto i),
            ba      => ddr2_ba_reg,
            addr    => ddr2_address_reg,
            dq      => ddr2_dq_sdram((8*(i+1))-1 downto i*8),
            dqs     => ddr2_dqs_sdram(i downto i),
            dqs_n   => ddr2_dqs_n_sdram(i downto i),
            rdqs_n  => open,
            odt     => ddr2_odt_reg
            );
      end generate gen_bytes;
    end generate registered_dimm;
    comp8_mul8  : if (REG_ENABLE = 0) generate
-----------------------------------------------------------------------------
-- if the memory part is component or unbuffered DIMM
-----------------------------------------------------------------------------
      gen_bytes: for i in 0 to DATA_STROBE_WIDTH - 1 generate
        
        u_mem0 : ddr2_model
          port map (
                        ck      => ddr2_clk_sdram(i),
            ck_n    => ddr2_clk_n_sdram(i),
            cke     => ddr2_cke_sdram,
            cs_n    => ddr2_cs_n_sdram,
            ras_n   => ddr2_ras_n_sdram,
            cas_n   => ddr2_cas_n_sdram,
            we_n    => ddr2_we_n_sdram,
            dm_rdqs => ddr2_dm_sdram(i downto i),
            ba      => ddr2_ba_sdram,
            addr    => ddr2_address_sdram,
            dq      => ddr2_dq_sdram((8*(i+1))-1 downto i*8),
            dqs     => ddr2_dqs_sdram(i downto i),
            dqs_n   => ddr2_dqs_n_sdram(i downto i),
            rdqs_n  => open,
            odt     => ddr2_odt_sdram
            );
      end generate gen_bytes;
    end generate comp8_mul8;
  end generate comp_8;

  comp_4 : if (DEVICE_WIDTH = 4) generate
-----------------------------------------------------------------------------
-- if the memory part is x4
-----------------------------------------------------------------------------
    registered_dimm : if (REG_ENABLE = 1) generate
-----------------------------------------------------------------------------
-- if the memory part is Registered DIMM
-----------------------------------------------------------------------------
      gen_bytes : for i in 0 to (DATA_STROBE_WIDTH - 1) generate
        
        u_mem0 : ddr2_model
          port map (
            ck      => ddr2_clk_sdram(CLK_WIDTH*i/DATA_STROBE_WIDTH),
            ck_n    => ddr2_clk_n_sdram(CLK_WIDTH*i/DATA_STROBE_WIDTH),
            cke     => ddr2_cke_reg,
            cs_n    => ddr2_cs_n_reg,
            ras_n   => ddr2_ras_n_reg,
            cas_n   => ddr2_cas_n_reg,
            we_n    => ddr2_we_n_reg,
            dm_rdqs => ddr2_dm_sdram(i/2 downto i/2),
            ba      => ddr2_ba_reg,
            addr    => ddr2_address_reg,
            dq      => ddr2_dq_sdram((4*(i+1))-1 downto i*4),
            dqs     => ddr2_dqs_sdram(i downto i),
            dqs_n   => ddr2_dqs_n_sdram(i downto i),
            rdqs_n  => open,
            odt     => ddr2_odt_reg
            );
      end generate gen_bytes;
    end generate registered_dimm;
    comp4_mul4 : if (REG_ENABLE = 0) generate
-----------------------------------------------------------------------------
-- if the memory part is component or unbuffered DIMM
-----------------------------------------------------------------------------
      gen_bytes: for i in 0 to DATA_STROBE_WIDTH - 1 generate
        
        u_mem0 : ddr2_model
          port map (
                        ck      => ddr2_clk_sdram(i),
            ck_n    => ddr2_clk_n_sdram(i),
            cke     => ddr2_cke_sdram,
            cs_n    => ddr2_cs_n_sdram,
            ras_n   => ddr2_ras_n_sdram,
            cas_n   => ddr2_cas_n_sdram,
            we_n    => ddr2_we_n_sdram,
            dm_rdqs => ddr2_dm_sdram(i/2 downto i/2),
            ba      => ddr2_ba_sdram,
            addr    => ddr2_address_sdram,
            dq      => ddr2_dq_sdram((4*(i+1))-1 downto i*4),
            dqs     => ddr2_dqs_sdram(i downto i),
            dqs_n   => ddr2_dqs_n_sdram(i downto i),
            rdqs_n  => open,
            odt     => ddr2_odt_sdram
            );
      end generate gen_bytes;
    end generate comp4_mul4;
  end generate comp_4;

-----------------------------------------------------------------------------
-- synthesizable test bench provided for wotb designs
-----------------------------------------------------------------------------



end architecture;
