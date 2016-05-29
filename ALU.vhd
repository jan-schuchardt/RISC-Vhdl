----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:11 05/01/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
	port(
	clk_in, cu_act_in, reg_act_in: in STD_LOGIC; --clock, control unit activate, register activate
	rst_in: in STD_LOGIC; -- reset
	opc_in: in std_logic_vector(6 downto 0);
	op3_in: in std_logic_vector(4 downto 0);
	 op1_in, op2_in, reg_data_in : in STD_LOGIC_VECTOR(31 downto 0); ---opcode, operands, 
	reg_Data_out, cu_data_out : out STD_LOGIC_VECTOR(31 downto 0);
	reg_act_out, reg_rw_out: out STD_LOGIC; --register activate; rw = 0 --> Read
	error_out: out STD_LOGIC; --report error
	reg_adr_out: out std_logic_vector(4 downto 0);
	cu_ack_out: out STD_LOGIC
	);
	
end ALU;

architecture Behavioral of ALU is

	signal s_op1, s_op2,  result, acc: STD_LOGIC_VECTOR(31 downto 0);
	signal s_opc: STD_LOGIC_VECTOR(6 downto 0);
	signal s_op3: STD_LOGIC_VECTOR(4 downto 0);
	signal state: STD_LOGIC_VECTOR(3 downto 0);
	--states:
	-- 0 - taking command from control unit
	-- 1 - send 1st operand to register_out
	-- 2 - activate registers
	-- 3 - send 2nd operand to register_out on acknowledgement and store 1st operand
	-- 4 - activate registers
	-- 5 - perform calculation
	-- 6 - send result to register
	-- 7 - activate register
	-- 8 - send data to control unit
	
	
	
begin

process (clk_in, rst_in) 
begin

	if(rst_in = '1') then
		
		state <= "0000";
	elsif rising_edge(clk_in) then
	---- Different operations from here on ----
	
	--- REG3 = REG1+REG2 (Opcode 0x00000001
	--- REG3 = REG1*REG2 (Opcode 0x00000002
	
	--state 0 : command from control unit
		if(state = "0000" and cu_act_in = '1') then
			reg_act_out <= '0';
			reg_rw_out <= '0';
			s_op1 <= op1_in;
			s_op2 <= op2_in;
			s_op3 <= op3_in;
			s_opc <= opc_in;
			result <= x"00000000";
			
			--(0 => Ne, others => '0');
			case opc_in is
				when "0000001" | "0000010"=>  
					state <= "0001";
				when others =>
			end case;
			
	--state 1 : 1st operand to reg_out
		elsif(state = "0001") then
			reg_adr_out <= s_op1(4 downto 0);
			reg_rw_out <= '0';
			reg_act_out <= '0';
			case s_opc is
				when "0000001" | "0000010"=>   
					state <= "0010";
				when others =>
			end case;
			
	--state 2 : activate register
		elsif(state = "0010") then
			case s_opc is
				when "0000001" | "0000010"=>  --adding
					state <= "0010";

					reg_act_out <= '1';
				when others =>
			end case;
			
	--state 3 : 2nd operand to reg_out and store 1st operand
		elsif(state = "0011" and reg_act_in = '1') then
			reg_adr_out <= s_op2(4 downto 0);
			reg_act_out <= '0';
			reg_rw_out <= '0';
			acc <= reg_data_in;
			case s_opc is
				when "0000001" | "0000010"=>   --adding
					state <= "0100";
				when others =>
			end case;
			
	--state 4: activate register
		
		elsif(state = "0100") then
		reg_act_out <= '1';
			case s_opc is
				when "0000001" | "0000010"=>   --adding
					state <= "0101";
					reg_act_out <= '1';
				when others =>
			end case;
			
	--state 5: perform calculation
		
		elsif(state = "0101" and reg_act_in = '1') then
		reg_act_out <= '0';
			case s_opc is
				when "0000001" => --adding
					acc <= std_logic_vector(unsigned(acc) + unsigned(reg_data_in));
					
					state <= "0110";
				when "0000010" => --multiplying
					--acc <= std_logic_vector(unsigned(acc) * unsigned(reg_data_in))(31 downto 0);
					
					state <= "0110";
				when others =>
			end case;
	
	--state 6: send result to register
		elsif(state = "0110") then
			reg_data_out <= acc;
			reg_adr_out <= s_op3;
			reg_rw_out <= '1';
			case s_opc is
				when "0000001" | "0000010"=>  
					state <= "0111";
				when others =>
			end case;
			
	--state 7: activate register
		elsif(state = "0111") then
			reg_act_out <= '1';
			case s_opc is
				when "0000001" | "0000010"=>  
					state <= "0000";
				when others =>
			end case;
			
		else
			state <= "0000";
			
		end if;
	end if;
end process;
end Behavioral;

