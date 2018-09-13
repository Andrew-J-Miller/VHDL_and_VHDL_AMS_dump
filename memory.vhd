--memory.vhd
--Generated at Mon Jul 30 13:02:21 2018
--Andrew Miller 7/30/18
--memory.vhd is a vhdl implementation of a 4 block RAM instantiation for a MIPS processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.procmem_definitions.all;


entity memory is

  port(
    clk : in std_logic;
    rst_n : in std_logic;
    MemRead : in std_logic;
    MemWrite : in std_logic;
    mem_address : in std_logic_vector(31 downto 0);
    data_in : in std_logic_vector(31 downto 0);
    data_out : out std_logic_vector(31 downto 0)
    );
  
end entity memory;

architecture default of memory is

  component ram is 
    generic (
      adrwidth : integer := 8;
      datwidth : integer := 8
      );
    port ( 
      address : in std_logic_vector(adrwidth-1 downto 0);
      data : in std_logic_vector(datwidth-1 downto 0);
      clk : in std_logic;
      wren : in std_logic;
      q : out std_logic_vector(datwidth-1 downto 0)
      );
    end component ram;
  
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
  mem_block0 : ram
    generic map (
      adrwidth => ram_adrwidth,
      datwidth => ram_datwidth
      )
      
    port map (
      address => address_0,
      data => data_in_0,
      clk => clk,
      wren => wren,
      q => data_out_0
      );
      
      
    mem_block1 : ram
      generic map (
        adrwidth => ram_adrwidth,
        datwidth => ram_datwidth
        )
        
      port map (
        address => address_1,
        data => data_in_1,
        clk => clk,
        wren => wren,
        q => data_out_1
        );
        
    mem_block2 : ram
    generic map (
      adrwidth => ram_adrwidth,
      datwidth => ram_datwidth
      )
      
    port map ( 
      address => address_2,
      data => data_in_2,
      clk => clk,
      wren => wren,
      q => data_out_2
      );
      
      
    mem_block3 : ram
      generic map (
       adrwidth => ram_adrwidth,
       datwidth => ram_datwidth
       )
       
      port map (
        address => address_3,
        data => data_in_3,
        clk => clk,
        wren => wren,
        q => data_out_3
        );
    
      --wren needs the correct internal logic for this memory instantiaion because read and write enable are being condensed into one signal
      wren <= '1' when memwrite = '1' and memread = '0' else
              '0' when memwrite = '1' and memread = '1' else
              '0' when memwrite = '0' and memread = '0' else
              'X';
              
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
      
      
      --assert data into ram blocks
      data_in_3 <= data_in(4*ram_datwidth-1 downto 3*ram_datwidth);
      data_in_2 <= data_in(3*ram_datwidth-1 downto 2*ram_datwidth);
      data_in_1 <= data_in(2*ram_datwidth-1 downto ram_datwidth);
      data_in_0 <= data_in(ram_datwidth-1 downto 0);
      
      --assert output of memory blocks to data_out
      data_out <= (data_out_3 & data_out_2 & data_out_1 & data_out_0);
      
      
  
  
end architecture default;

