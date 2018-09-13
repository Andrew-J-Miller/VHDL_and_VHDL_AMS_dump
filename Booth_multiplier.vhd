--Booth_multiplier.vhd
-- Generated at Fri Aug 10 11:11:20 2018
--Andrew Miller 8/10/18
--Booth_multiplier.vhd is a Booth multiplier creaed by instantiating the multiplier_datapath.vhd component

library IEEE;
use IEEE.std_logic_1164.all;


entity Booth_multiplier is

  port(a : in std_logic_vector(31 downto 0);
       b : in std_logic_vector(31 downto 0);
       start : in std_logic;
       p : out std_logic_vector(63 downto 0);
       done : out std_logic;
       reset : in std_logic;
       clk : in std_logic
       );
       
      
end entity Booth_multiplier;

architecture default of Booth_multiplier is

  component multiplier_datapath is
    port(
         a : in std_logic_vector(31 downto 0);
         b : in std_logic_vector(31 downto 0);
         clk, shift, reset, load_p, load_a, load_b, cnt_enable : in std_logic;
         cnt : out std_logic_vector(6 downto 0);
         preg : inout std_logic_vector(31 downto 0);
         areg : inout std_logic_vector(31 downto 0)
         );
  end component;
  
  component control_unit is
    port(
         start, clk, reset : in std_logic;
         cnt : in std_logic_vector(6 downto 0);
         done, shift, clear, load_p, load_a, load_b, enable_cnt : out std_logic
         );
  end component;
  
  signal shift, clear_data, load_p, load_a, load_b, cnt_enable : std_logic;
  signal cnt : std_logic_vector(6 downto 0);
  signal result : std_logic_vector(63 downto 0);
  signal preg, areg : std_logic_vector(31 downto 0);
 
  
begin

  result <= preg & areg;
  
  p <= result;
  
  data: multiplier_datapath
    port map(
             a => a,
             b => b,
             clk => clk,
             shift => shift,
             reset => clear_data,
             load_p => load_p,
             load_a => load_a,
             load_b => load_b,
             cnt_enable => cnt_enable,
             cnt => cnt,
             preg => preg,
             areg => areg
             );
             
  ControlUnit : control_unit
    port map(
             start => start,
             clk => clk,
             reset => reset,
             cnt => cnt, 
             done => done,
             shift => shift,
             clear => clear_data,
             load_p => load_p,
             load_a => load_a, 
             load_b => load_b,
             enable_cnt => cnt_enable
             );
  
  
end architecture default;

