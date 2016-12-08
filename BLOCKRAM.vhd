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

--lui x3, 0x20000
"00100000000000000000000110110111",

--addi x3, x3, 0x000
"00000000000000011000000110010011",

--addi x2, x0, 0x030
"00000011000000000000000100010011",

--addi x4, x0, 0x03A
"00000011101000000000001000010011",

--addi x5, x0, 0x047
"00000100011100000000001010010011",

--addi x6, x0, 0x011
"00000001000100000000001100010011",

--sb x3, x2, 0x000
"00000000001000011000000000100011",

--addi x2, x2, 0x001
"00000000000100010000000100010011",

--addi x3, x3, 0x001
"00000000000100011000000110010011",

--blt x2, x4, init1
"11111110010000010100101011100011",

--bge x4, x5, init2
"00000000010100100101100001100011",

--addi x2, x0, 0x041
"00000100000100000000000100010011",

--add x4, x0, x5
"00000000010100000000001000110011",

--jal x0, init1
"11111110010111111111000001101111",

--sub x3, x3, x6
"01000000011000011000000110110011",

--jal x0, start
"00000101110000000000000001101111",

--addi x8, x0, 0x007
"00000000011100000000010000010011",

--add x7, x0, x10
"00000000101000000000001110110011",

--sll x8, x8, 0x2
"00000000001001000001010000110011",

--srl x7, x7, x8
"00000000100000111101001110110011",

--srl x8, x8, 0x2
"00000000001001000101010000110011",

--andi x7, x7, 0x00F
"00000000111100111111001110010011",

--add x7, x7, x3
"00000000001100111000001110110011",

--lb x7, x7, 0x000
"00000000000000111000001110000011",

--add x6, x2, x8
"00000000100000010000001100110011",

--sb x6, x7, 0x000
"00000000011100110000000000100011",

--addi x8, x8, 0xFFF
"11111111111101000000010000010011",

--blt x0, x8, print_dword1
"11111100100000000100110011100011",

--jalr x0, x1, 0x000
"00000000000000001000000001100111",

--add x6, x2, x0
"00000000000000010000001100110011",

--add x8, x10, x0
"00000000000001010000010000110011",

--add x7, x0, x0
"00000000000000000000001110110011",

--lb x7, x8, 0x000
"00000000000001000000001110000011",

--sb x6, x7, 0x000
"00000000011100110000000000100011",

--addi x6, x6, 0x001
"00000000000100110000001100010011",

--addi x8, x8, 0x001
"00000000000101000000010000010011",

--bne x7, x0, print_string1
"11111110000000111001100011100011",

--jalr x0, x1, 0x000
"00000000000000001000000001100111",

--lui x10, 0x6789a
"01100111100010011010010100110111",

--addi x10, x10, 0xbcd
"10111100110101010000010100010011",

--lui x2, 0x20000
"00100000000000000000000100110111",

--addi x2, x2, 0x020
"00000010000000010000000100010011",

--jal x1, print_dword
"11111001100111111111000011101111",

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
