--data_memwriteback.vhd
--Generated at Fri Jul 27 13:30:19 2018
--Andrew Miller 7/27/18
--data_memwriteback.vhd is a vhdl implemenatation of a data writeback module for a MIPS processor

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;




entity data_memwriteback is

  port(
    clk, rst_n : in std_logic;
    jump_addr : in std_logic_vector(width-1 downto 0);
    alu_result : in std_logic_vector(width-1 downto 0);
    PCSource : in std_logic_vector(1 downto 0);
    
    pc_in : out std_logic_vector(width-1 downto 0);
    alu_out : out std_logic_vector(width-1 downto 0)
    );

  
end entity data_memwriteback;

architecture default of data_memwriteback is

  component tempreg
    port(
      clk : in std_logic;
      rst_n : in std_logic;
      reg_in : in std_logic_vector(width - 1 downto 0);
      reg_out : out std_logic_vector(width - 1 downto 0)
      );
  end component;
  
  signal alu_out_internal : std_logic_vector(width-1 downto 0);

  
begin

  tempreg_inst : tempreg
    port map(
      clk => clk,
      rst_n => rst_n,
      reg_in => alu_result,
      reg_out => alu_out_internal
      );
      
  --multiplexer for A ALU input
  mux : process(PCSource, ALU_result, ALU_out_internal, jump_addr)
  begin
  	case PCSource is 
  	  When "00" => pc_in <= alu_result;
  	  When "01" => pc_in <= alu_out_internal;
  	  When "10" => pc_in <= jump_addr;
  	  When others => pc_in <= (others => 'X');
    end case;
  end process mux;

  alu_out <= alu_out_internal;

  
end architecture default;

