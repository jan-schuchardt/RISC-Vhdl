# Abkuerzungen:
#  reg  - Register
#  alu  - ALU
#  ram  - RAM-Unit
#  ltwk - Leitwerk
#  com  - Befehlsleitung(en)
#  work - Synchronisationsleitung
#  data - Datenleitung(en)
#  adr  - Adressleitung(en)
#  ack  - Bestaetigungsleitung
#
#  pc   - Program counter
#  ir   - Instruction register
#  clk  - Clock
#  rst  - Reset
#  err  - Error
#
# Spezifikation für die Schnittstellen zwischen den Werken
# ========================================================
# Leitwerk - ALU
# --------------
# Leitungen:
#  Leitwerk -> ALU
#   Datenleitungen
#    alu_data_out1: out std_logic_vector(31 downto 0)
#    alu_data_out2: out std_logic_vector(31 downto 0)
#   Adressleitungen
#    alu_adr_out:  out std_logic_vector(4 downto 0)
#   Befehlsleitungen
#    alu_com_out:   out std_logic_vector(6 downto 0)
#   Synchronisationsleitungen
#    alu_work_out:  out std_logic
#  ALU -> Leitwerk
#   Datenleitungen
#    alu_data_in:   in  std_logic_vector(31 downto 0)
#   Adressleitungen
#   Befehlsleitungen
#   Synchronisationsleitungen
#
# Spezifikation:
# - Die Leitungen alu_data_out1, alu_data_out2, alu_adr_out, alu_com_out dürfen
#   ihre Werte nur ändern, wenn alu_work_out auf 1 steht.
# - Auf den Leitungen alu_data_in müssen grundsätzlich die Werte der letzten
#   Operation anliegen. Gab es keine letzte Operation (also unmittelbar nach dem
#   Reset), dann wird erwartet, dass auf allen Leitungen eine 0 anliegt.
# - Eine Veränderung des Wertes, der auf alu_data_in anliegt, ist nur erlaubt,
#   wenn alu_work_out 3 Takte vorher auf 1 stand.
# - alu_work_out wird vom Leitwerk einen Takt lang auf 1 gesetzt, wenn es möchte,
#   dass die ALU mit den Werten, die auf den restlichen Leitungen anliegen, nun
#   rechnet.
# - Unmittelbar nach dem Reset wird erwartet und garantiert, dass alle Leitungen
#   auf 0 stehen.
# - Die ALU darf für beliebige Rechenoperation aus der RV32I-ISA max. 3 Takte
#   brauchen (nach diesen 3 Takten müssen die korrekten Ergebnisse auf den
#   Leitungen zum Leitwerk anliegen).
# - Das Ergebnis der Operation wird immer sowohl auf alu_data_in gelegt, als auch
#   in das Register, dass durch alu_adr_out adressiert wird, geschrieben. Soll
#   ein Ergebnis verworfen werden, so wird als Zielregister x0 angegeben.
# - Aufbau von alu_com_out:
#   alu_com_out (6 Bit): op1|op2|com
#   - op1 (1 Bit):
#     0: Lese Operand 1 alu_data_out1
#     1: Lese Operand 1 aus dem Register, dass durch alu_data_out1(4 downto 0) adressiert wird
#   - op2 (1 Bit):
#     0: Lese Operand 2 alu_data_out2
#     1: Lese Operand 2 aus dem Register, dass durch alu_data_out2(4 downto 0) adressiert wird
#   - com (4 Bit):
#     0000: addiere
#     0001: subtrahiere
#     0010: logisches und
#     0011: logisches oder
#     0100: logisches xor
#     0101: shift left
#     0110: shift right
#     0111: arithmetic shift right
#     1000: set less than immediate (siehe ISA)
#     1001: set less than immediate unsigned (siehe ISA)
#
#
# Leitwerk - MMU
# --------------
# Leitungen:
#  Leitwerk -> MMU
#   Datenleitungen
#    mmu_data_out: out std_logic_vector(31 downto 0);
#   Adressleitungen
#    mmu_adr_out:  out std_logic_vector(31 downto 0);
#   Befehlsleitungen
#    mmu_com_out:  out std_logic_vector(3 downto 0);
#   Synchronisationsleitungen
#    mmu_work_out: out std_logic;
#  MMU -> Leitwerk
#   Datenleitungen
#    mmu_data_in:  in  std_logic_vector(31 downto 0);
#   Adressleitungen
#   Befehlsleitungen
#   Synchronisationsleitungen
#    mmu_ack_in:   in  std_logic
#
# Spezifikation:
# - Die Leitungen mmu_data_out, mmu_adr_out, alu_com_out dürfen ihre Werte nur
#   ändern, wenn mmu_work_out auf 1 steht.
# - Auf den Leitungen mmu_data_in müsssen grundsätzlich die Werte der letzten
#   Operation anliegen. Gab es keine letzte Operation (also unmittelbar nach dem
#   Reset), dann wird erwartet, dass auf allen Leitungen eine 0 anliegt.
# - Eine Veränderung des Wertes, der auf mmu_data_in anliegt, ist nur erlaubt,
#   wenn mmu_ack_in sich von 0 auf 1 ändert.
# - mmu_work_out wird vom Leitwerk einen Takt lang auf 1 gesetzt, wenn es möchte,
#   dass die MMU mit den Werten, die auf den restlichen Leitungen anliegen, nun
#   arbeitet.
# - mmu_ack_in wird von der MMU auf 1 gesetzt, sobald bei einem Lesebefehl auf
#   mmu_data_in die zu lesenden Daten gelegt werden oder bei einem Schreibbefehl
#   dieser abgeschlossen wurde. mmu_ack_in wird erst wieder auf 0 gesetzt, wenn
#   auf mmu_work_out eine 1 angelegt wurde.
# - mmu_ack_in darf frühestens 2 Takte nachdem mmu_work_out auf 1 gesetzt wurde
#   auf 1 gesetzt werden.
# - Aufbau von mmu_com_out:
#   mmu_com_out (3 Bit): rw|len
#   - rw (1 Bit):
#     0: Lese 32 Bit von der Speicherposition, die durch alu_adr_out adressiert wird
#     1: Schreibe len*8+8 Bit aus alu_data_out(len*8+7 downto 0) an die Speicherposition, die durch alu_adr_out adressiert wird
#   - len (2 Bit):
#     Es sind nur die Werte 00, 01 und 11 erlaubt.
#     siehe rw

