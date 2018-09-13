--counter42.vhd
-- Generated at Fri Aug 10 07:45:42 2018
--Andrew Miller 8/10/18
--counter42.vhd is a 4:2 counter

library IEEE;
use IEEE.std_logic_1164.all;

entity counter42 is

  port(a : in std_logic_vector(39 downto 0);
       b : in std_logic_vector(39 downto 0);
       c : in std_logic_vector(39 downto 0);
       d : in std_logic_vector(39 downto 0);
       s : out std_logic_vector(39 downto 0);
       co : out std_logic_vector(39 downto 0)
       );
  
end entity counter42;

architecture default of counter42 is

  signal si : std_logic_vector(39 downto 0);
  signal ti : std_logic_vector(40 downto 0);
  
begin

  ti(0) <= '0';
  proc : process(a,b,c,d)
  begin
  for j in 0 to 39 loop
    --first 3:2 counter
    si(j) <= c(j) xor b(j) xor a(j);
    ti(j+1) <= (c(j) and b(j)) or ((b(j) xor c(j)) and a(j));
  
    --second 3:2 counter
    s(j) <= si(j) xor d(j) xor ti(j);
    co(j) <= (si(j) and d(j)) or ((si(j) xor d(j)) and ti(j));
  end loop;
  end process proc;
  
end architecture default;

