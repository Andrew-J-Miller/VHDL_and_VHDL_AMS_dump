--cache_tag_valid_array
-- Generated at Thu Aug 23 09:59:27 2018
--Andrew Miller 8/23/18
--cache_tag_valid_array.vhd is an array of tags and valid bits for a 1 kb 2 way set associative cache

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cache_tag_valid_array is

  port(clk, reset, write, validate, invalidate : in std_logic;
       index : in std_logic_vector(5 downto 0);
       data_out : out std_logic_vector(24 downto 0);
       --write_data is 1 bit less than read data b/c the valid bit is included in read data but not write
       write_data : in std_logic_vector(23 downto 0));
       
  
end entity cache_tag_valid_array;

architecture default of cache_tag_valid_array is

  type tag_valid_data is array (63 downto 0) of std_logic_vector(24 downto 0);
  signal tag_valid : tag_valid_data;
  
begin

  process(clk, reset)
  begin
  	if reset = '1' then
  	  --zero_out the array
  	  tag_valid <= (others => (others => '0'));
  	--synchronous writes and validates/invalidates
  	elsif rising_edge(clk) then
  	  if write = '1' then
  	   tag_valid(to_integer(unsigned(index)))(23 downto 0) <= write_data;
      end if;
      if validate = '1' then
        tag_valid(to_integer(unsigned(index)))(24) <= '1';
      elsif invalidate = '1' then
        tag_valid(to_integer(unsigned(index)))(24) <= '0';
      end if;
    end if;
  end process;
  
  --asynchronous reads
  data_out <= tag_valid(to_integer(unsigned(index)));
  	  
  
end architecture default;

