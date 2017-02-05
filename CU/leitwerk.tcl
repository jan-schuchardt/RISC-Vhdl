set __MMU_8B  "00"
set __MMU_16B "01"
set __MMU_32B "11"
set __MMU_READ  "0"
set __MMU_WRITE "1"
set __ALU_OP_REG "1"
set __ALU_OP_LTK "0"
set ALU_ADD  "00000"
set ALU_SUB  "00001"
set ALU_AND  "00010"
set ALU_OR   "00011"
set ALU_XOR  "00100"
set ALU_SHL  "00101"
set ALU_SHR  "00110"
set ALU_SAR  "00111"
set ALU_SLT  "01000"
set ALU_SLTU "01001"
set ALU_MUL_LOW               "01010"
set ALU_MUL_UPP_SIGN_SIGN     "01011"
set ALU_MUL_UPP_SIGN_UNSIGN   "01100"
set ALU_MUL_UPP_UNSIGN_UNSIGN "01101"
set ALU_DIV_SIGN              "01110"
set ALU_DIV_UNSIGN            "01111"
set ALU_REM_SIGN              "10000"
set ALU_REM_UNSIGN            "10001"

array set signals {}
array set inits {}
array set ports {}
array set commands {}
array set opcodes {}
set entity_name ""
set alu_invoked 0
set mmu_invoked 0
set ir_loaded 0
set set_pc 0
set wait_for_mmu ""
set if_state ""

proc IMPORTS {} {
 puts "library ieee;"
 puts "use ieee.std_logic_1164.all;"
 puts "use ieee.numeric_std.all;"
 puts ""
}

proc DEFINE_SIGNAL {name length {init ""}} {
 if [__IS_DEFINED $name] {
  puts "'$name' is defined!"
  ERROR
 }
 set ::signals($name) "$length"
 if [string match $init ""] {
  set ::inits($name) "std_logic_vector(to_unsigned(0,$name'length))"
 } else {
  set ::inits($name) "$init"
 }
}

proc DEFINE_PORT {name length direction} {
 if [expr ! [string match "in" $direction] && ! [string match "out" $direction]] {
  puts "'direction' should be \"in\" or \"out\"!"
  ERROR
 }
 if [__IS_DEFINED $name] {
  puts "'$name' is defined!"
  ERROR
 }
 set ::ports($name) "$length $direction"
}

proc ENTITY {name} {
 set ::entity_name $name
 puts "entity $name is"
 puts "port("
 set i 1
 foreach {name length_direction} [array get ::ports] {
  if [expr $i == [array size ::ports]] {
   if [expr [lindex $length_direction 0] == 1] {
    puts " $name: [lindex $length_direction 1] std_logic"
   } else {
    puts " $name: [lindex $length_direction 1] std_logic_vector([expr [lindex $length_direction 0] - 1] downto 0)"
   }
  } else {
   if [expr [lindex $length_direction 0] == 1] {
    puts " $name: [lindex $length_direction 1] std_logic;"
   } else {
    puts " $name: [lindex $length_direction 1] std_logic_vector([expr [lindex $length_direction 0] - 1] downto 0);"
   }
  }
  incr i
 }
 puts ");"
 puts "end entity;"
 puts ""
}

