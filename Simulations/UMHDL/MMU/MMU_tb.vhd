-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Franz
-- 
-- Create Date:    08/11/2016 19:47:18
-- Project Name:   MMU
-- Module Name:    MMU_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, ufsigned

entity MMU_tb is
end    MMU_tb;

architecture Testbench of MMU_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component MMU
--      port( );
 port(
		--Clocking and reset ports
		reset_in : in std_logic;
		clk_in : in std_logic;
		clk90_in : in std_logic;

		--Ports connected to CPU
		data_out: out std_logic_vector(31 downto 0);
		data_in: in std_logic_vector(31 downto 0);
		addr_in: in std_logic_vector(31 downto 0);
		cmd_in: in std_logic_vector(2 downto 0);
		work_in : in std_logic;
		ack_out : out std_logic;
		
		--Ports connected to DRR2_RAM_CORE
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
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: MMU use entity WORK.MMU(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
   --signal   <clock> : std_logic := '0';
   signal   clk : std_logic := '0';
	constant clock_period : time := 50 fs;
   signal   clock_on : boolean := true;
	signal rst : std_logic := '1';

	signal	clk90_in : std_logic;

	signal	data_out : std_logic_vector(31 downto 0);
	signal	data_in:  std_logic_vector(31 downto 0);
	signal	addr_in:  std_logic_vector(31 downto 0);
	signal	cmd:  std_logic_vector(2 downto 0);
	signal	work_in :  std_logic;
	signal	ack_out :  std_logic;
 	signal	init_done : std_logic;
	signal	 command_register :  std_logic_vector(2 downto 0);
	signal	 input_adress :  std_logic_vector(24 downto 0);
	signal	 input_data :  std_logic_vector(31 downto 0);
	signal	 output_data : std_logic_vector(31 downto 0);
	signal	 cmd_ack : std_logic;
	signal	 data_valid : std_logic;
	signal	 burst_done :  std_logic;
	signal	 auto_ref_req : std_logic;

begin

   -- Ifstantiate the Unit Under Test (UUT)
   uut: MMU port map ( 
		
	reset_in => rst,
	clk_in => clk,
	clk90_in => clk90_in,
	
	--Connecting CPU signals to MMU
	data_out =>data_out,
	data_in =>data_in,
	addr_in =>addr_in,
	cmd_in =>cmd,
	work_in =>work_in,
	ack_out =>ack_out,

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

-- Clock process (uncomment if needed)
-- Descomentar en caso de requerir senial de reloj
-- Sustituir <clock> por el nombre de puerto apropiado
clock_process : process
begin
   while (clock_on) loop
      clk <= '0';
      wait for clock_period/2;
      clk <= '1';
      wait for clock_period/2;
   end loop;
   --assert (false) report ("Finished") severity error;
   -- Wait forever
   wait;
 end process;

-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 fs

   wait for 100 fs;

	rst <= '0';
   ---------------------------------------------------------
   -- ifsert stimulus here
   ---------------------------------------------------------

	data_in <= "10101010101010101010101010101010";
	addr_in <= "00000000000000000000000000000000";
	cmd <= "100";
	work_in <= '1';

   -- Test case 1
   -- ... Asignaciones a seniales de entrada ...
wait for 100 fs;
   wait until ack_out = '1';
	work_in <= '0';
	cmd <= "000";

	  wait for 100 fs;
	work_in <= '1';


   -- assert (<condition>) report "Error case 1" severity error;

   -- Test case 2
   -- ... Asignaciones a seniales de entrada ...
   wait for 100 fs;
	wait until ack_out ='1';
   wait for 100 fs;

	work_in <= '0';




wait for 100 fs;
   -- assert (<condition>) report "Error case 2" severity error;

   -- Stop clock
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;
