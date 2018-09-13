--MEM_WB_reg.vhd
-- Generated at Wed Aug 01 15:01:53 2018
--Andrew Miller 8/1/18
--MEM_WB_reg.vhd is a register between the memory and writeback stages of the pipeline stages of the MIPS standard pipeline

library IEEE;
use IEEE.std_logic_1164.all;

entity MEM_WB_reg is

  port(
    RegWrite_in : in std_logic;
    data_mem_in : in std_logic_vector(31 downto 0);
    ALU_in : in std_logic_vector(31 downto 0);
    reg_adr_in : in std_logic_vector(4 downto 0);
    memtoReg_in : in std_logic;
    JAL_in : in std_logic;
    PC_in : in std_logic_vector(31 downto 0);
    Jump_in : in std_logic_vector(31 downto 0);
    jumpb_in : in std_logic;
    
    RegWrite_out : out std_logic;
    data_mem_out : out std_logic_vector(31 downto 0);
    ALU_out : out std_logic_vector(31 downto 0);
    reg_adr_out : out std_logic_vector(4 downto 0);
    memtoReg_out : out std_logic;
    JAL_out : out std_logic;
    PC_out : out std_logic_vector(31 downto 0);
    Jump_out : out std_logic_vector(31 downto 0);
    jumpb_out : out std_logic;
  
    rst_n : in std_logic;
    clk : in std_logic
    );

  
end entity MEM_WB_reg;

architecture default of MEM_WB_reg is

  
begin


  pipe : process(rst_n, clk)
  begin
  	if rst_n = '0' then
  	  RegWrite_out <= '0';
  	  memtoReg_out <= '0';
  	  data_mem_out <= (others => '0');
  	  ALU_out <= (others => '0');
  	  reg_adr_out <= (others => '0');
  	  JAL_out <= '0';
  	  PC_out <= (others => '0');
  	  Jump_out <= (others => '0');
  	  jumpb_out <= '0';
  	elsif rising_edge(clk) then
  	  memtoReg_out <= memtoReg_in;
  	  RegWrite_out <= RegWrite_in;
  	  data_mem_out <= data_mem_in;
  	  ALU_out <= ALU_in;
  	  reg_adr_out <= reg_adr_in;
  	  JAL_out <= JAL_in;
  	  PC_out <= PC_in;
  	  Jump_out <= Jump_in;
  	  jumpb_out <= jumpb_in;
    end if;
  end process pipe;
  	  

  
end architecture default;