proc ARCHITECTURE {name} {
 set digits 1
 foreach {command states} [array get ::commands] {
  if [expr $digits < [llength $states]] {
   set digits [llength $states]
  }
 }
 set max_state $digits
 set digits [expr $digits + 3]
 set digits [expr int([expr ceil([expr [expr log($digits)] / [expr log(2)]])])]
 DEFINE_SIGNAL state $digits "\"[__BINARY $max_state $digits]\""
 puts "architecture $name of $::entity_name is"
 foreach {name length} [array get ::signals] {
  puts " signal $name: std_logic_vector([expr [lindex $length 0] - 1] downto 0);"
 }
 puts "begin"
 puts "process(rst_in,clk_in)"
 puts "begin"
 puts " if rst_in='1' then"
 foreach {name length} [array get ::signals] {
  puts "  $name <= [lindex [array get ::inits $name] 1];"
 }
 foreach {name length_direction} [array get ::ports] {
  if [string match "out" [lindex $length_direction 1]] {
   if [expr ! [string match $name "err_out"] && ! [string match $name "pc_out"] && ! [string match $name "ir_out"]] {
    if [expr [lindex $length_direction 0] == 1] {
     puts "  $name <= '0';"
    } else {
     puts "  $name <= std_logic_vector(to_unsigned(0,$name'length));"
    }
   }
  }
 }
 puts " elsif err=\"1\" then"
 puts ""
 puts " elsif rising_edge(clk_in) then"
 puts "  if state >= \"[__BINARY $max_state $digits]\" then"
 puts "   case state is"
 puts "   when \"[__BINARY $max_state $digits]\" =>"
 puts "    if pc = std_logic_vector(to_unsigned(0,pc'length)) then"
 puts "     if mmu_ack_in = '1' then"
 puts "      mmu_data_out <= std_logic_vector(to_unsigned(0,mmu_data_out'length));"
 puts "      mmu_adr_out  <= std_logic_vector(to_unsigned(0,mmu_adr_out'length));"
 puts "      mmu_com_out  <= \"0\" & \"00\";"
 puts "      mmu_work_out <= '1';"
 puts "      state <= \"[__BINARY [expr $max_state + 1] $digits]\";"
 puts "     end if;"
 puts "    else"
 puts "     pc <= std_logic_vector(unsigned(pc) + 1);"
 puts "    end if;"
 puts "   when \"[__BINARY [expr $max_state + 1] $digits]\" =>"
 puts "    mmu_work_out <= '0';"
 puts "    state <= \"[__BINARY [expr $max_state + 2] $digits]\";"
 puts "   when \"[__BINARY [expr $max_state + 2] $digits]\" =>"
 puts "    if mmu_ack_in='1' then"
 puts "     if mmu_data_in(1 downto 0)/=\"11\" then"
 puts "      err <= \"1\";"
 puts "     end if;"
 puts "     ir(29 downto 0) <= mmu_data_in(31 downto 2);"
 puts "     state <= \"[__BINARY 0 $digits]\";"
 puts "    end if;"
 puts "   when others =>"
 puts "    err <= \"1\";"
 puts "   end case;"
 puts "  else"
 puts "   case ir(4 downto 0) is"
 foreach {command states} [array get ::commands] {
  puts "-- $command"
  puts "   when \"[lindex [array get ::opcodes $command] 1]\" =>"
  puts "    case state is"
  set i 0
  foreach {state} $states {
   if [expr ! [string match $::if_state ""]] {
    puts "if $::if_state then"
   }
   if [expr $i != 0] {
    puts "     state <= \"[__BINARY $i $digits]\";"
   }
   if [expr ! [string match $::if_state ""]] {
    puts "end if;"
    set ::if_state ""
   }
   if [expr ! [string match $::wait_for_mmu ""]] {
    set ::wait_for_mmu ""
    puts "end if;"
   }
   puts "    when \"[__BINARY $i $digits]\" =>"
   if [expr $::alu_invoked == 1] {
    set ::alu_invoked 0
    puts "     alu_work_out <= '0';"
   }
   if [expr $::mmu_invoked == 1] {
    set ::mmu_invoked 0
    puts "     mmu_work_out <= '0';"
   }
   eval $state
   if [expr ! [string match $::wait_for_mmu ""]] {
    puts "if mmu_ack_in='1' then"
    eval $::wait_for_mmu
   }
   incr i
  }
  if [expr $::ir_loaded == 0] {
   puts "     if mmu_ack_in='1' then"
   puts "      if mmu_data_in(1 downto 0)/=\"11\" then"
   puts "       err <= \"1\";"
   puts "      end if;"
   puts "      ir(29 downto 0) <= mmu_data_in(31 downto 2);"
  }
  puts "      instr_ctr <= std_logic_vector(unsigned(instr_ctr) + 1);"
  if [expr ! $::set_pc] {
   puts "      pc <= std_logic_vector(unsigned(pc) + 1);"
  } else {
   set ::set_pc 0
  }
  puts "      state <= \"[__BINARY 0 $digits]\";"
  if [expr $::ir_loaded == 0] {
   puts "     end if;"
  } else {
   set ::ir_loaded 0
  }
  puts "    when others =>"
  puts "     err <= \"1\";"
  puts "    end case;"
 }
 puts "   when others =>"
 puts "    err <= \"1\";"
 puts "   end case;"
 puts "   cycle_ctr <= std_logic_vector(unsigned(cycle_ctr) + 1);"
 puts "   time_ctr <= std_logic_vector(unsigned(time_ctr) + 1);"
 puts "  end if;"
 puts " end if;"
 puts "end process;"
 puts "err_out <= err(0);"
 puts "pc_out <= pc(29 downto 0) & \"00\";"
 puts "ir_out <= ir(29 downto 0) & \"11\";"
 puts "end architecture;"
}

