--p_FloatPt.vhd
-- Generated at Mon Aug 06 07:15:42 2018
--Andrew Miller 8/6/18
--p_FloatPt is a floating point package that will be used for floating point operations

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package p_FloatPt is
  --takes a signed integer and converts to fp
  function SIGNED_TO_FP(v : signed)return std_logic_vector;

  --converts a fp number to signed vector of length n
  function FP_to_SIGNED(fp : std_logic_vector; N : integer) return signed;
  
  component FPP_MULT is
    port(A : in std_logic_vector(31 downto 0);
         B : in std_logic_vector(31 downto 0);
         clk : in std_logic;
         reset : in std_logic;
         go : in std_logic;
         done : out std_logic;
         overflow : out std_logic;
         result : out std_logic_vector(31 downto 0)
         );
  end component FPP_MULT;
  
  component FPP_ADD_SUB is
    port(A : in std_logic_vector(31 downto 0);
         B : in std_logic_vector(31 downto 0);
         clk : in std_logic;
         reset : in std_logic;
         go : in std_logic;
         done : out std_logic;
         result : out std_logic_vector(31 downto 0)
         );
  end component FPP_ADD_SUB;
  
  component FPP_DIVIDE is
    port(A : in std_logic_vector(31 downto 0);  --dividend
         B : in std_logic_vector(31 downto 0);  --divisor
         clk : in std_logic;
         reset : in std_logic;
         go : in std_logic;
         done : out std_logic;
         overflow : out std_logic;
         result : out std_logic_vector(31 downto 0)
         );
  end component FPP_DIVIDE;
  
  component MantissaDivision is
    generic(NBIT : integer := 24;
            EBIT : integer := 8);
            
    port(clkin : in std_logic;
         reset : in std_logic;
         start : in std_logic;
         done : out std_logic;
         as : in unsigned(NBIT-1 downto 0);  --aligned dividend mantissa
         bs : in unsigned(NBIT-1 downto 0);  --divisor mantissa
         qs : out unsigned(NBIT-1 downto 0); --quotient
         shift : out unsigned(EBIT-1 downto 0)
         );
  end component MantissaDivision;
  
end package p_FloatPt;

package body p_FloatPt is 

  function SIGNED_TO_FP(v : signed) return std_logic_vector is
    variable i : integer range 0 to v'left+1;
    variable j : integer range 0 to 255;
    variable fp : std_logic_vector(31 downto 0); --fp to be returned
    variable exp : integer range -1024 to 1024;  --the exponent
    variable m : unsigned(v'length downto 0); --mantissa + leading bit
    
    
  begin
  	m := '0' & unsigned(abs(v));  --a mantissa is created using the magnitude of v
  	--mag(v) = 2**(exp-127) * m.m m m m  .... (biased by 127 for IEEE fp)
  	exp := 127 + m'length-1;
  	--normalise m as the mantissa with one bit in front of the decimal point
  	for i in 0 to m'left loop
  	  if m(m'left) = '1' then
  	    j := 1;
  	    exit;
  	  else
  	    m := m(m'left-1 downto 0) & '0';
  	  
  	  end if; 
    end loop;
    exp := exp - j;
    fp(30 downto 23) := std_logic_vector(TO_UNSIGNED(exp, 8));
    --We need to ensure there are enough bits for a normalised mantissa (23)
    
    if  m'length < 24 then --there are less than 24 bits, set bottom bits to 0 and drop leading 1
      fp(23-m'length downto 0) := (others => '0');
      fp(22 downto 24-m'length) := std_logic_vector(m(m'length-2 downto 0));
    else  --24 bits or greater: drop leading 1 and take next 23 bits for fp
      fp(22 downto 0) := std_logic_vector(m(m'length-2 downto m'length-24));
    end if;
    
    if v(v'left) = '1' then
      fp(31) := '1';
    else fp(31) := '0';
    end if;
    return fp;
  end function SIGNED_TO_FP;
  
  function FP_TO_SIGNED(fp : std_logic_vector; N : integer)return signed is
    variable num : unsigned(N+1 downto 0);
    variable result : signed(N+1 downto 0); --return result
    variable exp : integer range -1024 downto 1023;
    variable m : unsigned(24 downto 0);
  begin
  	m := "01" & unsigned(fp(22 downto 0)); --restores mantissa leading 1
  	exp := TO_INTEGER(unsigned(fp(30 downto 23))) - 127; --unbias the exponent
  	if exp < 0 then  --number less than 1 truncated to 0
  	  num := (others => '0');
  	elsif exp >= N then  --number greater than 2**N saturates
  	  num := (others => '1');
  	else
  	  num(exp+1 downto 0) := m(24 downto 23-exp); --effectively multiply m by 2**exp
  	  num(N+1 downto exp+2) := (others => '0'); --and pad with leading zeroes
    end if;
  
    if fp(31) = '1' then
      result := -signed(num);
    else
      result := signed(num);
    end if;
    return result(N-1 downto 0);
  end function FP_TO_SIGNED;
  
end package body p_FloatPt;     
