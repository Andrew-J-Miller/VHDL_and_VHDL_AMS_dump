--interter_32.vhd
-- Generated at Fri Aug 10 09:55:38 2018
--Andrew Miller 8/10/18
--A simple 32 bit inverter

library IEEE;
use IEEE.std_logic_1164.all;


entity inverter_32 is

  port(a : in std_logic_vector(31 downto 0);
       b : out std_logic_vector(31 downto 0)
       );
  
end entity inverter_32;

architecture default of inverter_32 is

  
begin

 b <= not a;
  
end architecture default;

