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
	debug_adr_out: out std_logic_vector(5 downto 0)
	);
	
end ALU;

architecture Behavioral of ALU is

	

	--signal reg_bank2: regs;
	
	signal s_op1, s_op2: STD_LOGIC_VECTOR(31 downto 0);
	signal s_opc: STD_LOGIC_VECTOR(5 downto 0);
	signal s_op3: STD_LOGIC_VECTOR(4 downto 0);
	signal state: STD_LOGIC_VECTOR(3 downto 0);
	signal acc: STD_LOGIC_VECTOR(31 downto 0);
	signal debug_signal: STD_LOGIC_VECTOR(31 downto 0);
	signal debug_adr_signal: STD_LOGIC_VECTOR(5 downto 0);
	
	signal ram_wea : std_logic_vector(0 downto 0);
	signal ram_web : std_logic_vector(0 downto 0);
	signal ram_addra : std_logic_vector(4 downto 0);
	signal ram_addrb : std_logic_vector(4 downto 0);
	 signal ram_dina: std_logic_vector(31 downto 0);
	 signal ram_dinb: std_logic_vector(31 downto 0);
	 signal ram_douta: std_logic_vector(31 downto 0);
		 signal ram_doutb: std_logic_vector(31 downto 0);



	type regs is array (1 to 31) of std_logic_vector(31 downto 0); -- 31 free Registers, Register 0 is always 0
		signal reg_data1: regs;
		signal reg_data2: regs;

	
	begin
	
	debug_data_out <= debug_signal;
	debug_adr_out <= debug_adr_signal;
	
	--debug_data_out <= x"10101010";
	--debug_adr_out <= "00001";
	
	--ram_web <= "0";
	--ram_dinb <= x"00000000";

