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
			addr_in : in std_logic_vector(10 downto 0); --11 Bit Adress enables 2048 8-Bit cells
			data_in : in std_logic_vector(7 downto 0);
			data_out: out std_logic_vector(7 downto 0);
			write_enable : in std_logic;
			read_enable : in std_logic
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
			MMU_IDLE,
			MMU_INIT,
			MMU_BRAM_READ,
			MMU_BRAM_WRITE,
			MMU_SDRAM_READ,
			MMU_SDRAM_READ_MASK,
			MMU_SDRAM_WRITE_PREFETCH,
			MMU_SDRAM_WRITE_MASK,
			MMU_SDRAM_WRITE_BACK,
			MMU_SDRAM_WRITE_DONE
		);
	signal MMU_STATE : MMU_STATE_T := MMU_IDLE; --State for MMU state machine

	--BRAM intern signals
	signal br_data_in : std_logic_vector(7 downto 0) := (others => '0');
	signal br_data_out : std_logic_vector (7 downto 0);
	signal br_write_enable : std_logic := '0';
	signal br_read_enable : std_logic := '0';
	signal br_addr_in : std_logic_vector (10 downto 0);
	signal br_data_buffer : std_logic_vector(31 downto 0); --holds the write data as buffer
	
	--Signals to manage reassembling of BRAM / DDR2SDRAM data 
	signal ram_access_addr_increment : std_logic; --tells if an address increment is requested or a operation (r/w)
	signal ram_access_cnt : unsigned(10 downto 0); --used to iterate through 8 bit values that are loaded into bram / used to count how many cells are still left to write
	
	
	
	--DDR2SDRAM intern signals
	signal ddr2_data_in : std_logic_vector(63 downto 0) := (others => '0');
	signal ddr2_data_out : std_logic_vector(63 downto 0) := (others => '0');
	signal ddr2_write_enable : std_logic := '0';
	signal ddr2_read_enable : std_logic := '0';
	signal ddr2_data_valid : std_logic;
	
	--Intern 8 x 8-bit Distributed RAM
	signal ddr2_data_buffer : std_logic_vector(63 downto 0); --buffer for prefetched read data
	
	begin
	
		process(clk_in) begin
		
			if rising_edge(clk_in) then
			
				if reset_in = '1' then
					--Initialize BRAM (DDR2SDRAM is initialized by DDR2_RAM_CORE unit)
					MMU_STATE <= MMU_INIT;
					ack_out <= '0';
					ram_access_addr_increment <= '0';
					ram_access_cnt <= to_unsigned(0, ram_access_cnt'length);
				
				else
				
					case MMU_STATE is
					
						when MMU_INIT =>
							--State to initialize BRAM with values
							ddr2_read_enable <= '0';
							ddr2_write_enable <= '0';
							if ram_access_addr_increment = '0' then
							
								case to_integer(ram_access_cnt) is --writing 8-bit values into bram
								
									when 0 => br_data_in <= x"00";
									when 1 => br_data_in <= x"01";
									when 2 => br_data_in <= x"03";
									when 3 => br_data_in <= x"04";
									when others =>NULL; -- init for bram finished
								
								end case;
								br_addr_in <= std_logic_vector(ram_access_cnt);
								br_write_enable <= '1';
							
							else
								--Wait for bram to sync before we can access again / we exit the init if all bytes were written
								if ram_access_cnt = 3 then
									MMU_STATE <= MMU_IDLE;
									ack_out <= '1'; --we tell the CPU that we are ready
								else
									--Write into next cell
									ram_access_cnt <= ram_access_cnt + 1;
									br_write_enable <= '0';
								
								end if;
								
							end if;
							
						when MMU_IDLE =>
							
							if work_in = '1' then
							
								ack_out <= '0'; --CPU has to wait until MMU has finished rw-cycle
								case cmd_in(1 downto 0) is --determination of length for operation (only used by bram, but calculated anyways)
									when "00" => ram_access_cnt <= to_unsigned(1, ram_access_cnt'length);
									when "01" => ram_access_cnt <= to_unsigned(2, ram_access_cnt'length);
									when "11" => ram_access_cnt <= to_unsigned(4, ram_access_cnt'length);
									when others => ram_access_cnt <= to_unsigned(0, ram_access_cnt'length);
								end case;
								
								--MMU starts working
								if cmd_in(2) = '1' then
									
									--Write cycle
									if unsigned(addr_in) < to_unsigned(2048, addr_in'length) then
										
										--Set base adress and also remaining bytes to write
										br_addr_in <= addr_in(10 downto 0);
										MMU_STATE <= MMU_BRAM_WRITE;
										ram_access_addr_increment <= '0'; --no increment requested in first place
										br_data_buffer <= data_in;
									else
									
										--DDR2SDRAM write access -> DDR2 Control is modified that it always negates the lower 2 bits, so 64 bit mid aligned data is prefetched
										ddr2_read_enable <= '1';
										ddr2_write_enable <= '0';
										MMU_STATE <= MMU_SDRAM_WRITE_PREFETCH;
									
									end if;
							
								else
								
									--Read cylce
									if unsigned(addr_in) < to_unsigned(2048, addr_in'length) then
										
										--Set base adress and also remaining bytes to write
										br_addr_in <= std_logic_vector(unsigned(addr_in(10 downto 0)) - 1 + unsigned(ram_access_cnt));
										MMU_STATE <= MMU_BRAM_READ;
										ram_access_addr_increment <= '0'; --no increment requested in first place
										br_data_buffer <= (others => '0');
									else
									
										--DDR2SDRAM read access -> DDR2 Control is modified that it always negates the lower 2 bits, so 64 bit with mid aligned data is loaded
										ddr2_read_enable <= '1';
										ddr2_write_enable <= '0';
										MMU_STATE <= MMU_SDRAM_READ;
										
									end if;
										
								end if;
								
							end if;
							
						when MMU_SDRAM_READ =>
							
							ddr2_read_enable <= '0';
							--We wait for valid data
							if ddr2_data_valid <= '1' then
								ddr2_data_buffer <= (others => '0');
								case to_integer(unsigned(addr_in(1 downto 0))) is
									when 0 => ddr2_data_buffer(31 downto 0) <= ddr2_data_out(31 downto 0);
									when 1 => ddr2_data_buffer(31 downto 0) <= ddr2_data_out(39 downto 8);
									when 2 => ddr2_data_buffer(31 downto 0) <= ddr2_data_out(47 downto 16);
									when 3 => ddr2_data_buffer(31 downto 0) <= ddr2_data_out(55 downto 24);
									when others => NULL;
								end case;
								MMU_STATE <= MMU_SDRAM_READ_MASK;
							end if;
							
							
						when MMU_SDRAM_READ_MASK =>
						
								data_out <= (others => '0');
								--Reassemble 8-bit, 16-bit or 32-bit data
								case to_integer(ram_access_cnt) is
									when 4 => data_out <= ddr2_data_buffer(31 downto 0);
									when 2 => data_out(15 downto 0) <= ddr2_data_buffer(15 downto 0);
									when 1 => data_out(7 downto 0) <= ddr2_data_buffer(7 downto 0);
									when others => NULL;
								end case;
								ack_out <= '1';
								MMU_STATE <= MMU_IDLE;
							
						when MMU_SDRAM_WRITE_PREFETCH =>	
						
							ddr2_data_buffer <= (others => '0');
							if ddr2_data_valid = '1' then
								ddr2_data_buffer <= ddr2_data_out;
								ddr2_read_enable <= '0';
								MMU_STATE <= MMU_SDRAM_WRITE_MASK;
							end if;
							
						when MMU_SDRAM_WRITE_MASK =>			
							--Now we apply the data input on the 64-bit prefetched data (we use cases to find the right position)
							case to_integer(ram_access_cnt) is
								when 4 =>
									--32 bit data must be applied to the right position in data buffer
									case to_integer(unsigned(addr_in(1 downto 0))) is
										when 0 => ddr2_data_buffer(31 downto 0) <= data_in;
										when 1 => ddr2_data_buffer(39 downto 8) <= data_in;
										when 2 => ddr2_data_buffer(47 downto 16) <= data_in;
										when 3 => ddr2_data_buffer(55 downto 24) <= data_in;
										when others => NULL;
									end case;
								when 2 =>
									case to_integer(unsigned(addr_in(1 downto 0))) is
										when 0 => ddr2_data_buffer(15 downto 0) <= data_in(15 downto 0);
										when 1 => ddr2_data_buffer(23 downto 8) <= data_in(15 downto 0);
										when 2 => ddr2_data_buffer(31 downto 16) <= data_in(15 downto 0);
										when 3 => ddr2_data_buffer(39 downto 24) <= data_in(15 downto 0);
										when others => NULL;
									end case;
								when 1 =>
									case to_integer(unsigned(addr_in(1 downto 0))) is
										when 0 => ddr2_data_buffer(7 downto 0) <= data_in(7 downto 0);
										when 1 => ddr2_data_buffer(15 downto 8) <= data_in(7 downto 0);
										when 2 => ddr2_data_buffer(23 downto 16) <= data_in(7 downto 0);
										when 3 => ddr2_data_buffer(31 downto 24) <= data_in(7 downto 0);
										when others => NULL;
									end case;	
								when others => NULL;	
							end case;
							
							
						
						when MMU_SDRAM_WRITE_BACK =>
							ddr2_data_in <= ddr2_data_buffer;
							ddr2_write_enable <= '1';
							MMU_STATE <= MMU_SDRAM_WRITE_DONE;
								
						when MMU_SDRAM_WRITE_DONE =>
							ddr2_write_enable <= '0';
							if ddr2_data_valid = '1' then
								ack_out <= '1';
								MMU_STATE <= MMU_IDLE;
							end if;
							
						when MMU_BRAM_WRITE =>
						
							-- Write cycle
							if ram_access_addr_increment = '1' then
							
								br_addr_in <= std_logic_vector(unsigned(br_addr_in) + 1);
								ram_access_cnt <= ram_access_cnt - 1;
								br_data_buffer(7 downto 0) <= br_data_buffer(15 downto 8); --next byte will be written
								ram_access_addr_increment <= '0';
								br_write_enable <= '0'; -- no write during increment
							
							else
								if ram_access_cnt = 0 then
									--Write done, return to idle state / this costs an extra frame which is required for sync with BRAM
									MMU_STATE <= MMU_IDLE;
									ack_out <= '1';
									
								else
									br_data_in <= br_data_buffer(7 downto 0);
									br_write_enable <= '1'; --write byte to BRAM
								end if;
							
							end if;
							
						when MMU_BRAM_READ =>
						
							-- Read cylce
							if ram_access_addr_increment = '1' then
							
								br_addr_in <= std_logic_vector(unsigned(br_addr_in) - 1); --as we recieve base_addr + size - 1 as first adress we subtract (we recieve MSB first)
								ram_access_cnt <= ram_access_cnt - 1;
								br_data_buffer(31 downto 8) <= br_data_buffer(23 downto 0); --lshift information read so far by eight
								ram_access_addr_increment <= '0';
								br_write_enable <= '0'; -- always read
							
							else
								if ram_access_cnt = 0 then
									--Write done, return to idle state / this costs an extra frame which is required for sync with BRAM
									MMU_STATE <= MMU_IDLE;
									ack_out <= '1';
									data_out <= br_data_buffer;
								else
									br_write_enable <= '0'; --always read
									br_data_buffer(31 downto 24) <= br_data_out; --we can expect that the address was assinged a frame before (either by addr_increment or IDLE state), so the data must be valid
								end if;
							
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
			write_enable => br_write_enable,
			read_enable => br_read_enable
	);
	
	INST_DDR2_Control_VHDL : DDR2_Control_VHDL
	PORT MAP (
		 reset_in => reset_in,
		 clk_in => clk_in,
		 clk90_in => clk90_in,

		 maddr   => addr_in(15 downto 0),
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
	