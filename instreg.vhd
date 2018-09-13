--instreg.vhd
--Generated at Fri Jul 27 09:00:13 2018
--Andrew Miller 7/27/18
--instreg is a vhdl implementation of an instruction reigster for a simple MIPS processor

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;


entity instreg is


  port(
    clk : in std_logic;
    rst_n : in std_logic;
    memdata : in std_logic_vector(31 downto 0);
    IRWrite : in std_logic;
    
    instr_31_26 : out std_logic_vector(5 downto 0);
    instr_25_21 : out std_logic_vector(4 downto 0);
    instr_20_16 : out std_logic_vector(4 downto 0);
    instr_15_0 : out std_logic_vector(15 downto 0)
  );
  
end entity instreg;

architecture default of instreg is

  
begin

  proc_instreg : process(clk, rst_n)
    begin
    	if rst_n = '0' then
    	  instr_31_26 <= (others => '0');
    	  instr_25_21 <= (others => '0');
    	  instr_20_16 <= (others => '0');
    	  instr_15_0 <= (others => '0');
    	elsif rising_edge(clk) then
    	  --memory output needs to be written to the instruction register
    	  if IRWrite = '1' then
    	    instr_31_26 <= (memdata(31 downto 26));
    	    instr_25_21 <= (memdata(25 downto 21));
    	    instr_20_16 <= (memdata(20 downto 16));
    	    instr_15_0 <= (memdata(15 downto 0));
    	  end if;
    	end if;
     end process proc_instreg;
  
end architecture default;

