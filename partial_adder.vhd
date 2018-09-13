--partial_adder.vhd
-- Generated at Thu Aug 09 14:40:34 2018
--Andrew Miller 8/9/18
--partial_adder.vhd is a partial adder that will be instantiated in an 8 bit cla

library IEEE;
use IEEE.std_logic_1164.all;

entity partial_adder is

  port(a : in std_logic;
       b : in std_logic;
       cin : in std_logic;
       s : out std_logic;
       p : out std_logic;
       g : out std_logic
       );
  
end entity partial_adder;

architecture default of partial_adder is

  
begin

  s <= a xor b xor cin;
  p <= a xor b;
  g <= a and b;

  
end architecture default;

