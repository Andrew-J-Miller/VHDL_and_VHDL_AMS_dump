--Control.vhd
-- Generated at Wed Aug 01 08:44:46 2018
--Andrew Miller 8/1/18

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;


entity Control is

  port(
    clk, rst_n : in std_logic;
    instr_31_26 : in std_logic_vector(5 downto 0);
    instr_15_0 : in std_logic_vector(15 downto 0);
    zero : in std_logic;
    ALUopcode : out std_logic_vector(2 downto 0);
    RegDst, RegWrite, ALUSrcA, MemRead, MemWrite, MemtoReg, IorD, IRWrite : out std_logic;
    ALUSrcB, PCSource : out std_logic_vector(1 downto 0);
    PC_en : out std_logic
    );

  
end entity Control;

architecture default of Control is

  component ControlFSM
  port (
    clk, rst_n : in std_logic;
    instr_31_26 : in std_logic_vector(5 downto 0);
    RegDst, RegWrite, ALUSrcA, MemRead, MemWrite, MemtoReg, IorD, IRWrite, PCWrite, PCWriteCond : OUT std_logic;
    ALUOp, ALUSrcB, PCSource : out std_logic_vector(1 downto 0)
    );
  end component ControlFSM;
  
  component ALUControl
  port(
    instr_15_0 : in std_logic_vector(15 downto 0);
    ALUOp : in std_logic_vector(1 downto 0);
    ALUopcode : out std_logic_vector(2 downto 0);
    instr_31_26 : in std_logic_vector(5 downto 0)
    );
  end component ALUControl;
  
  signal ALUOp_intern : std_logic_vector(1 downto 0);
  signal PCWrite_intern : std_logic;
  signal PCWriteCond_intern : std_logic;
  
begin

  inst_ControlFSM : ControlFSM
  PORT MAP (
    clk => clk,
    rst_n => rst_n,
    instr_31_26 => instr_31_26,
    RegDst => RegDst,
    RegWrite => RegWrite,
    ALUSrcA => ALUSrcA,
    MemRead => MemRead,
    MemWrite => MemWrite,
    MemtoReg => MemtoReg,
    IorD => IorD,
    IRWrite => IRWrite,
    PCWrite => PCWrite_intern,
    PCWriteCond => PCWriteCond_intern,
    ALUOp => ALUOp_intern,
    ALUSrcB => ALUSrcB,
    PCSource => PCSource
    );

  inst_ALUControl : ALUControl
  port map ( 
  instr_15_0 => instr_15_0,
  ALUOp => ALUOp_intern,
  ALUopcode => ALUopcode,
  instr_31_26 => instr_31_26
  );
  
  PC_en <= PCWrite_intern or (PCWriteCond_intern and zero);


  
end architecture default;

