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
	
--lui x1, 0x10000
"00010000000000000000000010110111",

--addi x1, x1, 0x100
"00010000000000001000000010010011",

--addi x30, x0, 0x100
"00010000000000000000111100010011",

--lui x28, 0x20000
"00100000000000000000111000110111",

--addi x29, x29, 0x001
"00000000000111101000111010010011",

--addi x28, x28, 0x001
"00000000000111100000111000010011",

--sb x28, x29, 0
"00000001110111100000000000100011",

--bne x29, x30, mar0
"11111111111011101001110111100011",

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
