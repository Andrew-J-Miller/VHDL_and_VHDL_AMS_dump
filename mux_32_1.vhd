--mux_32_1.vhd
-- Generated at Fri Aug 10 09:58:24 2018
--Andrew Miller 8/10/18
--a 4 to 1 32 bit mux

library IEEE;
use IEEE.std_logic_1164.all;

entity mux_32_1 is

  port(in00 : in std_logic_vector(31 downto 0);
       in01 : in std_logic_vector(31 downto 0);
       in10 : in std_logic_vector(31 downto 0);
       in11 : in std_logic_vector(31 downto 0);
       sel : in std_logic_vector(1 downto 0);
       output : out std_logic_vector(31 downto 0)
       );
  
end entity mux_32_1;

architecture default of mux_32_1 is

  
begin


  output <= in00 when sel = "00" else
           in01 when sel = "01" else
           in10 when sel = "10" else
           in11 when sel = "11" else
           (others => 'X');
  
end architecture default;

