--data_decode.vhd
--Generated at Fri Jul 27 12:33:38 2018
--Andrew Miller 7/27/18
--data_decode.vhd is a vhdl implementation of a data decoder for a MIPS processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;


entity data_decode is

  port(
    clk : in std_logic;
    rst_n : in std_logic;
    instr_25_21 : in std_logic_vector(4 downto 0);
    instr_20_16 : in std_logic_vector(4 downto 0);
    instr_15_0 : in std_logic_vector(15 downto 0);
    reg_memdata : in std_logic_vector(width - 1 downto 0);
    alu_out : in std_logic_vector(width - 1 downto 0);
    --control signals
    RegDst : in std_logic;
    Regwrite : in std_logic;
    MemtoReg : in std_logic;
    --outputs
    reg_A : out std_logic_vector(width - 1 downto 0);
    reg_B : out std_logic_vector(width - 1 downto 0);
    instr_15_0_se : out std_logic_vector(width - 1 downto 0);
    instr_15_0_se_sl : out std_logic_vector(width - 1 downto 0)
  );

  
end entity data_decode;

architecture default of data_decode is

  component regfile is 
    port ( 
      clk, rst_n : in std_logic;
      wen : in std_logic; --write control
      writeport : in std_logic_vector(width - 1 downto 0); --register input
      adrwport : in std_logic_vector(regfile_adrsize-1 downto 0); --address write
      adrwport0 : in std_logic_vector(regfile_adrsize-1 downto 0); --address port 0
      adrwport1 : in std_logic_vector(regfile_adrsize-1 downto 0); --address port 1
      readport0 : out std_logic_vector(width - 1 downto 0);  --output port 0
      readport1 : out std_logic_vector(width - 1 downto 0)   --output port 1
      );
  end component;
  
  component tempreg is
    port(
      clk : in std_logic;
      rst_n : in std_logic;
      reg_in : in std_logic_vector(width - 1 downto 0);
      reg_out : out std_logic_vector(width - 1 downto 0)
    );
  
  end component;
  
  
  --internal signal declaration
  signal write_reg : std_logic_vector(regfile_adrsize - 1 downto 0);
  signal write_data : std_logic_vector(width - 1 downto 0);
  signal data_1 : std_logic_vector(width - 1 downto 0);
  signal data_2 : std_logic_vector(width - 1 downto 0);
  
  
  
begin

  A : tempreg
    port map(
      clk => clk,
      rst_n => rst_n,
      reg_in => data_1,
      reg_out => reg_A
      );
      
      
  B : tempreg
    port map(
      clk => clk,
      rst_n => rst_n,
      reg_in => data_2,
      reg_out => reg_B
      );
      
  inst_regfile : regfile
    port map(
      clk => clk,
      rst_n => rst_n,
      wen => RegWrite,
      writeport => write_data,
      adrwport => write_reg,
      adrwport0 => instr_25_21,
      adrwport1 => instr_20_16,
      readport0 => data_1,
      readport1 => data_2
      );
      
      --multiplexer for write register
      write_reg <= instr_20_16 when RegDst = '0' else
                   instr_15_0(15 downto 11) when RegDst = '1' else
                   (others => 'X');
                 
      --multiplexer for write data
      write_data <= alu_out when MemtoReg = '0' else
                    reg_memdata when MemtoReg = '1' else
                    (others => 'X');
                   
      --sign extension and shift
      sign_extend : process(instr_15_0)
      
      variable temp_instr_15_0_se : std_logic_vector(width - 1 downto 0);
      variable temp_instr_15_0_se_sl : std_logic_vector(width - 1 downto 0);
      begin
      	--sign extend instr_15_0 to 32 bits
      	temp_instr_15_0_se := std_logic_vector(resize(signed(instr_15_0), instr_15_0_se'LENGTH));
      	--now left shift by 2
      	temp_instr_15_0_se_sl := temp_instr_15_0_se(width-3 downto 0) & "00";
      	
      	instr_15_0_se <= temp_instr_15_0_se;
      	instr_15_0_se_sl <= temp_instr_15_0_se_sl;
      	
      end process sign_extend;
      

  
end architecture default;

