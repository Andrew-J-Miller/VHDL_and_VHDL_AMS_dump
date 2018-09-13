--Booth_e_mult.vhd
-- Generated at Thu Aug 09 14:13:53 2018
--Andrew Miller 8/9/18
--Booth_e_mult is a booth encoder multiplier

library IEEE;
use IEEE.std_logic_1164.all;

entity Booth_e_mult is

  port(a : in std_logic_vector(31 downto 0);
       b: in std_logic_vector(31 downto 0);
       m : out std_logic_vector(63 downto 0)); 
  
end entity Booth_e_mult;

architecture default of Booth_e_mult is
 
  --Booth encoder
  component Booth_encoder is
    port(
         a : in std_logic_vector(31 downto 0);
         d : in std_logic_vector(2 downto 0);
         m : out std_logic_vector(32 downto 0)
         );
  end component;
  
  --Carry lookahead adder
  component cla is
    port(
         a : in std_logic_vector(63 downto 0);
         b : in std_logic_vector(63 downto 0);
         cin : in std_logic;
         s : out std_logic_vector(63 downto 0);
         co : out std_logic
         );
  end component;
  
  --Bit vector based 4:2 counter
  component counter42 is 
    port(
         a : in std_logic_vector(39 downto 0);
         b : in std_logic_vector(39 downto 0);
         c : in std_logic_vector(39 downto 0);
         d : in std_logic_vector(39 downto 0);
         s : out std_logic_vector(39 downto 0);
         co : out std_logic_vector(39 downto 0)
         );
  end component;
  
  --first Booth digit
  signal d0 : std_logic_vector(2 downto 0);
  
  --products
  signal p0 : std_logic_vector(32 downto 0);
  signal p1 : std_logic_vector(32 downto 0);
  signal p2 : std_logic_vector(32 downto 0);
  signal p3 : std_logic_vector(32 downto 0);
  signal p4 : std_logic_vector(32 downto 0);
  signal p5 : std_logic_vector(32 downto 0);
  signal p6 : std_logic_vector(32 downto 0);
  signal p7 : std_logic_vector(32 downto 0); 
  signal p8 : std_logic_vector(32 downto 0);
  signal p9 : std_logic_vector(32 downto 0);
  signal p10 : std_logic_vector(32 downto 0);
  signal p11 : std_logic_vector(32 downto 0);
  signal p12 : std_logic_vector(32 downto 0);
  signal p13 : std_logic_vector(32 downto 0);
  signal p14 : std_logic_vector(32 downto 0);
  signal p15 : std_logic_vector(32 downto 0); 
 
 
 
  
  --sign extension
  signal se0 : std_logic_vector(39 downto 0);
  signal se1 : std_logic_vector(39 downto 0);
  signal se2 : std_logic_vector(39 downto 0);
  signal se3 : std_logic_vector(39 downto 0);
  signal se4 : std_logic_vector(39 downto 0);
  signal se5 : std_logic_vector(39 downto 0);
  signal se6 : std_logic_vector(39 downto 0);
  signal se7 : std_logic_vector(39 downto 0);
  signal se8 : std_logic_vector(39 downto 0);
  signal se9 : std_logic_vector(39 downto 0);
  signal se10 : std_logic_vector(39 downto 0);
  signal se11 : std_logic_vector(39 downto 0);
  signal se12 : std_logic_vector(39 downto 0);
  signal se13 : std_logic_vector(39 downto 0);
  signal se14 : std_logic_vector(39 downto 0);
  signal se15 : std_logic_vector(39 downto 0);
  
 
 
  
  --intermediary sums and carries
  signal s1 : std_logic_vector(39 downto 0);
  signal s2 : std_logic_vector(39 downto 0);
  signal s3 : std_logic_vector(39 downto 0);
  signal s4 : std_logic_vector(39 downto 0);
  signal co1 : std_logic_vector(39 downto 0);
  signal co2 : std_logic_vector(39 downto 0);
  signal co3 : std_logic_vector(39 downto 0);
  signal co4 : std_logic_vector(39 downto 0);
  
  --final sum and carry
  signal s5 : std_logic_vector(63 downto 0);
  signal co5 : std_logic_vector(63 downto 0);
  
  --padded sums and carries
  signal s1p : std_logic_vector(63 downto 0);
  signal s2p : std_logic_vector(63 downto 0);
  signal co1p : std_logic_vector(63 downto 0);
  signal co2p : std_logic_vector(63 downto 0);
  signal co3p : std_logic_vector(63 downto 0);
  

