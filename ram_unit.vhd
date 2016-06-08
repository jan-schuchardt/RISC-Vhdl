----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:25:29 06/07/2016 
-- Design Name: 
-- Module Name:    ram_unit - Behavioral 
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

entity ram_unit is
	port(   clk     : in std_logic;
            rst     : in std_logic;


				addr : in std_logic_vector(31 downto 0); --used for read and write since write and read can never be performed together
				data : inout std_logic_vector (31 downto 0); --used for read and write since write and read can never be performed together
				width : in std_logic_vector(1 downto 0); --encoding for different data sizes (8, 16, 32)
				
				out_ready : out std_logic; --is ram unit done with its task
				
				w : in std_logic; --perform write
				r : in std_logic --perform read
			
         );
end ram_unit;



architecture Behavioral of ram_unit is

signal test_delay : unsigned(1 downto 0) := (others => '0'); --delay timer for the ram unit
signal ready : std_logic := '1';

begin 
	out_ready <= ready;
	ram_cycle : process(clk, rst)
	begin
		if rst = '1' then
			--reset the ram unit by aborting everything
			data <= (others => '0');
			ready <= '0';
		else
		
			if ready = '1' then
				
				if r = '1' and w = '0' then
						
						--provide an dummy output that matches the requested data width
						ready <= '0';
						test_delay <= "00";
						
						case width is
							
							when "00" => --8 bit value
								data <= (7 downto 0 => '1', others => '0');
							
							when "01" => --16 bit value
								data <= (15 downto 0 => '1', others => '0');
								
							when "10" => --32 bit value
								data <= (31 downto 0 => '1', others => '0');
							
							when others => NULL;
						
						end case;
					
				
				elsif w = '1' and r = '0' then
						ready <= '0';
						test_delay <="00";
						
						--we dont have to do anything to simulate a write

					
				end if;
			else
				--simulate a delay for the ram unit
				if to_integer(test_delay) = 3 then
					ready <= '1';
				else
					test_delay <= test_delay + 1;
				end if;
				
			
			end if;
		
		end if;
		
	end process;


end Behavioral;

