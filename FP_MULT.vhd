--FP_MULT.vhd
-- Generated at Mon Aug 06 08:11:53 2018
--Andrew Miller 8/6/18
--FP_MULT is the multplier element of an FPU

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.p_FloatPt.all;


entity FP_MULT is

  port(A : in std_logic_vector(31 downto 0);
       B : in std_logic_vector(31 downto 0); 
       clk : in std_logic;
       reset : in std_logic;
       go : in std_logic;
       done : out std_logic;
       overflow : out std_logic;
       result : out std_logic_vector(31 downto 0)
       );
  
  
end entity FP_MULT;


architecture default of FP_MULT is

  constant BIAS : unsigned(8 downto 0) := to_unsigned(127, 9); --127 bias
  
  signal full_mantissa : std_logic_vector(47 downto 0);
  signal full_exp : std_logic_vector(8 downto 0);
  signal R_sign : std_logic;
  
  signal Aop, Bop : std_logic_vector(31 downto 0);

  
  --State machine declaration
  type MULT_SM is (WAITM, MAN_EXP, CHECK, NORMALIZE, PAUSE);
  signal MULTIPLY : MULT_SM;
  attribute INIT : string;
  attribute INIT of MULTIPLY : signal is "WAITM";
  
begin

  process(MULTIPLY, clk, go, reset) is 
  begin
  	if reset = '1' then
  	  full_mantissa <= (others => '0');
  	  full_exp <= (others => '0');
  	  done <= '0';
  	  MULTIPLY <= WAITM;
  	elsif rising_edge(clk) then
  	  case MULTIPLY is
  	    when WAITM =>
  	      overflow <= '0';
  	      done <= '0';
  	      if go = '1' then
  	        Aop <= A;
  	        Bop <= B;
  	        MULTIPLY <= MAN_EXP;
  	      else
  	        MULTIPLY <= WAITM;
          end if;
        when MAN_EXP => --compute a sign, exponent and mantissa for product
          R_sign <= Aop(31) xor Bop(31);
          full_mantissa <= std_logic_vector(unsigned('1' & Aop(22 downto 0)) * unsigned('1' & Bop(22 downto 0)));
          full_exp <= std_logic_vector((unsigned(Aop(30 downto 23)) - Bias) + unsigned(Bop(30 downto 23)));
          MULTIPLY <= NORMALIZE;
        when CHECK =>
          if (unsigned(full_exp) > 255) then
            overflow <= '1';
            result <= (31 => R_sign, others => '1');
            done <= '1';
            MULTIPLY <= PAUSE;
          else
            MULTIPLY <= NORMALIZE;
          end if;
        when NORMALIZE =>
          if full_mantissa(47) = '1' then
            full_mantissa <= '0' & full_mantissa(47 downto 1);
            full_exp <= std_logic_vector(unsigned(full_exp) + 1);
          else
            result <= R_sign & full_exp(7 downto 0) & full_mantissa(45 downto 23);
            done <= '1';
            MULTIPLY <= PAUSE;
          end if;
        when PAUSE =>
          if go = '0' then
            done <= '0';
            MULTIPLY <= WAITM;
          end if;
        when others =>
          MULTIPLY <= WAITM;
      end case;
    end if;
  end process;



  
end architecture default;

