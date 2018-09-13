--data_array.vhd
-- Generated at Wed Aug 15 11:29:14 2018
--Andrew Miller 8/15/18
--data_array.vhd is a cache data array

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity data_array is

  port(clk, wren : in std_logic;
       address : in std_logic_vector(5 downto 0);
       wrdata : in std_logic_vector(31 downto 0);
       data : out std_logic_vector(31 downto 0)
       );
  
end entity data_array;

architecture default of data_array is

  type data_array_data is array (63 downto 0) of std_logic_vector(31 downto 0);
  signal data_array : data_array_data;
  
begin
  
  data <= data_array(to_integer(unsigned(address)));
  
  process(clk)
  begin
  	if wren = '1' then
  	  data_array(to_integer(unsigned(address))) <= wrdata;
    end if;
  end process;

  
end architecture default;

