--Bus_combine3.vhd
-- Generated at Wed Aug 01 08:08:51 2018
--Andrew Miller 8/1/18
--Bus_combine3.vhd is a vhdl 4 and 28 bit bus combinination component

library IEEE;
use IEEE.std_logic_1164.all;


entity Bus_combine4 is

  port(
    in28 : in std_logic_vector(26 downto 0);
    in4 : in std_logic_vector(4 downto 0);
    output : out std_logic_vector(31 downto 0)
    );
  
end entity Bus_combine4;

architecture default of Bus_combine4 is

  
begin

  combine : process(in28, in4)
    variable temp : std_logic_vector(31 downto 0);
  begin
  	temp(31 downto 27) := in4;
  	temp(26 downto 0) := in28;
  	output <= temp;
 end process combine;

  
end architecture default;

