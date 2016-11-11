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

Component charmap is
Port ( addr : in  STD_LOGIC_vector( 7 downto 0);
           clk : in  STD_LOGIC;
           data : out  STD_LOGIC_vector (63 downto 0)
			  );
			  
			  end component charmap;


signal curr_char : std_logic_vector(7 downto 0);
--signal curr_char_pixels: std_logic_vector(25 downto 0);
signal curr_addr: unsigned (1023 downto 0);
signal curr_bitfield : std_logic_vector(63 downto 0);
signal curr_pixel : std_logic;




begin
--testing
pixel_out <= curr_pixel; 


curr_char <="00000000"; --char_in

--curr_bitfield <= "00000000"& --A  
--					"01111110"&
--					"01100110"&
--					"01100110"&
--					"01111110"&
--					"01100110"&
--					"01100110"&
--					"00000000";

process (clk)
begin

if (rising_edge (clk) ) then
	curr_addr <= unsigned(y_in(9 downto 3) & "000000") + unsigned(x_in(9 downto 3)); -- (y/8)*64 + x/8
 
 
	curr_pixel <= curr_bitfield( to_integer(unsigned(x_in(2 downto 0)) + unsigned(y_in(2 downto 0)&"000"))); -- x + y*8
	
	--curr_addr <= (integer(x_in) mod integer(6));

--	if ( integer(x_in) / 8 = integer(0) ) then
--	end if;
	
	--todo:logic
	--todo: 


end if;


end process;


inst_charmap : CHARMAP 
port map
(
	addr => curr_char,
	clk => clk,
	data => curr_bitfield
);


end Behavioral;

