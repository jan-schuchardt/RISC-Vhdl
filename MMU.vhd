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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MMU is
port (
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

end MMU;




architecture Behavioral of MMU is

	-- BLOCKRAM Control --
	component BLOCKRAM is
	Port(
			clk : in std_logic;
			rst : in std_logic;
			addr_in : in std_logic_vector(10 downto 0); --11 Bit Adress enables 2048 8-Bit cells, but now: 256 64-Bit cells
			data_in : in std_logic_vector(63 downto 0);
			data_out: out std_logic_vector(63 downto 0);
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
	signal data_buf : std_logic_vector(127 downto 0); --Buffers two 64-Bit values read from bram with every read access
	signal addr_in_buf : std_logic_vector(31 downto 0); --Signal to buffer an address for access cycles
	signal write_mode : std_logic := '0'; --Signal to buffer if the MMU is in write mode
	
	--Intern signals to be conncted to bram
	signal br_data_in : std_logic_vector(63 downto 0);
	signal br_data_out : std_logic_vector(63 downto 0);
	signal br_write_enable : std_logic := '0';
	signal br_addr_in : std_logic_vector(10 downto 0);
	
	--Intern signals to be connected to ddr2sdram
	signal ddr2_addr_in : std_logic_vector(15 downto 0);
	signal ddr2_data_in : std_logic_vector(63 downto 0) := (others => '0');
	signal ddr2_data_out : std_logic_vector(63 downto 0) := (others => '0');
	signal ddr2_write_enable : std_logic := '0';
	signal ddr2_read_enable : std_logic := '0';
	signal ddr2_data_valid : std_logic;
	
	
	begin
	
		process(clk_in) begin
			
			if rising_edge(clk_in) then
			
				if reset_in = '1' then
				
					ack_out <= '1';
					
				else
				
					case MMU_STATE is
					
						when MMU_IDLE =>
						
							--we wait for work_in input
							if work_in = '1' then
							
								ack_out <= '0'; --CPU has to wait until MMU has finished
								addr_in_buf <= addr_in; --Buffer the adress in any case
								
								--We always send a read command, since we need to prefetch for every write as well
								case addr_in(31 downto 28) is
								
									when "0000" =>
										--Prefix 0x0 : BRAM access
										br_addr_in <= addr_in(10 downto 0);
										MMU_STATE <= MMU_BRAM_READ_FIRST;
							
									when "0001" =>
										--Prefix 0x1 : SDRAM access
										ddr2_read_enable <= '1';
										ddr2_addr_in <= addr_in(18 downto 3); --ddr2sdram uses 16-bit cells that are adressed in blocks of 4, so the adress is auto aligned by 8
										MMU_STATE <= MMU_SDRAM_READ_FIRST;
									
									
									when others => NULL;
										
								end case;
								
								--Buffer if we have to write back afterwards or not
								if cmd_in(2) = '1' then
									write_mode <= '1';
								else
									write_mode <= '0';
								end if;
								
							
							end if;
						
						
						when MMU_BRAM_READ_FIRST =>
							--Reading the first 64-Bit word in this state
							data_buf(63 downto 0) <= br_data_out;
							if addr_in_buf(2) = '1' and not addr_in_buf(1 downto 0) = "00" then
								--Read a second word from BRAM to get the missing parts (addr_in_buf(2 downto 0) > 4)
								MMU_STATE <= MMU_BRAM_READ_SECOND;
								br_addr_in <= std_logic_vector(unsigned(addr_in_buf) + 8); --Read next 64-Bit word
							else
								MMU_STATE <= MMU_READ_DONE;
							end if;
							
						when MMU_BRAM_READ_SECOND =>
							--Reading the second 64-Bit word in this state
							data_buf(127 downto 64) <= br_data_out;
							MMU_STATE <= MMU_READ_DONE;
							
						when MMU_SDRAM_READ_FIRST =>
							--Wait for the first 64-Bit cell read form ddr2sdram
							if ddr2_data_valid = '0' then
								ddr2_read_enable <= '0'; --wait for the ddr2ram to finish until we read next
							else
								data_buf(63 downto 0) <= ddr2_data_out;
								if addr_in_buf(2) = '1' and not addr_in_buf(1 downto 0) = "00" then
									--We need to read a second 64-bit cell
									ddr2_addr_in <= std_logic_vector(unsigned(addr_in_buf(18 downto 3)) + 1);
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
							
								data_buf(127 downto 64) <= ddr2_data_out;
								MMU_STATE <= MMU_READ_DONE;	
									
							end if;
							
						
							
						when MMU_READ_DONE =>
							--Applying the respective bytes to the output
							--Since we always have 32-bit as read size we use a case statement
							case addr_in_buf(2 downto 0) is
							
								when "000" => data_out <= data_buf(31 downto 0);
								when "001" => data_out <= data_buf(39 downto 8);
								when "010" => data_out <= data_buf(47 downto 16);
								when "011" => data_out <= data_buf(55 downto 24);
								when "100" => data_out <= data_buf(63 downto 32);
								when "101" => data_out <= data_buf(71 downto 40);
								when "110" => data_out <= data_buf(79 downto 48);
								when "111" => data_out <= data_buf(87 downto 56);
								when others => NULL;
		
							end case;
						
							--Jump back into idle mode or intro write back depending on the mode of the mmu
							if write_mode = '0' then
								ack_out <= '1';
								MMU_STATE <= MMU_IDLE;
							else
								--Todo apply the the right size to the right position
								data_buf(31 downto 0) <= data_in_buf; --This provisional solution always writes 32 bit to the lowest position (which results in data loss)
								MMU_STATE <= MMU_WRITE_BACK;
							end if;
							
						when MMU_WRITE_BACK =>
							--Intiliaze the writeback of data 
							case addr_in_buf(31 downto 28) is
								
								when "0000" =>
									--BRAM write
									br_addr_in <= addr_in_buf(10 downto 0);
									br_data_in <= data_buf(63 downto 0);
									br_write_enable <= '1';
									MMU_STATE <= MMU_BRAM_WRITE_FIRST;
									
								when "0001" =>
									--ddr2sdram write
									ddr2_addr_in <= addr_in_buf(18 downto 3); --write the first cell back
									ddr2_data_in <= data_buf(63 downto 0);
									ddr2_write_enable <= '1';
									MMU_STATE <= MMU_SDRAM_WRITE_FIRST;
								
								when others => NULL;
								
							end case;
							
						when MMU_BRAM_WRITE_FIRST =>
							--After the first write command was sent to bram
							if addr_in_buf(2) = '1' and not addr_in_buf(1 downto 0) = "00" then
								--Write back the second read 64-bit value
								br_addr_in <= std_logic_vector(unsigned(addr_in_buf(10 downto 0)) + 8);
								br_data_in <= data_buf(127 downto 64);
								br_write_enable <= '1';
								MMU_STATE <= MMU_BRAM_WRITE_SECOND;
							else
								br_write_enable <= '0';
								ack_out <= '1';
								MMU_STATE <= MMU_IDLE;
							
							end if;
							
						when MMU_BRAM_WRITE_SECOND =>
							--Return to idle state of mmu after we have written the next 64 bit cell
							br_write_enable <= '0';
							ack_out <= '1';
							MMU_STATE <= MMU_IDLE;
							
						when MMU_SDRAM_WRITE_FIRST =>
							--after the first write was sent, we wait for data valid as confirmation
							if ddr2_data_valid = '1' then
								
								if addr_in_buf(2) = '1' and not addr_in_buf(1 downto 0) = "00" then
									--Write the second 64-bit cell due the address was at a border of cells
									ddr2_data_in <= data_buf(127 downto 64);
									ddr2_addr_in <= std_logic_vector(unsigned(addr_in_buf(18 downto 3)) + 1);
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

end Behavioral;
	