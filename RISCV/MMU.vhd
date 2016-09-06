----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:05 09/06/2016 
-- Design Name: 
-- Module Name:    MMU - Behavioral 
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

entity MMU is
port (
		reset_in : in std_logic;
		clk_in : in std_logic;
		clk90_in : in std_logic;

		 mmu_data_in: out std_logic_vector(31 downto 0);
	 mmu_data_out: in std_logic_vector(31 downto 0);
	 mmu_adr_out: in std_logic_vector(31 downto 0);
	 mmu_com_out: in std_logic_vector(2 downto 0);
	 mmu_work_out : in std_logic;
	 mmu_ack_in : out std_logic;
		
		init_done : in std_logic;
		command_register : out std_logic_vector(2 downto 0);
		input_adress : out std_logic_vector(24 downto 0);
		input_data : out std_logic_vector(31 downto 0);
		output_data : in std_logic_vector(31 downto 0);
		cmd_ack : in std_logic;
		data_valid : in std_logic;
		burst_done : out std_logic;
		auto_ref_req : in std_logic
	);

end MMU;




architecture Behavioral of MMU is


-- DDR2 Control --
COMPONENT DDR2_Control_VHDL is
PORT (
    reset_in : in std_logic;
    clk_in : in std_logic;
    clk90_in : in std_logic;

    maddr   : in std_logic_vector(15 downto 0);
    mdata_i : in std_logic_vector(7 downto 0);
    data_out : out std_logic_vector(7 downto 0);
    mwe	  : in std_logic;
    mrd    : in std_logic;
	 
	 

    init_done : in std_logic;
    command_register : out std_logic_vector(2 downto 0);
    input_adress : out std_logic_vector(24 downto 0);
    input_data : out std_logic_vector(31 downto 0);
    output_data : in std_logic_vector(31 downto 0);
    cmd_ack : in std_logic;
    data_valid : in std_logic;
    burst_done : out std_logic;
    auto_ref_req : in std_logic
);
END COMPONENT DDR2_Control_VHDL;

   signal  i_maddr : std_logic_vector(15 downto 0);
   signal  i_mdata_i :  std_logic_vector(7 downto 0);
   signal  i_data_out : std_logic_vector(7 downto 0);
   signal  i_mwe	 : std_logic;
   signal  i_mrd  : std_logic;




		  


begin

	
INST_DDR2_Control_VHDL : DDR2_Control_VHDL
PORT MAP (
    reset_in => reset_in,
    clk_in => clk_in,
    clk90_in => clk90_in,

    maddr   => i_maddr,
    mdata_i => i_mdata_i,
    data_out => i_data_out,
    mwe	  => i_mwe,
    mrd     => i_mrd,

    -- ddr2	
    init_done => init_done, --in
    command_register => command_register, --out
    input_adress => input_adress, --out
    input_data => input_data, --out 
    output_data => output_data, --in
    cmd_ack => cmd_ack, --in
    data_valid => data_valid, --in
    burst_done => burst_done, --out
    auto_ref_req => auto_ref_req --in
);

end Behavioral;

