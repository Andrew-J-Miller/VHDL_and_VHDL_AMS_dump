--ram2.vhd
-- Generated at Wed Aug 15 13:35:48 2018
--Andrew Miller 8/15/18
--ram2.vhd is a vhdl ram implementation for ram in a cache memory system

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram2 is

  port(clk, wr : in std_logic;
       address : in std_logic_vector(9 downto 0);
       data_in : in std_logic_vector(31 downto 0);
       data_out : out std_logic_vector(31 downto 0);
       ram_ready : out std_logic := '0'
       );
  
end entity ram2;

architecture default of ram2 is

  type data_array_data is array (1023 downto 0) of std_logic_vector(31 downto 0);
  signal data_array : data_array_data;
  
begin

  data_out <= data_array(to_integer(unsigned(address)));
  
  process(clk)
  begin
  	ram_ready <= '0';
  	if wr = '1' then
  	  data_array(to_integer(unsigned(address))) <= data_in;
    end if;
  
  ram_ready <= '1';
  
  end process;
  
  
  
end architecture default;

