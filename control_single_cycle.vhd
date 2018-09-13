--control_single_cycle
-- Generated at Wed Aug 01 09:00:49 2018
--Andrew Miller 8/1/18
--control_single_cycle.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity control_single_cycle is

  port(
    instr_31_26 : in std_logic_vector(5 downto 0);
    RegDst, Jump, Branch, memread, memtoReg, memwrite,ALUSrc, Regwrite, BNE_bit, JAL_bit : out std_logic;
    ALUOp : out std_logic_vector(1 downto 0)
    );

  
end entity control_single_cycle;

architecture default of control_single_cycle is


constant RTYPE : std_logic_vector(5 downto 0) := "000000";
constant JUMPI : std_logic_vector(5 downto 0) := "000010";
constant JAL : std_logic_vector(5 downto 0) := "000011";
constant LWORD : std_logic_vector(5 downto 0) := "100011";
constant SWORD : std_logic_vector(5 downto 0) := "101011";
constant BEQ : std_logic_vector(5 downto 0) := "000100";
constant BNE : std_logic_vector(5 downto 0) := "000101";
constant ADDI : std_logic_vector(5 downto 0) := "001000";
CONSTANT ANDI : std_logic_vector(5 downto 0) := "001100";
CONSTANT ORI : std_logic_vector(5 downto 0) := "001101";
CONSTANT XORI : std_logic_vector(5 downto 0) := "001110";
CONSTANT SLTI : std_logic_vector(5 downto 0) := "001010";

CONSTANT ADDIU : std_logic_vector(5 downto 0) := "001001";
CONSTANT SLTIU : std_logic_vector(5 downto 0) := "001011";
  
begin
	
  control_signal : process(instr_31_26)
    variable control : std_logic_vector(11 downto 0);
  begin
  	case instr_31_26 is
  	  when RTYPE => control := "001000010001";
  	  when LWORD => control := "000001100011";
  	  when SWORD => control := "000000000110";
  	  when BEQ => control := "000010001000";
  	  when BNE => control := "010010001000";
  	  when ADDI => control := "000000011011";
  	  when ORI => control := "000000011011";
  	  when ANDI => control := "000000011011";
  	  when XORI => control := "000000011011";
  	  when SLTI => control := "000000011011";
  	  when JUMPI => control := "000100001000";
  	  when JAL => control := "100100001001";
  	  when ADDIU => control := "000000011011";
  	  when SLTIU => control := "000000011011";
  	  when others => control := (others => '0');
    end case;
  
    
    JAL_bit <= control(11);
    BNE_bit <= control(10);
    RegDst <= control(9);
    Jump <= control(8);
    Branch <= control(7);
    memread <= control(6);
    memtoReg <= control(5);
    ALUOp <= control(4 downto 3);
    memwrite <= control(2);
    ALUSrc <= control(1);
    Regwrite <= control(0);
  
  end process control_signal;

end architecture default;

