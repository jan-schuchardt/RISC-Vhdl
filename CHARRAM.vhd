----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:23 11/11/2016 
-- Design Name: 
-- Module Name:    CHARRAM - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CHARRAM is
port(
		clk : in std_logic;
		rst : in std_logic;
		addr_in : in std_logic_vector(8 downto 0); --9 bit for adressing 512 32-bit cells
		data_in : in std_logic_vector(31 downto 0);
		data_out: out std_logic_vector(31 downto 0);
			
		write_enable : in std_logic;
		
		char_out: out std_logic_vector(7 downto 0);	
		char_addr_in : in std_logic_vector( 10 downto 0)
);

end CHARRAM;

architecture Behavioral of CHARRAM is




type mem_t is array (0 to 511) of std_logic_vector(31 downto 0);  -- 128 cells with 32 bit / 1024 with 8 bit
	signal cells : mem_t:= (


"00000001"&"00000001"&"00000001"&"00000001",
"00000000"& "00000001"& "00000000"&"00000001",

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
				
				
				case char_addr_in(1 downto 0) is
				
				when "00" => char_out <= cells(to_integer(unsigned(char_addr_in (9 downto 2))))(31 downto 24);--right order?  should be 10 NOT 9
				
				when "01" => char_out <= cells(to_integer(unsigned(char_addr_in (9 downto 2))))(23 downto 16);
				
				when "10" => char_out <= cells(to_integer(unsigned(char_addr_in (9 downto 2))))(15 downto 8);
				
				when "11" => char_out <= cells(to_integer(unsigned(char_addr_in (9 downto 2))))(7 downto 0);
				
					when others => NULL;
				
				
				
				end case;
				
			
			end if;
						
			
		end if;
			
	end process;

end Behavioral;