process (clk_in, rst_in) 
begin

	if(rst_in = '1') then

		--reg_bank1(1) <= x"00000000";
		--reg_bank2(1) <= x"00000000";
		--debug_signal <= x"FFFFFFFF";
		--debug_adr_signal <= "00001";
		--ram_wea <= "0";
		state <= "0000";
	elsif rising_edge(clk_in) then
	
	---- Different operations from here on ----
	
	
	--state 0 : Get command from control unit + get operands from registers
		if(state = "0000" and cu_work_in = '1') then
			
			
			s_op3 <= cu_adr_in;
			s_opc <= cu_com_in;
			ram_wea <= "0";
			
			
			--First operand
			--Immediate
				if cu_com_in(5) = '0' then
					s_op1 <= cu_data_in1;
				--Register
				elsif cu_com_in(5) = '1' then
					--s_op1 <= x"00000000";
					
					if cu_data_in1 /= std_logic_vector(to_unsigned(0,cu_data_in1'length)) then
							ram_douta <= reg_data1(to_integer(unsigned(cu_data_in1)));
							
					end if;
				
				end if;
				
			--second operand
			if cu_com_in(4) = '0' then
					s_op2 <= cu_data_in2;
			elsif cu_com_in(4) = '1' then
				--s_op1 <= x"00000000";
					if cu_data_in2 /= std_logic_vector(to_unsigned(0,cu_data_in2'length)) then
						ram_doutb <= reg_data2(to_integer(unsigned(cu_data_in2)));
					end if;
			end if;
			
			state <= "0001";
		end if;

	
	--state1:  calculations
		if(state = "0001") then
		
			case s_opc(3 downto 0) is
			
			--ADD
			when "0000" =>
			
				if s_opc(5)='0' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(s_op1) + unsigned(s_op2));
				elsif s_opc(5)='0' and s_opc(4)='1' then
					acc <= std_logic_vector(unsigned(s_op1) + unsigned(ram_doutb));
				elsif s_opc(5)='1' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(ram_douta) + unsigned(s_op2));
				else
					acc <= std_logic_vector(unsigned(ram_douta) + unsigned(ram_doutb));
				end if;
				
			--SUB
			when "0001" =>
			
			
				if s_opc(5)='0' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(s_op1) - unsigned(s_op2));
				elsif s_opc(5)='0' and s_opc(4)='1' then
					acc <= std_logic_vector(unsigned(s_op1) - unsigned(ram_doutb));
				elsif s_opc(5)='1' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(ram_douta) - unsigned(s_op2));
				else
					acc <= std_logic_vector(unsigned(ram_douta) - unsigned(ram_doutb));
				end if;
			
			--AND
			when "0010" =>
			
				if s_opc(5)='0' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(s_op1) and unsigned(s_op2));
				elsif s_opc(5)='0' and s_opc(4)='1' then
					acc <= std_logic_vector(unsigned(s_op1) and unsigned(ram_doutb));
				elsif s_opc(5)='1' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(ram_douta) and unsigned(s_op2));
				else
					acc <= std_logic_vector(unsigned(ram_douta) and unsigned(ram_doutb));
				end if;
			
			
			--OR
			when "0011" =>
			
			
				if s_opc(5)='0' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(s_op1) or unsigned(s_op2));
				elsif s_opc(5)='0' and s_opc(4)='1' then
					acc <= std_logic_vector(unsigned(s_op1) or unsigned(ram_doutb));
				elsif s_opc(5)='1' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(ram_douta) or unsigned(s_op2));
				else
					acc <= std_logic_vector(unsigned(ram_douta) or unsigned(ram_doutb));
				end if;
			
				
		
			
			--XOR
			when "0100" =>
			
				if s_opc(5)='0' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(s_op1) xor unsigned(s_op2));
				elsif s_opc(5)='0' and s_opc(4)='1' then
					acc <= std_logic_vector(unsigned(s_op1) xor unsigned(ram_doutb));
				elsif s_opc(5)='1' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(ram_douta) xor unsigned(s_op2));
				else
					acc <= std_logic_vector(unsigned(ram_douta) xor unsigned(ram_doutb));
				end if;
			
			
			--Shift Logical Left			
			when "0101" =>
			
				
				
				if s_opc(5)='0' and s_opc(4)='0' then
					acc <= std_logic_vector( unsigned(s_op1) sll to_integer(unsigned(s_op2)));
				elsif s_opc(5)='0' and s_opc(4)='1' then
					acc <= std_logic_vector( unsigned(s_op1) sll to_integer(unsigned(ram_doutb)));
				elsif s_opc(5)='1' and s_opc(4)='0' then
					acc <= std_logic_vector( unsigned(ram_douta) sll to_integer(unsigned(s_op2)));
				else
					acc <= std_logic_vector( unsigned(ram_douta) sll to_integer(unsigned(ram_doutb)));
				end if;
				
			--Shift Logical Right
			when "0110" =>
			
				if s_opc(5)='0' and s_opc(4)='0' then
					acc <= std_logic_vector(unsigned(s_op1) srl to_integer(unsigned(s_op2)));
				elsif s_opc(5)='0' and s_opc(4)='1' then
					acc <= std_logic_vector( unsigned(s_op1) srl to_integer(unsigned(ram_doutb)));
				elsif s_opc(5)='1' and s_opc(4)='0' then
					acc <= std_logic_vector( unsigned(ram_douta) srl to_integer(unsigned(s_op2)));
				else
					acc <= std_logic_vector( unsigned(ram_douta) srl to_integer(unsigned(ram_doutb)));
				end if;
				
			--Shift arithmetic right
			when "0111" =>
			
				if s_opc(5)='0' and s_opc(4)='0' then
					acc <= std_logic_vector( unsigned(s_op1) srl to_integer(unsigned(s_op2)));
				elsif s_opc(5)='0' and s_opc(4)='1' then
					acc <= std_logic_vector( unsigned(s_op1) srl to_integer(unsigned(ram_doutb)));
				elsif s_opc(5)='1' and s_opc(4)='0' then
					acc <= std_logic_vector( unsigned(ram_douta) srl to_integer(unsigned(s_op2)));
				else
					acc <= std_logic_vector( unsigned(ram_douta) srl to_integer(unsigned(ram_doutb)));
				end if;
			
				
				
			--Set less than immediate
			when "1000" =>
				if s_opc(5)='0' and s_opc(4)='0' then
					if signed(s_op1) < signed(s_op2) then
						acc <= x"00000001";
					else
						acc <= x"00000000";
					end if;
				elsif s_opc(5)='0' and s_opc(4)='0' then
					if signed(s_op1) < signed(ram_doutb) then
						acc <= x"00000001";
					else
						acc <= x"00000000";
					end if;
				elsif s_opc(5)='0' and s_opc(4)='0' then
					if signed(ram_douta) < signed(s_op2) then
						acc <= x"00000001";
					else
						acc <= x"00000000";
					end if;
				else
					if signed(ram_douta) < signed(ram_doutb) then
						acc <= x"00000001";
					else
						acc <= x"00000000";
					end if;
				end if;
				
			--set less than immediate (unsigned)
			
				if s_opc(5)='0' and s_opc(4)='0' then
					if unsigned(s_op1) < unsigned(s_op2) then
						acc <= x"00000001";
					else
						acc <= x"00000000";
					end if;
				elsif s_opc(5)='0' and s_opc(4)='0' then
					if unsigned(s_op1) < unsigned(ram_doutb) then
						acc <= x"00000001";
					else
						acc <= x"00000000";
					end if;
				elsif s_opc(5)='0' and s_opc(4)='0' then
					if unsigned(ram_douta) < unsigned(s_op2) then
						acc <= x"00000001";
					else
						acc <= x"00000000";
					end if;
				else
					if unsigned(ram_douta) < unsigned(ram_doutb) then
						acc <= x"00000001";
					else
						acc <= x"00000000";
					end if;
				end if;
				
				
			when others =>
			
			
				
			end case;
			
			
			
			state <= "0010";
			
			
		end if;
	--state3: write back
		if(state = "0010") then
			
			
					if s_op3 /= std_logic_vector(to_unsigned(0,s_op3'length)) then
						
						reg_data1(to_integer(unsigned(s_op3)))<= std_logic_vector(acc);
						reg_data2(to_integer(unsigned(s_op3)))<= std_logic_vector(acc);
						
						debug_signal <= acc;
						debug_adr_signal <= "0" & s_op3;
						
					end if;
					
					cu_data_out <= acc;
					
					
					
					

			
			state <= "0000";
		end if;

		
	end if;
	
	
end process;




	
	--test <= '1' when reg_data(1) = "00101010101010101010000000000000" else '0';
end Behavioral;


