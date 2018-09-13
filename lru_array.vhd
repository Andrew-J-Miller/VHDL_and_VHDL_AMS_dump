--lru_array.vhd
-- Generated at Wed Aug 15 11:35:31 2018
--Andrew Miller 8/23/18
--lru_array.vhd is a vhdl lru array for a cache

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lru_array is

  port(hit0, hit1, reset : in std_logic;
       index : in std_logic_vector(5 downto 0);
       LRU_way : out std_logic  
       );
  
end entity lru_array;

architecture default of lru_array is

 signal LRU : std_logic_vector(63 downto 0);
  
begin

  process(index, hit0, hit1, reset)
  begin
  	if reset = '1' then
  	  LRU <= (others => '0');
  	else
  	  if hit1 = '1' then --way 0 is new LRU
  	    LRU(to_integer(unsigned(index))) <= '0';
  	  elsif hit0 = '1' then --way 1 is new LRU
  	    LRU(to_integer(unsigned(index))) <= '1';
      end if;
    end if;
  
  LRU_way <= LRU(to_integer(unsigned(index)));
  
  end process;
  
end architecture default;

