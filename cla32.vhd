--cla.vhd
--Generated at Thu Aug 09 11:53:40 2018
--Andrew Miller 8/9/18
--cla.vhd is a 32 bit carry lookahead adder

library IEEE;
use IEEE.std_logic_1164.all;

entity cla32 is

  port(a : in std_logic_vector(31 downto 0);
       b : in std_logic_vector(31 downto 0);
       ci : in std_logic;
       s : out std_logic_vector(31 downto 0)
       );
  
end entity cla32;

architecture default of cla32 is

  signal g : std_logic_vector(31 downto 0);
  signal p : std_logic_vector(31 downto 0);
  signal c : std_logic_vector(31 downto 0);
  
begin
  product_loop: for i in 0 to 31 generate
    p(i) <= a(i) xor b(i);
    g(i) <= a(i) and b(i);
  end generate;


  s(0) <= p(0) xor ci;
  sum_loop: for i in 0 to 6 generate
    s(i+1) <= p(i+1) xor c(i);
  end generate;


  c(0) <= 
          g(0) or
          (ci and p(0));
          
  c(1) <= 
          g(1) or
          (g(0) and p(1)) or 
          (ci and p(1) and p(0));
          
  c(2) <= 
          g(2) or
          (g(1) and p(2)) or 
          (g(0) and p(2) and p(1)) or
          (ci and p(2) and p(1) and p(0));  
          
  c(3) <= 
          g(3) or
          (g(2) and p(3)) or 
          (g(1) and p(3) and p(2)) or
          (g(0) and p(3) and p(2) and p(1)) or
          (ci and p(3) and p(2) and p(1) and p(0)); 
          
   c(4) <= 
          g(4) or
          (g(3) and p(4)) or
          (g(2) and p(4) and p(3)) or 
          (g(1) and p(4) and p(3) and p(2)) or
          (g(0) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(4) and p(3) and p(2) and p(1) and p(0)); 
          
   c(5) <= 
          g(5) or
          (g(4) and p(5)) or
          (g(3) and p(5) and p(4)) or
          (g(2) and p(5) and p(4) and p(3)) or 
          (g(1) and p(5) and p(4) and p(3) and p(2)) or
          (g(0) and p(5) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(5) and p(4) and p(3) and p(2) and p(1) and p(0)); 
          
    c(6) <= 
          g(6) or
          (g(5) and p(6)) or
          (g(4) and p(6) and p(5)) or
          (g(3) and p(6) and p(5) and p(4)) or
          (g(2) and p(6) and p(5) and p(4) and p(3)) or 
          (g(1) and p(6) and p(5) and p(4) and p(3) and p(2)) or
          (g(0) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));
          
    c(7) <= 
          g(7) or
          (g(6) and p(7)) or
          (g(5) and p(7) and p(6)) or
          (g(4) and p(7) and p(6) and p(5)) or
          (g(3) and p(7) and p(6) and p(5) and p(4)) or
          (g(2) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
          (g(1) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
          (g(0) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));
                           
     c(8) <= 
          g(8) or
          (g(7) and p(8)) or
          (g(6) and p(8) and p(7)) or
          (g(5) and p(8) and p(7) and p(6)) or
          (g(4) and p(8) and p(7) and p(6) and p(5)) or
          (g(3) and p(8) and p(7) and p(6) and p(5) and p(4)) or
          (g(2) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
          (g(1) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
          (g(0) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));   
 
          
     c(9) <= 
          g(9) or
          (g(8) and p(9)) or
          (g(7) and p(9) and p(8)) or
          (g(6) and p(9) and p(8) and p(7)) or
          (g(5) and p(9) and p(8) and p(7) and p(6)) or
          (g(4) and p(9) and p(8) and p(7) and p(6) and p(5)) or
          (g(3) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
          (g(2) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
          (g(1) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
          (g(0) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));

          
     c(10) <= 
          g(10) or
          (g(9) and p(10)) or
          (g(8) and p(10) and p(9)) or
          (g(7) and p(10) and p(9) and p(8)) or
          (g(6) and p(10) and p(9) and p(8) and p(7)) or
          (g(5) and p(10) and p(9) and p(8) and p(7) and p(6)) or
          (g(4) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
          (g(3) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
          (g(2) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
          (g(1) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
          (g(0) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  

          
     c(11) <= 
          g(11) or
          (g(10) and p(11)) or
          (g(9) and p(11) and p(10)) or
          (g(8) and p(11) and p(10) and p(9)) or
          (g(7) and p(11) and p(10) and p(9) and p(8)) or
          (g(6) and p(11) and p(10) and p(9) and p(8) and p(7)) or
          (g(5) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
          (g(4) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
          (g(3) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
          (g(2) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
          (g(1) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
          (g(0) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));   
          
  c(12) <= 
          g(12) or
          (g(11) and p(12)) or
          (g(10) and p(12) and p(11)) or
          (g(9) and p(12) and p(11) and p(10)) or
          (g(8) and p(12) and p(11) and p(10) and p(9)) or
          (g(7) and p(12) and p(11) and p(10) and p(9) and p(8)) or
          (g(6) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
          (g(5) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
          (g(4) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
          (g(3) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
          (g(2) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
          (g(1) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
          (g(0) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));             
                            
    c(13) <= 
          g(13) or
          (g(12) and p(13)) or
          (g(11) and p(13) and p(12)) or
          (g(10) and p(13) and p(12) and p(11)) or
          (g(9) and p(13) and p(12) and p(11) and p(10)) or
          (g(8) and p(13) and p(12) and p(11) and p(10) and p(9)) or
          (g(7) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
          (g(6) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
          (g(5) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
          (g(4) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
          (g(3) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
          (g(2) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
          (g(1) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
          (g(0) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));
          
  c(14) <= 
          g(14) or
          (g(13) and p(14)) or
          (g(12) and p(14) and p(13)) or
          (g(11) and p(14) and p(13) and p(12)) or
          (g(10) and p(14) and p(13) and p(12) and p(11)) or
          (g(9) and p(14) and p(13) and p(12) and p(11) and p(10)) or
          (g(8) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
          (g(7) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
          (g(6) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
          (g(5) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
          (g(4) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
          (g(3) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
          (g(2) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
          (g(1) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
          (g(0) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
          (ci and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
   
  c(15) <= 
         g(15) or
         (g(14) and p(15)) or
         (g(13) and p(15) and p(14)) or
         (g(12) and p(15) and p(14) and p(13)) or
         (g(11) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
 
                 
  c(16) <= 
         g(16) or
         (g(15) and p(16)) or
         (g(14) and p(16) and p(15)) or
         (g(13) and p(16) and p(15) and p(14)) or
         (g(12) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
                                    
   c(17) <= 
         g(17) or
         (g(16) and p(17)) or
         (g(15) and p(17) and p(16)) or
         (g(14) and p(17) and p(16) and p(15)) or
         (g(13) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
                           
  c(18) <= 
         g(18) or
         (g(17) and p(18)) or
         (g(16) and p(18) and p(17)) or
         (g(15) and p(18) and p(17) and p(16)) or
         (g(14) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
                           
    
   c(19) <= 
         g(19) or
         (g(18) and p(19)) or 
         (g(17) and p(19) and p(18)) or
         (g(16) and p(19) and p(18) and p(17)) or
         (g(15) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
                           
 
   c(20) <= 
         g(20) or
         (g(19) and p(20)) or 
         (g(18) and p(20) and p(19)) or 
         (g(17) and p(20) and p(19) and p(18)) or
         (g(16) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  

   c(21) <= 
         g(21) or
         (g(20) and p(21)) or
         (g(19) and p(21) and p(20)) or 
         (g(18) and p(21) and p(20) and p(19)) or 
         (g(17) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
                       
  
  c(22) <= 
         g(22) or
         (g(21) and p(22)) or
         (g(20) and p(22) and p(21)) or
         (g(19) and p(22) and p(21) and p(20)) or 
         (g(18) and p(22) and p(21) and p(20) and p(19)) or 
         (g(17) and p(22) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
 
  c(23) <= 
         g(23) or
         (g(22) and p(23)) or
         (g(21) and p(23) and p(22)) or
         (g(20) and p(23) and p(22) and p(21)) or
         (g(19) and p(23) and p(22) and p(21) and p(20)) or 
         (g(18) and p(23) and p(22) and p(21) and p(20) and p(19)) or 
         (g(17) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
  
  c(24) <= 
         g(24) or
         (g(23) and p(24)) or
         (g(22) and p(24) and p(23)) or
         (g(21) and p(24) and p(23) and p(22)) or
         (g(20) and p(24) and p(23) and p(22) and p(21)) or
         (g(19) and p(24) and p(23) and p(22) and p(21) and p(20)) or 
         (g(18) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19)) or 
         (g(17) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
  

  c(25) <= 
         g(25) or
         (g(24) and p(25)) or 
         (g(23) and p(25) and p(24)) or
         (g(22) and p(25) and p(24) and p(23)) or
         (g(21) and p(25) and p(24) and p(23) and p(22)) or
         (g(20) and p(25) and p(24) and p(23) and p(22) and p(21)) or
         (g(19) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20)) or 
         (g(18) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19)) or 
         (g(17) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
 
  c(26) <= 
         g(26) or
         (g(25) and p(26)) or
         (g(24) and p(26) and p(25)) or 
         (g(23) and p(26) and p(25) and p(24)) or
         (g(22) and p(26) and p(25) and p(24) and p(23)) or
         (g(21) and p(26) and p(25) and p(24) and p(23) and p(22)) or
         (g(20) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21)) or
         (g(19) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20)) or 
         (g(18) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19)) or 
         (g(17) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  


  c(27) <= 
         g(27) or
         (g(26) and p(27)) or
         (g(25) and p(27) and p(26)) or
         (g(24) and p(27) and p(26) and p(25)) or 
         (g(23) and p(27) and p(26) and p(25) and p(24)) or
         (g(22) and p(27) and p(26) and p(25) and p(24) and p(23)) or
         (g(21) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22)) or
         (g(20) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21)) or
         (g(19) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20)) or 
         (g(18) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19)) or 
         (g(17) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  

  c(28) <= 
         g(28) or
         (g(27) and p(28)) or
         (g(26) and p(28) and p(27)) or
         (g(25) and p(28) and p(27) and p(26)) or
         (g(24) and p(28) and p(27) and p(26) and p(25)) or 
         (g(23) and p(28) and p(27) and p(26) and p(25) and p(24)) or
         (g(22) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23)) or
         (g(21) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22)) or
         (g(20) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21)) or
         (g(19) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20)) or 
         (g(18) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19)) or 
         (g(17) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  


  c(29) <= 
         g(29) or
         (g(28) and p(29)) or
         (g(27) and p(29) and p(28)) or
         (g(26) and p(29) and p(28) and p(27)) or
         (g(25) and p(29) and p(28) and p(27) and p(26)) or
         (g(24) and p(29) and p(28) and p(27) and p(26) and p(25)) or 
         (g(23) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24)) or
         (g(22) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23)) or
         (g(21) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22)) or
         (g(20) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21)) or
         (g(19) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20)) or 
         (g(18) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19)) or 
         (g(17) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
 
  c(30) <= 
         g(30) or
         (g(29) and p(30)) or
         (g(28) and p(30) and p(29)) or
         (g(27) and p(30) and p(29) and p(28)) or
         (g(26) and p(30) and p(29) and p(28) and p(27)) or
         (g(25) and p(30) and p(29) and p(28) and p(27) and p(26)) or
         (g(24) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25)) or 
         (g(23) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24)) or
         (g(22) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23)) or
         (g(21) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22)) or
         (g(20) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21)) or
         (g(19) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20)) or 
         (g(18) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19)) or 
         (g(17) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  

  c(31) <= 
         g(31) or
         (g(30) and p(31)) or
         (g(29) and p(31) and p(30)) or
         (g(28) and p(31) and p(30) and p(29)) or
         (g(27) and p(31) and p(30) and p(29) and p(28)) or
         (g(26) and p(31) and p(30) and p(29) and p(28) and p(27)) or
         (g(25) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26)) or
         (g(24) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25)) or 
         (g(23) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24)) or
         (g(22) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23)) or
         (g(21) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22)) or
         (g(20) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21)) or
         (g(19) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20)) or 
         (g(18) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19)) or 
         (g(17) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18)) or
         (g(16) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17)) or
         (g(15) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16)) or
         (g(14) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15)) or
         (g(13) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14)) or
         (g(12) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13)) or
         (g(11) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12)) or
         (g(10) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11)) or
         (g(9) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10)) or
         (g(8) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9)) or
         (g(7) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8)) or
         (g(6) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7)) or
         (g(5) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6)) or
         (g(4) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5)) or
         (g(3) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4)) or
         (g(2) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3)) or 
         (g(1) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2)) or
         (g(0) and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1)) or
         (ci and p(31) and p(30) and p(29) and p(28) and p(27) and p(26) and p(25) and p(24) and p(23) and p(22) and p(21) and p(20) and p(19) and p(18) and p(17) and p(16) and p(15) and p(14) and p(13) and p(12) and p(11) and p(10) and p(9) and p(8) and p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0));  
               
end architecture default;

