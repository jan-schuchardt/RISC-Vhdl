----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:05 09/06/2016 
-- Design Name: 
-- Module Name:    MMU - Behavioral 
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

entity MMU is
port (
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

end MMU;




architecture Behavioral of MMU is


-- DDR2 Control --
COMPONENT DDR2_Control_VHDL is
PORT (
    reset_in : in std_logic;
    clk_in : in std_logic;
    clk90_in : in std_logic;

    maddr   : in std_logic_vector(15 downto 0);
    mdata_i : in std_logic_vector(63 downto 0);
    data_out : out std_logic_vector(63 downto 0);
    mwe	  : in std_logic;
    mrd    : in std_logic;
	 valid : out std_logic;
	 

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
END COMPONENT DDR2_Control_VHDL;

   signal  i_maddr : std_logic_vector(15 downto 0);
   signal  i_mdata_i :  std_logic_vector(63 downto 0);
   signal  i_data_out : std_logic_vector(63 downto 0);
   signal  i_mwe	 : std_logic;
   signal  i_mrd  : std_logic;
	signal  i_valid : std_logic;


	signal i_busy : std_logic;
	signal i_ackwait : unsigned(1 downto 0);	  
	
	signal blockram_acc : std_logic;
	

	type blocks is array (0 to 2047) of std_logic_vector(7 downto 0);  -- 2048 Cells with 8 bit 
	signal blockram : blocks;


begin

i_maddr <= mmu_adr_out (15 downto 0);


process(clk_in) begin
	
	
	if rising_edge(clk_in)	then 
	
		if reset_in = '1' then
		i_mdata_i <= "0000000000000000000000000000000000000000000000000000000000000000";
		i_mwe <= '0';
		i_mrd <= '0';
		mmu_ack_in <= '0';
		i_busy <= '0';
		else	
		
	
				if i_busy = '0' and mmu_work_out = '1' then 
					i_busy <= '1';
					mmu_ack_in <= '0';					
					i_ackwait <= to_unsigned(2,i_ackwait'length);
					
					if(  unsigned(mmu_adr_out) > to_unsigned(2047,mmu_adr_out'length) ) then
						if mmu_com_out(2) = '0' then
							i_mrd <= '1';
							i_mwe <= '0';					
						else 
							i_mrd <= '0';
							i_mwe <= '1';	
							i_mdata_i(31 downto 0) <= 	mmu_data_out;
						end if;	
						
					else
						if mmu_com_out(2) = '0' then 
							mmu_data_in<=std_logic_vector'(blockram(to_integer(unsigned(mmu_adr_out)+3)) & blockram(to_integer(unsigned(mmu_adr_out)+2))
								& blockram(to_integer(unsigned(mmu_adr_out)+1)) & blockram(to_integer(unsigned(mmu_adr_out)+0)));
							
						else
							case mmu_com_out(1 downto 0) is  -- edge case: adress 2047 no 32 bit read/write
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
							
						end if;
					end if;
					
				
				elsif i_busy = '1' then
					if not i_ackwait = to_unsigned(0,i_ackwait'length) then
						i_ackwait <= i_ackwait - 1;
						
					else
						if i_valid = '1' then
							mmu_ack_in <= '1';
							i_busy <= '0';
							mmu_data_in <= i_data_out(31 downto 0);
						
						end if;
						
					end if;
				
				end if;
	
		end if;
	
	end if;

end process;

	
INST_DDR2_Control_VHDL : DDR2_Control_VHDL
PORT MAP (
    reset_in => reset_in,
    clk_in => clk_in,
    clk90_in => clk90_in,

    maddr   => i_maddr,
    mdata_i => i_mdata_i,
    data_out => i_data_out,
    mwe	  => i_mwe,
    mrd     => i_mrd,
	 valid => i_valid,

    -- ddr2	
    init_done => init_done, --in
    command_register => command_register, --out
    input_adress => input_adress, --out
    input_data => input_data, --out 
    output_data => output_data, --in
    cmd_ack => cmd_ack, --in
    data_valid => data_valid, --in
    burst_done => burst_done, --out
    auto_ref_req => auto_ref_req --in
);

end Behavioral;

