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
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity toplevel is
port (
    -- Clocks --
    clk_50mhz   : in   std_logic;
    
    -- User Interface --
    reset       : in    std_logic;
    slow        : in    std_logic;
    leds        : out   std_logic_vector(7 downto 0) ;

    -- DDR2 SDRAM-Port-Pins --
    cntrl0_ddr2_a       : out std_logic_vector(12 downto 0) := (others => '0');
    cntrl0_ddr2_ba      : out std_logic_vector(1 downto 0) := (others => '0');
    cntrl0_ddr2_ck      : out std_logic_vector(0 downto 0) := (others => '0');
    cntrl0_ddr2_ck_n    : out std_logic_vector(0 downto 0) := (others => '0');
    cntrl0_ddr2_cke     : out std_logic := '0';
    cntrl0_ddr2_cs_n    : out std_logic := '0';
    cntrl0_ddr2_ras_n   : out std_logic := '0'; 
    cntrl0_ddr2_cas_n   : out std_logic := '0';
    cntrl0_ddr2_we_n    : out std_logic := '0';
    cntrl0_ddr2_odt     : out std_logic := '0';
    cntrl0_ddr2_dm      : out std_logic_vector(1 downto 0) := (others => '0');
    cntrl0_ddr2_dqs_n   : inout std_logic_vector(1 downto 0) := (others => '0');
    cntrl0_ddr2_dqs     : inout std_logic_vector(1 downto 0) := (others => '0');
    cntrl0_ddr2_dq      : inout std_logic_vector(15 downto 0) := (others => '0');
    cntrl0_rst_dqs_div_in   : in std_logic;
    cntrl0_rst_dqs_div_out  : out std_logic;	
  
    -- VGA --
    r           : out   std_logic_vector(3 downto 0);
    g           : out   std_logic_vector(3 downto 0);
    b           : out   std_logic_vector(3 downto 0);
    hsync       : out   std_logic;
    vsync       : out   std_logic
  );
end toplevel;


architecture behaviour of toplevel is

----------------------------------------------------
-- Components                                     --
----------------------------------------------------

-- Clocking --
COMPONENT Clock_VHDL is
PORT (
    clk_in_133MHz : in std_logic;
    clk_out_1Hz : out std_logic
);
END COMPONENT Clock_VHDL;

component clk133m_dcm is
port ( CLKIN_IN        : in    std_logic; 
    CLKFX_OUT       : out   std_logic; 
    CLKIN_IBUFG_OUT : out   std_logic; 
    CLK0_OUT        : out   std_logic; 
    CLK2X_OUT       : out   std_logic; 
    LOCKED_OUT      : out   std_logic);
end component clk133m_dcm;

-- VGA --
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
    reg_adr_in : in std_logic_vector(5 downto 0)
    );
END COMPONENT;

COMPONENT vga_clk
PORT(
    CLKIN_IN   : in    std_logic; 
    RST_IN     : in    std_logic; 
    CLKDV_OUT  : out   std_logic; 
    CLK0_OUT   : out   std_logic; 
    LOCKED_OUT : out   std_logic);
END COMPONENT;	

-- DDR2 Control --
COMPONENT MMU is
PORT (
    reset_in : in std_logic;
    clk_in : in std_logic;
    clk90_in : in std_logic;

   
    mmu_data_in: out std_logic_vector(31 downto 0);
	 mmu_data_out: in std_logic_vector(31 downto 0);
	 mmu_adr_out: in std_logic_vector(31 downto 0);
	 mmu_com_out: in std_logic_vector(2 downto 0);
	 mmu_work_out : in std_logic;
	 mmu_ack_in : out std_logic;


    init_done : in std_logic;
    command_register : out std_logic_vector(2 downto 0);
    input_adress : out std_logic_vector(24 downto 0);
    input_data : out std_logic_vector(31 downto 0);
    output_data : in std_logic_vector(31 downto 0);
    cmd_ack : in std_logic;
    data_valid : in std_logic;
    burst_done : out std_logic;
    auto_ref_req : in std_logic
);
END COMPONENT MMU;

