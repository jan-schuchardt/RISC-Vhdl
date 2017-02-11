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
		

		--lui x1, 0x40000
		"10110111","00000000","00000000","01000000",

		--jalr x0, x1, 0
		"01100111","10000000","00000000","00000000",

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
