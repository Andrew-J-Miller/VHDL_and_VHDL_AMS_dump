--level_4.vhd
--Generated at Mon Jul 30 08:45:50 2018
--Andrew Miller 7/30/18
--level_4.vhd is a 32 bit constant 4 generator

library IEEE;
use IEEE.std_logic_1164.all;


entity level_12_64 is

  port(output : out std_logic_vector(63 downto 0));

  
end entity level_12_64;



architecture default of level_12_64 is

  
begin


 output <= (others => '1');

  
end architecture default;

