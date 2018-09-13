--mult_sep.vhd
-- Generated at Thu Aug 23 07:41:27 2018
--Andrew Miller 8/23/18
--mult_sep.vhd is a seperator for the 32 msb and 32 lsb of a multiplier

library IEEE;
use IEEE.std_logic_1164.all;

entity mult_sep is

  port(input : in std_logic_vector(63 downto 0);
       msb : out std_logic_vector(31 downto 0);
       lsb : out std_logic_vector(31 downto 0));
  
end entity mult_sep;

architecture default of mult_sep is

  
begin


  msb <= input(63 downto 32);
  lsb <= input(31 downto 0);
  
end architecture default;

