library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    Port(   clk : in std_logic;
            rst: in std_logic;  --reset
            addr: in std_logic_vector(24 downto 0);
            cmd: in std_logic_vector(2 downto 0); --bit 2: w:=1, r:=0, bit 0-1: data width (8, 16, prohibted, 32)  
            data_in: in std_logic_vector (31 downto 0);
            data_out: out std_logic_vector(31 downto 0);  
            ack_out:  out std_logic;  -- ack_interntmation: 1 if ready
				work_in: in std_logic; --1: activated
				
				
					  -- ddr2
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
			cntrl0_ddr2_dqs               : inout std_logic_vector(0 downto 0);
			cntrl0_ddr2_dqs_n             : inout std_logic_vector(0 downto 0);
			cntrl0_ddr2_ck                : out   std_logic_vector(0 downto 0);
			cntrl0_ddr2_ck_n              : out   std_logic_vector(0 downto 0)
		 );
end entity;

architecture a1 of RAM is


	component ramunit
		  Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (24 downto 0);
           cmd : in  STD_LOGIC_VECTOR (2 downto 0);
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ack_out : out  STD_LOGIC;
           work_in : in  STD_LOGIC;
			  
			  
			  
			  -- ddr2
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
			cntrl0_ddr2_dqs               : inout std_logic_vector(0 downto 0);
			cntrl0_ddr2_dqs_n             : inout std_logic_vector(0 downto 0);
			cntrl0_ddr2_ck                : out   std_logic_vector(0 downto 0);
			cntrl0_ddr2_ck_n              : out   std_logic_vector(0 downto 0)
			  
			  );
	end component;
	
	

	type blocks is array (0 to 12) of std_logic_vector(7 downto 0);  -- 12 Cells with 32 bit 

   signal data: blocks;
   signal ack_intern: std_logic;  -- ack_internrmation intern
   signal test1: std_logic_vector(31 downto 0);
	signal test2: std_logic_vector(31 downto 0);
	signal test3: std_logic_vector(31 downto 0);
	
	signal i_cmd: std_logic_vector(2 downto 0);
	signal i_data_out: std_logic_vector( 31 downto 0);
	signal i_ack_out: std_logic;
	
    begin
	 
	 
    
	

	process(clk) 
	variable aligned_addr : std_logic_vector(9 downto 0); 
	begin
		if rising_edge(clk) then
		
			if( unsigned(addr) > to_unsigned(2047, addr'length) ) then
			i_cmd <= cmd;
			data_out <= i_data_out;
			ack_out <= i_ack_out;
			
			else
			 ack_out<= ack_intern;
			if work_in = '1' then
				if cmd(2) ='1' then
					-- Write operation
					case cmd(1 downto 0) is
						when "00" => --8 bit access
							data(to_integer(unsigned(addr)))<= data_in(7 downto 0);
						when "01" => --16 bit access
							aligned_addr := addr(9 downto 1) & "0";
							data(to_integer(unsigned(aligned_addr)))<= data_in(7 downto 0);
							data(to_integer(unsigned(aligned_addr)) + 1)<= data_in(15 downto 8);
						when "11" => --32 bit access
							aligned_addr := addr(9 downto 2) & "00";
							data(to_integer(unsigned(aligned_addr)))<= data_in(7 downto 0);
							data(to_integer(unsigned(aligned_addr)) + 1)<= data_in(15 downto 8);
							data(to_integer(unsigned(aligned_addr)) + 2)<= data_in(23 downto 16);
							data(to_integer(unsigned(aligned_addr)) + 3)<= data_in(31 downto 24);
						when others => NULL;
						end case;
					ack_intern<= '1';
				else 
					-- Read operation
					--case cmd(1 downto 0) is
						--when "00" => --8 bit access
							--data_out<=std_logic_vector(resize(unsigned(data(to_integer(unsigned(addr)))),data_out'length));
							--data_out<=(7 downto 0 => data(to_integer(unsigned(addr))), others => '0');
						--when "01" => --16 bit access
							--aligned_addr := addr(9 downto 1) & "0";
							--data_out<=std_logic_vector(resize(unsigned(std_logic_vector'(data(to_integer(unsigned(aligned_addr))) & data(to_integer(unsigned(aligned_addr)+1)))),data_out'length));
							--data_out<=(7 downto 0 => data(to_integer(unsigned(aligned_addr))),
							--15 downto 8 => data(to_integer(unsigned(aligned_addr)+1)), others => '0');
						--when "11" => --32 bit access
							--aligned_addr := addr(9 downto 2) & "00";
							data_out<=std_logic_vector'(data(to_integer(unsigned(addr)+3)) & data(to_integer(unsigned(addr)+2))
							& data(to_integer(unsigned(addr)+1)) & data(to_integer(unsigned(addr)+0)));
							
							--data_out <= "00101010101010101010000010110111";
							
							--data_out<=(7 downto 0 => data(to_integer(unsigned(aligned_addr))),
							--15 downto 8 => data(to_integer(unsigned(aligned_addr)+1)),
							--23 downto 16 => data(to_integer(unsigned(aligned_addr)+2)),
							--31 downto 24 => data(to_integer(unsigned(aligned_addr)+3)));
						--when others => NULL;
						--end case;
						
					ack_intern<= '1';
					
				end if;
			end if;
	
			
			if work_in = '0' then
				ack_intern <= '0';
			end if;
			
			end if;
					

						  
			if rst = '1' then
			
			--	data <= 0;	
			test1 <= "000000000011" & "00001" & "000" & "00001" & "00100" & "11";
			data(0)<= test1(7 downto 0);
			data(1)<= test1(15 downto 8);
			data(2)<= test1(23 downto 16);
			data(3)<= test1(31 downto 24);
			test2 <= "11111111110111111111" & "00000" & "11011" & "11";
			data(4)<= test2(7 downto 0);
			data(5)<= test2(15 downto 8);
			data(6)<= test2(23 downto 16);
			data(7)<= test2(31 downto 24);
				--data(0)<= "10101010"; 
				ack_intern <= '0';
			end if;
			
		end if;
		
	end process  ;    

		u_ramunit: ramunit
			port map(
			  clk =>clk,
           rst =>rst,
           addr =>addr,
           cmd =>i_cmd,
           data_in =>data_in,
           data_out =>i_data_out,
           ack_out =>i_ack_out,
           work_in =>work_in,
			  
			  -- ddr2
			cntrl0_ddr2_dq                => cntrl0_ddr2_dq ,
			cntrl0_ddr2_a                 => cntrl0_ddr2_a,
			cntrl0_ddr2_ba                => cntrl0_ddr2_ba,
			cntrl0_ddr2_cke               => cntrl0_ddr2_cke,
			cntrl0_ddr2_cs_n              => cntrl0_ddr2_cs_n,
			cntrl0_ddr2_ras_n             => cntrl0_ddr2_ras_n,
			cntrl0_ddr2_cas_n             => cntrl0_ddr2_cas_n,
			cntrl0_ddr2_we_n              => cntrl0_ddr2_we_n,
			cntrl0_ddr2_odt               => cntrl0_ddr2_odt,
			cntrl0_rst_dqs_div_in         => cntrl0_rst_dqs_div_in,
			cntrl0_rst_dqs_div_out        => cntrl0_rst_dqs_div_out,
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
--			cntrl0_clk_tb                 => cntrl0_clk_tb,
--			cntrl0_clk90_tb               => cntrl0_clk90_tb,
--			cntrl0_sys_rst_tb             => cntrl0_sys_rst_tb,
--			cntrl0_sys_rst90_tb           => cntrl0_sys_rst90_tb,
--			cntrl0_sys_rst180_tb          => cntrl0_sys_rst180_tb,
			--cntrl0_user_output_data       =>,
			--cntrl0_user_input_data        =>,
			--cntrl0_user_input_address     =>,
			cntrl0_ddr2_dqs               => cntrl0_ddr2_dqs,
			cntrl0_ddr2_dqs_n             => cntrl0_ddr2_dqs_n,
			cntrl0_ddr2_ck                => cntrl0_ddr2_ck,
			cntrl0_ddr2_ck_n              => cntrl0_ddr2_ck_n
			  
			  
			  );
end a1;