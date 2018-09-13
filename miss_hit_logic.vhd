--miss_hit_logic.vhd
-- Generated at Wed Aug 15 12:28:10 2018
--Andrew Miller 8/15/18
--miss_hit_logic.vhd is some miss logic for a VHDL cache

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity miss_hit_logic is

  port(tag : in std_logic_vector(3 downto 0);
       w0 : in std_logic_vector(4 downto 0);
       w1 : in std_logic_vector(4 downto 0);
       hit : out std_logic;
       w0_valid : out std_logic;
       w1_valid : out std_logic
       );
  
end entity miss_hit_logic;

architecture default of miss_hit_logic is

  signal equal_w0 : std_logic_vector(3 downto 0);
  signal equal_w1 : std_logic_vector(3 downto 0);
  signal is_w0 : std_logic;
  signal is_w1 : std_logic;
  
begin

  equal_w0 <= w0(3 downto 0) xnor tag;
  equal_w1 <= w1(3 downto 0) xnor tag;
  is_w0 <= equal_w0(3) and equal_w0(2) and equal_w0(1) and equal_w0(0);
  is_w1 <= equal_w1(3) and equal_w1(2) and equal_w1(1) and equal_w1(1);
  w0_valid <= is_w0 and w0(4);
  w1_valid <= is_w1 and w1(4);
  hit <= (is_w0 and w0(4)) or (is_w1 and w1(4));
  
end architecture default;

