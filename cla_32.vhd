--cla_32.vhd
-- Generated at Thu Aug 09 14:24:43 2018
--Andrew Miller 8/9/18
--cla_32.vhd is a 32 bit instantiation of 4 8 bit cla's

library IEEE;
use IEEE.std_logic_1164.all;



entity cla_32 is

  port(a : in std_logic_vector(31 downto 0);
       b: in std_logic_vector(31 downto 0);
       cin : in std_logic;
       s : out std_logic_vector(31 downto 0);
       co : out std_logic
       );
  
end entity cla_32;

architecture default of cla_32 is

  component cla8
  port(a : in std_logic_vector(7 downto 0);
       b : in std_logic_vector(7 downto 0);
       cin : in std_logic;
       cout : out std_logic;
       s : out std_logic_vector(7 downto 0)
       );
  end component;

  signal co_int : std_logic_vector(2 downto 0);
  
begin

  cla8_1 : cla8
  port map(a => a(7 downto 0),
           b => b(7 downto 0),
           cin => cin,
           s => s(7 downto 0),
           cout => co_int(0)
           );


  cla8_2 : cla8
  port map(a => a(15 downto 8),
           b => b(15 downto 8),
           cin => co_int(0),
           s => s(15 downto 8),
           cout => co_int(1)
           );


  cla8_3 : cla8
  port map(a => a(23 downto 16),
           b => b(23 downto 16),
           cin => co_int(1),
           s => s(23 downto 16),
           cout => co_int(2)
           );

  cla8_4 : cla8
  port map(a => a(31 downto 24),
           b => b(31 downto 24),
           cin => co_int(2),
           s => s(31 downto 24),
           cout => co
           );

      
           
  
end architecture default;