begin

  --pad first booth digit
  d0 <= b(1 downt 0) & "0";
  
  --product stages
  p0_stage: Booth_encoder port map(a=>a, d=>d0, m=>p0);
  p1_stage: Booth_encoder port map(a=>a, d=>b(3 downto 1), m=>p1);
  p2_stage: Booth_encoder port map(a=>a, d=>b(5 downto 3), m=>p2);
  p3_stage: Booth_encoder port map(a=>a, d=>b(7 downto 5), m=>p3);
  p4_stage: Booth_encoder port map(a=>a, d=>b(9 downto 7), m=>p4);
  p5_stage: Booth_encoder port map(a=>a, d=>b(11 downto 9), m=>p5);
  p6_stage: Booth_encoder port map(a=>a, d=>b(13 downto 11), m=>p6);
  p7_stage: Booth_encoder port map(a=>a, d=>b(15 downto 13), m=>p7);
  p8_stage: Booth_encoder port map(a=>a, d=>b(17 downto 15), m=>p8);
  p9_stage: Booth_encoder port map(a=>a, d=>b(19 downto 17), m=>p9);
  p10_stage: Booth_encoder port map(a=>a, d=>b(21 downto 19), m=>p10);
  p11_stage: Booth_encoder port map(a=>a, d=>b(23 downto 21), m=>p11);
  p12_stage: Booth_encoder port map(a=>a, d=>b(25 downto 23), m=>p12);
  p13_stage: Booth_encoder port map(a=>a, d=>b(27 downto 25), m=>p13);
  p14_stage: Booth_encoder port map(a=>a, d=>b(29 downto 27), m=>p14);
  p15_stage: Booth_encoder port map(a=>a, d=>b(31 downto 29), m=>p15);
  
  
  
  --reduced sign extension, assuming that compiler
  --takes care of getting rid of constants
  se0 <= "0000" & (not p0(32)) & p0(32) & p0(32) & p0;
  se1 <= "0001" & (not p1(32))          & p1   & "00";
  se2 <= "01" & (not p2(32))            & p2 & "0000";
  se3 <= not(p3(32))                  & p3 & "000000";
  
  se4 <= "000001" & (not p4(32))                 & p4;
  se5 <= "0001" & (not p5(32))            & p5 & "00";
  se6 <= "01" & (not p6(32))            & p6 & "0000";
  se7 <= not(p7(32))                  & p7 & "000000";
  
  se8 <= "000001" & (not p8(32))                 & p8;
  se9 <= "0001" & (not p9(32))            & p9 & "00";
  se10 <= "01" & (not p10(32))            & p10 & "0000";
  se11 <= not(p11(32))                  & p11 & "000000";
  
  se12 <= "000001" & (not p12(32))                 & p12;
  se13 <= "0001" & (not p13(32))            & p13 & "00";
  se14 <= "01" & (not p14(32))            & p14 & "0000";
  se15 <= not(p15(32))                  & p15 & "000000";
  
  
  
  --Add first 4 products
  counter_stage1 : counter42 port map(
    a => se0, b => se1, c => se2, d => se3,
    s => s1, co => co1);
    
  --add next 4 products
  counter_stage2: counter42 port map(
    a => se4, b => se5, c => se6, d => se7,
    s => s2, co => co2);
    
  --add next 4 products
  counter_stage3: counter42 port map(
    a => se8, b => se9, c => se10, d => se11,
    s => s3, co => co3);
  
  --add final 4 products
  counter_stage4: counter42 port map(
    a => se12, b => se13, c => se14, d => se15,
    s => s4, co => co4);
    
  --pad carries
  s1p <= "00000001" & s1;
  s2p <= s2 & "00000000";
  co1p <= "0000000" * co1 & "0";
  co2p <= co2(
  
end architecture default;

