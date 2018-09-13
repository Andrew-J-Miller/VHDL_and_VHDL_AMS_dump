--alu.vhd
--Generated at Fri Jul 27 09:32:01 2018
--Andrew Miller
--alu.vhd is a vhdl implementation of an alu

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;



use work.procmem_definitions.all;

entity ALU2 is

  
  port(
    a, b : in std_logic_vector(31 downto 0);
    opcode : in std_logic_vector(2 downto 0);
    shift_amnt : in std_logic_vector(4 downto 0);
    signed : in std_logic;
    
    result : out std_logic_vector(31 downto 0);
    zero : out std_logic
    );
  
  
  
end entity ALU2;

architecture default of ALU2 is

  
begin

  execute : process(a, b, opcode)
    variable r_uns : unsigned(width-1 downto 0);
    variable a_uns : std_logic_vector(width-1 downto 0);
    variable b_uns : std_logic_vector(width-1 downto 0);
    variable z_uns : std_logic;
    begin
    	
      a_uns := a;
      b_uns := b;
      
      --select operation based on opcode
      case opcode is 
        --add operation
        when "010" =>
          if signed = '1' then
            r_uns := ADD_SIGNED(width, a_uns, b_uns);
          else
            r_uns := a_uns + b_uns;
          end if;
        --sub operation
        when "110" =>
          r_uns := a_uns - b_uns;
        --xor operation
        when "011" =>
          r_uns := a_uns xor b_uns;
        --and operation
        when "000" =>
          r_uns := a_uns and b_uns;
        --or operation
        when "001" =>
          r_uns := a_uns or b_uns;
        --slt operation
        when "111" =>
          r_uns := a_uns - b_uns;
          if signed(r_uns) < 0 then
            r_uns := to_unsigned(1, r_uns'LENGTH);
          else
            r_uns := (others => '0');
          end if;
        --sll operation  
        when "101" =>
          r_uns := shift_left(a_uns, to_integer(unsigned(shift_amnt)));
        
        --srl operation
        when "100" => 
          r_uns :=  shift_right(a_uns, to_integer(unsigned(shift_amnt)));
          
        --unsed bits (others)
        --set result to don't care
        when others => r_uns := (others => 'X');
      end case;

      --the zero bit must be set if the result is zero
      if to_integer(unsigned(r_uns)) = 0 then
        z_uns := '1';
      else
        z_uns := '0';
      end if;
      
      --assign outputs
      result <= std_logic_vector(r_uns);
      zero <= z_uns;
      
    end process execute;
  
  
  
end architecture default;