source [file dirname [info script]]/leitwerk.tcl

IMPORTS

# Clock
DEFINE_PORT clk_in        1  in
# Reset
DEFINE_PORT rst_in        1  in
# Error
DEFINE_PORT err_out       1  out
# Debug output
DEFINE_PORT pc_out        32 out
DEFINE_PORT ir_out        32 out

# Datenleitungen
DEFINE_PORT alu_data_in   32 in
DEFINE_PORT alu_data_out1 32 out
DEFINE_PORT alu_data_out2 32 out
# Adressleitungen
DEFINE_PORT alu_adr_out   5  out
# Befehlsleitung
DEFINE_PORT alu_com_out   7  out
# Synchronisationsleitungen
DEFINE_PORT alu_work_out  1  out

# Datenleitungen
DEFINE_PORT mmu_data_in   32 in
DEFINE_PORT mmu_data_out  32 out
# Adressleitung
DEFINE_PORT mmu_adr_out   32 out
# Befehlsleitung
DEFINE_PORT mmu_com_out   3  out
# Synchronisationsleitungen
DEFINE_PORT mmu_work_out  1  out
DEFINE_PORT mmu_ack_in    1  in

ENTITY CU


# Program-Counter
DEFINE_SIGNAL pc        30 std_logic_vector(to_unsigned(1073741800,pc'length))
# Instruction-Register
DEFINE_SIGNAL ir        30
# Error-Signal
DEFINE_SIGNAL err       1
# Timer und Counter (siehe ISA)
DEFINE_SIGNAL cycle_ctr 64
DEFINE_SIGNAL time_ctr  64
DEFINE_SIGNAL instr_ctr 64


NEW_COMMAND LUI 01101
NEW_STATE LUI {
FETCH_NEXT_COMMAND
ALU_LTK_LTK {ir(29 downto 10) & "000000000000"} [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD
}
NEW_STATE LUI {
NOP
}
NEW_STATE LUI {
NOP
}
NEW_STATE LUI {
NOP
}


NEW_COMMAND AUPIC 00101
NEW_STATE AUPIC {
FETCH_NEXT_COMMAND
ALU_LTK_LTK {ir(29 downto 10) & "000000000000"} [CURRENT_PC] {ir(9 downto 5)} $::ALU_ADD
}
NEW_STATE AUPIC {
NOP
}
NEW_STATE AUPIC {
NOP
}
NEW_STATE AUPIC {
NOP
}

NEW_COMMAND JAL 11011
NEW_STATE JAL {
ALU_LTK_LTK [SIGN_EXTEND alu_data_out1 {ir(29 downto 29) & ir(17 downto 10) & ir(18 downto 18) & ir(28 downto 19) & "0"}] [CURRENT_PC] [ZERO alu_adr_out] $::ALU_ADD
}
NEW_STATE JAL {
NOP
}
NEW_STATE JAL {
NOP
}
NEW_STATE JAL {
NOP
}
NEW_STATE JAL {
ALU_LTK_LTK [NEXT_PC] [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD
SET_PC alu_data_in
FETCH_COMMAND_FROM alu_data_in
}
NEW_STATE JAL {
NOP
}
NEW_STATE JAL {
NOP
}
NEW_STATE JAL {
NOP
}

NEW_COMMAND JALR 11001
NEW_STATE JALR {
CHECK {ir(12 downto 10)/="000"}
ALU_REG_LTK {ir(17 downto 13)} [SIGN_EXTEND alu_data_out2 {ir(29 downto 18)}] [ZERO alu_adr_out] $::ALU_ADD
}
NEW_STATE JALR {
NOP
}
NEW_STATE JALR {
NOP
}
NEW_STATE JALR {
NOP
}
NEW_STATE JALR {
ALU_LTK_LTK [NEXT_PC] [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD
SPECIAL_SET_PC alu_data_in
FETCH_COMMAND_FROM {alu_data_in(31 downto 1) & "0"}
}
NEW_STATE JALR {
NOP
}
NEW_STATE JALR {
NOP
}
NEW_STATE JALR {
NOP
}

NEW_COMMAND BRANCH 11000
NEW_STATE BRANCH {
CASE {ir(12 downto 11)}\
00 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} [ZERO alu_adr_out] $::ALU_SUB}\
10 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} [ZERO alu_adr_out] $::ALU_SLT}\
11 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} [ZERO alu_adr_out] $::ALU_SLTU}
}
NEW_STATE BRANCH {
NOP
}
NEW_STATE BRANCH {
NOP
}
NEW_STATE BRANCH {
NOP
}
NEW_STATE BRANCH {
CASE {ir(12 downto 12)}\
 0 {CASE {ir(10 downto 10)}\
     0 {IF {unsigned(alu_data_in)=0}\
         {ALU_LTK_LTK [CURRENT_PC] [SIGN_EXTEND alu_data_out2 {ir(29 downto 29) & ir(5 downto 5) & ir(28 downto 23) & ir(9 downto 6) & "0"}] [ZERO alu_adr_out] $::ALU_ADD}\
         {ALU_LTK_LTK [NEXT_PC] [ZERO alu_data_out2] [ZERO alu_adr_out] $::ALU_ADD}\
       }\
     1 {IF {unsigned(alu_data_in)/=0}\
         {ALU_LTK_LTK [CURRENT_PC] [SIGN_EXTEND alu_data_out2 {ir(29 downto 29) & ir(5 downto 5) & ir(28 downto 23) & ir(9 downto 6) & "0"}] [ZERO alu_adr_out] $::ALU_ADD}\
         {ALU_LTK_LTK [NEXT_PC] [ZERO alu_data_out2] [ZERO alu_adr_out] $::ALU_ADD}\
       }\
   }\
 1 {CASE {ir(10 downto 10)}\
     0 {IF {unsigned(alu_data_in)/=0}\
         {ALU_LTK_LTK [CURRENT_PC] [SIGN_EXTEND alu_data_out2 {ir(29 downto 29) & ir(5 downto 5) & ir(28 downto 23) & ir(9 downto 6) & "0"}] [ZERO alu_adr_out] $::ALU_ADD}\
         {ALU_LTK_LTK [NEXT_PC] [ZERO alu_data_out2] [ZERO alu_adr_out] $::ALU_ADD}\
       }\
     1 {IF {unsigned(alu_data_in)=0}\
         {ALU_LTK_LTK [CURRENT_PC] [SIGN_EXTEND alu_data_out2 {ir(29 downto 29) & ir(5 downto 5) & ir(28 downto 23) & ir(9 downto 6) & "0"}] [ZERO alu_adr_out] $::ALU_ADD}\
         {ALU_LTK_LTK [NEXT_PC] [ZERO alu_data_out2] [ZERO alu_adr_out] $::ALU_ADD}\
       }\
   }
}
NEW_STATE BRANCH {
NOP
}
NEW_STATE BRANCH {
NOP
}
NEW_STATE BRANCH {
NOP
}
NEW_STATE BRANCH {
FETCH_COMMAND_FROM alu_data_in
SET_PC alu_data_in
}
NEW_STATE BRANCH {
NOP
}
NEW_STATE BRANCH {
NOP
}
NEW_STATE BRANCH {
NOP
}