proc ZERO {name} {
 return "std_logic_vector(to_unsigned(0,$name'length))"
}

proc NOP {} {
}

proc WAIT_FOR_MMU {process} {
 set ::wait_for_mmu $process
}

proc SPECIAL {str} {
 puts "$str"
}

proc LOAD_IR {} {
 set ::ir_loaded 1
 puts "     if mmu_data_in(1 downto 0)/=\"11\" then"
 puts "      err <= \"1\";"
 puts "     end if;"
 puts "     ir(29 downto 0) <= mmu_data_in(31 downto 2);"
}

proc CASE {args} {
 if [expr [llength $args] == 0] {
  puts "'CASE' must be called with at least 1 argument!"
  ERROR
 }
 puts "case [lindex $args 0] is"
 set args [lreplace $args 0 0]
 foreach {condition process} $args {
  puts "when \"$condition\" =>"
  eval $process
 }
 puts "when others =>"
 puts " err <= \"1\";"
 puts "end case;"
}

proc IF {condition then else} {
 puts "if $condition then"
 eval $then
 puts "else"
 eval $else
 puts "end if;"
}

proc CURRENT_PC {} {
 return "pc & \"00\""
}

proc NEXT_PC {} {
 return "std_logic_vector(unsigned(pc) + 1) & \"00\""
}

proc CHECK {condition} {
 puts "if $condition then"
 puts " err <= \"1\";"
 puts "end if;"
}

proc EXTEND {dest src} {
 return "std_logic_vector(resize(unsigned($src),$dest'length))"
}

proc SIGN_EXTEND {dest src} {
 return "std_logic_vector(resize(signed($src),$dest'length))"
}

proc SET_PC {data} {
 set ::set_pc 1
 puts "if $data\(1 downto 0\)/=\"00\" then"
 puts " err <= \"1\";"
 puts "end if;"
 puts "pc <= $data\(31 downto 2\);"
}

proc SPECIAL_SET_PC {data} {
 set ::set_pc 1
 puts "if $data\(1 downto 1\)/=\"0\" then"
 puts " err <= \"1\";"
 puts "end if;"
 puts "pc <= $data\(31 downto 2\);"
}

proc IF_STATE {condition} {
 set ::if_state "$condition"
}

proc MMU_READ {address} {
 set ::mmu_invoked 1
 puts "mmu_data_out <= std_logic_vector(to_unsigned(0,mmu_data_out'length));"
 puts "mmu_adr_out  <= $address;"
 puts "mmu_com_out  <= \"$::__MMU_READ\" & \"$::__MMU_8B\";"
 puts "mmu_work_out <= '1';"
}

proc FETCH_COMMAND_FROM {address} {
 MMU_READ "$address"
}

proc FETCH_CURRENT_COMMAND {} {
 MMU_READ "pc & \"00\""
}

proc FETCH_NEXT_COMMAND {} {
 MMU_READ "std_logic_vector(unsigned(pc) + 1) & \"00\""
}

proc MMU_WRITE {address data} {
 set ::mmu_invoked 1
 puts "mmu_data_out <= $data;"
 puts "mmu_adr_out  <= $address;"
 if [string match [__LENGTH $data] "8"] {
  puts "mmu_com_out  <= \"$::__MMU_WRITE\" & \"$::__MMU_8B\";"
 } elseif [string match [__LENGTH $data] "16"] {
  puts "mmu_com_out  <= \"$::__MMU_WRITE\" & \"$::__MMU_16B\";"
 } elseif [string match [__LENGTH $data] "32"] {
  puts "mmu_com_out  <= \"$::__MMU_WRITE\" & \"$::__MMU_32B\";"
 } else {
  puts "Can't write [__LENGTH $data] bytes!"
  ERROR
 }
 puts "mmu_work_out <= '1';"
}

