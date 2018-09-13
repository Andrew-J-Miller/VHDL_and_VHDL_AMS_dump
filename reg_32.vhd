--reg_32.vhd
-- Generated at Fri Aug 10 10:03:22 2018
--Andrew Miller 8/10/18
--reg_32 is a 32 bit register

library IEEE;
use IEEE.std_logic_1164.all;


entity reg_32 is

  port(clk, reset, load : in std_logic;
       input : in std_logic_vector(31 downto 0);
       output : out std_logic_vector(31 downto 0)
       );
  
end entity reg_32;

architecture default of reg_32 is

 signal temp : std_logic_vector(31 downto 0);
 signal sel : std_logic_vector(1 downto 0);
  
begin

  process(clk, reset) is
  begin
  	if reset = '1' then
  	  temp <= (others => '0');
  	elsif rising_edge(clk) and load = '1' then
  	  temp <= input;
    end if;
  end process;

  output <= temp;
  
end architecture default;