NEW_COMMAND OP-IMM 00100
NEW_STATE OP-IMM {
FETCH_NEXT_COMMAND
CASE {ir(12 downto 10)}\
 000 {ALU_REG_LTK {ir(17 downto 13)} [SIGN_EXTEND alu_data_out2 {ir(29 downto 18)}] {ir(9 downto 5)} $::ALU_ADD}\
 010 {ALU_REG_LTK {ir(17 downto 13)} [SIGN_EXTEND alu_data_out2 {ir(29 downto 18)}] {ir(9 downto 5)} $::ALU_SLT}\
 011 {ALU_REG_LTK {ir(17 downto 13)} [SIGN_EXTEND alu_data_out2 {ir(29 downto 18)}] {ir(9 downto 5)} $::ALU_SLTU}\
 100 {ALU_REG_LTK {ir(17 downto 13)} [SIGN_EXTEND alu_data_out2 {ir(29 downto 18)}] {ir(9 downto 5)} $::ALU_XOR}\
 110 {ALU_REG_LTK {ir(17 downto 13)} [SIGN_EXTEND alu_data_out2 {ir(29 downto 18)}] {ir(9 downto 5)} $::ALU_OR}\
 111 {ALU_REG_LTK {ir(17 downto 13)} [SIGN_EXTEND alu_data_out2 {ir(29 downto 18)}] {ir(9 downto 5)} $::ALU_AND}\
 001 {
      CHECK {ir(29 downto 23)/="0000000"}
      ALU_REG_LTK {ir(17 downto 13)} [SIGN_EXTEND alu_data_out2 {ir(22 downto 18)}] {ir(9 downto 5)} $::ALU_SHL
     }\
 101 {
      IF {ir(29 downto 23)="0000000"}\
       {ALU_REG_LTK {ir(17 downto 13)} [SIGN_EXTEND alu_data_out2 {ir(22 downto 18)}] {ir(9 downto 5)} $::ALU_SHR}\
       {
        IF {ir(29 downto 23)="0100000"}\
        {ALU_REG_LTK {ir(17 downto 13)} [SIGN_EXTEND alu_data_out2 {ir(22 downto 18)}] {ir(9 downto 5)} $::ALU_SAR}\
        {SPECIAL {err <= "1";}}\
       }\
     }
}
NEW_STATE OP-IMM {
NOP
}
NEW_STATE OP-IMM {
NOP
}
NEW_STATE OP-IMM {
NOP
}

