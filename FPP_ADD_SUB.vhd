--FPP_ADD_SUB.vhd
-- Generated at Mon Aug 06 08:43:55 2018
--Andrew Miller 8/6/18
--FPP_ADD_SUB.vhd is a floating point add/subtract module for an FPU

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.p_FloatPt.all;

entity FPP_ADD_SUB is

  port(A : in std_logic_vector(31 downto 0);
       B: in std_logic_vector(31 downto 0);
       clk : in std_logic;
       reset : in std_logic;
       go : in std_logic;
       done : out std_logic;
       result : out std_logic_vector(31 downto 0)
       );
  
end entity FPP_ADD_SUB;

architecture default of FPP_ADD_SUB is

  type SMC is (WAITC, ALIGN, ADDC, NORMC, PAUSEC);
  signal ADD_SUB : SMC;
  attribute INIT : string;
  attribute INIT of ADD_SUB : signal is "WAITC"; --initialize the state to WAITC
  
  signal A_mantissa, B_mantissa : std_logic_vector(24 downto 0);
  signal A_exp, B_exp : std_logic_vector(8 downto 0);
  signal A_sgn, B_sgn : std_logic;
  
  signal sum : std_logic_vector(31 downto 0);
  signal mantissa_sum : std_logic_vector(24 downto 0);
 
begin

  result <= sum;
  
  --the state machine process will wait for request,  latch inputs, align exponents, add, then normalize the result
  SM : process(clk, reset, ADD_SUB, go)
    variable diff : signed(8 downto 0);
  begin
  	if reset = '1' then
  	  ADD_SUB <= WAITC;
  	  done <= '0';
  	elsif rising_edge(clk) then
  	  case ADD_SUB is 
  	    when WAITC =>
  	      if go = '1' then
  	        A_sgn <= A(31);
  	        B_sgn <= B(31);
  	        A_exp <= '0' & A(30 downto 23);
  	        B_exp <= '0' & B(30 downto 23);
  	        A_mantissa <= "01" & A(22 downto 0);
  	        B_mantissa <= "01" & B(22 downto 0);
  	        ADD_SUB <= ALIGN;
  	      else
  	        ADD_SUB <= WAITC;
          end if;
        when ALIGN =>  --exponenet alignment. Always makes A_exp be final exponent
          if unsigned(A_exp) = unsigned(B_exp) then
            ADD_SUB <= ADDC;
          elsif unsigned(A_exp) > unsigned(B_exp) then
            diff := signed(A_exp) - signed(B_exp);
            if diff > 23 then
              mantissa_sum <= A_mantissa; --B is insignificant relative to A
              sum(31) <= A_sgn;
              ADD_SUB <= PAUSEC;
            else
              B_mantissa(24- to_integer(diff) downto 0) <= B_mantissa(24 downto to_integer(diff));
              B_mantissa(24 downto 25-to_integer(diff)) <= (others => '0');
              ADD_SUB <= ADDC;
            end if;
          else  --A needs to be downshifted
            diff := signed(B_exp) - signed(A_exp);
            if diff > 23 then
              mantissa_sum <= B_mantissa;
              sum(31) <= B_sgn;
              A_exp <= B_exp;
              ADD_SUB <= PAUSEC;
            else
              A_exp <= B_exp;
              A_mantissa(24-to_integer(diff) downto 0) <= A_mantissa(24 downto to_integer(diff));
              A_mantissa(24 downto 25-to_integer(diff)) <= (others => '0');
              ADD_SUB <= ADDC;
            end if;
          end if;
        when ADDC =>  --the actual addition step
          ADD_SUB <= NORMC;
          if (A_sgn xor B_sgn) = '0' then --condition for same sign, simply add two inputs
            mantissa_sum <= std_logic_vector((unsigned(A_mantissa) + unsigned(B_mantissa)));
            sum(31) <= A_sgn; --since both inputs have the smae sign it doesn't matter which is used
          elsif unsigned(A_mantissa) >= unsigned(B_mantissa) then
            mantissa_sum <= std_logic_vector((unsigned(A_mantissa) - unsigned(B_mantissa)));
            sum(31) <= A_sgn;
          else
            mantissa_sum <= std_logic_vector((unsigned(B_mantissa) - unsigned(A_mantissa)));
            sum(31) <= B_sgn;
          end if;
          
        when NORMC =>  --the post normalization step. A_exp is the exponent of the unormalized sum
          if unsigned(mantissa_sum) = TO_UNSIGNED(0,25) then
            mantissa_sum <= (others => '0');
            A_exp <= (others => '0');
            ADD_SUB <= PAUSEC;
          elsif mantissa_sum(24) = '1' then --if sum overflowed downshift
            mantissa_sum <= '0' & mantissa_sum(24 downto 1);
            A_exp <= std_logic_vector((unsigned(A_exp)+1));
            ADD_SUB <= PAUSEC;
          elsif mantissa_sum(23) = '0' then --upshift
            for i in 22 downto 1 loop
              if mantissa_sum(i) = '1' then
                mantissa_sum(24 downto 23-i) <= mantissa_sum(i+1 downto 0);
                mantissa_sum(22-i downto 0) <= (others => '0');
                A_exp <= std_logic_vector(unsigned(A_exp) - 23 + i);
                exit;
              end if;
            end loop;
            ADD_SUB <= PAUSEC;
            
          else
            ADD_SUB <= PAUSEC;  --the leading 1 is already there. Simply Latch output and wait for acknowledge
          end if;
          
        when PAUSEC =>
          sum(22 downto 0) <= mantissa_sum(22 downto 0);
          sum(30 downto 23) <= A_exp(7 downto 0);
          done <= '1';
          if go = '0' then
            done <= '0';
            ADD_SUB <= WAITC;
          end if;
        
        when others =>  ADD_SUB <= WAITC;
        
      end case;
    end if;
  end process SM;
        
          
            
            
end architecture default;

