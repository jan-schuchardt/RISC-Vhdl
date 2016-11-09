----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:18:20 11/09/2016 
-- Design Name: 
-- Module Name:    ASCIIUNIT - Behavioral 
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

entity ASCIIUNIT is
    Port ( clk : in std_logic;
			  char_in : in  STD_LOGIC_VECTOR(7 downto 0);
           x_in : in  std_logic_vector(9 downto 0);
           y_in : in  std_logic_vector(9 downto 0);
           pixel_out : out  STD_LOGIC;
           addr_out : out  STD_LOGIC_VECTOR(10 downto 0)
			  );
end ASCIIUNIT;

architecture Behavioral of ASCIIUNIT is

signal curr_char : std_logic_vector(7 downto 0);
signal curr_char_pixels: std_logic_vector(25 downto 0);
signal curr_addr: unsigned(10 downto 0);


begin
--testing
pixel_out <= '1' when x_in = y_in; 

process (clk)
begin

if (rising_edge (clk) ) then
 
	--curr_addr <= (unsigned(x_in) / unsigned(6));

	--if ( unsigned(x_in) / unsigned(6) = unsigned(0) ) then
	--end if;
	
	--todo:logic
	--todo: 


end if;


end process;



end Behavioral;

