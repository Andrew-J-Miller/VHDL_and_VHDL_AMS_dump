--DFF.vhd
-- Generated at Fri Aug 10 09:53:07 2018
--Andrew Miller 8/10/18
--a behavioral DFF
library IEEE;
use IEEE.std_logic_1164.all;


entity DFF is

  port(d, clk, reset : in std_logic;
       q : out std_logic
       );
  
end entity DFF;

architecture default of DFF is

  
begin

  process(clk, reset) is
  begin
  	if reset = '1' then
  	  q <= '0';
  	elsif rising_edge(clk) then
  	  q <= d;
    end if;
  end process;
  
  
end architecture default;

