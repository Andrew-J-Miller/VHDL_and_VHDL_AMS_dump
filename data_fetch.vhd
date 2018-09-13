--data_fetch.vhd
--Generated at Fri Jul 27 07:45:36 2018
--Andrew Miller 7/27/18
--data_fetch.vhd is a vhdl implementation of a data_fetch module for a simple MIPS processor


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;




entity data_fetch is

  port(
  --inputs
  clk : in std_logic;
  rst_n : in std_logic;
  pc_in : in std_logic_vector(width - 1 downto 0);
  alu_out : in std_logic_vector(width - 1 downto 0);
  mem_data : in std_logic_vector(width - 1 downto 0);
  --control signals
  PC_en : in std_logic;
  IorD : in std_logic;
  IRWrite : in std_logic;
  --outputs
  reg_memdata : out std_logic_vector(width - 1 downto 0);
  instr_31_26 : out std_logic_vector(5 downto 0);
  instr_25_21 : out std_logic_vector(4 downto 0);
  instr_20_16 : out std_logic_vector(4 downto 0);
  instr_15_0 : out std_logic_vector(15 downto 0);
  mem_address : out std_logic_vector(width - 1 downto 0);
  pc_out : out std_logic_vector(width - 1 downto 0)
  );
  
end entity data_fetch;

architecture default of data_fetch is



component instreg is 
  port(
    clk : in std_logic;
    rst_n : in std_logic;
    memdata : in std_logic_vector(width - 1 downto 0);
    IRWrite : in std_logic;
    instr_31_26 : out std_logic_vector(5 downto 0);
    instr_25_21 : out std_logic_vector(4 downto 0);
    instr_20_16 : out std_logic_vector(4 downto 0);
    instr_15_0 : out std_logic_vector(15 downto 0));
end component;

component tempreg is 
  port(
    clk : in std_logic;
    rst_n : in std_logic;
    reg_in : in std_logic_vector(width-1 downto 0);
    reg_out : out std_logic_vector(width-1 downto 0));
end component;

component pc is 
  port(
    clk : in std_logic;
    rst_n : in std_logic;
    pc_in : in std_logic_vector(width-1 downto 0);
    PC_en : in std_logic;
    pc_out : out std_logic_vector(width-1 downto 0));
end component;

  --signals for components
  signal pc_out_intern : std_logic_vector(width - 1 downto 0);

  
begin

  proc_cnt : pc
    port map(
      clk => clk,
      rst_n => rst_n,
      pc_in => pc_in,
      PC_en => PC_en,
      pc_out => pc_out_intern);
  
  instr_reg : instreg
    port map (
      clk => clk,
      rst_n => rst_n,
      memdata => mem_data,
      IRWrite => IRWrite,
      instr_31_26 => instr_31_26,
      instr_25_21 => instr_25_21,
      instr_20_16 => instr_20_16,
      instr_15_0 => instr_15_0);
      
  mem_data_reg : tempreg
    port map(
      clk => clk,
      rst_n => rst_n,
      reg_in => mem_data,
      reg_out => reg_memdata);
      
      

  --multiplexer
  addr_mux : process(IorD, pc_out_intern, alu_out)
    variable mem_address_temp : std_logic_vector(width - 1 downto 0);
    begin
    	if IorD = '0' then
    	  mem_address_temp := pc_out_intern;
    	elsif IorD = '1' then
    	  mem_address_temp := alu_out;
    	else
    	  mem_address_temp := (others => 'X');
        end if;
        mem_address <= mem_address_temp;
    end process;

  
  pc_out <= pc_out_intern;
  
end architecture default;

