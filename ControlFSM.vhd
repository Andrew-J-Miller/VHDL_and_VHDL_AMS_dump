--ControlFSM.vhd
--Generated at Fri Jul 27 10:42:18 2018
--Andrew Miller 7/27/18
--ControlFSM.vhd is a control finite state machine for a MIPS processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;


entity ControlFSM is


  port(
    clk, rst_n : in std_logic;
    instr_31_26 : in std_logic_vector(5 downto 0);
    RegDst, RegWrite, ALUSrcA, MemRead, MemWrite, MemtoReg, IorD, IRWrite, PCWrite, PCWriteCond : out std_logic;
    ALUOp, ALUSrcB, PCSource : out std_logic_vector(1 downto 0)
  );

  
end entity ControlFSM;

architecture default of ControlFSM is

  --state names must be defined
  type state_type is (InstDec, MemAddComp, MemAccL, MemReadCompl, MemAccS, Exec, Exec1, RCompl, ICompl, BranchCompl, JumpCompl, InstFetch);
  signal state, next_state : state_type;
  
begin


  --state process
  state_reg : process(clk, rst_n)
  begin
  	if rst_n = '0' then
  	  state <= InstFetch;
  	elsif rising_edge(clk) then
  	  state <= next_state;
    end if;
  end process state_reg;

   
  --Logic Process
  logic_process : process(state, instr_31_26)
  
  variable control_signals : std_logic_vector(15 downto 0);
  
  Constant LOADWORD : std_logic_vector(5 downto 0) := "100011";
  Constant STOREWORD : std_logic_vector(5 downto 0) := "101011";
  Constant RTYPE : std_logic_vector(5 downto 0) := "000000";
  Constant BEQ : std_logic_vector(5 downto 0) := "000100";
  Constant JMP : std_logic_vector(5 downto 0) := "000010";
  Constant ADDI : std_logic_vector(5 downto 0) := "001000";
  Constant ANDI : std_logic_vector(5 downto 0) := "001100";
  Constant ORI : std_logic_vector(5 downto 0) := "001101";
  Constant XORI : std_logic_vector(5 downto 0) := "001110";
  Constant SLTI : std_logic_vector(5 downto 0) := "001010";
  
  begin
  	
  	case state is
  	
  	  --instruction fetch
  	  When InstFetch =>
  	    control_signals := "0001000110000100";
  	      
  	    next_state <= InstDec;
  	   
  	  --instruction decode and register fetch    
  	  When InstDec =>
  	    control_signals := "0000000000001100";
  	    
  	    if instr_31_26 = LOADWORD or instr_31_26 = STOREWORD then
  	      next_state <= MemAddComp;
  	    elsif instr_31_26 = RTYPE then
  	      next_state <= Exec;
  	    elsif instr_31_26 = BEQ then
  	      next_state <= BranchCompl;
  	    elsif instr_31_26 = JMP then
  	      next_state <= JumpCompl;
  	    elsif instr_31_26 = ADDI or instr_31_26 = ANDI or instr_31_26 = ORI or instr_31_26 = XORI or instr_31_26 = SLTI then
  	      next_state <= Exec1;
  	    else
  	      next_state <= InstFetch;--ErrState;
        end if;
  
      --memory address comptation
      When MemAddComp =>
        control_signals := "0010000000001000";
        
        if instr_31_26 = LOADWORD then
          next_state <= MemAccL;
        elsif instr_31_26 = STOREWORD then
          next_state <= MemAccs;
        else
          next_state <= InstFetch;--ErrState;
        end if;
        
        
        --Memory Access Load Word
        When MemAccL =>
          control_signals := "0011001000001000";
          
          next_state <= MemReadCompl;
          
        --Memory Read Completion
        When MemReadCompl =>
          control_signals := "0110010000001000";
          
          next_state <= InstFetch;
          
        --Memory Access Store Word
        When MemAccS =>
          control_signals := "0010101000001000";
          
          next_state <= InstFetch;
          
        --Execution
        When Exec =>
          control_signals := "0010000000100000";
          
          next_state <= RCompl;
          
        --I type add execution 
        When Exec1 =>
          control_signals := "0010000000111000";
          
          next_state <= Icompl;
          
          
        --The add immediate instruction completion stage  
        When Icompl =>
          control_signals := "0110000000101000";
          
          next_state <= InstFetch;
          
        --R-type Completion
        When RCompl =>
          control_signals := "1110000000100000";
          
          next_state <= InstFetch;
        
        --Branch Completion
        When BranchCompl => 
          control_signals := "0010000001010001";
          
          next_state <= InstFetch;
          
        --Jump Completion
        When JumpCompl =>
          control_signals := "0000000010001110";
          
          next_state <= InstFetch;
          
        When others =>
          control_signals := (others => 'X');
          
          next_state <= InstFetch;
          
      end case;
      
      RegDst <= control_signals(15);
      RegWrite <= control_signals(14);
      ALUSrcA <= control_signals(13);
      MemRead <= control_signals(12);
      MemWrite <= control_signals(11);
      MemtoReg <= control_signals(10);
      IorD <= control_signals(9);
      IRWrite <= control_signals(8);
      PCWrite <= control_signals(7);
      PCWriteCond <= control_signals(6);
      ALUOp <= control_signals(5 downto 4);
      ALUSrcB <= control_signals(3 downto 2);
      PCSource <= control_signals(1 downto 0);
      
      
    end process logic_process;
  





  
end architecture default;

