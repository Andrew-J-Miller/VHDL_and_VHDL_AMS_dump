--multiplier_datapath.vhd
-- Generated at Fri Aug 10 10:34:19 2018
--Andrew Miller 8/10/18
--multiplier_datapath.vhd is a multiplier datapath for a 32 bit booth multiplier

library IEEE;
use IEEE.std_logic_1164.all;

entity multiplier_datapath is

  port(a : in std_logic_vector(31 downto 0);
       b : in std_logic_vector(31 downto 0);
       clk, shift, reset, load_p, load_a, load_b, cnt_enable : in std_logic;
       cnt : out std_logic_vector(6 downto 0);
       preg : inout std_logic_vector(31 downto 0);
       areg : inout std_logic_vector(31 downto 0)
       );

  
end entity multiplier_datapath;

architecture default of multiplier_datapath is


  component counter
    port(
         RESET : in std_logic;
         CLK : in std_logic;
         enable : in std_logic;
         cnt_out : out std_logic_vector(6 downto 0)
         );
         
  end component;
   
   component sreg_32
     port(
          clk, ser_in, reset, load, shift : in std_logic;
          input : in std_logic_vector(31 downto 0);
          q_out : inout std_logic_vector(31 downto 0);
          ser_out : out std_logic
          );
          
   end component;
    
    component cla_32
      port(
           a : in std_logic_vector(31 downto 0);
           b : in std_logic_vector(31 downto 0);
           cin : in std_logic;
           s : out std_logic_vector(31 downto 0);
           co : out std_logic
           );
     
    end component;
    
    component reg_32
      port(
           clk, reset, load : in std_logic;
           input : in std_logic_vector(31 downto 0);
           output : out std_logic_vector(31 downto 0)
           );
           
    end component;
     
     
     component DFF
       port(
            d, clk, reset : in std_logic;
            q : out std_logic
            );
     end component;
      
      component mux_32_1
        port(
             in00 : in std_logic_vector(31 downto 0);
             in01 : in std_logic_vector(31 downto 0);
             in10 : in std_logic_vector(31 downto 0);
             in11 : in std_logic_vector(31 downto 0);
             sel : in std_logic_vector(1 downto 0);
             output : out std_logic_vector(31 downto 0)
             );
       end component;
       
       component inverter_32
         port(
              a : in std_logic_vector(31 downto 0);
              b : in std_logic_vector(31 downto 0)
              );
       end component;     
                   
  signal b_out, b_out_neg, mux_output, adder_output : std_logic_vector(31 downto 0);
  signal final_cout, areg_so, preg_so, cin_adder : std_logic;
  
  signal a_sel : std_logic_vector(1 downto 0) := "00";
  signal mux_zeros : std_logic_vector(31 downto 0) := (others => '0');
  
begin


  cin_adder <= a_sel(1) and (not a_sel(0));
  
  Aregister: sreg_32
    port map(
             clk => clk,
             ser_in => preg_so,
             reset => reset,
             load => load_a,
             shift => shift,
             input => a,
             q_out => areg,
             ser_out => a_sel(1)
             );
             
  Pregister: sreg_32
    port map(
             clk => clk,
             ser_in => preg(31),
             reset => reset,
             load => load_p,
             shift => shift,
             input => adder_output,
             q_out => preg,
             ser_out => preg_so
             );

  Bregister: reg_32
    port map(
             clk => clk,
             reset => reset,
             load => load_b,
             input => b,
             output => b_out
             );
             
  negate_b: inverter_32
    port map(
             a => b_out,
             b => b_out_neg
             );
  adderinput: mux_32_1
    port map(
             in00 => mux_zeros,
             in01 => b_out,
             in10 => b_out_neg,
             in11 => mux_zeros,
             sel => a_sel,
             output => mux_output
             );
  
  previousA: DFF
    port map(
             d => a_sel(1),
             clk => clk,
             reset => reset,
             q => a_sel(0)
             );
  
  cla_adder: cla_32
    port map(
             a => mux_output,
             b => preg,
             cin => cin_adder,
             s => adder_output,
             co => final_cout
             );
             
  ctn: counter
    port map(
             reset => reset,
             clk => clk,
             enable => cnt_enable,
             cnt_out => cnt
             );
  
end architecture default;

