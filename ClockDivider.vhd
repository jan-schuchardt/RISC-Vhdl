----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:56:49 06/20/2016 
-- Design Name: 
-- Module Name:    ClockDivider - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ClockDivider is
port(clk_in, rst_in, slow_in: in std_logic;
clk_out: out std_logic);
end ClockDivider;

architecture Behavioral of ClockDivider is

signal counter:unsigned(31 downto 0);
signal clk_sgn: std_logic;

begin

clk_out <= clk_sgn when slow_in = '1' else clk_in;

process(clk_in, rst_in)
begin
	if rst_in = '1' then
		clk_sgn <= '0';
		counter <= (others => '0');
	elsif rising_edge(clk_in) then
		if counter >= x"17D7840" then
			counter <= (others => '0');
			clk_sgn <= not clk_sgn;
		else
			counter <= counter + "1";
		end if;
	end if;
end process;






end Behavioral;

