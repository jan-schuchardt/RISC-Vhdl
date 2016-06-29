----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:36 04/20/2016 
-- Design Name: 
-- Module Name:    toplevel - Behavioral 
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

entity toplevel is
    Port ( clk : in  STD_LOGIC;
			  slow : IN STD_LOGIC;
           rst : in  STD_LOGIC;
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
           r : out  STD_LOGIC_VECTOR (3 downto 0);
           g : out  STD_LOGIC_VECTOR (3 downto 0);
           b : out  STD_LOGIC_VECTOR (3 downto 0);
			  err_out : out std_logic);
end toplevel;

architecture Behavioral of toplevel is

COMPONENT vga
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		
		rgb : IN std_logic_vector(11 downto 0);          
		x : OUT std_logic_vector(9 downto 0);
		y : OUT std_logic_vector(9 downto 0);
		offs : OUT std_logic;
		r : OUT std_logic_vector(3 downto 0);
		g : OUT std_logic_vector(3 downto 0);
		b : OUT std_logic_vector(3 downto 0);
		h : OUT std_logic;
		v : OUT std_logic;
		reg_in: in std_logic_vector(31 downto 0);
		reg_adr_in : in std_logic_vector(4 downto 0)
		);
	END COMPONENT;
	
	COMPONENT vga_clk
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKDV_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;
	
	signal clk25 : std_logic;
	signal rgb : std_logic_vector(11 downto 0) := (others => '0');
	signal x, y : std_logic_vector(9 downto 0);
	signal offs : std_logic;
	
	signal debug:std_logic_vector(31 downto 0);
	signal debug_adr: std_logic_vector(4 downto 0);
	
	signal clk_cpu : std_logic;

begin


Inst_vga: vga PORT MAP(
		clk => clk25,
		rst => rst,
		rgb => rgb,
		x => x,
		y => y,
		offs => offs,
		r => r,
		g => g,
		b => b,
		h => hsync,
		v => vsync,
		reg_in => debug,
		reg_adr_in => debug_adr
	);
	
Inst_vga_clk: vga_clk PORT MAP(
		CLKIN_IN => clk,
		RST_IN => rst,
		CLKDV_OUT => clk25,
		CLKIN_IBUFG_OUT => open,
		CLK0_OUT => clk_cpu,
		LOCKED_OUT => open
	);

PROZESSOR: entity work.cpu PORT MAP(
	cpu_rst_in => rst,
	cpu_clk_in => clk_cpu, --clk25,
	cpu_debug_out => debug,
	cpu_debug_adr_out => debug_adr,
	cpu_slow_in => slow,
	cpu_err_out => err_out
);
end Behavioral;

