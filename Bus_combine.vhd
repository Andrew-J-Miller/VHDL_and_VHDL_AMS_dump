--Bus_combine.vhd
--Generated at Mon Jul 30 09:15:21 2018
--Andrew Miller 7/30/18
--Bus_combine.vhd is a part to combine a few varying buses into one 32 bit bus

library IEEE;
use IEEE.std_logic_1164.all;


entity Bus_combine is

  port (
    instr_25_21 : in std_logic_vector(4 downto 0);
    instr_20_16 : in std_logic_vector(4 downto 0);
    instr_15_0 : in std_logic_vector(15 downto 0);
    instr_25_0 : out std_logic_vector(25 downto 0)
    );
  
end entity Bus_combine;

architecture default of Bus_combine is

  
begin

  combine : process(instr_15_0)
    variable temp : std_logic_vector(25 downto 0);
  begin
  	temp(25 downto 21) := instr_25_21;
  	temp(20 downto 16) := instr_20_16;
  	temp(15 downto 0) := instr_15_0;
  	instr_25_0 <= temp;
  end process combine;

  
  
end architecture default;

