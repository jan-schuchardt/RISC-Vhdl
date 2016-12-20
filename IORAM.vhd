----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:00:44 12/20/2016 
-- Design Name: 
-- Module Name:    IORAM - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IORAM is

port(

		clk : in std_logic;
		rst : in std_logic;

		pin_in : in std_logic_vector(15 downto 0);
		pin_out : out std_logic_vector(15 downto 0);
		
		addr_in : in std_logic_vector(1 downto 0); --2 bit for 32 bit IO access
		data_in : in std_logic_vector(7 downto 0);
		data_out: out std_logic_vector(7 downto 0);
		write_enable : in std_logic
);

end IORAM;




architecture Behavioral of IORAM is

	signal ro_pins : std_logic_vector(15 downto 0);
	signal rw_pins : std_logic_vector(15 downto 0);

	


begin
	
	ro_pins <= pin_in;
	pin_out <= rw_pins;

	process(clk) begin
	
	
		if rising_edge(clk) then
		
			if rst = '0' then
			--No reset -> standard usage
				if write_enable = '1' then
					case addr_in is
						--when "11" => rw_pins(15 downto 8) <= data_in; zero bits
						when "10" => rw_pins(7 downto 0) <= data_in;
						when others=>NULL; --Write only allowed to adresses 2,3
					end case;
				
				else
					case addr_in is
						when "01" => data_out <= ro_pins(15 downto 8);
						when "00" => data_out <= ro_pins(7 downto 0);
						when "11" => data_out <= (others=>'0'); --rw_pins(15 downto 8); zero bits
						when "10" => data_out <= rw_pins(7 downto 0);
						when others =>NULL;
					end case;
				end if;
					
			else
				rw_pins <= (others => '0'); --after reset the out regs are zero initialized
			
			end if;
			
		end if;
			
	end process;

end Behavioral;

