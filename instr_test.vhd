--level_4.vhd
--Generated at Mon Jul 30 08:45:50 2018
--Andrew Miller 7/30/18
--level_4.vhd is a 32 bit constant 4 generator

library IEEE;
use IEEE.std_logic_1164.all;


entity instr_test is

  port(output : out std_logic_vector(31 downto 0));

  
end entity instr_test;



architecture default of instr_test is

  
begin


 output <= "00000000000100010000000010010011";

  
end architecture default;

