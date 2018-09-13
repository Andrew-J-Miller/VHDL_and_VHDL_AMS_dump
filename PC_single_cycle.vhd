--PC_single_cycle.vhd
--Generated at Wed Aug 01 07:04:59 2018
--Andrew Miller 8/1/18
--PC_single_cycle.vhd is a vhdl implementation of a PC for a single cycle MIPS processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity PC_single_cycle is

  port(
    PC_in : in std_logic_vector(31 downto 0);
    PC_out : out std_logic_vector(31 downto 0);
    clk : in std_logic;
    rst_n : in std_logic
    );

  
end entity PC_single_cycle;

architecture default of PC_single_cycle is

  
begin
	
	
  PC : process(clk, rst_n)
    variable pc_temp : std_logic_vector(31 downto 0);
  begin
  	if rst_n = '0' then
  	  pc_temp := (others => '0');
  	elsif rising_edge(clk) then
  	  pc_temp := PC_in;
    end if;
    PC_out <= pc_temp;
  end process PC;
	

  
end architecture default;

