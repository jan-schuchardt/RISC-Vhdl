----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:16:45 11/10/2016 
-- Design Name: 
-- Module Name:    CHARMAP - Behavioral 
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

entity CHARMAP is
    Port ( addr : in  STD_LOGIC_vector( 7 downto 0);
           clk : in  STD_LOGIC;
           data : out  STD_LOGIC_vector (63 downto 0)
			  );
end CHARMAP;

architecture Behavioral of CHARMAP is

type mem_t is array (0 to 255) of std_logic_vector(63 downto 0);  -- 512 cells with 32 bit
	signal cells : mem_t:= (
					"00000000"& --A
					"01111110"&
					"01100110"&
					"01100110"&
					"01111110"&
					"01100110"&
					"01100110"&
					"00000000",
					
					
					"00000000"& --B
					"01111100"&
					"01100110"&
					"01100110"&
					"01111100"&
					"01100110"&
					"01111100"&
					"00000000",
					
					others=>(others=>'0')
					
					);
					
					attribute ram_style: string;
	attribute ram_style of cells : signal is "block";
begin



	process(clk) begin
	
		
		
		if rising_edge(clk) then
		
			
			
				data <= cells(to_integer(unsigned(addr)));
			
			
			
			
			
			
		end if;
			
	end process;

end Behavioral;

