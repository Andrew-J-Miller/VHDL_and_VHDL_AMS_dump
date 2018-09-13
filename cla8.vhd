--cla4.vhd
-- Generated at Thu Aug 09 14:44:18 2018
--Andrew Miller 8/9/18
--cla4.vhd is a 8 bit carry lookahead adder

library IEEE;
use IEEE.std_logic_1164.all;

entity cla8 is

  port(a: in std_logic_vector(7 downto 0);
       b : in std_logic_vector(7 downto 0);
       cin : in std_logic;
       s : out std_logic_vector(7 downto 0);
       cout : out std_logic
       );
  
end entity cla8;

architecture default of cla8 is

  component partial_adder
  port(a : in std_logic;
       b : in std_logic;
       cin : in std_logic;
       s : out std_logic;
       p : out std_logic;
       g : out std_logic
       );
  end component;
  
  signal c : std_logic_vector(7 downto 1);
  signal p, g : std_logic_vector(7 downto 0);
  
begin

  PFA1 : partial_adder
  port map(a => a(0),
           b => b(0),
           cin => cin,
           s => s(0),
           p => p(0),
           g => g(0)
           );

  PFA2 : partial_adder
  port map(a => a(1),
           b => b(1),
           cin => c(1),
           s => s(1),
           p => p(1),
           g => g(1)
           );
  
  PFA3 : partial_adder
  port map(a => a(2),
           b => b(2),
           cin => c(2),
           s => s(2),
           p => p(2),
           g => g(2)
           );
  
  PFA4 : partial_adder
  port map(a => a(3),
           b => b(3),
           cin => c(3),
           s => s(3),
           p => p(3),
           g => g(3)
           );

 
  PFA5 : partial_adder
  port map(a => a(4),
           b => b(4),
           cin => c(4),
           s => s(4),
           p => p(4),
           g => g(4)
           );
 
  PFA6 : partial_adder
  port map(a => a(5),
           b => b(5),
           cin => c(5),
           s => s(5),
           p => p(5),
           g => g(5)
           );
  PFA7 : partial_adder
  port map(a => a(6),
           b => b(6),
           cin => c(6),
           s => s(6),
           p => p(6),
           g => g(6)
           );
           
  PFA8 : partial_adder
  port map(a => a(7),
           b => b(7),
           cin => c(7),
           s => s(7),
           p => p(7),
           g => g(7)
           );        
 
  c(1) <= G(0) OR 
        (P(0) AND Cin);
       
  c(2) <= G(1) OR 
        (P(1) AND G(0)) OR 
        (P(1) AND P(0) AND Cin);
       
  c(3) <= G(2) OR 
        (P(2) AND G(1)) OR 
        (P(2) AND P(1) AND G(0)) OR 
        (P(2) AND P(1) AND P(0) AND Cin);
  
  C(4) <= G(3) OR 
          (P(3) AND G(2)) OR 
          (P(3) AND P(2) AND G(1)) OR 
          (P(3) AND P(2) AND P(1) AND G(0)) OR 
          (P(3) AND P(2) AND P(1) AND P(0) AND Cin);

  C(5) <= G(4) OR
          (P(4) AND G(3)) OR 
          (P(4) AND P(3) AND G(2)) OR 
          (P(4) AND P(3) AND P(2) AND G(1)) OR 
          (P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR 
          (P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND Cin);  
          
  C(6) <= G(5) OR
          (P(5) AND G(4)) OR
          (P(5) AND P(4) AND G(3)) OR 
          (P(5) AND P(4) AND P(3) AND G(2)) OR 
          (P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR 
          (P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR 
          (P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND Cin); 
          
   C(7) <= G(6) OR
          (P(6) AND G(5)) OR
          (P(6) AND P(5) AND G(4)) OR
          (P(6) AND P(5) AND P(4) AND G(3)) OR 
          (P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR 
          (P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR 
          (P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR 
          (P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND Cin); 
          
   Cout <= G(7) OR
          (P(7) AND G(6)) OR
          (P(7) AND P(6) AND G(5)) OR
          (P(7) AND P(6) AND P(5) AND G(4)) OR
          (P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR 
          (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR 
          (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR 
          (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR 
          (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND Cin);       
                     
          
  
end architecture default;