COMPONENT DDR2_Ram_Core is
PORT (
    cntrl0_ddr2_dq : inout std_logic_vector(15 downto 0);
    cntrl0_ddr2_a : out std_logic_vector(12 downto 0);
    cntrl0_ddr2_ba : out std_logic_vector(1 downto 0);
    cntrl0_ddr2_cke : out std_logic;
    cntrl0_ddr2_cs_n : out std_logic;
    cntrl0_ddr2_ras_n : out std_logic;
    cntrl0_ddr2_cas_n : out std_logic;
    cntrl0_ddr2_we_n : out std_logic;
    cntrl0_ddr2_odt : out std_logic;
    cntrl0_ddr2_dm : out std_logic_vector(1 downto 0);
    cntrl0_rst_dqs_div_in : in std_logic;
    cntrl0_rst_dqs_div_out : out std_logic;		
    sys_clk_in : in std_logic;
    reset_in_n : in std_logic;
    cntrl0_burst_done : in std_logic;
    cntrl0_init_done : out std_logic;
    cntrl0_ar_done : out std_logic;
    cntrl0_user_data_valid : out std_logic;
    cntrl0_auto_ref_req : out std_logic;
    cntrl0_user_cmd_ack : out std_logic;
    cntrl0_user_command_register : in std_logic_vector(2 downto 0);
    cntrl0_clk_tb : out std_logic;
    cntrl0_clk90_tb : out std_logic;
    cntrl0_sys_rst_tb : out std_logic;
    cntrl0_sys_rst90_tb : out std_logic;
    cntrl0_sys_rst180_tb : out std_logic;
    cntrl0_user_output_data : out std_logic_vector(31 downto 0);
    cntrl0_user_input_data : in std_logic_vector(31 downto 0);
    cntrl0_user_data_mask : in std_logic_vector(3 downto 0);
    cntrl0_user_input_address : in std_logic_vector(24 downto 0);
    cntrl0_ddr2_dqs : inout std_logic_vector(1 downto 0);
    cntrl0_ddr2_dqs_n : inout std_logic_vector(1 downto 0);
    cntrl0_ddr2_ck : out std_logic_vector(0 downto 0);
    cntrl0_ddr2_ck_n : out std_logic_vector(0 downto 0)
);
END COMPONENT DDR2_Ram_Core;

signal reset_n  : std_logic;

-- VGA ----------------------------------------------------------
signal clk25 : std_logic;
signal rgb : std_logic_vector(11 downto 0) := (others => '0');
signal x, y : std_logic_vector(9 downto 0);
signal offs : std_logic;

-- CPU ----------------------------------------------------------
signal debug :std_logic_vector(31 downto 0);
signal debug_adr : std_logic_vector(5 downto 0);
signal err_out : std_logic;

signal clk_cpu : std_logic;

-- DDR2 SDRAM-Leitungen -----------------------------------------
signal we_rise		: std_logic;
signal rd_rise		: std_logic;
signal maddr: std_logic_vector(15 downto 0);
signal SDRAM_DO: std_logic_vector(7 downto 0);
signal cpu_ram_d_to_cv_s,
cpu_ram_d_from_cv_s : std_logic_vector( 7 downto 0);
signal cart_a_s            : std_logic_vector(14 downto 0);

signal clk_tb : std_logic;
signal clk90_tb : std_logic;
signal burst_done : std_logic;
signal user_command_register : std_logic_vector(2 downto 0) := (others => '0');
signal user_data_mask : std_logic_vector(3 downto 0):= (others => '0');
signal user_input_data : std_logic_vector(31 downto 0);
signal user_input_address : std_logic_vector(24 downto 0);
signal v_init_done : std_logic;
signal ar_done : std_logic;
signal auto_ref_req : std_logic;
signal user_cmd_ack : std_logic;
signal user_data_valid : std_logic;
signal user_output_data	: std_logic_vector(31 downto 0);

signal ddr2_led : std_logic;

signal CLK_130M : std_logic;
signal CLKB_130M : std_logic;
signal CLK50M : std_logic;
	
	
signal 	 mmu_data_in:  std_logic_vector(31 downto 0);
signal	 mmu_data_out:  std_logic_vector(31 downto 0);
signal	 mmu_adr_out:  std_logic_vector(31 downto 0);
signal	 mmu_com_out:  std_logic_vector(2 downto 0);
signal	 mmu_work_out :  std_logic;
signal	 mmu_ack_in :  std_logic;	
	
begin

-----------------------------------------------------------------------------
-- Reset & LEDs
-----------------------------------------------------------------------------
reset_n <= not reset;

leds(7 downto 3) <= (others => '0');
leds(2) <= err_out;
leds(1) <= slow;
leds(0) <= ddr2_led;
  
-----------------------------------------------------------------------------
-- Clock Generator
-----------------------------------------------------------------------------
	
INST_Clock_VHDL : Clock_VHDL
PORT MAP (	
    clk_in_133MHz => clk_tb,		
    clk_out_1Hz => ddr2_led
);

clk133 : clk133m_dcm
port map( 
    CLKIN_IN    => CLK_50MHZ, 
    CLKFX_OUT      => CLK_130M,
    CLKIN_IBUFG_OUT => open, 
    CLK0_OUT        => clk50m, 
    CLK2X_OUT       => open,
    LOCKED_OUT      => open
    );
         
clk_obuf : OBUF port map ( I => CLK_130M, O => CLKB_130M ); 
  
