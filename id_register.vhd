--IF_register.vhd
-- Generated at Wed Aug 01 12:52:05 2018
--Andrew Miller 8/1/18
--ID_register.vhd is the instruction decode register for a MIPS sigle datapath pipelined processor

library IEEE;
use IEEE.std_logic_1164.all;



entity ID_register is

  port(
    instr_25_0_in : in std_logic_vector(25 downto 0);
    PC_plus_4_in : in std_logic_vector(31 downto 0);
    RegDst_in, Jump_in, Branch_in, memread_in, BNE_in, memtoReg_in, memWrite_in, ALUSrc_in : in std_logic;
    ALUOp_in : in std_logic_vector(1 downto 0);
    a_in, b_in : in std_logic_vector(31 downto 0);
    instr_31_26_in : in std_logic_vector(5 downto 0);
    instr_15_11_in : in std_logic_vector(4 downto 0);
    instr_15_0_se_in : in std_logic_vector(31 downto 0);
    instr_20_16_in : in std_logic_vector(4 downto 0);
    RegWrite_in : in std_logic;
    JAL_in : in std_logic;
    PC_in  : in std_logic_vector(31 downto 0);
    
    instr_25_0_out : out std_logic_vector(25 downto 0);
    PC_plus_4_out : out std_logic_vector(31 downto 0);
    RegDst_out, Jump_out, Branch_out, memread_out, BNE_out, memtoReg_out, memWrite_out, ALUSrc_out : out std_logic;
    ALUOp_out : out std_logic_vector(1 downto 0);
    a_out, b_out : out std_logic_vector(31 downto 0);
    instr_31_26_out : out std_logic_vector(5 downto 0);
    instr_15_11_out : out std_logic_vector(4 downto 0);
    instr_15_0_se_out : out std_logic_vector(31 downto 0);
    instr_20_16_out : out std_logic_vector(4 downto 0);
    Regwrite_out : out std_logic;
    JAL_out : out std_logic;
    PC_out : out std_logic_vector(31 downto 0);
    
    rst_n : in std_logic;
    clk : in std_logic
    ); 
  
  
end entity ID_register;

architecture default of ID_register is

  
begin

  pipe : process(clk)
  begin
  	if rst_n = '0' then
  	  instr_25_0_out <= (others => '0');
  	  PC_plus_4_out <= (others => '0');
  	  RegDst_out <= '0';
  	  Jump_out <= '0';
  	  Branch_out <= '0';
  	  memread_out <= '0';
  	  BNE_out <= '0';
  	  memtoReg_out <= '0';
  	  memWrite_out <= '0';
  	  ALUSrc_out <= '0';
  	  ALUOp_out <= (others => '0');
  	  a_out <= (others => '0');
  	  b_out <= (others => '0');
  	  instr_31_26_out <= (others => '0');
  	  instr_15_11_out <= (others => '0');
  	  instr_15_0_se_out <= (others => '0');
  	  instr_20_16_out <= (others => '0');
  	  RegWrite_out <= '0';
  	  JAL_out <= '0';
  	  PC_out <= (others => '0');
  	  
  	elsif rising_edge(clk) then
  	  instr_25_0_out <= instr_25_0_in;
  	  PC_plus_4_out <= PC_plus_4_in;
  	  RegDst_out <= RegDst_in;
  	  Jump_out <= Jump_in;
  	  Branch_out <= Branch_in;
  	  memread_out <= memread_in;
  	  BNE_out <= BNE_in;
  	  memtoReg_out <= memtoReg_in;
  	  memWrite_out <= memWrite_in;
  	  ALUSrc_out <= ALUSrc_in;
  	  ALUOp_out <= ALUOp_in;
  	  a_out <= a_in;
  	  b_out <= b_in;
  	  instr_31_26_out <= instr_31_26_in;
  	  instr_15_11_out <= instr_15_11_in;
  	  instr_15_0_se_out <= instr_15_0_se_in;
  	  instr_20_16_out <= instr_20_16_in;
  	  RegWrite_out <= RegWrite_in;
  	  JAL_out <= JAL_in;
  	  PC_out <= PC_in;
  	    
    end if;
  end process pipe;

  
end architecture default;

