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
--Clocking and reset ports
--		reset_in : in std_logic;
--		clk_in : in std_logic;
--		clk90_in : in std_logic;
--
--		--Ports connected to CPU
--		data_out: out std_logic_vector(31 downto 0);
--		data_in: in std_logic_vector(31 downto 0);
--		addr_in: in std_logic_vector(31 downto 0);
--		cmd_in: in std_logic_vector(2 downto 0);
--		work_in : in std_logic;
--		ack_out : out std_logic;
--		
--		--Ports connected to DRR2_RAM_CORE
--		init_done : in std_logic;
--		command_register : out std_logic_vector(2 downto 0);
--		input_adress : out std_logic_vector(24 downto 0);
--		input_data : out std_logic_vector(31 downto 0);
--		output_data : in std_logic_vector(31 downto 0);
--		cmd_ack : in std_logic;
--		data_valid : in std_logic;
--		burst_done : out std_logic;
--		auto_ref_req : in std_logic
end    MMU_tb;

architecture Testbench of MMU_tb is

   -- Component Declaration for the Unit Under Test (UUT)
--   component MMU
----      port( );
-- port(
--		--Clocking and reset ports
--		reset_in : in std_logic;
--		clk_in : in std_logic;
--		clk90_in : in std_logic;
--
--		--Ports connected to CPU
--		data_out: out std_logic_vector(31 downto 0);
--		data_in: in std_logic_vector(31 downto 0);
--		addr_in: in std_logic_vector(31 downto 0);
--		cmd_in: in std_logic_vector(2 downto 0);
--		work_in : in std_logic;
--		ack_out : out std_logic;
--		
--		--Ports connected to DRR2_RAM_CORE
--		init_done : in std_logic;
--		command_register : out std_logic_vector(2 downto 0);
--		input_adress : out std_logic_vector(24 downto 0);
--		input_data : out std_logic_vector(31 downto 0);
--		output_data : in std_logic_vector(31 downto 0);
--		cmd_ack : in std_logic;
--		data_valid : in std_logic;
--		burst_done : out std_logic;
--		auto_ref_req : in std_logic
--	);
--   end component;




	-- BLOCKRAM Control --
	component BLOCKRAM is
	Port(
			clk : in std_logic;
			rst : in std_logic;
			addr_in : in std_logic_vector(8 downto 0); --9 Bit Adress enables 512 32-Bit cells
			data_in : in std_logic_vector(31 downto 0);
			data_out: out std_logic_vector(31 downto 0);
			write_enable : in std_logic
	);
	end Component BLOCKRAM;

	-- DDR2 Control --
	COMPONENT DDR2_Control_VHDL is
	PORT (
		 reset_in : in std_logic;
		 clk_in : in std_logic;
		 clk90_in : in std_logic;

		 maddr   : in std_logic_vector(15 downto 0);
		 mdata_i : in std_logic_vector(63 downto 0);
		 data_out : out std_logic_vector(63 downto 0);
		 mwe	  : in std_logic;
		 mrd    : in std_logic;
		 valid : out std_logic;
		 

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

	type MMU_STATE_T is (
			MMU_BRAM_READ_FIRST,
			MMU_BRAM_READ_SECOND,
			MMU_READ_DONE,
			MMU_SDRAM_READ_FIRST,
			MMU_SDRAM_READ_SECOND,
			MMU_WRITE_BACK,
			MMU_BRAM_WRITE_FIRST,
			MMU_BRAM_WRITE_SECOND,
			MMU_SDRAM_WRITE_FIRST,
			MMU_SDRAM_WRITE_SECOND,
			MMU_IDLE
		);
	signal MMU_STATE : MMU_STATE_T := MMU_IDLE;
	
	signal data_in_buf : std_logic_vector(31 downto 0); --Buffer for the write input data from CPU
	signal data_buf : std_logic_vector(63 downto 0); --Buffers two 32-Bit values read from bram with every read access
	signal addr_in_buf : std_logic_vector(31 downto 0); --Signal to buffer an address for access cycles
	signal write_mode : std_logic := '0'; --Signal to buffer if the MMU is in write mode
	signal access_size : std_logic_vector(1 downto 0); --encoding follows cpu specification ("00" => 1, "01"=> 2, "11" => 3
	
	--Intern signals to be conncted to bram
	signal br_data_in : std_logic_vector(31 downto 0);
	signal br_data_out : std_logic_vector(31 downto 0);
	signal br_write_enable : std_logic := '0';
	signal br_addr_in : std_logic_vector(8 downto 0);
	
	--Intern signals to be connected to ddr2sdram
	signal ddr2_addr_in : std_logic_vector(15 downto 0);
	signal ddr2_data_in : std_logic_vector(63 downto 0) := (others => '0');
	signal ddr2_data_out : std_logic_vector(63 downto 0) := (others => '0');
	signal ddr2_write_enable : std_logic := '0';
	signal ddr2_read_enable : std_logic := '0';
	signal ddr2_data_valid : std_logic;



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

			signal	 clk_in : std_logic;
	signal	 reset_in : std_logic;
	signal	 cmd_in : std_logic_vector(2 downto 0);



begin

clk_in <= clk;
reset_in <= rst;
cmd_in <=cmd;


process(clk_in) begin
			
			if rising_edge(clk_in) then
			
				if reset_in = '1' then
				
					ack_out <= '1';
					
				else
				
					case MMU_STATE is
					
						when MMU_IDLE =>
						
							--we wait for work_in input
							if work_in = '1' then
								data_in_buf <= data_in;
								ack_out <= '0'; --CPU has to wait until MMU has finished
								addr_in_buf <= addr_in; --Buffer the adress in any case
								
								--We always send a read command, since we need to prefetch for every write as well
								case addr_in(31 downto 28) is
								
									when "0000" =>
										--Prefix 0x0 : BRAM access
										br_addr_in <= addr_in(10 downto 2); --4 aligned access
										MMU_STATE <= MMU_BRAM_READ_FIRST;
							
									when "0001" =>
										--Prefix 0x1 : SDRAM access
										ddr2_read_enable <= '1';
										ddr2_addr_in <= addr_in(17 downto 2); --4 aligned access (we treat the 64-bit cells as 32 bit cells)
										MMU_STATE <= MMU_SDRAM_READ_FIRST;
									
									
									when others => NULL;
										
								end case;
								
								--Buffer if we have to write back afterwards or not
								if cmd_in(2) = '1' then
									write_mode <= '1';
								else
									write_mode <= '0';
								end if;
								
								--Buffer the access size
								access_size <= cmd_in(1 downto 0);
							
							end if;
						
						
						when MMU_BRAM_READ_FIRST =>
							--Reading the first 64-Bit word in this state
							data_buf(31 downto 0) <= br_data_out;
							if not addr_in_buf(1 downto 0) = "00" then
								--Read a second word from BRAM to get the missing parts (addr_in_buf(2 downto 0) > 4)
								MMU_STATE <= MMU_BRAM_READ_SECOND;
								br_addr_in <= std_logic_vector(unsigned(addr_in_buf(10 downto 2)) + 1); --Read next 32-Bit word
							else
								MMU_STATE <= MMU_READ_DONE;
							end if;
							
						when MMU_BRAM_READ_SECOND =>
							--Reading the second 64-Bit word in this state
							data_buf(63 downto 32) <= br_data_out;
							MMU_STATE <= MMU_READ_DONE;
							
						when MMU_SDRAM_READ_FIRST =>
							--Wait for the first 64-Bit cell read form ddr2sdram
							if ddr2_data_valid = '0' then
								ddr2_read_enable <= '0'; --wait for the ddr2ram to finish until we read next
							else
								data_buf(31 downto 0) <= ddr2_data_out(31 downto 0);
								if not addr_in_buf(1 downto 0) = "00" then
									--We need to read a second 32-bit cell
									ddr2_addr_in <= std_logic_vector(unsigned(addr_in_buf(17 downto 2)) + 1);
									ddr2_read_enable <= '1';
									MMU_STATE <= MMU_SDRAM_READ_SECOND;
								else
									ddr2_read_enable <= '0';
									MMU_STATE <= MMU_READ_DONE;
								end if;
							
							end if;
							
						when MMU_SDRAM_READ_SECOND =>
						
							ddr2_read_enable <= '0';
							if ddr2_data_valid = '1' then
							
								data_buf(63 downto 32) <= ddr2_data_out(31 downto 0);
								MMU_STATE <= MMU_READ_DONE;	
									
							end if;
							
						
							
						when MMU_READ_DONE =>
							--Applying the respective bytes to the output
						
							--Jump back into idle mode or intro write back depending on the mode of the mmu
							if write_mode = '0' then
								--Since we always have 32-bit as read size we use a case statement
								case addr_in_buf(1 downto 0) is
								
									when "00" => data_out <= data_buf(31 downto 0);
									when "01" => data_out <= data_buf(39 downto 8);
									when "10" => data_out <= data_buf(47 downto 16);
									when "11" => data_out <= data_buf(55 downto 24);
									when others => NULL;
			
								end case;
								ack_out <= '1';
								MMU_STATE <= MMU_IDLE;
							else
								--Todo apply the the right size to the right position
								case access_size is
								
									--8-Bit access
									when "00" =>
										case addr_in_buf(1 downto 0) is
											when "00" => data_buf(7 downto 0) <= data_in_buf(7 downto 0);
											when "01" => data_buf(15 downto 8) <= data_in_buf(7 downto 0);
											when "10" => data_buf(23 downto 16) <= data_in_buf(7 downto 0);
											when "11" => data_buf(31 downto 24) <= data_in_buf(7 downto 0);
											when others =>NULL;
										end case;
										
									--16-Bit access	
									when "01" =>
										case addr_in_buf(1 downto 0) is
											when "00" => data_buf(15 downto 0) <= data_in_buf(15 downto 0);
											when "01" => data_buf(23 downto 8) <= data_in_buf(15 downto 0);
											when "10" => data_buf(31 downto 16) <= data_in_buf(15 downto 0);
											when "11" => data_buf(39 downto 24) <= data_in_buf(15 downto 0);
											when others =>NULL;
										end case;
										
									--32-Bit access	
									when "11" =>
										case addr_in_buf(1 downto 0) is
											when "00" => data_buf(31 downto 0) <= data_in_buf(31 downto 0);
											when "01" => data_buf(39 downto 8) <= data_in_buf(31 downto 0);
											when "10" => data_buf(47 downto 16) <= data_in_buf(31 downto 0);
											when "11" => data_buf(55 downto 24) <= data_in_buf(31 downto 0);
											when others =>NULL;
										end case;
										
									when others=>NULL;	
										
								end case;
								--data_buf(31 downto 0) <= data_in_buf; --This provisional solution always writes 32 bit to the lowest position (which results in data loss)
								MMU_STATE <= MMU_WRITE_BACK;
							end if;
							
						when MMU_WRITE_BACK =>
							--Intiliaze the writeback of data 
							case addr_in_buf(31 downto 28) is
								
								when "0000" =>
									--BRAM write
									br_addr_in <= addr_in_buf(10 downto 2);
									br_data_in <= data_buf(31 downto 0);
									br_write_enable <= '1';
									MMU_STATE <= MMU_BRAM_WRITE_FIRST;
									
								when "0001" =>
									--ddr2sdram write
									ddr2_addr_in <= addr_in_buf(17 downto 2); --write the first cell back
									ddr2_data_in(31 downto 0) <= data_buf(31 downto 0);
									ddr2_write_enable <= '1';
									MMU_STATE <= MMU_SDRAM_WRITE_FIRST;
								
								when others => NULL;
								
							end case;
							
						when MMU_BRAM_WRITE_FIRST =>
							--After the first write command was sent to bram
							if not addr_in_buf(1 downto 0) = "00" then
								--Write back the second read 32-bit value
								br_addr_in <= std_logic_vector(unsigned(addr_in_buf(10 downto 2)) + 1);
								br_data_in <= data_buf(63 downto 32);
								br_write_enable <= '1';
								MMU_STATE <= MMU_BRAM_WRITE_SECOND;
							else
								br_write_enable <= '0';
								ack_out <= '1';
								MMU_STATE <= MMU_IDLE;
							
							end if;
							
						when MMU_BRAM_WRITE_SECOND =>
							--Return to idle state of mmu after we have written the next 32 bit cell
							br_write_enable <= '0';
							if ddr2_data_valid = '1' then
								ack_out <= '1';
								MMU_STATE <= MMU_IDLE;
							end if;
							
						when MMU_SDRAM_WRITE_FIRST =>
							--after the first write was sent, we wait for data valid as confirmation
							if ddr2_data_valid = '1' then
								
								if not addr_in_buf(1 downto 0) = "00" then
									--Write the second 32-bit cell due the address was at a border of cells
									ddr2_data_in(31 downto 0) <= data_buf(63 downto 32);
									ddr2_addr_in <= std_logic_vector(unsigned(addr_in_buf(17 downto 2)) + 1);
									ddr2_write_enable <= '1';
									MMU_STATE <= MMU_SDRAM_WRITE_SECOND;
								else
								
									ddr2_write_enable <= '0';
									ack_out <= '1';
									MMU_STATE <= MMU_IDLE;
								end if;
								
							else
								ddr2_write_enable <= '0'; --Wait for the write to finish
						
							end if;
						
						
						when MMU_SDRAM_WRITE_SECOND =>
							--Wait until the second 64-bit cell was written
							ddr2_write_enable <= '0';
							if ddr2_data_valid = '1' then
							
								ack_out <= '1';
								MMU_STATE <= MMU_IDLE;
							
							end if;
							
						when others => NULL;
				
					end case;
				
				end if;
				
			end if;
		
		end process;

	--Instanciate Blockram 
		INST_BLOCKRAM : BLOCKRAM
		PORT MAP (
				clk => clk_in,
				rst => reset_in,
				addr_in => br_addr_in,
				data_in => br_data_in,
				data_out => br_data_out,
				write_enable => br_write_enable
		);
		
		INST_DDR2_Control_VHDL : DDR2_Control_VHDL
		PORT MAP (
			 reset_in => reset_in,
			 clk_in => clk_in,
			 clk90_in => clk90_in,

			 maddr   => ddr2_addr_in,
			 mdata_i => ddr2_data_in,
			 data_out => ddr2_data_out,
			 mwe	  => ddr2_write_enable,
			 mrd     => ddr2_read_enable,
			 valid => ddr2_data_valid,

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

   -- Ifstantiate the Unit Under Test (UUT)
--   uut: MMU port map ( 
--		
--	reset_in => rst,
--	clk_in => clk,
--	clk90_in => clk90_in,
--	
--	--Connecting CPU signals to MMU
--	data_out =>data_out,
--	data_in =>data_in,
--	addr_in =>addr_in,
--	cmd_in =>cmd,
--	work_in =>work_in,
--	ack_out =>ack_out,
--
--	-- ddr2	
--	init_done => init_done, --in
--	command_register => command_register, --out
--	input_adress => input_adress, --out
--	input_data => input_data, --out 
--	output_data => output_data, --in
--	cmd_ack => cmd_ack, --in
--	data_valid => data_valid, --in
--	burst_done => burst_done, --out
--	auto_ref_req => auto_ref_req --in
--
--	 );

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
	 wait for 100 fs;
	work_in <= '0';
	cmd <= "100";
addr_in <= "00000000000000000000000000001001";
	data_in <= "10101010101010101010101010101111";
wait for 100 fs;
work_in <= '1';
wait for 100 fs;
	wait until ack_out ='1';
wait for 100 fs;

 wait for 100 fs;
	work_in <= '0';
	cmd <= "011";
addr_in <= "00000000000000000000000000001001";
	data_in <= "10101010101010101010101010101111";
wait for 100 fs;
work_in <= '1';
wait for 100 fs;
	wait until ack_out ='1';
   wait for 100 fs;

 wait for 100 fs;
	work_in <= '0';
	cmd <= "100";
addr_in <= "00000000000000000000000000001001";
	data_in <= "10101010101010101010101010101111";
wait for 100 fs;
work_in <= '1';
wait for 100 fs;
	wait until ack_out ='1';
   wait for 100 fs;

 wait for 100 fs;
	work_in <= '0';
	cmd <= "000";
addr_in <= "00000000000000000000000000001001";
	data_in <= "10101010101010101010101010101111";
wait for 100 fs;
work_in <= '1';
wait for 100 fs;
	wait until ack_out ='1';
   wait for 100 fs;

 wait for 100 fs;
	work_in <= '0';
	cmd <= "100";
addr_in <= "00000000000000000000000000001001";
	data_in <= "10101010101010101010101010101111";
wait for 100 fs;
work_in <= '1';
wait for 100 fs;
	wait until ack_out ='1';
   wait for 100 fs;


   -- assert (<condition>) report "Error case 2" severity error;

   -- Stop clock
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:02:21 09/08/2016 
-- Design Name: 
-- Module Name:    BLOCKRAM - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BLOCKRAM is
port(
		clk : in std_logic;
		rst : in std_logic;
		addr_in : in std_logic_vector(8 downto 0); --9 bit for adressing 32-bit cells
		data_in : in std_logic_vector(31 downto 0);
		data_out: out std_logic_vector(31 downto 0);
		write_enable : in std_logic
);

end BLOCKRAM;

architecture Behavioral of BLOCKRAM is

	type mem_t is array (0 to 511) of std_logic_vector(31 downto 0);  -- 512 cells with 32 bit
	signal cells : mem_t:= (

--addi x1, x0, 0x200
"00100000000000000000000010010011",

--addi x2, x0, 0
"00000000000000000000000100010011",

--addi x2, x2, 0xFFF
"11111111111100010000000100010011",

--lui x3, 0x80201
"10000000001000000001000110110111",

--addi x3, x3, 0x008
"00000000100000011000000110010011",

--lw x4, x1, 16
"00000001000000001010001000000011",

--lw x5, x1, 20
"00000001010000001010001010000011",

--lw x6, x1, 24
"00000001100000001010001100000011",

--lw x7, x1, 28
"00000001110000001010001110000011",

--sw x1, x2, 16
"00000000001000001010100000100011",

--sw x1, x2, 20
"00000000001000001010101000100011",

--sw x1, x2, 24
"00000000001000001010110000100011",

--sw x1, x2, 28
"00000000001000001010111000100011",

--sw x1, x0, 16
"00000000000000001010100000100011",

--lw x8, x1, 16
"00000001000000001010010000000011",

--lw x9, x1, 20
"00000001010000001010010010000011",

--lw x10, x1, 24
"00000001100000001010010100000011",

--lw x11, x1, 28
"00000001110000001010010110000011",

--sw x1, x0, 21
"00000000000000001010101010100011",

--lw x12, x1, 16
"00000001000000001010011000000011",

--lw x13, x1, 20
"00000001010000001010011010000011",

--lw x14, x1, 24
"00000001100000001010011100000011",

--lw x15, x1, 28
"00000001110000001010011110000011",

--sh x1, x0, 24
"00000000000000001001110000100011",

--lw x16, x1, 16
"00000001000000001010100000000011",

--lw x17, x1, 20
"00000001010000001010100010000011",

--lw x18, x1, 24
"00000001100000001010100100000011",

--lw x19, x1, 28
"00000001110000001010100110000011",

--sh x1, x0, 27
"00000000000000001001110110100011",

--lw x20, x1, 16
"00000001000000001010101000000011",

--lw x21, x1, 20
"00000001010000001010101010000011",

--lw x22, x1, 24
"00000001100000001010101100000011",

--lw x23, x1, 28
"00000001110000001010101110000011",

--sb x1, x0, 30
"00000000000000001000111100100011",

--lw x24, x1, 16
"00000001000000001010110000000011",

--lw x25, x1, 20
"00000001010000001010110010000011",

--lw x26, x1, 24
"00000001100000001010110100000011",

--lw x27, x1, 28
"00000001110000001010110110000011",

others=>(others=>'0')








	
	);
	
	attribute ram_style: string;
	attribute ram_style of cells : signal is "block";
	
begin
	

	process(clk) begin
	
		
		
		if rising_edge(clk) then
		
			if rst = '0' then
			--No reset -> standard dual-port usage
				if write_enable = '1'then
					cells(to_integer(unsigned(addr_in))) <= data_in;
				end if;
				data_out <= cells(to_integer(unsigned(addr_in)));
			
			end if;
			
			
			
			
		end if;
			
	end process;

end Behavioral;



