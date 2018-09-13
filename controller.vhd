--controller.vhd
-- Generated at Wed Aug 15 12:53:22 2018
--Andrew Miller 8/15/18
--controller.vhd is a VHDL cache controller

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controller is

  port(write : in std_logic;
       read : in std_logic;
       hit : in std_logic;
       clk : in std_logic;
       cache_ready : in std_logic := '0';
       ram_ready : in std_logic := '0';
       wr_cache : out std_logic := '0';
       wr_ram : out std_logic := '0';
       invalidate : out std_logic := '0';
       validate : out std_logic := '1'
       );
  
end entity controller;

architecture default of controller is

  constant initial : integer := 0;
  constant begin_write_cache : integer := 1; 
  constant started_cache_write : integer := 2;

  
begin

  process(clk)
    variable current_state : integer := initial;
  begin
  	if current_state = initial then
  	  if write = '1' and read = '0' then
  	    wr_ram <= '1';
  	    wr_cache <= '0';
  	    validate <= '0';
  	    if hit = '1' then
  	      invalidate <= '1';
        end if;
      elsif write = '0' and read = '1' then
        if cache_ready = '1' then
          if hit = '1' then
            wr_ram <= '0';
            wr_cache <= '0';
            validate <= '1';
            invalidate <= '0';
          else
            wr_ram <= '0';
            wr_cache <= '1';
            validate <= '1';
            invalidate <= '0';
            current_state := begin_write_cache;
          end if;
        end if;
      else
        wr_ram <= '0';
        wr_cache <= '0';
        validate <= '0';
        invalidate <= '0';
      end if;
      
    elsif current_state = begin_write_cache then
      if cache_ready = '1' then
        current_state := started_cache_write;
        wr_cache <= '1';
        validate <= '1';
        invalidate <= '0';
        wr_ram <= '0';
      end if;
      
    elsif current_state = started_cache_write then
      if cache_ready = '1' then
        current_state := initial;
        wr_cache <= '1';
        validate <= '1';
        wr_ram <= '0';
        invalidate <= '0';
      end if;
    end if;
  end process;
  
      
	

  
end architecture default;

