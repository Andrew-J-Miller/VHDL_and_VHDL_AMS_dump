--memory.vhd
--Generated at Mon Jul 30 13:02:21 2018
--Andrew Miller 7/30/18
--memory.vhd is a vhdl implementation of a 4 block RAM instantiation for a MIPS processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;


entity inst_memory is

  port(
    mem_address : in std_logic_vector(31 downto 0);
    data_out : out std_logic_vector(31 downto 0)
    );
  
end entity inst_memory;

architecture default of inst_memory is

  component ram_inst_mem is 
    generic (
      adrwidth : integer := 8;
      datwidth : integer := 8
      );
    port ( 
      address : in std_logic_vector(adrwidth-1 downto 0);
      q : out std_logic_vector(datwidth-1 downto 0)
      );
    end component ram_inst_mem;
  
  --internal signals
  --the ram is separated into 4 blocks. Each block has has input data, an input address, and output data
  signal wren : std_logic;
  signal data_in_0 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_in_1 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_in_2 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_in_3 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_out_0 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_out_1 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_out_2 : std_logic_vector(ram_datwidth-1 downto 0);
  signal data_out_3 : std_logic_vector(ram_datwidth-1 downto 0);
  signal address_0 : std_logic_vector(ram_adrwidth-1 downto 0);
  signal address_1 : std_logic_vector(ram_adrwidth-1 downto 0);
  signal address_2 : std_logic_vector(ram_adrwidth-1 downto 0);
  signal address_3 : std_logic_vector(ram_adrwidth-1 downto 0);
 
  
begin

  --the 4 ram blocks must now be instantited
  mem_block0 : ram_inst_mem
    generic map (
      adrwidth => ram_adrwidth,
      datwidth => ram_datwidth
      )
      
    port map (
      address => address_0,
      q => data_out_0
      );
      
      
    mem_block1 : ram_inst_mem
      generic map (
        adrwidth => ram_adrwidth,
        datwidth => ram_datwidth
        )
        
      port map (
        address => address_1,
        q => data_out_1
        );
        
    mem_block2 : ram_inst_mem
    generic map (
      adrwidth => ram_adrwidth,
      datwidth => ram_datwidth
      )
      
    port map ( 
      address => address_2,
      q => data_out_2
      );
      
      
    mem_block3 : ram_inst_mem
      generic map (
       adrwidth => ram_adrwidth,
       datwidth => ram_datwidth
       )
       
      port map (
        address => address_3,
        q => data_out_3
        );
    
      
      --assert address to ram blocks
      addr_assert : process(mem_address)
        variable temp_ram_address : std_logic_vector(ram_adrwidth-1 downto 0);
      begin
      	temp_ram_address := mem_address(ram_adrwidth-1+2 downto 2);
      	
      	address_0 <= temp_ram_address;
      	address_1 <= temp_ram_address;
      	address_2 <= temp_ram_address;
      	address_3 <= temp_ram_address;
      end process addr_assert;
      
      
      
      --assert output of memory blocks to data_out
      data_out <= (data_out_3 & data_out_2 & data_out_1 & data_out_0);
      
      
  
  
end architecture default;

