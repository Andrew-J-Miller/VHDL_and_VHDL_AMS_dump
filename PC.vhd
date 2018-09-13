--PC.vhd
--Generated at Fri Jul 27 07:11:54 2018
--Andrew Miller 7/27/18
--PC.vhd is a vhdl implementation of a PC (program counter) for a simple processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;

entity PC is

  port( clk : in std_logic;
  rst_n : in std_logic;
  pc_in : in std_logic_vector(31 downto 0);
  PC_en : in std_logic;
  pc_out : out std_logic_vector(31 downto 0));
  
end entity PC;

architecture default of PC is

  
begin

  program_counter : process(clk, rst_n)
    variable pc_temp : std_logic_vector(width - 1 downto 0);
    
    begin
    	if rst_n = '0' then
    	  pc_temp := (others => '0');
    	elsif rising_edge(clk) then
    	  if PC_en = '1' then
    	    pc_temp := pc_in;
    	  end if;
        end if;
      pc_out <= pc_temp;
      
    end process program_counter;


  
end architecture default;

