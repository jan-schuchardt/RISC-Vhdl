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

--addi x1, x0, 0x3
--addi x2, x0, 0x4
"0000000001000000000000010001001100000000001100000000000010010011",

--mul x3, x1, x2
--addi x3, x3, 0x1
"0000000000010001100000011001001100000010001000001000000110110011",

--rem x4, x3, x2
--rem x5, x3, x2
"0000001000100001111000101011001100000010001000011110001000110011",

--rem x6, x3, x2
--rem x7, x3, x2
"0000001000100001111000111011001100000010001000011110001100110011",

--div x8, x3, x2
--div x9, x3, x2
"0000001000100001110001001011001100000010001000011100010000110011",

--div x10, x3, x2
--div x11, x3, x2
"0000001000100001110001011011001100000010001000011100010100110011",

--rem x12, x3, x2
--rem x13, x3, x2
"0000001000100001111001101011001100000010001000011110011000110011",

--rem x14, x3, x2
--rem x15, x3, x2
"0000001000100001111001111011001100000010001000011110011100110011",

--div x16, x3, x2
--div x17, x3, x2
"0000001000100001110010001011001100000010001000011100100000110011",

--div x18, x3, x2
--div x19, x3, x2
"0000001000100001110010011011001100000010001000011100100100110011",

--rem x20, x3, x1
--rem x21, x3, x1
"0000001000010001111010101011001100000010000100011110101000110011",

--rem x22, x3, x1
--rem x23, x3, x1
"0000001000010001111010111011001100000010000100011110101100110011",

--div x24, x3, x1
--div x25, x3, x1
"0000001000010001110011001011001100000010000100011100110000110011",

--div x26, x3, x1
--div x27, x3, x1
"0000001000010001110011011011001100000010000100011100110100110011",

--rem x28, x3, x1
--rem x29, x3, x1
"0000001000010001111011101011001100000010000100011110111000110011",

--div x30, x3, x1
--div x31, x3, x1
"0000001000010001110011111011001100000010000100011100111100110011",

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



