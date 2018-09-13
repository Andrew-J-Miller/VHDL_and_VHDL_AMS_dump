--control_unit.vhd
-- Generated at Fri Aug 10 10:10:01 2018
--Andrew Miller 8/10/18
--control_unit.vhd is a control unit for a 32 bit Booth multiplier

library IEEE;
use IEEE.std_logic_1164.all;

entity control_unit is

  port(start, clk, reset : in std_logic;
       cnt : in std_logic_vector(6 downto 0);
       done, shift, clear, load_p, load_a, load_b, enable_cnt : out std_logic
       );
       
  
end entity control_unit;

architecture default of control_unit is

  TYPE state is (idle, load_data, addP_holdA, shiftData, finished);
  
  signal cState, nState : state;
  signal cnt_done : std_logic;
  
begin
  
  --the count being done is dependent on the MSB of the counter
  cnt_done <= cnt(6);
  
  transitions : process(clk, reset) is
  begin
  	if reset = '1' then
  	  cState <= idle;
  	elsif rising_edge(clk) then
  	  cState <= nState;
    end if;
  
  end process transitions;


  decoding : process(cState, start, cnt_done)
  begin
  	case cState is 
  	  when idle =>
  	    if start = '1' then
  	      nState <= load_data;
  	    else
  	      nState <= idle;
        end if;
      when load_data =>
        nState <= addP_holdA;
        
      when addp_holdA =>
        nState <= shiftData;
        
      when ShiftData =>
        if cnt_done = '1' then
          nState <= finished;
        else
          nState <= addP_holdA;
        end if;
        
      when finished =>
        nState <= idle;
        
      when others =>
        nState <= idle;
        
    end case;
    
  end process decoding;
  
  outputs : process(cState)
  begin
  	case cState is 
  	  when idle =>
  	    clear <= '1';
  	    done <= '0';
  	    shift <= '0';
  	    load_p <= '0';
  	    load_a <= '0';
  	    load_b <= '0';
  	    enable_cnt <= '0';
  	    
  	  when load_data =>
  	    clear <= '0';
  	    done <= '0';
  	    shift <= '0';
  	    load_p <= '1';
  	    load_a <= '1';
  	    load_b <= '1';
  	    enable_cnt <= '1';

      when addP_holdA =>
        clear <= '0';
  	    done <= '0';
  	    shift <= '0';
  	    load_p <= '1';
  	    load_a <= '0';
  	    load_b <= '0';
  	    enable_cnt <= '1';
  	    
  	  when shiftData =>
  	    clear <= '0';
  	    done <= '0';
  	    shift <= '1';
  	    load_p <= '0';
  	    load_a <= '0';
  	    load_b <= '0';
  	    enable_cnt <= '1';
  	    
  	  when finished =>
  	    clear <= '0';
  	    done <= '1';
  	    shift <= '0';
  	    load_p <= '0';
  	    load_a <= '0';
  	    load_b <= '0';
  	    enable_cnt <= '0';
  	    
    end case;
  end process outputs;
  
end architecture default;

