----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:38:41 06/28/2016 
-- Design Name: 
-- Module Name:    ramunit - Behavioral 
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

entity ramunit is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (24 downto 0);
           cmd : in  STD_LOGIC_VECTOR (2 downto 0);
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ack_out : out  STD_LOGIC;
           work_in : in  STD_LOGIC);
end ramunit;

	architecture Behavioral of ramunit is

	component ddr
	 port(
			cntrl0_ddr2_dq                : inout std_logic_vector(7 downto 0);
			cntrl0_ddr2_a                 : out   std_logic_vector(12 downto 0);
			cntrl0_ddr2_ba                : out   std_logic_vector(1 downto 0);
			cntrl0_ddr2_cke               : out   std_logic;
			cntrl0_ddr2_cs_n              : out   std_logic;
			cntrl0_ddr2_ras_n             : out   std_logic;
			cntrl0_ddr2_cas_n             : out   std_logic;
			cntrl0_ddr2_we_n              : out   std_logic;
			cntrl0_ddr2_odt               : out   std_logic;
			cntrl0_rst_dqs_div_in         : in    std_logic;
			cntrl0_rst_dqs_div_out        : out   std_logic;
			sys_clkb                      : in    std_logic;
			sys_clk                       : in    std_logic;
			reset_in_n                    : in    std_logic;
			cntrl0_burst_done             : in    std_logic;
			cntrl0_init_done              : out   std_logic;
			cntrl0_ar_done                : out   std_logic;
			cntrl0_user_data_valid        : out   std_logic;
			cntrl0_auto_ref_req           : out   std_logic;
			cntrl0_user_cmd_ack           : out   std_logic;
			cntrl0_user_command_register  : in    std_logic_vector(2 downto 0);
			cntrl0_clk_tb                 : out   std_logic;
			cntrl0_clk90_tb               : out   std_logic;
			cntrl0_sys_rst_tb             : out   std_logic;
			cntrl0_sys_rst90_tb           : out   std_logic;
			cntrl0_sys_rst180_tb          : out   std_logic;
			cntrl0_user_output_data       : out   std_logic_vector(15 downto 0);
			cntrl0_user_input_data        : in    std_logic_vector(15 downto 0);
			cntrl0_user_input_address     : in    std_logic_vector(24 downto 0);
			cntrl0_ddr2_dqs               : inout std_logic_vector(0 downto 0);
			cntrl0_ddr2_dqs_n             : inout std_logic_vector(0 downto 0);
			cntrl0_ddr2_ck                : out   std_logic_vector(0 downto 0);
			cntrl0_ddr2_ck_n              : out   std_logic_vector(0 downto 0)

	);
	end component;


	-- intern signals
	signal		i_cntrl0_ddr2_dq                :  std_logic_vector(7 downto 0);
	signal      i_cntrl0_ddr2_a                 :    std_logic_vector(12 downto 0);
	signal 		i_cntrl0_ddr2_ba                :    std_logic_vector(1 downto 0);
	signal      i_cntrl0_ddr2_cke               :    std_logic;
	signal      i_cntrl0_ddr2_cs_n              :    std_logic;
	signal      i_cntrl0_ddr2_ras_n             :    std_logic;
	signal      i_cntrl0_ddr2_cas_n             :    std_logic;
	signal      i_cntrl0_ddr2_we_n              :    std_logic;
	signal      i_cntrl0_ddr2_odt               :    std_logic;
	signal      i_cntrl0_rst_dqs_div_in         :     std_logic;
	signal      i_cntrl0_rst_dqs_div_out        :    std_logic;
	signal      i_sys_clkb                      :     std_logic;
	signal      i_sys_clk                       :     std_logic;
	signal      i_reset_in_n                    :     std_logic;
	signal      i_cntrl0_burst_done             :     std_logic;
	signal      i_cntrl0_init_done              :    std_logic;
	signal      i_cntrl0_ar_done                :    std_logic;
	signal      i_cntrl0_user_data_valid        :    std_logic;
	signal      i_cntrl0_auto_ref_req           :    std_logic;
	signal      i_cntrl0_user_cmd_ack           :    std_logic;
	signal      i_cntrl0_user_command_register  :    std_logic_vector(2 downto 0);
	signal      i_cntrl0_clk_tb                 :    std_logic;
	signal      i_cntrl0_clk90_tb               :    std_logic;
	signal      i_cntrl0_sys_rst_tb             :    std_logic;
	signal      i_cntrl0_sys_rst90_tb           :    std_logic;
	signal      i_cntrl0_sys_rst180_tb          :    std_logic;
	signal      i_cntrl0_user_output_data       :    std_logic_vector(15 downto 0);
	signal      i_cntrl0_user_input_data        :     std_logic_vector(15 downto 0);
	signal      i_cntrl0_user_input_address     :     std_logic_vector(24 downto 0);
	signal      i_cntrl0_ddr2_dqs               :  std_logic_vector(0 downto 0);
	signal      i_cntrl0_ddr2_dqs_n             :  std_logic_vector(0 downto 0);
	signal      i_cntrl0_ddr2_ck                :    std_logic_vector(0 downto 0);
	signal      i_cntrl0_ddr2_ck_n              :    std_logic_vector(0 downto 0);

	--
	
	signal initsent : unsigned (10 downto 0);  -- counter for init
	
	signal readcounter : unsigned (10 downto 0);  -- counter for read
																 --? 2048 clks should be enough for refresh
	signal readsent: std_logic;
	
	signal read_data : std_logic_vector(31 downto 0);
	
	signal ack : std_logic;
	
	
		begin

		
		data_out <= read_data when cmd(1 downto 0) = "11" else
						"0000000000000000"&read_data(15 downto 0) when cmd(1 downto 0) = "01" else
						"000000000000000000000000"&read_data(7 downto 0) when cmd(1 downto 0) = "00" else
						"00000000000000000000000000000000";
		ack_out <= ack; 

		i_sys_clk <= clk; 
		i_sys_clkb <= clk; -- ?better directly
		i_cntrl0_rst_dqs_div_in <= '0';  -- ?maybe 1
		i_reset_in_n <= not rst;  -- active low



		process(clk) begin
			if( falling_edge(clk)) then
			
			if( rst = '1' ) then 
					i_cntrl0_user_command_register <= "010";
					
					readsent <= '0';
					read_data <= "00000000000000000000000000000000";
					readcounter <= "00000000000";
					initsent <= "00000000000"; 
					i_cntrl0_user_input_data <= "0000000000000000"; 
					i_cntrl0_user_input_address <= "0000000000000000000000000"; 
					i_cntrl0_burst_done <= '0'; 
					
					-- todo: write init-values
			else

					if( i_cntrl0_init_done = '1') then

						if( work_in = '1') then
							
							if( cmd(2) = '1') then --write
							
							-- todo
							
							else  --read
							-- (todo: data width)
							
						
								if( readsent = '0') then 
								
									if ( i_cntrl0_user_cmd_ack = '0') then 
										i_cntrl0_user_input_address <= addr;
										i_cntrl0_user_command_register <= "110";
										readsent <= '1';
										readcounter <= "00000000000"; 
									end if;
								else
								
										if ( i_cntrl0_user_cmd_ack = '1') then 
											case readcounter is
												when to_unsigned(0,readcounter'length) => 
												when to_unsigned(1,readcounter'length) => 
												when to_unsigned(2,readcounter'length) => 

												-- ?values might be too low/high
												when to_unsigned(3,readcounter'length) => 	if (i_cntrl0_user_data_valid = '1') then -- ?todo: not setting ack in the next step, if data here is not valid
																	read_data( 31 downto 16) <= i_cntrl0_user_output_data;
																	
																	end if;
																	
												when to_unsigned(4,readcounter'length) => 	if (i_cntrl0_user_data_valid = '1') then
																	read_data( 15 downto 0) <= i_cntrl0_user_output_data;
																	ack <= '1'; 
																	end if;		

																	i_cntrl0_burst_done <= '1';
																	
												when to_unsigned(5,readcounter'length) =>		i_cntrl0_user_command_register <= "000";

																		
												when to_unsigned(6,readcounter'length) => 	i_cntrl0_burst_done <= '0'; 				
																	
												when to_unsigned(7,readcounter'length) => -- ?ack should be active for longer					
												when others => 
												if ( i_cntrl0_user_cmd_ack = '0') then
												ack <= '0'; 
												readsent <= '0';
												end if; 
											
											end case;
						
											readcounter <= readcounter+1; -- starts counting after cmd_ack
											--readsent <= 1;
									
									
										
										end if; 
								end if;
							
							end if;
							
						else
							i_cntrl0_user_command_register <= "000";
						end if;

					else 
						-- todo: write init-values
						readcounter <= to_unsigned(0,readcounter'length);
						initsent <= initsent +1;
						if( initsent = 0) then
							i_cntrl0_user_command_register <= "101";
					 
						else
					 
							i_cntrl0_user_command_register <= "000";
						end if;
					 
					 
					end if; 

				end if;
			end if;
		end process;




		u_ddr :ddr
				 port map (
				cntrl0_ddr2_dq                => i_cntrl0_ddr2_dq,
				cntrl0_ddr2_a                 => i_cntrl0_ddr2_a,
				cntrl0_ddr2_ba                => i_cntrl0_ddr2_ba,
				cntrl0_ddr2_cke               => i_cntrl0_ddr2_cke,
				cntrl0_ddr2_cs_n              => i_cntrl0_ddr2_cs_n,
				cntrl0_ddr2_ras_n             => i_cntrl0_ddr2_ras_n,
				cntrl0_ddr2_cas_n             => i_cntrl0_ddr2_cas_n,
				cntrl0_ddr2_we_n              => i_cntrl0_ddr2_we_n,
				cntrl0_ddr2_odt               => i_cntrl0_ddr2_odt,
				cntrl0_rst_dqs_div_in         => i_cntrl0_rst_dqs_div_in,
				cntrl0_rst_dqs_div_out        => i_cntrl0_rst_dqs_div_out,
				sys_clkb                      => i_sys_clkb,
				sys_clk                       => i_sys_clk,
				reset_in_n                    => i_reset_in_n,
				cntrl0_burst_done             => i_cntrl0_burst_done,
				cntrl0_init_done              => i_cntrl0_init_done,
				cntrl0_ar_done                => i_cntrl0_ar_done,
				cntrl0_user_data_valid        => i_cntrl0_user_data_valid,
				cntrl0_auto_ref_req           => i_cntrl0_auto_ref_req,
				cntrl0_user_cmd_ack           => i_cntrl0_user_cmd_ack,
				cntrl0_user_command_register  => i_cntrl0_user_command_register,
				cntrl0_clk_tb                 => i_cntrl0_clk_tb,
				cntrl0_clk90_tb               => i_cntrl0_clk90_tb,
				cntrl0_sys_rst_tb             => i_cntrl0_sys_rst_tb,
				cntrl0_sys_rst90_tb           => i_cntrl0_sys_rst90_tb,
				cntrl0_sys_rst180_tb          => i_cntrl0_sys_rst180_tb,
				cntrl0_user_output_data       => i_cntrl0_user_output_data,
				cntrl0_user_input_data        => i_cntrl0_user_input_data,
				cntrl0_user_input_address     => i_cntrl0_user_input_address,
				cntrl0_ddr2_dqs               => i_cntrl0_ddr2_dqs,
				cntrl0_ddr2_dqs_n             => i_cntrl0_ddr2_dqs_n,
				cntrl0_ddr2_ck                => i_cntrl0_ddr2_ck,
				cntrl0_ddr2_ck_n              => i_cntrl0_ddr2_ck_n
		);






end Behavioral;

