--data_execution
--Generated at Fri Jul 27 13:05:41 2018
--Andrew Miller 7/27/28
--data_execution.vhd is a vhdl implementation of a data execution module for a MIPS processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;



entity data_execution is

  port(
    instr_25_21 : in std_logic_vector(4 downto 0);
    instr_20_16 : in std_logic_vector(4 downto 0);
    instr_15_0 : in std_logic_vector(15 downto 0);
    ALUSrcA : in std_logic;
    ALUSrcB : in std_logic_vector(1 downto 0);
    ALUOpcode : in std_logic_vector(2 downto 0);
    reg_A, reg_B : in std_logic_vector(width-1 downto 0);
    pc_out : in std_logic_vector(width-1 downto 0);
    instr_15_0_se : in std_logic_vector(width-1 downto 0);
    instr_15_0_se_sl : in std_logic_vector(width-1 downto 0);
    
    jump_addr : out std_logic_vector(width - 1 downto 0);
    alu_result : out std_logic_vector(width - 1 downto 0);
    zero : out std_logic
  );

  
end entity data_execution;

architecture default of data_execution is

  COMPONENT alu
     PORT (
       a, b : IN STD_LOGIC_VECTOR(width-1 DOWNTO 0);
       opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
       result : OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0);
       zero : OUT STD_LOGIC
       );
 END COMPONENT;

  
  signal mux_A_out : std_logic_vector(width-1 downto 0);
  signal mux_B_out : std_logic_vector(width-1 downto 0);
  
  
begin

  
  alu_inst : alu
    port map (
      a => mux_A_out,
      b => mux_B_out,
      opcode => ALUopcode,
      result => alu_result,
      zero => zero
      );
      
  --multiplexer for ALU A input
  mux_A : process(ALUSrcA, PC_Out, reg_A)
  begin
  	case ALUSrcA is 
  	  when '0' => mux_A_out <= PC_out;
  	  when '1' => mux_A_out <= reg_A;
  	  when others => mux_A_out <= (others => 'X');
    end case;
  end process mux_A;

  --multiplexer for ALU B input
  mux_B : process(ALUSrcB, reg_B, instr_15_0_se, instr_15_0_se_sl)
  begin
  	case ALUSrcB is 
  	  when "00" => mux_B_out <= reg_B;
  	  when "01" => mux_B_out <= std_logic_vector(to_unsigned(4, width)); --map to constant 4
  	  when "10" => mux_B_out <= instr_15_0_se;
  	  when "11" => mux_B_out <= instr_15_0_se_sl;
  	  when others => mux_B_out <= (others => 'X');
    end case;
  end process mux_B;
  
  
  --now jump address can be computed
  jump_addr <= PC_out(width-1 downto width-4) & instr_25_21 & instr_20_16 & instr_15_0 & "00";
  
  
 
  
  
  
end architecture default;

