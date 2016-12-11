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
		addr_in : in std_logic_vector(10 downto 0); --11 bit for adressing 8-bit cells
		data_in : in std_logic_vector(7 downto 0);
		data_out: out std_logic_vector(7 downto 0);
		write_enable : in std_logic
);

end BLOCKRAM;

architecture Behavioral of BLOCKRAM is

	type mem_t is array (0 to 2047) of std_logic_vector(7 downto 0);  -- 2048 cells with 8 bit
	signal cells : mem_t:= (
	
	
	--lui x3, 0x20000
"10110111","00000001","00000000","00100000",

--addi x3, x3, 0x000
"10010011","10000001","00000001","00000000",

--addi x2, x0, 0x030
"00010011","00000001","00000000","00000011",

--addi x4, x0, 0x03A
"00010011","00000010","10100000","00000011",

--addi x5, x0, 0x047
"10010011","00000010","01110000","00000100",

--addi x6, x0, 0x011
"00010011","00000011","00010000","00000001",

--sb x3, x2, 0x000
"00100011","10000000","00100001","00000000",

--addi x2, x2, 0x001
"00010011","00000001","00010001","00000000",

--addi x3, x3, 0x001
"10010011","10000001","00010001","00000000",

--blt x2, x4, init1
"11100011","01001010","01000001","11111110",

--bge x4, x5, init2
"01100011","01011000","01010010","00000000",

--addi x2, x0, 0x041
"00010011","00000001","00010000","00000100",

--add x4, x0, x5
"00110011","00000010","01010000","00000000",

--jal x0, init1
"01101111","11110000","01011111","11111110",

--sub x3, x3, x6
"10110011","10000001","01100001","01000000",

--jal x0, start
"01101111","00000000","11000000","00000101",

--addi x8, x0, 0x007
"00010011","00000100","01110000","00000000",

--add x7, x0, x10
"10110011","00000011","10100000","00000000",

--sll x8, x8, 0x2
"00110011","00010100","00100100","00000000",

--srl x7, x7, x8
"10110011","11010011","10000011","00000000",

--srl x8, x8, 0x2
"00110011","01010100","00100100","00000000",

--andi x7, x7, 0x00F
"10010011","11110011","11110011","00000000",

--add x7, x7, x3
"10110011","10000011","00110011","00000000",

--lb x7, x7, 0x000
"10000011","10000011","00000011","00000000",

--add x6, x2, x8
"00110011","00000011","10000001","00000000",

--sb x6, x7, 0x000
"00100011","00000000","01110011","00000000",

--addi x8, x8, 0xFFF
"00010011","00000100","11110100","11111111",

--blt x0, x8, print_dword1
"11100011","01001100","10000000","11111100",

--jalr x0, x1, 0x000
"01100111","10000000","00000000","00000000",

--add x6, x2, x0
"00110011","00000011","00000001","00000000",

--add x8, x10, x0
"00110011","00000100","00000101","00000000",

--add x7, x0, x0
"10110011","00000011","00000000","00000000",

--lb x7, x8, 0x000
"10000011","00000011","00000100","00000000",

--sb x6, x7, 0x000
"00100011","00000000","01110011","00000000",

--addi x6, x6, 0x001
"00010011","00000011","00010011","00000000",

--addi x8, x8, 0x001
"00010011","00000100","00010100","00000000",

--bne x7, x0, print_string1
"11100011","10011000","00000011","11111110",

--jalr x0, x1, 0x000
"01100111","10000000","00000000","00000000",

--lui x10, 0x6789a
"00110111","10100101","10001001","01100111",

--addi x10, x10, 0xbcd
"00010011","00000101","11010101","10111100",

--lui x2, 0x20000
"00110111","00000001","00000000","00100000",

--addi x2, x2, 0x020
"00010011","00000001","00000001","00000010",

--jal x1, print_dword
"11101111","11110000","10011111","11111001",



----addi x30, x0, 0x7FF
--"00010011","00001111","11110000","01111111",
--
----lui x28, 0x20000
--"00110111","00001110","00000000","00100000",
--
----addi x29, x29, 0x001
--"10010011","10001110","00011110","00000000",
--
----addi x28, x28, 0x001
--"00010011","00001110","00011110","00000000",
--
----sb x28, x29, 0
--"00100011","00000000","11011110","00000001",
--
----bne x29, x30, mar0
--"11100011","10011010","11101110","11111111",
--




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

