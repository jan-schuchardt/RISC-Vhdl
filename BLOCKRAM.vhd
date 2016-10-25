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



--lui x1, 0x10000
--lui x10, 0xFFFFF
"1111111111111111111101010011011100010000000000000000000010110111",

--addi x10, x10, 0xFFF
--lui x11, 0xAAAAA
"1010101010101010101001011011011111111111111101010000010100010011",

--addi x11, x11, 0xAAA
--lw x4, x1, 0x000
"0000000000000000101000100000001110101010101001011000010110010011",

--lw x5, x1, 0x008
--lw x6, x1, 0x000
"0000000000000000101000110000001100000000100000001010001010000011",

--sw x1, x10, 0x000
--sw x1, x11, 0x008
"0000000010110000101001000010001100000000101000001010000000100011",

--lw x7, x1, 0x000
--lw x8, x1, 0x008
"0000000010000000101001000000001100000000000000001010001110000011",

--addi x1, x0, 0x3
--addi x2, x0, 0x4
"0000000001000000000000010001001100000000001100000000000010010011",

--mul x3, x2, x1
--div x4, x3, x1
"0000001000010001110000100011001100000010000100010000000110110011",

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



