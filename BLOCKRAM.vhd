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
--addi x1, x0, 0
"10010011","00000000","00000000","00000000",

--lui x1, 0x10000
"10110111","00000000","00000000","00010000",

--addi x2, x0, 0x666
"00010011","00000001","01100000","01100110",

--lui x2, 0x66666
"00110111","01100001","01100110","01100110",

--addi x3, x0, 0x999
"10010011","00000001","10010000","10011001",

--lui x3, 0x99999
"10110111","10010001","10011001","10011001",

--lw x4, x1, 0
"00000011","10100010","00000000","00000000",

--lw x5, x1, 4
"10000011","10100010","01000000","00000000",

--lw x6, x1, 8
"00000011","10100011","10000000","00000000",

--lw x7, x1, 12
"10000011","10100011","11000000","00000000",

--sw x1, x2, 0
"00100011","10100000","00100000","00000000",

--lw x8, x1, 0
"00000011","10100100","00000000","00000000",

--lw x9, x1, 0
"10000011","10100100","00000000","00000000",

--lw x10, x1, 0
"00000011","10100101","00000000","00000000",

--lw x11, x1, 0
"10000011","10100101","00000000","00000000",

--sw x1, x2, 5
"10100011","10100010","00100000","00000000",

--lw x12, x1, 0
"00000011","10100110","00000000","00000000",

--lw x13, x1, 0
"10000011","10100110","00000000","00000000",

--lw x14, x1, 0
"00000011","10100111","00000000","00000000",

--lw x15, x1, 0
"10000011","10100111","00000000","00000000",

--sh x1, x3, 8
"00100011","10010100","00110000","00000000",

--lw x16, x1, 0
"00000011","10101000","00000000","00000000",

--lw x17, x1, 4
"10000011","10101000","01000000","00000000",

--lw x18, x1, 8
"00000011","10101001","10000000","00000000",

--lw x19, x1, 12
"10000011","10101001","11000000","00000000",

--sh x1, x3, 11
"10100011","10010101","00110000","00000000",

--lw x20, x1, 0
"00000011","10101010","00000000","00000000",

--lw x21, x1, 0
"10000011","10101010","00000000","00000000",

--lw x22, x1, 0
"00000011","10101011","00000000","00000000",

--lw x23, x1, 0
"10000011","10101011","00000000","00000000",

--sb x1, x3, 14
"00100011","10000111","00110000","00000000",

--lw x24, x1, 0
"00000011","10101100","00000000","00000000",

--lw x25, x1, 0
"10000011","10101100","00000000","00000000",

--lw x26, x1, 0
"00000011","10101101","00000000","00000000",

--lw x27, x1, 0
"10000011","10101101","00000000","00000000",

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
