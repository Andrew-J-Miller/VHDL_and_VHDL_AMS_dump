--MantissaDivision
-- Generated at Mon Aug 06 10:15:59 2018
--Andrew Miller 8/6/18
--MantissaDivision.vhd is a Mantissa division module for a 32 bit FPU

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.p_FloatPt.all;


entity MantissaDivision is

  generic(NBIT : integer := 24;
          EBIT : integer := 8);
          
  port(clkin : in std_logic;
       reset : in std_logic;                 --needed to initialize state machine
       start : in std_logic;                 --external start request
       done : out std_logic;                 --division complete signal
       as : in unsigned(NBIT-1 downto 0);    --aligned dividend
       bs : in unsigned(NBIT-1 downto 0);    --divisor
       qs : out unsigned(NBIT-1 downto 0);   --normalized quotient with leading 1 supressed
       shift : out unsigned(EBIT-1 downto 0)
       );
  
  
end entity MantissaDivision;

architecture default of MantissaDivision is

  --state machine signals
  type SM_type is (IDLE, NORM, TEST, CHKBO, FINI);
  signal state : SM_type;
  attribute INIT : string;
  attribute INIT of state : signal is "IDLE"; --initialize to idle state
  signal sm_clk : std_logic;
  
  --registers
  signal acc : unsigned(NBIT-1 downto 0); --accumulated quotient
  signal numerator, denominator : unsigned(2*NBIT-1 downto 0);
  signal diff : unsigned(2*NBIT-1 downto 0); --difference between current numerator and denominator
  signal shift_I : unsigned(EBIT-1 downto 0); --reduction of final exponent for normalization
  signal count : integer range 0 to NBIT; --iteration count
  
  --SR inference
  attribute shreg_extract : string;

  
begin

  shift <= shift_I;
  
  --division state machine
  diff <= numerator - denominator;
  sm_clk <= clkin;
  
  MDIV : process(sm_clk, reset, state, start, as, bs) is
  begin
  	if reset = '1' then
  	  state <= IDLE;
  	  done <= '0';
  	elsif rising_edge(sm_clk) then
  	  case state is
  	    when IDLE =>
  	      if start = '1' then
  	        acc <= (others => '0');
  	        numerator(NBIT-1 downto 0) <= as;
  	        numerator(2*NBIT downto NBIT) <= (others => '0');
  	        denominator(NBIT-1 downto 0) <= bs;
  	        denominator(2*NBIT-1 downto NBIT) <= (others => '0');
  	        count <= 0;
  	        state <= TEST;
  	        done <= '0';
  	        shift_I <= (others => '0');
          end if;
          
        when TEST => --test, shift and apply subtraction to numerator if necessary
          if numerator < denominator then
            acc <= acc(NBIT-2 downto 0) & '0';
            numerator <= numerator(2*NBIT-2 downto 0) & '0';
          else
            acc <= acc(NBIT-2 downto 0) & '1';
            numerator <= diff(2*NBIT-2 downto 0) & '0';
          end if;
          state <= CHKBO;
          
        when CHKBO => --check count for breakout (creates 1 clk delay)
          if count < NBIT-1 then
            count <= count + 1;
            state <= TEST;
          else
            state <= NORM;
          end if;
          
        when NORM => --normalize the 24 bit accumulated quotient
          if acc(NBIT-1) = '0' then
            acc <= acc(NBIT-2 downto 0) & '0';
            shift_I <= shift_I + 1;
            state <= NORM;
          else
            qs <= acc;
            done <= '1';
            state <= FINI;
          end if;
         
        when FINI => --wait until start goes off to avoid a race condition
          if start = '0' then
            state <= IDLE;
            done <= '0';
          end if;
          
        when others => state <= IDLE;
        
      end case;
    end if;
  end process MDIV;
  

  
end architecture default;

