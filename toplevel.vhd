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
			  err_out : out std_logic;
			  
			    -- ddr2
			SD_DQ            : inout std_logic_vector(7 downto 0);
			SD_A                 : out   std_logic_vector(15 downto 0);
			SD_BA               : out   std_logic_vector(2 downto 0);
			SD_CKE               : out   std_logic;
			SD_CS              : out   std_logic;
			SD_RAS             : out   std_logic;
			SD_CAS             : out   std_logic;
			SD_WE              : out   std_logic;
			SD_ODT               : out   std_logic;
			LOOP_IN         : in    std_logic;
			LOOP_OUT        : out   std_logic;
			--sys_clkb                      : in    std_logic;
			--sys_clk                       : in    std_logic;
			--reset_in_n                    : in    std_logic;
			--cntrl0_burst_done             : in    std_logic;
			--cntrl0_init_done              : out   std_logic;
			--cntrl0_ar_done                : out   std_logic;
			--cntrl0_user_data_valid        : out   std_logic;
			--cntrl0_auto_ref_req           : out   std_logic;
			--cntrl0_user_cmd_ack           : out   std_logic;
			--cntrl0_user_command_register  : in    std_logic_vector(2 downto 0);
--			cntrl0_clk_tb                 : out   std_logic;
--			cntrl0_clk90_tb               : out   std_logic;
--			cntrl0_sys_rst_tb             : out   std_logic;
--			cntrl0_sys_rst90_tb           : out   std_logic;
--			cntrl0_sys_rst180_tb          : out   std_logic;
			--cntrl0_user_output_data       : out   std_logic_vector(15 downto 0);
			--cntrl0_user_input_data        : in    std_logic_vector(15 downto 0);
			--cntrl0_user_input_address     : in    std_logic_vector(24 downto 0);
--			cntrl0_ddr2_dqs               : inout std_logic_vector(0 downto 0);------
--			cntrl0_ddr2_dqs_n             : inout std_logic_vector(0 downto 0);
			SD_CK_P                : out   std_logic_vector(0 downto 0);
			SD_CK_N              : out   std_logic_vector(0 downto 0);
			  
			  
			  SD_LDQS_N : inout std_logic;
			  SD_UDQS_N : inout std_logic;
			  SD_LDQS_P : inout std_logic;
			  SD_UDQS_P: inout std_logic

			  
			  
			  );
end toplevel;

architecture Behavioral of toplevel is
 signal nullsetzer : std_logic;


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

SD_BA(2) <= '0'; -- BenchAddr: nur 2 Bits generiert, oberes 0 setzen?
SD_A(15 downto 13) <= "000"; --Obere 3 Bit der Adresse sind 0
SD_UDQS_N <= '0'; --upper 0 setzen
SD_UDQS_P <= '0';			  
			

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
	cpu_err_out => err_out,
	
		  -- ddr2
			cntrl0_ddr2_dq                => SD_DQ ,
			cntrl0_ddr2_a                 => SD_A(12 downto 0),
			cntrl0_ddr2_ba                => SD_BA(1 downto 0),
			cntrl0_ddr2_cke               => SD_CKE,
			cntrl0_ddr2_cs_n              => SD_CS,
			cntrl0_ddr2_ras_n             => SD_RAS,
			cntrl0_ddr2_cas_n             => SD_CAS,
			cntrl0_ddr2_we_n              => SD_WE,
			cntrl0_ddr2_odt               => SD_ODT,
			cntrl0_rst_dqs_div_in         => LOOP_IN,
			cntrl0_rst_dqs_div_out        => LOOP_OUT,
			--sys_clkb                      =>,
			--sys_clk                       =>,
			--reset_in_n                    =>,
			--cntrl0_burst_done             =>,
			--cntrl0_init_done              =>,
			--cntrl0_ar_done                =>,
			--cntrl0_user_data_valid        =>,
			--cntrl0_auto_ref_req           => cntrl0_auto_ref_req,
			--cntrl0_user_cmd_ack           =>,
			--cntrl0_user_command_register  =>,
			--cntrl0_clk_tb                 => cntrl0_clk_tb,
			--cntrl0_clk90_tb               => cntrl0_clk90_tb,
			--cntrl0_sys_rst_tb             => cntrl0_sys_rst_tb,
			--cntrl0_sys_rst90_tb           => cntrl0_sys_rst90_tb,
			--cntrl0_sys_rst180_tb          => cntrl0_sys_rst180_tb,
			--cntrl0_user_output_data       =>,
			--cntrl0_user_input_data        =>,
			--cntrl0_user_input_address     =>,
			cntrl0_ddr2_dqs(0)               => SD_LDQS_P,
			cntrl0_ddr2_dqs_n(0)             => SD_LDQS_N,
			cntrl0_ddr2_ck                => SD_CK_P,
			cntrl0_ddr2_ck_n              => SD_CK_N
			
			 
			 
			  
);
end Behavioral;

