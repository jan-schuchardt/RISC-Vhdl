library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    Port(   clk : in std_logic;
            rst: in std_logic;  --reset
            addr: in std_logic_vector(9 downto 0);
            cmd: in std_logic_vector(2 downto 0); --bit 2: w:=1, r:=0, bit 0-1: data width (8, 16, prohibted, 32)  
            data_in: in std_logic_vector (31 downto 0);
            data_out: out std_logic_vector(31 downto 0);  
            ack_out:  out std_logic;  -- ack_interntmation: 1 if ready
				work_in: in std_logic --1: activated
		 );
end entity;

architecture a1 of RAM is

	type blocks is array (0 to 1024) of std_logic_vector(7 downto 0);  -- 65536 Cells with 32 bit 

   signal data: blocks;
   signal ack_intern: std_logic;  -- ack_internrmation intern
    
    begin
    
    ack_out<= ack_intern;
       

	process(clk) 
	variable aligned_addr : std_logic_vector(9 downto 0);
	begin
		if rising_edge(clk) then
													  
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
					case cmd(1 downto 0) is
						when "00" => --8 bit access
							data_out<=(7 downto 0 => data(to_integer(unsigned(addr))), others => '0');
						when "01" => --16 bit access
							alinged_addr := addr(9 downto 1) & "0";
							data_out<=(7 downto 0 => data(to_integer(unsigned(aligned_addr))),
							15 downto 8 => data(to_integer(unsigned(aligned_addr)+1)), others => '0');
						when "11" => --32 bit access
							alinged_addr := addr(9 downto 2) & "00";
							data_out<=(7 downto 0 => data(to_integer(unsigned(aligned_addr))),
							15 downto 8 => data(to_integer(unsigned(aligned_addr)+1)),
							23 downto 16 => data(to_integer(unsigned(aligned_addr)+2)),
							31 downto 24 => data(to_integer(unsigned(aligned_addr)+3)));
						when others => NULL;
						end case;
						
					ack_intern<= '1';
					
				end if;
			end if;
				  
			if rst = '1' then
			
			--	data <= 0;	
				data(to_integer(unsigned(0)))<= "10101010"; 
				ack_intern <= '0';
			end if;
			
			if work_in = '0' then
				ack_intern <= '0';
			end if;
		end if;
	end process  ;     
end a1;