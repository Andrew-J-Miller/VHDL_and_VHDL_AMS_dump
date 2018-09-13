--demux1_2.vhd
-- Generated at Thu Aug 23 14:57:35 2018
--Andrew Miller 8/23/18
--demux1_2 is a VHDL 1 to 2 1 bit demultiplexer

library IEEE;
use IEEE.std_logic_1164.all;

entity demux1_2 is

  port(input : in std_logic;
       sel : in std_logic;
       out0 : out std_logic;
       out1 : out std_logic);
  
end entity demux1_2;

architecture default of demux1_2 is

  
begin




  out0 <= input when sel = '0' else
          '0';
          
  out1 <= input when sel = '1' else
          '0';

  
end architecture default;

