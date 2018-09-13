--IF_register.vhd
-- Generated at Wed Aug 01 12:52:05 2018
--Andrew Miller 8/1/18
--IF_register.vhd is the instruction fetch register for a MIPS sigle datapath pipelined processor

library IEEE;
use IEEE.std_logic_1164.all;



entity IF_register is

  port(
    instruction_in : in std_logic_vector(31 downto 0);
    PC_plus_4_in : in std_logic_vector(31 downto 0);
    instruction_out : out std_logic_vector(31 downto 0);
    PC_plus_4_out : out std_logic_vector(31 downto 0);
    PC_in : in std_logic_vector(31 downto 0);
    PC_out : out std_logic_vector(31 downto 0);
    clk : in std_logic;
    rst_n : in std_logic
    ); 
  
  
end entity IF_register;

architecture default of IF_register is

  
begin

  pipe : process(clk)
  begin
  	if rst_n = '0' then
  	  instruction_out <= (others => '0');
  	  PC_plus_4_out <= (others => '0');
  	  PC_out <= (others => '0');
  	elsif rising_edge(clk) then
  	  instruction_out <= instruction_in;
  	  PC_plus_4_out <= PC_plus_4_in;
  	  PC_out <= PC_in;
    end if;
  end process pipe;

  
end architecture default;

