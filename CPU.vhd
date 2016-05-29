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

	port(cpu_clk_in, cpu_rst_in : in STD_LOGIC);
end CPU;

architecture Behavioral of CPU is

signal cu_err_in, alu_err_in: std_logic;

--In und out immer aus sicht der vorderen Komponente

--Signals between control unit and registers
signal cu_reg_data_in, cu_reg_data_out: std_logic_vector(31 downto 0);
signal cu_reg_adr_out: std_logic_vector(4 downto 0);
signal cu_reg_com_out: std_logic_vector( 0 downto 0);
signal cu_reg_sync_out, cu_reg_ack_in: std_logic;


--Signals between control unit and ALU
signal cu_alu_data_in, cu_alu_data_out1, cu_alu_data_out2: std_logic_vector(31 downto 0);
signal cu_alu_adr_out3:  std_logic_vector(4 downto 0);
signal cu_alu_com_out: std_logic_vector(6 downto 0);
signal cu_alu_sync_out, cu_alu_ack_in: std_logic;

--Signals between control unit and RAM
signal cu_ram_data_in, cu_ram_data_out,  cu_ram_adr_out: std_logic_vector(31 downto 0);
signal cu_ram_com_out: std_logic_vector(2 downto 0);
signal cu_ram_sync_out, cu_ram_ack_in: std_logic;

--Signals between ALU and register
signal alu_reg_data_in, alu_reg_data_out: std_logic_vector(31 downto 0);
signal alu_reg_adr_out: std_logic_vector(4 downto 0);
signal alu_reg_act_in, alu_reg_act_out, alu_reg_rw_out: std_logic;


 
begin

cu_reg_data_in <= x"00000000";
cu_reg_ack_in <= '0';


CU: entity work.leitwerk port map(
	--Grundsignale
	clk_in => cpu_clk_in,
	rst_in => cpu_rst_in,
	err_out => cu_err_in,
	--Register
	reg_data_in => cu_reg_data_in,
	reg_data_out => cu_reg_data_out,
	reg_adr_out => cu_reg_adr_out,
	reg_com_out => cu_reg_com_out,
	reg_sync_out => cu_reg_sync_out,
	reg_ack_in => cu_reg_ack_in,
	--ALU
	alu_data_in => cu_alu_data_in,
	alu_data_out1 => cu_alu_data_out1,
	alu_data_out2 => cu_alu_data_out2,
	alu_adr_out3 => cu_alu_adr_out3,
	alu_com_out => cu_alu_com_out,
	alu_sync_out => cu_alu_sync_out,
	alu_ack_in => cu_alu_ack_in,
	--RAM
	ram_data_in => cu_ram_data_in,
	ram_data_out => cu_ram_data_out,
	ram_adr_out => cu_ram_adr_out,
	ram_com_out => cu_ram_com_out,
	ram_sync_out => cu_ram_sync_out,
	ram_ack_in => cu_ram_ack_in
	
);

RECHENEINHEIT: entity work.ALU port map(
	clk_in => cpu_clk_in,
	cu_act_in => cu_alu_sync_out,
	rst_in => cpu_rst_in,
	opc_in => cu_alu_com_out,
	op1_in => cu_alu_data_out1,
	op2_in => cu_alu_data_out2,
	op3_in => cu_alu_adr_out3,
	reg_data_in => alu_reg_data_in,
	reg_data_out => alu_reg_data_out,
	cu_data_out => cu_alu_data_in,
	reg_adr_out => alu_reg_adr_out,
	reg_act_out => alu_reg_act_out,
	reg_rw_out => alu_reg_rw_out,
	error_out => alu_err_in,
	reg_act_in => alu_reg_act_in,
	cu_ack_out => cu_alu_ack_in
);

SPEICHER: entity work.RAM port map(
	clk => cpu_clk_in,
	rst => cpu_rst_in,
	addr => cu_ram_adr_out,
	r_w => cu_ram_com_out(0),
	data_in => cu_ram_data_out,
	data_out => cu_ram_data_in,
	sync => cu_ram_sync_out,
	conf => cu_ram_ack_in

);

reg: entity work.regist port map(
	
	clk => cpu_clk_in,
	rst => cpu_rst_in,
	addr => alu_reg_adr_out,
	r_w => alu_reg_rw_out,
	data_in => alu_reg_data_out,
	data_out => alu_reg_data_in,
	sync => alu_reg_act_out,
	conf => alu_reg_act_in

);

end Behavioral;