proc ALU_REG_REG {src1 src2 dest com} {
 set ::alu_invoked 1
 puts "alu_data_out1 <= std_logic_vector(resize(unsigned($src1),alu_data_out1'length));"
 puts "alu_data_out2 <= std_logic_vector(resize(unsigned($src2),alu_data_out2'length));"
 puts "alu_adr_out   <= $dest;"
 puts "alu_com_out   <= \"$::__ALU_OP_REG\" & \"$::__ALU_OP_REG\" & \"$com\";"
 puts "alu_work_out  <= '1';"
}

proc ALU_LTK_REG {src1 src2 dest com} {
 set ::alu_invoked 1
 puts "alu_data_out1 <= $src1;"
 puts "alu_data_out2 <= std_logic_vector(resize(unsigned($src2),alu_data_out2'length));"
 puts "alu_adr_out   <= $dest;"
 puts "alu_com_out   <= \"$::__ALU_OP_LTK\" & \"$::__ALU_OP_REG\" & \"$com\";"
 puts "alu_work_out  <= '1';"
}

proc ALU_REG_LTK {src1 src2 dest com} {
 set ::alu_invoked 1
 puts "alu_data_out1 <= std_logic_vector(resize(unsigned($src1),alu_data_out1'length));"
 puts "alu_data_out2 <= $src2;"
 puts "alu_adr_out   <= $dest;"
 puts "alu_com_out   <= \"$::__ALU_OP_REG\" & \"$::__ALU_OP_LTK\" & \"$com\";"
 puts "alu_work_out  <= '1';"
}

proc ALU_LTK_LTK {src1 src2 dest com} {
 set ::alu_invoked 1
 puts "alu_data_out1 <= $src1;"
 puts "alu_data_out2 <= $src2;"
 puts "alu_adr_out   <= $dest;"
 puts "alu_com_out   <= \"$::__ALU_OP_LTK\" & \"$::__ALU_OP_LTK\" & \"$com\";"
 puts "alu_work_out  <= '1';"
}

proc NEW_COMMAND {command opcode} {
 set ::commands($command) [list]
 set ::opcodes($command) $opcode
}

proc NEW_STATE {command process} {
 if [expr ! [__IS_COMMAND $command]] {
  puts "'$command' isn't a command!"
  ERROR
 }
 set lst [lindex [array get ::commands $command] 1]
 lappend lst $process
 set ::commands($command) $lst
}

proc __IS_COMMAND {command} {
 return [llength [array names ::commands -exact $command]]
}

proc __IS_DEFINED {name} {
 return [expr [__IS_SIGNAL $name] || [__IS_PORT $name]]
}

proc __IS_SIGNAL {name} {
 return [llength [array names ::signals -exact $name]]
}

proc __IS_PORT {name} {
 return [llength [array names ::ports -exact $name]]
}

proc __IS_IN {name} {
 if [__IS_SIGNAL $name] {
  return 1
 }
 if [__IS_PORT $name] {
  return [string match [lindex [lindex [array get ::signals $name] 1] 1] "in"]
 } else {
  puts "'$name' isn't defined!"
  ERROR
 }
}

proc __IS_OUT {name} {
 if [__IS_SIGNAL $name] {
  return 1
 }
 if [__IS_PORT $name] {
  return [string match [lindex [lindex [array get ::signals $name] 1] 1] "out"]
 } else {
  puts "'$name' isn't defined!"
  ERROR
 }
}

proc __LENGTH {name} {
 if [__IS_SIGNAL $name] {
  return [lindex [lindex [array get ::signals $name] 1] 0]
 } elseif [__IS_PORT $name] {
  return [lindex [lindex [array get ::ports $name] 1] 0]
 } else {
  puts "'$name' isn't defined!"
  ERROR
 }
}

proc __BINARY {var digits} {
 set tmp $var
 set ret ""
 for {set i 0} {$i < $digits} {incr i} {
  if [expr $tmp == 0] {
   set ret [string cat "0" $ret]
  } else {
   set ret [string cat [expr $tmp & 1] $ret]
   set tmp [expr $tmp >> 1]
  }
 }
 return $ret
}

