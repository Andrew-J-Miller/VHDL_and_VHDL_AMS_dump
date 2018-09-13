--Bus_combine2.vhd
--Generated at Mon Jul 30 09:36:50 2018
--Andrew Miller 7/30/18
--Bus_combine2.vhd is a 2 input part to combine buses into a single 32 bit bus

library IEEE;
use IEEE.std_logic_1164.all;

entity Bus_combine2 is

  port(
    instr_25_0 : in std_logic_vector(27 downto 0);
    PC_31_26 : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(31 downto 0)
  );
  
end entity Bus_combine2;

architecture default of Bus_combine2 is

  
begin

  combine : process(PC_31_26)
    variable temp : std_logic_vector(31 downto 0);
  begin
  	
  	temp(31 downto 28) := PC_31_26;
  	temp(27 downto 0) := instr_25_0;
  	output <= temp;
 end process combine;


  
end architecture default;

