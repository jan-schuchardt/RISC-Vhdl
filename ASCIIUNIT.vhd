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
signal curr_addr: unsigned (2047 downto 0);
signal curr_bitfield : std_logic_vector(0 to 63);
signal curr_pixel : std_logic;
--signal curr_addr_out : std_logic_vector(9 downto 0) :="0000000000";
signal const : std_logic_vector(31 downto 0) := x"00000002";

signal temp_x : std_logic_vector( 31 downto 0);


begin
--testing
pixel_out <= curr_pixel; 


--curr_char <="00000000"; --char_in


curr_char <= char_in; --"00000001"  when y_in(5) = '1' and x_in(4) = '1' else "00000000";--testing  should be <= char_in


process (clk)
begin

if (rising_edge (clk) ) then

	temp_x <= std_logic_vector(unsigned(x_in) + unsigned(const));
	
	addr_out <= std_logic_vector(unsigned(y_in(9 downto 3) & "000000") + unsigned(temp_x(9 downto 3))); -- (y/8)*64 + (x-1)/8  should be x+2? 
 
 
	curr_pixel <= curr_bitfield( to_integer( unsigned(x_in(2 downto 0)) + unsigned(y_in(2 downto 0)&"000"))); -- x + y*8
	
	


end if;


end process;


inst_charmap : CHARMAP 
port map
(
	addr => curr_char, -- testing purpose  later: addr => char_in,
	clk => clk,
	data(63 downto 0) => curr_bitfield(0 to 63) -- reverting input, better readability in CHARMAP
);


end Behavioral;

