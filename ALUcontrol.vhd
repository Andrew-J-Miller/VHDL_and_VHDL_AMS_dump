--ALUcontrol.vhd
--Generated at Fri Jul 27 10:22:38 2018
--Andrew Miller 7/27/18
--ALUcontrol.vhd is a vhdl implementation of an ALU control unit for a MIPS processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;




entity ALUcontrol is

  port(
    instr_15_0 : in std_logic_vector(15 downto 0);
    ALUOp : in std_logic_vector(1 downto 0);
    ALUopcode : out std_logic_vector(2 downto 0);
    instr_31_26 : in std_logic_vector(5 downto 0);
    shift_amnt : out std_logic_vector(4 downto 0);
    signed : out std_logic
  );

  
end entity ALUcontrol;

  

architecture default of ALUcontrol is


  
  
begin
  
 ctrl : process(ALUOp, instr_15_0)
  --R TYPE instructions
  CONSTANT cADD : std_logic_vector(5 downto 0) := "100000";
  CONSTANT cSUB : std_logic_vector(5 downto 0) := "100010";
  CONSTANT cSLT : std_logic_vector(5 downto 0) := "101010";
  CONSTANT cAND : std_logic_vector(5 downto 0) := "100100";
  CONSTANT cOR : std_logic_vector(5 downto 0) := "100101";
  CONSTANT cXOR : std_logic_vector(5 downto 0) := "100110";
  CONSTANT cSRA : std_logic_vector(5 downto 0) := "000011";
  
  --all R TYPE unsigned instructions
  CONSTANT ADDU : std_logic_vector(5 downto 0) := "100001";
  CONSTANT SLTU : std_logic_vector(5 downto 0) := "101011";
  CONSTANT SUBU : std_logic_vector(5 downto 0) := "100011";
  CONSTANT cSRL : std_logic_vector(5 downto 0) := "000010";
  CONSTANT cSLL : std_logic_vector(5 downto 0) := "000000";
  
  
  --all I TYPE unsigned instructions
  CONSTANT ADDIU : std_logic_vector(5 downto 0) := "001001";
  CONSTANT SLTIU : std_logic_vector(5 downto 0) := "001011";
 
  --I TYPE instructions
  CONSTANT ANDI : std_logic_vector(5 downto 0) := "001100";
  CONSTANT ADDI : std_logic_vector(5 downto 0) := "001000";
  CONSTANT ORI : std_logic_vector(5 downto 0) := "001101";
  CONSTANT XORI : std_logic_vector(5 downto 0) := "001110";
  CONSTANT SLTI : std_logic_vector(5 downto 0) := "001010";
 
  begin
 
    case ALUOp is 
      when "00" =>
         signed <= '1';
         ALUopcode <= "010"; --case for add
      when "01" => 
        signed <= '1';
        ALUopcode <= "110"; --case for subtract
      when "10" =>                     --in this case the operation is dependent on the function field
        case instr_15_0 (5 downto 0) is
          when cADD =>
            signed <= '1';
            ALUopcode <= "010"; --add
          when cSUB =>
            signed <= '1';
            ALUopcode <= "110"; --sub
          when cAND => 
            signed <= 'X';
            ALUopcode <= "000"; --AND
          when cOR => 
            signed <= 'X';
            ALUopcode <= "001";  --OR
          when cSLT =>
            signed <= '1'; 
            ALUopcode <= "111"; --SLT
          when cXOR =>
            signed <= 'X'; 
            ALUopcode <= "011"; --XOR
          when cSLL =>
            signed <= 'X';
            ALUopcode <= "101";            --repurposed opcode for left shift
            shift_amnt <= instr_15_0(10 downto 6); --output the shift amount
          when cSRL =>
            signed <= 'X';
            ALUopcode <= "100";            --repurposed opcode for right shift
            shift_amnt <= instr_15_0(10 downto 6); --output the shift amount
            
          when ADDU =>
            signed <= '0';
            ALUopcode <= "010"; --code for add
           
          when SLTU =>
            signed <= '0';
            ALUopcode <= "111"; --code for slt
            
          when SUBU => 
            signed <= '0';
            ALUopcode <= "110"; --code for sub
          
          when cSRA => 
            signed <= '1';
            ALUopcode <= "100"; --code for right shift
            shift_amnt <= instr_15_0(10 downto 6);

          when others => ALUopcode <= "000";
        end case;
      when "11" => --This isn't the norm for MIPS processors, but in this case, 11 is being used as a case for I type instructions
      --the processor needs a case to know when to check the instruction opcode instead of function code to get the 3 bit ALU opcode
        case instr_31_26 (5 downto 0) is
          when ANDI => 
            signed <= 'X';
            ALUopcode <= "000"; --AND
          when ADDI => 
            signed <= '1';
            ALUopcode <= "010"; --add
          when ORI =>
            signed <= 'X'; 
            ALUopcode <= "001"; --OR
          when XORI =>
            signed <= 'X'; 
            ALUopcode <= "011"; --XOR
          when SLTI =>
            signed <= '1'; 
            ALUopcode <= "111"; --SLT
            
          when ADDIU => 
            signed <= '0';
            ALUopcode <= "010"; -- add
            
          when SLTIU =>
            signed <= '0';
            ALUopcode <= "111"; --SLT
          when others => ALUopcode <= "000";
        end case;
      when others => ALUopcode <= "000";
    end case;
   end process ctrl;
   	
		

  
end architecture default;

