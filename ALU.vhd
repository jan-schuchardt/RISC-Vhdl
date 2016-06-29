library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
	port(
	
	--in
	
	--Basic control
	clk_in: in std_logic;
	rst_in: in std_logic;
	--Data
	cu_data_in1, cu_data_in2:in std_logic_vector(31 downto 0);

	--Adress
	cu_adr_in: in std_logic_vector(4 downto 0);
	--Commands
	cu_com_in: in std_logic_vector(5 downto 0);
	--Synchronization
	cu_work_in : in std_logic;
	
	--out
	cu_data_out: out std_logic_vector(31 downto 0);
	debug_data_out:out std_logic_vector(31 downto 0);
	debug_adr_out: out std_logic_vector(4 downto 0)
	);
	
end ALU;

architecture Behavioral of ALU is

	type regs is array (1 to 31) of std_logic_vector(31 downto 0); -- 31 free Registers, Register 0 is always 0
	signal reg_data: regs;

	
	signal s_op1, s_op2: STD_LOGIC_VECTOR(31 downto 0);
	signal s_opc: STD_LOGIC_VECTOR(5 downto 0);
	signal s_op3: STD_LOGIC_VECTOR(4 downto 0);
	signal state: STD_LOGIC_VECTOR(3 downto 0);
	signal acc: UNSIGNED(31 downto 0);
	signal debug_signal: STD_LOGIC_VECTOR(31 downto 0);
	signal debug_adr_signal: STD_LOGIC_VECTOR(4 downto 0);
	
	
	begin
	
	debug_data_out <= debug_signal;
	debug_adr_out <= debug_adr_signal;

process (clk_in, rst_in) 
begin

	if(rst_in = '1') then
	
		reg_data(1) <= x"00000000";
		debug_signal <= x"FFFFFFFF";
		state <= "0000";
	elsif rising_edge(clk_in) then
	
	---- Different operations from here on ----
	
	
	--state 0 : Get command from control unit
		if(state = "0000" and cu_work_in = '1') then
			
			s_op1 <= cu_data_in1;
			s_op2 <= cu_data_in2;
			s_op3 <= cu_adr_in;
			s_opc <= cu_com_in;
			acc <= x"00000000";
			
			--(0 => Ne, others => '0');
			state <= "0001";
		end if;
		
	--state 1: Get first operand
		if(state = "0001") then
			
			
				--Immediate
				if s_opc(5) = '0' then
					acc <= unsigned(s_op1);
				--Register
				elsif s_opc(5) = '1' then
				
					if s_op1 /= std_logic_vector(to_unsigned(0,s_op1'length)) then
							acc <=  unsigned(reg_data(to_integer(unsigned(s_op1))));
							
					end if;
				
				end if;
				state <= "0010";
		end if;
	--state2: get second operand + calculations
		if(state = "0010") then
		
			case s_opc(3 downto 0) is
			
			--ADD
			when "0000" =>
			
				if s_opc(4) = '0' then
					acc <= acc + unsigned(s_op2);
				elsif s_opc(4) = '1' then
					if s_op2 /= std_logic_vector(to_unsigned(0,s_op2'length)) then
					acc <= acc + unsigned( reg_data(to_integer(unsigned(s_op2))));
					end if;
				end if;
				
			--SUB
			when "0001" =>
				if s_opc(4) = '0' then
					acc <= acc - unsigned(s_op2);
				elsif s_opc(4) = '1' then
					if s_op2 /= std_logic_vector(to_unsigned(0,s_op2'length)) then
					acc <= acc - unsigned( reg_data(to_integer(unsigned(s_op2))));
					end if;
				end if;
			
			
			--AND
			when "0010" =>
				if s_opc(4) = '0' then
					acc <= unsigned(std_logic_vector(acc) and std_logic_vector(unsigned(s_op2)));
				elsif s_opc(4) = '1' then
					if s_op2 /= std_logic_vector(to_unsigned(0,s_op2'length)) then
					acc <= unsigned(std_logic_vector(acc) and reg_data(to_integer(unsigned(s_op2))));
					end if;
				end if;
			
			
			--OR
			when "0011" =>
				if s_opc(4) = '0' then
					acc <= unsigned(std_logic_vector(acc) or std_logic_vector(unsigned(s_op2)));
				elsif s_opc(4) = '1' then
					if s_op2 /= std_logic_vector(to_unsigned(0,s_op2'length)) then
					acc <= unsigned(std_logic_vector(acc) or reg_data(to_integer(unsigned(s_op2))));
					end if;
				end if;
			
				
		
			
			--XOR
			when "0100" =>
				if s_opc(4) = '0' then
					acc <= unsigned(std_logic_vector(acc) xor std_logic_vector(unsigned(s_op2)));
				elsif s_opc(4) = '1' then
					if s_op2 /= std_logic_vector(to_unsigned(0,s_op2'length)) then
					acc <= unsigned(std_logic_vector(acc) xor reg_data(to_integer(unsigned(s_op2))));
					end if;
				end if;
			
			
			--Shift Logical Left			
			when "0101" =>
				if s_opc(4) = '0' then
					acc <= unsigned(acc sll to_integer(unsigned(s_op2)));
				elsif s_opc(4) = '1' then
					if s_op2 /= std_logic_vector(to_unsigned(0,s_op2'length)) then
					acc <= unsigned(acc sll to_integer(unsigned(reg_data(to_integer(unsigned(s_op2))))));
					end if;
				end if;
			
			
			--Shift Logical right			
			when "0110" =>
				if s_opc(4) = '0' then
					acc <= unsigned(acc srl to_integer(unsigned(s_op2)));
				elsif s_opc(4) = '1' then
					if s_op2 /= std_logic_vector(to_unsigned(0,s_op2'length)) then
					acc <= unsigned(acc srl to_integer(unsigned(reg_data(to_integer(unsigned(s_op2))))));
					end if;
				end if;
				
				
			--Set less than immediate
			when "1000" =>
				if s_opc(4) = '0' then
					if signed(acc) < signed(s_op2) then
						acc <= x"80000000";
					else
						acc <= x"00000000";
					end if;
				elsif s_opc(4) = '1' then
					if s_op2 /= std_logic_vector(to_unsigned(0,s_op2'length)) then
						if signed(acc) < signed(reg_data(to_integer(unsigned(s_op2)))) then
							acc <= x"80000000";
						else
							acc <= x"00000000";
						end if;
					end if;
				end if;
				
			when others =>
			
			
				
			end case;
			
			
			state <= "0011";
			
			
		end if;
	--state3: write back
		if(state = "0011") then
			
			
			
					if s_op3 /= std_logic_vector(to_unsigned(0,s_op3'length)) then
								reg_data(to_integer(unsigned(s_op3)))<= std_logic_vector(acc); 
								cu_data_out <= std_logic_vector(acc);
								
					else
						cu_data_out <= std_logic_vector(acc);
					end if;
					
					

			
			state <= "0100";
		end if;
		
		--state4: wait
		if(state = "0100") then
			
			debug_signal <= std_logic_vector(acc);
			debug_adr_signal <= s_op3;
			
			state <= "0000";
			
			
	
		end if;
	end if;
	
	
end process;

	
	--test <= '1' when reg_data(1) = "00101010101010101010000000000000" else '0';
end Behavioral;