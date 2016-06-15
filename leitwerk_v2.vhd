-- Abkuerzungen:
-- reg - Register
-- alu - ALU
-- ram - RAM-Unit
-- ltwk - Leitwerk
-- com - Befehlsleitung(en)
-- work - Synchronisationsleitung
-- data - Datenleitung(en)
-- adr - Adressleitung(en)
-- ack - Bestaetigungsleitung
--
-- pc - Program counter
-- ir - Instruction register
-- clk - Clock
-- rst - Reset
-- err - Error
--
-- Protokolle:
-- ALU - Leitwerk:
-- - Auf den Leitungen alu_data_out1, alu_data_out2, alu_adr_out3, alu_com_out können beliebige Werte anliegen, solange alu_work_out auf 0 steht.
-- - Auf der Leitung alu_data_in muss grundsätzlich die Werte der letzten Operation anliegen. Gab es keine letzte Operation (also unmittelbar nach dem Reset), dann wird erwar$
-- - Eine Veränderung des Wertes, der auf alu_data_in anliegt, ist nur erlaubt, wenn alu_work_out auf 1 steht.
-- - alu_work_out wird vom Leitwerk auf 1 gesetzt, wenn es möchte, dass die ALU mit den Werten, die auf den restlichen Leitungen anliegen, nun rechnet. Es wird wieder auf 0 g$
-- - Sobald alu_work_out wieder auf 0 steht, geht das Leitwerk davon aus, dass auf den entsprechenden Leitungen korrekte Ergebnisse anliegen.
-- - Das Ergebnis der Operation wird immer sowohl auf alu_data_in gelegt, als auch in das Register, dass durch alu_adr_out3 adressiert wird, geschrieben. Soll ein Ergebnis ve$
-- - alu_com_out (6 Bit): op1|op2|com
-- - op1 (1 Bit):
-- 0: Lese Operand 1 alu_data_out1
-- 1: Lese Operand 1 aus dem Register, dass durch alu_data_out1(4 downto 0) adressiert wird
-- - op2 (1 Bit):
-- 0: Lese Operand 2 alu_data_out2
-- 1: Lese Operand 2 aus dem Register, dass durch alu_data_out2(4 downto 0) adressiert wird
-- - com (4 Bit):
-- 0000: addiere
-- 0001: subtrahiere
-- 0010: logisches und
-- 0011: logisches oder
-- 0100: logisches xor
-- 0101: shift left
-- 0110: shift right
-- 0111: arithmetic shift right
-- 1000: set less than immediate (siehe ISA)
-- 1001: set less than immediate unsigned (siehe ISA)
--
-- MMU - Leitwerk:
-- - Auf den Leitungen mmu_data_out, mmu_adr_out, mmu_com_out können beliebige Werte anliegen, solange mmu_work_out auf 0 steht.
-- - Auf der Leitung mmu_data_in muss grundsätzlich die Werte der letzten Operation anliegen. Gab es keine letzte Operation (also unmittelbar nach dem Reset), dann wird erwar$
-- - Eine Veränderung des Wertes, der auf mmu_data_in anliegt, ist nur erlaubt, wenn mmu_work_out auf 1 steht.
-- - mmu_work_out wird vom Leitwerk auf 1 gesetzt, wenn es möchte, dass die MMU mit den Werten, die auf den restlichen Leitungen anliegen, nun arbeitet. Es wird wieder auf 0 $
-- - mmu_ack_in wird von der MMU auf 1 gesetzt, sobald bei einem Lesebefehl auf mmu_data_in die zu lesenden Daten liegen oder bei einem Schreibbefehl dieser abgeschlossen wur$
-- - alu_com_out (3 Bit): rw|len
-- - rw (1 Bit):
-- 0: Lese 32 Bit von der Speicherposition, die durch alu_adr_out adressiert wird
-- 1: Schreibe len*8+8 Bit aus alu_data_out(len*8+7 downto 0) an die Speicherposition, die durch alu_adr_out adressiert wird
-- - len (2 Bit):
-- Es sind nur die Werte 00, 01 und 11 erlaubt.
-- siehe rw
library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
entity leitwerk is
port(
-- Clock
clk_in: in std_logic;
-- Reset
rst_in: in std_logic;
-- Error
--err_out: out std_logic_vector(0 downto 0);
-- Datenleitungen
alu_data_in: in std_logic_vector(31 downto 0);
alu_data_out1: out std_logic_vector(31 downto 0);
alu_data_out2: out std_logic_vector(31 downto 0);
-- Adressleitungen
alu_adr_out3: out std_logic_vector(4 downto 0);
-- Befehlsleitung
alu_com_out: out std_logic_vector(5 downto 0);
-- Synchronisationsleitungen
alu_work_out: out std_logic_vector(0 downto 0);
-- Datenleitungen
mmu_data_in: in std_logic_vector(31 downto 0);
mmu_data_out: out std_logic_vector(31 downto 0);
-- Adressleitung
mmu_adr_out: out std_logic_vector(31 downto 0);
-- Befehlsleitung
mmu_com_out: out std_logic_vector(2 downto 0);
-- Synchronisationsleitungen
mmu_work_out: out std_logic_vector(0 downto 0);
mmu_ack_in: in std_logic_vector(0 downto 0)
);
end entity;
architecture leitwerk_1 of leitwerk is
 signal HEADER_wait_state_HEADER: integer:=0;
 signal state1: std_logic_vector(1 downto 0);
 signal state2: std_logic_vector(2 downto 0);
 signal pc: std_logic_vector(29 downto 0);
 signal ir: std_logic_vector(29 downto 0);
 signal err_out: std_logic_vector(0 downto 0);
