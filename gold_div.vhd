--gold_div.vhd
-- Generated at Mon Aug 13 13:51:35 2018
--Andrew Miller 8/13/18
--gold_div.vhd is a vhdl Goldschmidt divider

library IEEE;
use IEEE.std_logic_1164.all;

entity gold_div is

  port(
       a : in std_logic_vector(31 downto 0);
       b : in std_logic_vector(31 downto 0);
       c : in std_logic_vector(2 downto 0);
       clk : in std_logic;
       rst : in std_logic;
       q : out std_logic_vector(31 downto 0)
       );
      
  
end entity gold_div;



architecture default of gold_div is

  component Wallace_mult is
    generic( width : integer := 32);
    port(
         a : in std_logic_vector(31 downto 0);
         b : in std_logic_vector(31 downto 0);
         prod : out std_logic_vector(31 downto 0
         );
   end component;
   
   component cla_32 is
     port(
             a : in std_logic_vector(31 downto 0);
             b : in std_logic_vector(31 downto 0);
             cin : in std_logic;
             s : out std_logic_vector(31 downto 0);
             co : out std_logic
            );
   end component;
   
   component reciprocal is
     port(
          b : in std_logic_vector(31 downto 0);
          r : in std_logic_vector(31 downto 0)
          );
   end component;
   
   --counter register
   signal counter : std_logic_vector(2 downto 0);
   signal counter_decremented : std_logic_vector(2 downto 0);
   
   --Intermediate output signals
   signal nop : std_logic_vector(63 downto 0);
   signal dop : std_logic_vector(63 downto 0);
   signal dos : std_logic_vector(31 downto 0);
   signal don : std_logic_vector(31 downto 0);
   
   --current iteration outputs
   signal no : std_logic_vector(31 downto 0);
   signal do : std_logic_vector(31 downto 0);
   signal fo : std_logic_vector(31 downto 0);
   
   --previous iteration registers
   signal np : std_logic_vector(31 downto 0);
   signal dp : std_logic_vector(31 downto 0);
   signal fp : std_logic_vector(31 downto 0);
   
   --initial reciprocal
   signal ir : std_logic_vector(31 downto 0);


  
begin

  --Registers for N, D, and F
  sync_process : process(clk, counter)
  begin
  	if rst = '1' then
  	  counter <= c;
  	  np <= a;
  	  dp <= b;
  	  fp <= ir;
  	elsif rising_edge(clk) then
  	  counter <= counter_decremented;
  	  np <= no;
  	  dp <= do;
  	  fp <= fo;
    end if;
  end process;


 
  
end architecture default;