NEW_COMMAND OP 01100
NEW_STATE OP {
FETCH_NEXT_COMMAND
IF {ir(29 downto 23)="0000001"}\
{CASE {ir(12 downto 10)}\
  000 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_MUL_LOW}\
  001 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_MUL_UPP_SIGN_SIGN}\
  010 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_MUL_UPP_SIGN_UNSIGN}\
  011 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_MUL_UPP_UNSIGN_UNSIGN}\
  100 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_DIV_SIGN}\
  101 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_DIV_UNSIGN}\
  110 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_REM_SIGN}\
  111 {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_REM_UNSIGN}\
}\
{CASE {ir(12 downto 10)}\
  000 {
       IF {ir(29 downto 23)="0000000"}\
        {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_ADD}\
        {
         IF {ir(29 downto 23)="0100000"}\
         {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_SUB}\
         {SPECIAL {err <= "1";}}\
        }\
      }\
  010 {
       CHECK {ir(29 downto 23)/="0000000"}
       ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_SLT
      }\
  011 {
       CHECK {ir(29 downto 23)/="0000000"}
       ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_SLTU
      }\
  100 {
       CHECK {ir(29 downto 23)/="0000000"}
       ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_XOR
      }\
  110 {
       CHECK {ir(29 downto 23)/="0000000"}
       ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_OR
      }\
  111 {
       CHECK {ir(29 downto 23)/="0000000"}
       ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_AND
      }\
  001 {
       CHECK {ir(29 downto 23)/="0000000"}
       ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_SHL
      }\
  101 {
       IF {ir(29 downto 23)="0000000"}\
        {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_SHR}\
        {
         IF {ir(29 downto 23)="0100000"}\
         {ALU_REG_REG {ir(17 downto 13)} {ir(22 downto 18)} {ir(9 downto 5)} $::ALU_SAR}\
         {SPECIAL {err <= "1";}}\
        }\
      }\
}
}
NEW_STATE OP {
NOP
}
NEW_STATE OP {
IF_STATE {ir(29 downto 23)/="0000001" or ir(12 downto 12)/="1" or alu_data_in=std_logic_vector(to_unsigned(0,alu_data_in'length))}
}
NEW_STATE OP {
NOP
}

NEW_COMMAND STORE 01000
NEW_STATE STORE {
ALU_LTK_REG [SIGN_EXTEND alu_data_out1 {ir(29 downto 23) & ir(9 downto 5)}] {ir(17 downto 13)} [ZERO alu_adr_out] $::ALU_ADD
}
NEW_STATE STORE {
NOP
}
NEW_STATE STORE {
NOP
}
NEW_STATE STORE {
NOP
}
NEW_STATE STORE {
SPECIAL {mmu_adr_out  <= alu_data_in;}
ALU_LTK_REG [ZERO alu_data_out1] {ir(22 downto 18)} [ZERO alu_adr_out] $::ALU_ADD
}
NEW_STATE STORE {
NOP
}
NEW_STATE STORE {
NOP
}
NEW_STATE STORE {
NOP
}
NEW_STATE STORE {
CASE {ir(12 downto 10)}\
 000 {SPECIAL {mmu_data_out <= std_logic_vector(resize(unsigned(alu_data_in(7 downto 0)),mmu_data_out'length)); mmu_com_out(2 downto 0) <= "100";}}\
 001 {SPECIAL {mmu_data_out <= std_logic_vector(resize(unsigned(alu_data_in(15 downto 0)),mmu_data_out'length)); mmu_com_out(2 downto 0) <= "101";}}\
 010 {SPECIAL {mmu_data_out <= alu_data_in; mmu_com_out(2 downto 0) <= "111";}}
SPECIAL {mmu_work_out <= '1';}
}
NEW_STATE STORE {
SPECIAL {mmu_work_out <= '0';}
}
NEW_STATE STORE {
WAIT_FOR_MMU {FETCH_NEXT_COMMAND}
}
NEW_STATE STORE {
NOP
}
NEW_STATE STORE {
NOP
}

NEW_COMMAND LOAD 00000
NEW_STATE LOAD {
ALU_LTK_REG [SIGN_EXTEND alu_data_out1 {ir(29 downto 18)}] {ir(17 downto 13)} [ZERO alu_adr_out] $::ALU_ADD
}
NEW_STATE LOAD {
NOP
}
NEW_STATE LOAD {
NOP
}
NEW_STATE LOAD {
NOP
}
NEW_STATE LOAD {
MMU_READ alu_data_in
}
NEW_STATE LOAD {
NOP
}
NEW_STATE LOAD {
WAIT_FOR_MMU {
CASE {ir(12 downto 10)}\
 000 {ALU_LTK_LTK [SIGN_EXTEND alu_data_out1 {mmu_data_in(7 downto 0)}] [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}\
 001 {ALU_LTK_LTK [SIGN_EXTEND alu_data_out1 {mmu_data_in(15 downto 0)}] [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}\
 010 {ALU_LTK_LTK mmu_data_in [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}\
 100 {ALU_LTK_LTK [EXTEND alu_data_out1 {mmu_data_in(7 downto 0)}] [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}\
 101 {ALU_LTK_LTK [EXTEND alu_data_out1 {mmu_data_in(15 downto 0)}] [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}
FETCH_NEXT_COMMAND
}
}
NEW_STATE LOAD {
NOP
}
NEW_STATE LOAD {
NOP
}
NEW_STATE LOAD {
NOP
}

NEW_COMMAND SYSTEM 11100
NEW_STATE SYSTEM {
FETCH_NEXT_COMMAND
CASE {ir(29 downto 10)}\
 11000000000000000010 {ALU_LTK_LTK {cycle_ctr(31 downto 0)} [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}\
 11001000000000000010 {ALU_LTK_LTK {cycle_ctr(63 downto 32)} [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}\
 11000000000100000010 {ALU_LTK_LTK {time_ctr(31 downto 0)} [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}\
 11001000000100000010 {ALU_LTK_LTK {time_ctr(63 downto 32)} [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}\
 11000000001000000010 {ALU_LTK_LTK {instr_ctr(31 downto 0)} [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}\
 11001000001000000010 {ALU_LTK_LTK {instr_ctr(63 downto 32)} [ZERO alu_data_out2] {ir(9 downto 5)} $::ALU_ADD}\
 00000000000000000000 {ALU_LTK_LTK [ZERO alu_data_out1] [ZERO alu_data_out2] [ZERO alu_adr_out] $::ALU_ADD}\
 00000000000000000001 {ALU_LTK_LTK [ZERO alu_data_out1] [ZERO alu_data_out2] [ZERO alu_adr_out] $::ALU_ADD}
}
NEW_STATE SYSTEM {
NOP
}
NEW_STATE SYSTEM {
NOP
}
NEW_STATE SYSTEM {
NOP
}

NEW_COMMAND MISC-MEM 00011
NEW_STATE MISC-MEM {
 FETCH_NEXT_COMMAND
 CHECK {(ir(29 downto 26) /= "0000" or ir(17 downto 5) /= "0000000000000") and ir(29 downto 5) /= "0000000000000000000100000"}
 ALU_LTK_LTK [ZERO alu_data_out1] [ZERO alu_data_out2] [ZERO alu_adr_out] $::ALU_ADD
}
NEW_STATE MISC-MEM {
NOP
}
NEW_STATE MISC-MEM {
NOP
}
NEW_STATE MISC-MEM {
NOP
}

ARCHITECTURE CU_1

