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
		addr_in : in std_logic_vector(10 downto 0); --11 Bit Adress enables 2048 8-Bit cells
		data_in : in std_logic_vector(63 downto 0);
		data_out: out std_logic_vector(63 downto 0);
		write_enable : in std_logic
);

end BLOCKRAM;

architecture Behavioral of BLOCKRAM is

	type mem_t is array (0 to 255) of std_logic_vector(63 downto 0);  -- 256 cells with 64 bit
	signal cells : mem_t:= (
		--addi x1, x0, 0xAAA
		--ori x2, x1, 0x555
		"0101010101010000111000010001001110101010101000000000000010010011",

		--andi x3, x2, 0xAAA
		--xori x4, x3, 0x5AA
		"0101101010100001110000100001001110101010101000010111000110010011",

		--xori x5, x4, 0x0FF
		--srai x7, x5, 2
		"0100000000100010110100111001001100001111111100100100001010010011",

		--srli x8, x7, 3
		--slli x9, x8, 2
		"0000000000100100000101001001001100000000001100111101010000010011",

		--add x10, x5, x3
		--sub x11, x1, x2
		"0100000000100000100001011011001100000000001100101000010100110011",

		--lui x12, 0x2
		--lui x13, 0x3
		"0000000000000000001101101011011100000000000000000010011000110111",

		--sra x14, x11, x12
		--srl x15, x11, x13
		"0000000011010101110101111011001101000000110001011101011100110011",

		--sll x16, x11, x12
		--NOP
		"0000000000000000000000000000000000000000110001011001100000110011",

others=>(others=>'0')


	
	);
	signal test1: std_logic_vector(31 downto 0); -- Singal used for init
	
	attribute ram_style: string;
	attribute ram_style of cells : signal is "block";
	
begin
	

	process(clk) begin
	
		
		
		if rising_edge(clk) then
		
			if rst = '0' then
			--No reset -> standard dual-port usage
				if write_enable = '1'then
					cells(to_integer(unsigned(addr_in(10 downto 3)))) <= data_in;
				end if;
				data_out <= cells(to_integer(unsigned(addr_in(10 downto 3))));
			
			end if;
			
			
			
			
		end if;
			
	end process;

end Behavioral;