-----------------------------------------------------------------------------
-- VGA
-----------------------------------------------------------------------------

Inst_vga: vga PORT MAP(
    clk => clk25,
    rst => reset,
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
    CLKIN_IN => clk50m,
    RST_IN => reset,
    CLKDV_OUT => clk25,
    CLK0_OUT => clk_cpu,
    LOCKED_OUT => open
);  

-----------------------------------------------------------------------------
-- Prozessor
-----------------------------------------------------------------------------

PROZESSOR: entity work.cpu PORT MAP(
	cpu_rst_in => reset,
	cpu_clk_in => clk_cpu, --clk25,
	cpu_debug_out => debug,
	cpu_debug_adr_out => debug_adr,
	cpu_slow_in => slow,
	cpu_err_out => err_out,		

    mmu_data_in =>mmu_data_in,
	 mmu_data_out =>mmu_data_out,
	 mmu_adr_out =>mmu_adr_out,
	 mmu_com_out =>mmu_com_out,
	 mmu_work_out =>mmu_work_out,
	 mmu_ack_in =>mmu_ack_in
	 
		
);  




  
-----------------------------------------------------------------------------
-- DDR2
-----------------------------------------------------------------------------

maddr <= '0' & cart_a_s(14 downto 0);
rd_rise <= '0';
we_rise <= '0';
 	
INST_MMU : MMU
PORT MAP (
    reset_in => Reset,
    clk_in => clk_tb,
    clk90_in => clk90_tb,

--    maddr   => maddr,
--    mdata_i => cpu_ram_d_from_cv_s,
--    data_out => SDRAM_DO,
--    mwe	  => we_rise,
--    mrd     => rd_rise,

 -- vom Prozessor
	   mmu_data_in =>mmu_data_in,
	 mmu_data_out =>mmu_data_out,
	 mmu_adr_out =>mmu_adr_out,
	 mmu_com_out =>mmu_com_out,
	 mmu_work_out =>mmu_work_out,
	 mmu_ack_in =>mmu_ack_in,

    -- ddr2	
    init_done => v_init_done, --in
    command_register => user_command_register, --out
    input_adress => user_input_address, --out
    input_data => user_input_data, --out 
    output_data => user_output_data, --in
    cmd_ack => user_cmd_ack, --in
    data_valid => user_data_valid, --in
    burst_done => burst_done, --out
    auto_ref_req => auto_ref_req --in
	 
	
);
		  
INST_DDR2_RAM_CORE : DDR2_Ram_Core
PORT MAP (
    sys_clk_in => CLKB_130M,
    reset_in_n => Reset_n,
    cntrl0_burst_done => burst_done,
    cntrl0_user_command_register => user_command_register,
    cntrl0_user_data_mask => user_data_mask,
    cntrl0_user_input_data => user_input_data,
    cntrl0_user_input_address => user_input_address,
    cntrl0_init_done => v_init_done,
    cntrl0_ar_done => ar_done,
    cntrl0_auto_ref_req => auto_ref_req,
    cntrl0_user_cmd_ack => user_cmd_ack,
    cntrl0_clk_tb => clk_tb,
    cntrl0_clk90_tb => clk90_tb,
    cntrl0_sys_rst_tb => open,
    cntrl0_sys_rst90_tb => open,
    cntrl0_sys_rst180_tb => open,
    cntrl0_user_data_valid => user_data_valid,
    cntrl0_user_output_data => user_output_data,			
    cntrl0_ddr2_ras_n => cntrl0_ddr2_ras_n,
    cntrl0_ddr2_cas_n => cntrl0_ddr2_cas_n,
    cntrl0_ddr2_we_n => cntrl0_ddr2_we_n,
    cntrl0_ddr2_cs_n => cntrl0_ddr2_cs_n,
    cntrl0_ddr2_cke => cntrl0_ddr2_cke,
    cntrl0_ddr2_dm => cntrl0_ddr2_dm,
    cntrl0_ddr2_ba => cntrl0_ddr2_ba,
    cntrl0_ddr2_a => cntrl0_ddr2_a,
    cntrl0_ddr2_ck => cntrl0_ddr2_ck,
    cntrl0_ddr2_ck_n => cntrl0_ddr2_ck_n,
    cntrl0_ddr2_dqs => cntrl0_ddr2_dqs,
    cntrl0_ddr2_dqs_n => cntrl0_ddr2_dqs_n,
    cntrl0_ddr2_dq => cntrl0_ddr2_dq,
    cntrl0_ddr2_odt => cntrl0_ddr2_odt,		
    cntrl0_rst_dqs_div_in => cntrl0_rst_dqs_div_in,
    cntrl0_rst_dqs_div_out => cntrl0_rst_dqs_div_out);	 

end behaviour;
