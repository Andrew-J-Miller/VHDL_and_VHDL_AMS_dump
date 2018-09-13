--level_31.vhd
--Generated at Mon Jul 30 08:45:50 2018
--Andrew Miller 8/3/18
--level_31.vhd is a 32 bit constant 31 generator

library IEEE;
use IEEE.std_logic_1164.all;


entity level_31 is

  port(output : out std_logic_vector(4 downto 0));

  
end entity level_31;



architecture default of level_31 is

  
begin


 output <= (others => '1');

  
end architecture default;

