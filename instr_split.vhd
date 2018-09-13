--instr_split.vhd
-- Generated at Wed Aug 01 07:36:21 2018
--Andrew Miller 8/1/18
--instr_split is a vdhl 32 instruction split component for a single cycle MIPS processor

library IEEE;
use IEEE.std_logic_1164.all;



entity instr_split is

  port(
    instr_31_0 : in std_logic_vector(31 downto 0);
    instr_31_26 : out std_logic_vector(5 downto 0);
    instr_25_21 : out std_logic_vector(4 downto 0);
    instr_20_16 : out std_logic_vector(4 downto 0);
    instr_15_0 : out std_logic_vector(15 downto 0);
    instr_15_11 : out std_logic_vector(4 downto 0)
    );
    
  
end entity instr_split;

architecture default of instr_split is

  
begin

  instr_31_26 <= instr_31_0(31 downto 26);
  instr_25_21 <= instr_31_0(25 downto 21);
  instr_20_16 <= instr_31_0(20 downto 16);
  instr_15_0 <= instr_31_0(15 downto 0);
  instr_15_11 <= instr_31_0(15 downto 11);
  
  
  
end architecture default;

