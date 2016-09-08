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
		reset_in : in std_logic;
		mmu_adr_out   : in std_logic_vector(4 downto 0);
		mmu_data_out : in std_logic_vector(31 downto 0);
		mmu_data_in : out std_logic_vector(31 downto 0);
		mask : in std_logic_vector(1 downto 0);
		mwe	  : in std_logic;
		mrd    : in std_logic;
		valid : out std_logic
);

end BLOCKRAM;

architecture Behavioral of BLOCKRAM is


	

	type blocks is array (0 to 31) of std_logic_vector(7 downto 0);  -- 32 Cells with 8 bit 
	signal blockram : blocks:= (others => (others => '0'));
	signal test1: std_logic_vector(31 downto 0);
	
begin

process(clk) begin

if rising_edge(clk) then
	if reset_in = '1' then
	
--	blockram <= (others => (others => '0'));
	
	test1 <= "000000000011" & "00001" & "000" & "00001" & "00100" & "11";
	blockram(0)<= test1(7 downto 0);
	blockram(1)<= test1(15 downto 8);
	blockram(2)<= test1(23 downto 16);
	blockram(3)<= test1(31 downto 24);
	
	
else
		if mrd = '1' then 
		mmu_data_in<=std_logic_vector'(blockram(to_integer(unsigned(mmu_adr_out)+3)) & blockram(to_integer(unsigned(mmu_adr_out)+2))
			& blockram(to_integer(unsigned(mmu_adr_out)+1)) & blockram(to_integer(unsigned(mmu_adr_out)+0)));
			valid <= '1';
									
		elsif mwe = '1' then
			case mask(1 downto 0) is  -- edge case: adress 2047 no 32 bit read/write
				when "00" => --8 bit access
					blockram(to_integer(unsigned(mmu_adr_out)))<= mmu_data_out(7 downto 0);
				when "01" => --16 bit access
					
					blockram(to_integer(unsigned(mmu_adr_out)))<= mmu_data_out(7 downto 0);
					blockram(to_integer(unsigned(mmu_adr_out)) + 1)<= mmu_data_out(15 downto 8);
				when "11" => --32 bit access
					
					blockram(to_integer(unsigned(mmu_adr_out)))<= mmu_data_out(7 downto 0);
					blockram(to_integer(unsigned(mmu_adr_out)) + 1)<= mmu_data_out(15 downto 8);
					blockram(to_integer(unsigned(mmu_adr_out)) + 2)<= mmu_data_out(23 downto 16);
					blockram(to_integer(unsigned(mmu_adr_out)) + 3)<= mmu_data_out(31 downto 24);
				when others => NULL;
			end case;
				valid <= '1';
				
		else
		
			valid <= '0';
		end if;
	end if;
end if;
end process;

end Behavioral;

