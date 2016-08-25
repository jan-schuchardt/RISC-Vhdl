----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:13 05/11/2016 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is

	port(
	cpu_clk_in, cpu_rst_in : in STD_LOGIC;
	cpu_slow_in: in STD_LOGIC;
	cpu_debug_out : out std_logic_vector(31 downto 0);
	cpu_debug_adr_out: out std_logic_vector(5 downto 0);
	cpu_err_out: out std_logic;
	
				  -- ddr2
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
			--sys_clkb                      : in    std_logic;
			--sys_clk                       : in    std_logic;
			--reset_in_n                    : in    std_logic;
			--cntrl0_burst_done             : in    std_logic;
			--cntrl0_init_done              : out   std_logic;
			--cntrl0_ar_done                : out   std_logic;
			--cntrl0_user_data_valid        : out   std_logic;
			--cntrl0_auto_ref_req           : out   std_logic;
			--cntrl0_user_cmd_ack           : out   std_logic;
			--cntrl0_user_command_register  : in    std_logic_vector(2 downto 0);
--			cntrl0_clk_tb                 : out   std_logic;
--			cntrl0_clk90_tb               : out   std_logic;
--			cntrl0_sys_rst_tb             : out   std_logic;
--			cntrl0_sys_rst90_tb           : out   std_logic;
--			cntrl0_sys_rst180_tb          : out   std_logic;
			--cntrl0_user_output_data       : out   std_logic_vector(15 downto 0);
			--cntrl0_user_input_data        : in    std_logic_vector(15 downto 0);
			--cntrl0_user_input_address     : in    std_logic_vector(24 downto 0);
			cntrl0_ddr2_dqs               : inout std_logic_vector(0 downto 0);
			cntrl0_ddr2_dqs_n             : inout std_logic_vector(0 downto 0);
			cntrl0_ddr2_ck                : out   std_logic_vector(0 downto 0);
			cntrl0_ddr2_ck_n              : out   std_logic_vector(0 downto 0)
	);
			 
end CPU;

architecture Behavioral of CPU is

signal cu_err_in, alu_err_in: std_logic;

--In und out immer aus sicht der vorderen Komponente



--Signals between control unit and ALU
signal cu_alu_data_in, cu_alu_data_out1, cu_alu_data_out2: std_logic_vector(31 downto 0);
signal cu_alu_adr_out3:  std_logic_vector(4 downto 0);
signal cu_alu_com_out: std_logic_vector(5 downto 0);
signal cu_alu_work_out: std_logic;

--Signals between control unit and MMU 
signal cu_mmu_data_in, cu_mmu_data_out, cu_mmu_adr_out: std_logic_vector(31 downto 0);
signal cu_mmu_com_out:std_logic_vector(2 downto 0);
signal cu_mmu_work_out, cu_mmu_ack_in : std_logic;

--Signals between ALU and Debug unit
signal alu_debug_data_out: std_logic_vector( 31 downto 0);

--Signal from and to the clock unit
signal clock_clk_out: std_logic;

 
begin



CU: entity work.leitwerk port map(
	
	clk_in => clock_clk_out,
	rst_in => cpu_rst_in,
	--ALU
	alu_data_in => cu_alu_data_in,
	alu_data_out1 => cu_alu_data_out1,
	alu_data_out2 => cu_alu_data_out2,
	alu_adr_out => cu_alu_adr_out3,
	alu_com_out => cu_alu_com_out,
	alu_work_out => cu_alu_work_out,
	
	--MMU
	mmu_data_in => cu_mmu_data_in,
	mmu_data_out => cu_mmu_data_out,
	mmu_adr_out => cu_mmu_adr_out,
	mmu_com_out => cu_mmu_com_out,
	mmu_work_out => cu_mmu_work_out,
	mmu_ack_in => cu_mmu_ack_in
);

RECHENEINHEIT: entity work.ALU port map(
	clk_in => clock_clk_out,
	rst_in => cpu_rst_in,
	cu_data_in1 => cu_alu_data_out1,
	cu_data_in2 => cu_alu_data_out2,
	cu_adr_in => cu_alu_adr_out3,
	cu_com_in => cu_alu_com_out,
	cu_work_in => cu_alu_work_out,
	cu_data_out => cu_alu_data_in,
	debug_data_out => cpu_debug_out,
	debug_adr_out => cpu_debug_adr_out
);

SPEICHER: entity work.RAM port map(
	clk =>cpu_clk_in,
	rst => cpu_rst_in,
	addr => cu_mmu_adr_out(24 downto 0),
	data_out => cu_mmu_data_in,
	data_in => cu_mmu_data_out,
	ack_out => cu_mmu_ack_in,
	work_in => cu_mmu_work_out,
	cmd => cu_mmu_com_out,
	
			  -- ddr2
			cntrl0_ddr2_dq                => cntrl0_ddr2_dq ,
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
			--sys_clkb                      =>,
			--sys_clk                       =>,
			--reset_in_n                    =>,
			--cntrl0_burst_done             =>,
			--cntrl0_init_done              =>,
			--cntrl0_ar_done                =>,
			--cntrl0_user_data_valid        =>,
			--cntrl0_auto_ref_req           => cntrl0_auto_ref_req,
			--cntrl0_user_cmd_ack           =>,
			--cntrl0_user_command_register  =>,
--			cntrl0_clk_tb                 => cntrl0_clk_tb,
--			cntrl0_clk90_tb               => cntrl0_clk90_tb,
--			cntrl0_sys_rst_tb             => cntrl0_sys_rst_tb,
--			cntrl0_sys_rst90_tb           => cntrl0_sys_rst90_tb,
--			cntrl0_sys_rst180_tb          => cntrl0_sys_rst180_tb,
			--cntrl0_user_output_data       =>,
			--cntrl0_user_input_data        =>,
			--cntrl0_user_input_address     =>,
			cntrl0_ddr2_dqs               => cntrl0_ddr2_dqs,
			cntrl0_ddr2_dqs_n             => cntrl0_ddr2_dqs_n,
			cntrl0_ddr2_ck                => cntrl0_ddr2_ck,
			cntrl0_ddr2_ck_n              => cntrl0_ddr2_ck_n
			  
);

CLOCKER: entity work.ClockDivider port map(
	clk_in => cpu_clk_in,
	rst_in => cpu_rst_in,
	clk_out => clock_clk_out,
	slow_in => cpu_slow_in

);






end Behavioral;

