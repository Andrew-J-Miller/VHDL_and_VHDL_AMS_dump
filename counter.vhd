--counter.vhd
-- Generated at Fri Aug 10 09:47:35 2018
--Andrew Miller 8/10/18
--A simple vhdl counter

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity counter is

  port(RESET : in std_logic;
       CLK : in std_logic;
       enable : in std_logic;
       cnt_out : out std_logic_vector(6 downto 0) --output data
       );
  
end entity counter;

architecture default of counter is

  signal cnt : unsigned(6 downto 0);
  
begin

  process(CLK) is
  begin
  	if RESET = '1' then
  	  cnt <= (others => '0');
  	elsif rising_edge(CLK) and enable = '1' then
  	  cnt <= cnt + 1;
    end if;
  end process;

  cnt_out <= std_logic_vector(cnt);
  
end architecture default;

