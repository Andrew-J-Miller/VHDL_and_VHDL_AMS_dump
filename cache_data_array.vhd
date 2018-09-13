--cache_data_array.vhd
-- Generated at Thu Aug 23 09:35:28 2018
--Andrew Miller 8/23/18
--cache_data_array is a data array for a 2 way set associative cache

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cache_data_array is

  port(clk, write : in std_logic;
       index : in std_logic_vector(5 downto 0);
       wr_data : in std_logic_vector(31 downto 0);
       data_out : out std_logic_vector(31 downto 0));
        
  
end entity cache_data_array;

architecture default of cache_data_array is

  type cache_data is array(63 downto 0) of std_logic_vector(31 downto 0);
  signal data : cache_data;
  
begin

  --synchronous write process
  process(clk)
  begin
  	if rising_edge(clk) and write = '1' then
  	  data(to_integer(unsigned(index))) <= wr_data;
    end if;
  end process;

  --reads data asynchronously
  data_out <= data(to_integer(unsigned(index)));

  
end architecture default;

