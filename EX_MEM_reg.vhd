--EX_MEM_reg.vhd
-- Generated at Wed Aug 01 14:10:03 2018
--Andrew Miller 8/1/18
--EX_MEM_reg.vhd is a register for the standard MIPS 5 stage pipeline

library IEEE;
use IEEE.std_logic_1164.all;

entity EX_MEM_reg is

  port(
    jump_adr_in : in std_logic_vector(31 downto 0);
    branch_adr_in : in std_logic_vector(31 downto 0);
    Jump_in, Branch_in, memread_in, BNE_in, memtoReg_in, memWrite_in : in std_logic;
    ALU_in : in std_logic_vector(31 downto 0);
    zero_in : in std_logic;
    reg_b_in : in std_logic_vector(31 downto 0);
    reg_adr_in : in std_logic_vector(4 downto 0);
    RegWrite_in : in std_logic;
    JAL_in : in std_logic;
    PC_in : in std_logic_vector(31 downto 0);
    
    jump_adr_out : out std_logic_vector(31 downto 0);
    branch_adr_out : out std_logic_vector(31 downto 0);
    Jump_out, Branch_out, memread_out, BNE_out, memtoReg_out, memWrite_out : out std_logic;
    ALU_out : out std_logic_vector(31 downto 0);
    zero_out : out std_logic;
    reg_b_out : out std_logic_vector(31 downto 0);
    reg_adr_out : out std_logic_vector(4 downto 0);
    RegWrite_out : out std_logic;
    JAL_out : out std_logic;
    PC_out : out std_logic_vector(31 downto 0);
    
    
    rst_n : in std_logic;
    clk : in std_logic
    );
  
end entity EX_MEM_reg;

architecture default of EX_MEM_reg is

  
begin
	
	
  pipe : process(clk, rst_n)
  begin
  	if rst_n = '0' then
  	  jump_adr_out <= (others => '0');
  	  branch_adr_out <= (others => '0');
  	  ALU_out <= (others => '0');
  	  reg_b_out <= (others => '0');
  	  reg_adr_out <= (others => '0');
  	  Jump_out <= '0';
  	  Branch_out <= '0';
  	  memread_out <= '0';
  	  BNE_out <= '0';
  	  memtoReg_out <= '0';
  	  memWrite_out <= '0';
  	  zero_out <= '0';
  	  RegWrite_out <= '0';
  	  JAL_out <= '0';
  	  PC_out <= (others => '0');
  	elsif rising_edge(clk) then
  	  jump_adr_out <= jump_adr_in;
  	  branch_adr_out <= branch_adr_in;
  	  ALU_out <= ALU_in;
  	  reg_b_out <= reg_b_in;
  	  reg_adr_out <= reg_adr_in;
  	  Jump_out <= Jump_in;
  	  Branch_out <= Branch_in;
  	  memread_out <= memread_in;
  	  BNE_out <= BNE_in;
  	  memtoReg_out <= memtoReg_in;
  	  memWrite_out <= memWrite_in;
  	  zero_out <= zero_in;
  	  RegWrite_out <= RegWrite_in;
  	  JAL_out <= JAL_in;
  	  PC_out <= PC_in;
    end if;
  end process pipe;
	
	
	

  
end architecture default;