begin
process(rst_in, clk_in)
begin
 if err_out="1" then
 elsif rst_in='1' then
  HEADER_wait_state_HEADER <= 0;
  state1 <= std_logic_vector(to_unsigned(0,state1'length));
  state2 <= std_logic_vector(to_unsigned(0,state2'length));
  pc <= std_logic_vector(to_unsigned(0,pc'length));
  ir <= std_logic_vector(to_unsigned(0,ir'length));
  err_out <= std_logic_vector(to_unsigned(0,err_out'length));
  alu_data_out1 <= std_logic_vector(to_unsigned(0,alu_data_out1'length));
  alu_data_out2 <= std_logic_vector(to_unsigned(0,alu_data_out2'length));
  alu_adr_out3 <= std_logic_vector(to_unsigned(0,alu_adr_out3'length));
  alu_com_out <= std_logic_vector(to_unsigned(0,alu_com_out'length));
  alu_work_out <= std_logic_vector(to_unsigned(0,alu_work_out'length));
  mmu_data_out <= std_logic_vector(to_unsigned(0,mmu_data_out'length));
  mmu_adr_out <= std_logic_vector(to_unsigned(0,mmu_adr_out'length));
  mmu_com_out <= std_logic_vector(to_unsigned(0,mmu_com_out'length));
  mmu_work_out <= std_logic_vector(to_unsigned(0,mmu_work_out'length));
 elsif rising_edge(clk_in) then
  case state1 is
  when "00" =>
-- Lesen von Speicherzelle dessen Adresse in pc steht
   mmu_data_out <= std_logic_vector(to_unsigned(0,mmu_data_out ' length)); mmu_adr_out <= std_logic_vector(pc(29 downto 0)) & "00"; mmu_com_out <= "0" & "00"; mmu_work_out <= "1";
   state1 <= "01";
  when "01" =>
-- Wir machen erst weiter, wenn von der RAM-Unit eine Antwort vorliegt
   if mmu_ack_in="1" then
    mmu_work_out <= "0";
-- Bits 0 und 1 muessen immer "11" sein
    if mmu_data_in(1 downto 0)/="11" then
     err_out <= "1";
    end if;
    ir(29 downto 0) <= mmu_data_in(31 downto 2);
    state1 <= "10";
   end if;
  when "10" =>
   case ir(4 downto 0) is
-- LUI
   when "01101" =>
    case state2 is
    when "000" =>
     alu_data_out1 <= ir(29 downto 10) & "000000000000"; alu_data_out2 <= std_logic_vector(to_unsigned(0,alu_data_out2 ' length)); alu_adr_out3 <= ir(9 downto 5); alu_com_out <= "0" & "0" & "0000"; alu_work_out <= "1";
     state2 <= "001";
    when "001" =>
     HEADER_wait_state_HEADER <= 0; case HEADER_wait_state_HEADER is when 0 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 1 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 2 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 3 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 4 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 5 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 6 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 7 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 8 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 9 => HEADER_wait_state_HEADER <= 0; state2 <= "010"; when others => err_out <= "1"; end case;
    when "010" =>
     alu_work_out <= "0";
     state1 <= std_logic_vector(to_unsigned(0,state1'length)); state2 <= std_logic_vector(to_unsigned(0,state2'length)); pc <= std_logic_vector(unsigned(pc) + 1);
    when others => err_out <= "1";
    end case;
-- OP
   when "01100" =>
    case state2 is
    when "000" =>
     alu_data_out1(31 downto 0) <= std_logic_vector(resize(unsigned(ir(17 downto 13)),alu_data_out1'length));
     alu_data_out2(31 downto 0) <= std_logic_vector(resize(unsigned(ir(22 downto 18)),alu_data_out2'length));
     alu_adr_out3(4 downto 0) <= ir(9 downto 5);
     alu_work_out <= "1";
     case ir(12 downto 10) is
-- ADD/SUB
     when "000" =>
      if ir(29 downto 23)="0000000" then
       alu_com_out <= "110000";
      elsif ir(29 downto 23)="0100000" then
       alu_com_out <= "110001";
      else
       err_out <= "1";
      end if;
-- SLL
     when "001" =>
      if ir(29 downto 23)/="0000000" then
       err_out <= "1";
      end if;
      alu_com_out <= "110101";
-- SLT
     when "010" =>
      if ir(29 downto 23)/="0000000" then
       err_out <= "1";
      end if;
      alu_com_out <= "111000";
-- SLTU
     when "011" =>
      if ir(29 downto 23)/="0000000" then
       err_out <= "1";
      end if;
      alu_com_out <= "111001";
-- XOR
     when "100" =>
      if ir(29 downto 23)/="0000000" then
       err_out <= "1";
      end if;
      alu_com_out <= "110100";
-- SRL/SRA
     when "101" =>
      if ir(29 downto 23)="0000000" then
       alu_com_out <= "110110";
      elsif ir(29 downto 23)="0100000" then
       alu_com_out <= "110111";
      else
       err_out <= "1";
      end if;
-- OR
     when "110" =>
      if ir(29 downto 23)/="0000000" then
       err_out <= "1";
      end if;
      alu_com_out <= "110011";
-- AND
     when "111" =>
      if ir(29 downto 23)/="0000000" then
       err_out <= "1";
      end if;
      alu_com_out <= "110010";
     when others => err_out <= "1";
     end case;
     state2 <= "001";
    when "001" =>
     HEADER_wait_state_HEADER <= 0; case HEADER_wait_state_HEADER is when 0 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 1 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 2 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 3 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 4 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 5 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 6 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 7 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 8 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 9 => HEADER_wait_state_HEADER <= 0; state2 <= "010"; when others => err_out <= "1"; end case;
    when "010" =>
     alu_work_out <= "0";
     state1 <= std_logic_vector(to_unsigned(0,state1'length)); state2 <= std_logic_vector(to_unsigned(0,state2'length)); pc <= std_logic_vector(unsigned(pc) + 1);
    when others => err_out <= "1";
    end case;
-- STORE
   when "01000" =>
    case state2 is
    when "000" =>
     alu_data_out1 <= std_logic_vector(resize(signed(ir(29 downto 23) & ir(9 downto 5)),alu_data_out1 ' length)); alu_data_out2 <= std_logic_vector(resize(unsigned(std_logic_vector(resize(unsigned(ir(17 downto 13)),alu_data_out2 ' length))),alu_data_out2 ' length)); alu_adr_out3 <= "00000"; alu_com_out <= "0" & "1" & "0000"; alu_work_out <= "1";
     state2 <= "001";
    when "001" =>
     HEADER_wait_state_HEADER <= 0; case HEADER_wait_state_HEADER is when 0 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 1 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 2 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 3 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 4 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 5 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 6 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 7 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 8 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 9 => HEADER_wait_state_HEADER <= 0; state2 <= "010"; when others => err_out <= "1"; end case;
    when "010" =>
     alu_work_out <= "0";
     mmu_adr_out <= alu_data_in;
     state2 <= "011";
    when "011" =>
     alu_data_out1 <= std_logic_vector(to_unsigned(0,alu_data_out1 ' length)); alu_data_out2 <= std_logic_vector(resize(unsigned(ir(22 downto 18)),alu_data_out2 ' length)); alu_adr_out3 <= "00000"; alu_com_out <= "0" & "1" & "0000"; alu_work_out <= "1";
     state2 <= "100";
    when "100" =>
     HEADER_wait_state_HEADER <= 0; case HEADER_wait_state_HEADER is when 0 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 1 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 2 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 3 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 4 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 5 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 6 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 7 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 8 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 9 => HEADER_wait_state_HEADER <= 0; state2 <= "101"; when others => err_out <= "1"; end case;
    when "101" =>
     alu_work_out <= "0";
     case ir(12 downto 10) is
     when "000" =>
      mmu_data_out(31 downto 0) <= std_logic_vector(resize(unsigned(alu_data_in(7 downto 0)),mmu_data_out'length));
      mmu_com_out(2 downto 0) <= "100";
     when "001" =>
      mmu_data_out(31 downto 0) <= std_logic_vector(resize(signed(alu_data_in(15 downto 0)),mmu_data_out'length));
      mmu_com_out(2 downto 0) <= "101";
     when "010" =>
      mmu_data_out(31 downto 0) <= alu_data_in(31 downto 0);
      mmu_com_out(2 downto 0) <= "111";
     when others => err_out <= "1";
     end case;
     mmu_adr_out(31 downto 0) <= alu_data_in(31 downto 0);
     mmu_work_out <= "1";
     state2 <= "110";
    when "110" =>
     if mmu_ack_in="1" then
      mmu_work_out <= "0";
      state1 <= std_logic_vector(to_unsigned(0,state1'length)); state2 <= std_logic_vector(to_unsigned(0,state2'length)); pc <= std_logic_vector(unsigned(pc) + 1);
     end if;
   when others => err_out <= "1";
   end case;
-- LOAD
   when "00000" =>
    case state2 is
    when "000" =>
     alu_data_out1 <= std_logic_vector(resize(signed(ir(29 downto 18)),alu_data_out1 ' length)); alu_data_out2 <= std_logic_vector(resize(unsigned(std_logic_vector(resize(unsigned(ir(17 downto 13)),alu_data_out2 ' length))),alu_data_out2 ' length)); alu_adr_out3 <= "00000"; alu_com_out <= "0" & "1" & "0000"; alu_work_out <= "1";
     state2 <= "001";
    when "001" =>
     HEADER_wait_state_HEADER <= 0; case HEADER_wait_state_HEADER is when 0 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 1 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 2 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 3 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 4 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 5 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 6 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 7 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 8 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 9 => HEADER_wait_state_HEADER <= 0; state2 <= "010"; when others => err_out <= "1"; end case;
    when "010" =>
     alu_work_out <= "0";
     mmu_data_out <= std_logic_vector(to_unsigned(0,mmu_data_out ' length)); mmu_adr_out <= alu_data_in(31 downto 0); mmu_com_out <= "0" & "00"; mmu_work_out <= "1";
     state2 <= "011";
    when "011" =>
     if mmu_ack_in="1" then
      mmu_work_out <= "0";
      case ir(12 downto 10) is
      when "000" =>
       alu_data_out1(31 downto 0) <= std_logic_vector(resize(signed(mmu_data_in(7 downto 0)),alu_data_out1'length));
      when "001" =>
       alu_data_out1(31 downto 0) <= std_logic_vector(resize(signed(mmu_data_in(15 downto 0)),alu_data_out1'length));
      when "010" =>
       alu_data_out1(31 downto 0) <= mmu_data_in(31 downto 0);
      when "100" =>
       alu_data_out1(31 downto 0) <= std_logic_vector(resize(unsigned(mmu_data_in(7 downto 0)),alu_data_out1'length));
      when "101" =>
       alu_data_out1(31 downto 0) <= std_logic_vector(resize(unsigned(mmu_data_in(15 downto 0)),alu_data_out1'length));
      when others => err_out <= "1";
      end case;
      alu_data_out2(31 downto 0) <= std_logic_vector(to_unsigned(0,alu_data_out2'length));
      alu_adr_out3(4 downto 0) <= ir(9 downto 5);
      alu_com_out(5 downto 0) <= "000000";
      alu_work_out <= "1";
      state2 <= "100";
     end if;
    when "100" =>
     HEADER_wait_state_HEADER <= 0; case HEADER_wait_state_HEADER is when 0 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 1 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 2 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 3 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 4 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 5 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 6 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 7 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 8 => HEADER_wait_state_HEADER <= HEADER_wait_state_HEADER + 1; when 9 => HEADER_wait_state_HEADER <= 0; state2 <= "101"; when others => err_out <= "1"; end case;
    when "101" =>
     alu_work_out <= "0";
     state1 <= std_logic_vector(to_unsigned(0,state1'length)); state2 <= std_logic_vector(to_unsigned(0,state2'length)); pc <= std_logic_vector(unsigned(pc) + 1);
    when others => err_out <= "1";
    end case;
   when others => err_out <= "1";
   end case;
  when others => err_out <= "1";
  end case;
 end if;
end process;
end architecture;
