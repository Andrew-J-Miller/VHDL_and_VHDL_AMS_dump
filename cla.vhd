--cla.vhd
-- Generated at Thu Aug 09 14:24:43 2018
--Andrew Miller 8/9/18
--cla.vhd is a 64 bit instantiation of 8 8 bit cla's

library IEEE;
use IEEE.std_logic_1164.all;



entity cla is

  port(a : in std_logic_vector(63 downto 0);
       b: in std_logic_vector(63 downto 0);
       cin : in std_logic;
       s : out std_logic_vector(63 downto 0);
       co : out std_logic
       );
  
end entity cla;

architecture default of cla is

  component cla8
  port(a : in std_logic_vector(7 downto 0);
       b : in std_logic_vector(7 downto 0);
       cin : in std_logic;
       cout : out std_logic;
       s : out std_logic_vector(7 downto 0)
       );
  end component;

  signal co_int : std_logic_vector(6 downto 0);
  
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
           cout => co_int(3)
           );

  cla8_5 : cla8
  port map(a => a(39 downto 32),
           b => b(39 downto 32),
           cin => co_int(3),
           s => s(39 downto 32),
           cout => co_int(4)
           );

          
  cla8_6 : cla8
  port map(a => a(47 downto 40),
           b => b(47 downto 40),
           cin => co_int(4),
           s => s(47 downto 40),
           cout => co_int(5)
           );         
 
  cla8_7 : cla8
  port map(a => a(55 downto 48),
           b => b(55 downto 48),
           cin => co_int(5),
           s => s(55 downto 48),
           cout => co_int(6)
           );
           
  cla8_8 : cla8
  port map(a => a(63 downto 56),
           b => b(63 downto 56),
           cin => co_int(6),
           s => s(63 downto 56),
           cout => co
           );        
           
  
end architecture default;

