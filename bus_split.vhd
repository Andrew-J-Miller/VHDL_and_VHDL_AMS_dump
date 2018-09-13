--bus_split.vhd
-- Generated at Thu Aug 02 07:21:42 2018
--Andrew Miller 8/2/18
--bus_split.vhd is a vhdl bus splitter 32 -> 26 bits

library IEEE;
use IEEE.std_logic_1164.all;



entity bus_split is

  port(
    instr32 : in std_logic_vector(31 downto 0);
    instr26 : out std_logic_vector(25 downto 0)
    );
  
  
end entity bus_split;

architecture default of bus_split is

  
begin

  
  instr26 <= instr32(25 downto 0);
  
  
end architecture default;

