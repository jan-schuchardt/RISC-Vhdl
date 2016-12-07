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
	
	--lui x2, 0x20000
"00100000000000000000000100110111",

--addi x2, x2, 0x030
"00000011000000010000000100010011",

--lui x7, 0x41414
"01000001010000010100001110110111",

--addi x7, x7, 0x141
"00010100000100111000001110010011",

--sw x2, x7, 0x000
"00000000011100010010000000100011",

--addi x2, x2, 0x004
"00000000010000010000000100010011",

--lui x7, 0x00000
"00000000000000000000001110110111",

--addi x7, x7, 0x041
"00000100000100111000001110010011",

--sw x2, x7, 0x000
"00000000011100010010000000100011",

--addi x2, x2, 0x004
"00000000010000010000000100010011",

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
