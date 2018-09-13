--cache.vhd
--Generated at Wed Aug 15 13:43:54 2018
--Andrew Miller 8/23/18
--cache.vhd is a vhdl implementation of a 2 way set associative 1 kb L1 cache

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity intsr_cache is

  port(clk, reset_in : in std_logic;
       address : in std_logic_vector(31 downto 0);
       data_in : in std_logic_vector(31 downto 0);
       mem_ready : in std_logic;
       
       write : out std_logic;
       reset_out : out std_logic;
       data_out : out std_logic_vector(31 downto 0);
       tag : out std_logic_vector(23 downto 0);
       index : out std_logic_vector(5 downto 0);
       byte_offset : out std_logic_vector(1 downto 0);
       );
       
  
end entity instr_cache;

architecture default of instr_cache is

  type states is (flush, comp_tag, read_mem);
  
  signal state : states := flush;

begin

  process(clk, reset)
  begin
  	if reset_in = '1' then
  	  state <= flush;
  	elsif rising_edge(clk) then
  	  case state is
  	    when flush =>
  	      --reset all LRU and mark all bits as invalid
  	      reset_out <= '1';
  	      --change state to comp_tag
  	      state <= comp_tag;
  	    when comp_tag =>
  	      if hit = '0' then --condition for cache miss, pull data from memory
  	        state <= read_mem;
  	      else --cache hit, continue to process instructions
  	        byte_offset <= address(1 downto 0);
  	        tag <= address(31 downto 8);
  	        index <= address(7 downto 2);
  	      end if;
  	    when read_mem =>
  	      if mem_ready = '1' then --memory has finished retrieving requested data. Output and write to cache
  	        write <= '1';
  	        state <= comp_tag;
  	      else --memory has not finished retrieving data, continue to wait
  	        state <= mem_ready;
  	      end if;
  	    when others => --this shouldn't happen, but if it does, just reset to flush
  	      state <= flush;
      end case;
    end if;
  end process;
  
  
  
  
  --turn reset_out off whenever flush is not the current state
  reset_out <= '0' when state /= flush;
  
  --asynchoronus reads when hit is high. This allows the cache controller to send the data without another clock cycle
  data_out <= data_in when hit = '1';
  
end architecture default;

