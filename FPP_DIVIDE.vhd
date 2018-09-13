--FPP_DIVIDE
-- Generated at Mon Aug 06 09:26:06 2018
--Andrew Miller 8/6/18
--FPP_DIVIDE.vhd is a floating point division module for an FPU

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.p_FloatPt.all;


entity FPP_DIVIDE is

  port(A : in std_logic_vector(31 downto 0);
       B : in std_logic_vector(31 downto 0);
       clk : in std_logic;
       reset : in std_logic;
       go : in std_logic;
       done : out std_logic;
       overflow : out std_logic;
       result : out std_logic_vector(31 downto 0) 
       );
  
end entity FPP_DIVIDE;

architecture default of FPP_DIVIDE is

  --constants
  constant ZERO_FP : std_logic_vector(30 downto 0) := (others => '0');
  constant EBIAS : unsigned(8 downto 0) := to_unsigned(127, 9);
  
  --FSM states
  type FPDIV is (FPDivIdle,        --Waits for Go signal to be set
                 FPDivAlign,       --Align dividend
                 FPDivSetExponent, --Set the quotient exponent
                 FPDivStart,       --start mantissa divider
                 FPDivWaitTilDone, --wait for completion
                 FPDivDone,        --done with calculation
                 FPDivPause        --Wait for GO signal to be cleared
                 );

  signal FPD : FPDiv;
  attribute init : string;
  attribute init of FPD : signal is "FPDivIdle";
  
  --Hardware/Registers
  signal Ae : unsigned(8 downto 0); --dividend exponent
  signal Be : unsigned(8 downto 0); --divisor exponent
  
  --Quotient parts
  signal Qs : std_logic;
  signal Qm : std_logic_vector(22 downto 0); --the final mantissa with leading 1 gone
  signal Qe : std_logic_vector(8 downto 0);
  
  --unsigned actual mantissa of divident and divisor with leading 1 restored
  signal rdAm, rdBm : unsigned(23 downto 0);
  
  --normalized mantissa quotient with leading 1
  signal rdQm : unsigned(23 downto 0);
  
  --Required exponent from quotient normalization
  signal expShift : unsigned(7 downto 0);
  
  --clock signals
  signal fpClk0 : std_logic := '0';
  signal fpClk : std_logic := '1';  --25 MHz clock for DIV state machine
  
  --Misc
  signal restoringDivStart : std_logic;
  signal restoringDivDone : std_logic;
  
  
begin

  div_clk0 : process(clk) is
  begin
  	if rising_edge(clk) then
  	  fpClk0 <= not fpClk0;
    end if;
  end process div_clk0;
  
  div_clk1 : process(fpClk0) is
  begin
  	if rising_edge(fpClk0) then
  	  fpClk <= not fpClk;
    end if;
  end process div_clk1;
  
  ----------------------------------------------------------------------
  UDIV : MantissaDivision --instantiate module for Mantissa division
    generic map(NBIT => 24, EBIT => 8)
    port map(clkin => fpClk,
             reset => reset,
             start => restoringDivStart,
             done => restoringDivDone,
             as => rdAm, --full mantissas with hidden leading 1 restored
             bs => rdBm,
             qs => rdQm,
             shift => expShift
             );
             
             
  ---------------------------------------------------------------------
  
  --State Machine for Division Control
  
  SM : process(fpClk, reset) is
  begin
  	if reset = '1' then
  	  FPD <= FPDivIdle;
  	  done <= '0';
  	  overflow <= '0';
  	  restoringDivStart <= '0';
  	elsif rising_edge(fpClk) then
  	  case FPD is
  	    when FPDivIdle =>
  	      restoringDivStart <= '0';
  	      done <= '0';
  	      if go = '1' then
  	        Qs <= A(31) xor B(31); --set sign of quotient
  	        if B(30 downto 0) = ZERO_FP then
  	          Qm <= (others => '1'); --divide by zero, return the max possible number
  	          Qe <= (others => '1');
  	          overflow <= '1';
  	          FPD <= FPDivDone;
  	        elsif A(30 downto 0) = ZERO_FP then
  	          Qm <= (others => '0'); --zero dividend. Return 0
  	          Qe <= (others => '0');
  	          FPD <= FPDivDone;
  	        else
  	          rdAm <= unsigned('1' & A(22 downto 0)); --Actual normalized mantissas
  	          rdBm <= unsigned('1' & B(22 downto 0));
  	          Ae <= unsigned('0' & A(30 downto 23)); --biased exponenets with extra msb
  	          Be <= unsigned('0' & B(30 downto 23));
  	          FPD <= FPDivAlign;
            end if;
          else
            FPD <= FPDivIdle;
          end if;
          
        when FPDivAlign =>
          FPD <= FPDivSetExponent;
          if rdAm > rdBm then
            rdAm <= '0' & rdAm(23 downto 1); --downshift to make Am less than Bm
            Ae <= Ae + 1;
          end if;
          
        when FPDivSetExponent =>
          if Ae > Be then
            Qe <= std_logic_vector(unsigned(Ae) - unsigned(Be) + EBIAS);
          else
            Qe <= std_logic_vector(EBIAS - (unsigned(Be) - unsigned(Ae)));
          end if;
          FPD <= FPDivStart;
          
        when FPDivStart =>
          restoringDivStart <= '1';
          FPD <= FPDivWaitTilDone;
          
        when FPDivWaitTilDone =>
          if restoringDivDone = '1' then
            Qe <= std_logic_vector(unsigned(Qe) - expShift);
            Qm <= std_logic_vector(rdQm(22 downto 0)); --drops the mantissa leading 1
            FPD <= FPDivDone;
          end if;
        
        when FPDivDone =>
          done <= '1';
          result <= Qs & Qe(7 downto 0) & Qm;
          restoringDivStart <= '0';
          FPD <= FPDivPause;
          
        when FPDivPause => 
          if go = '0' then
            done <= '0';
            FPD <= FPDivIdle;
          end if;
          
        when others =>
          FPD <= FPDivIdle;
          
        end case;
      end if;
    end process SM;
  
  
end architecture default;

