-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Franz
-- 
-- Create Date:    10/11/2016 22:40:10
-- Project Name:   Ascii
-- Module Name:    Ascii_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Ascii_tb is
end    Ascii_tb;

architecture Testbench of Ascii_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Ascii
--      port( );
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: Ascii use entity WORK.Ascii(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   --Sustituir <clock> por el nombre de puerto apropiado
  signal   clk : std_logic := '0';
   constant clock_period : time := 50 ps;
  signal   clock_on : boolean := true;



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



signal			  char_in :  STD_LOGIC_VECTOR(7 downto 0);
signal           x_in :  std_logic_vector(9 downto 0);
signal           y_in :  std_logic_vector(9 downto 0);
signal           pixel_out :  STD_LOGIC;
signal           addr_out :  STD_LOGIC_VECTOR(10 downto 0);


begin



   -- Instantiate the Unit Under Test (UUT)
 --  uut: Ascii port map ( );

-- Clock process (uncomment if needed)
-- Descomentar en caso de requerir senial de reloj
-- Sustituir <clock> por el nombre de puerto apropiado
clock_process : process
begin
   while (clock_on) loop
     clk <= '0';
      wait for clock_period/2;
      clk <= '1';
      wait for clock_period/2;
   end loop;
   --assert (false) report ("Finished") severity error;
   -- Wait forever
   wait;
 end process;



--testing
pixel_out <= curr_pixel; 


curr_char <="00000000";

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




-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ps;

   ---------------------------------------------------------
   -- insert stimulus here
   ---------------------------------------------------------



	char_in <= "00000000";
   x_in <= "0000000000";
	y_in <= "0000000001";
   wait for 100 ps;
   x_in <= "0000000001";
	y_in <= "0000000001";
   wait for 100 ps;
   x_in <= "0000000010";
	y_in <= "0000000001";
   wait for 100 ps;
   x_in <= "0000000011";
	y_in <= "0000000001";
   wait for 100 ps;
   x_in <= "0000000100";
	y_in <= "0000000001";
   wait for 100 ps;
   x_in <= "0000000101";
	y_in <= "0000000001";
   wait for 100 ps;
   x_in <= "0000000111";
	y_in <= "0000000001";
   wait for 100 ps;
   x_in <= "0000001000";
	y_in <= "0000000001";
   wait for 100 ps;
 



 -- assert (<condition>) report "Error case 1" severity error;

   -- Test case 2
   -- ... Asignaciones a seniales de entrada ...
   wait for 100 ps;
   -- assert (<condition>) report "Error case 2" severity error;

   -- Stop clock
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;



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

