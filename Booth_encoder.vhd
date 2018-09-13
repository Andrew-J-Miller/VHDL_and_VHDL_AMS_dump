--Booth_encoder.vhd
-- Generated at Thu Aug 09 11:33:20 2018
--Andrew Miller 8/9/18
--Booth_encoder.vhd is a vhdl booth encoder for a 32 bit booth multiplier

library IEEE;
use IEEE.std_logic_1164.all;

--when multiplying a and b:
--d is the radix-4 booth encoded bits of digit of the multiplier b
--a is the bit vector of multiplicand
--n is the 2's complement of a
--m is the product of d and a

entity Booth_encoder is

  port(a : in std_logic_vector(31 downto 0);
       d : in std_logic_vector(2 downto 0);  
       m : out std_logic_vector(32 downto 0)--TBD Lower bit by 1?
       );
    
end entity Booth_encoder;

architecture default of Booth_encoder is

  component cla_32 is --32 bit carry look-ahead adder
    generic (N : integer := 32);
    port(a : in std_logic_vector(N-1 downto 0);
         b : in std_logic_vector(N-1 downto 0);
         cin : in std_logic;
         s : out std_logic_vector(N-1 downto 0);
         co : out std_logic
         );
   end component;
  
  --Signals for two's complement
  signal ai : std_logic_vector(31 downto 0);
  signal an : std_logic_vector(31 downto 0);
  
begin
  --Two's complement of a
  ai <= not a;
  cla_stage : cla_32 
  generic map (N => 31)
  port map(a => ai,
           b => "00000000000000000000000000000001",
           cin => '0',
           s => an
           );
  --Dummy LUT
  with d select
    m <= a(31) & a   when "001", --sign expanded addition
         a(31) & a   when "010", --"" "" ""
         a     & "0" when "011", --add double
         an    & "0" when "100", --subtract double
         an(31)& an  when "101", --sign expanded addition
         an(31)& an  when "110", --"" "" ""
         (others => '0') when others;
  
  
end architecture default;

